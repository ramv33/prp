#include <linux/etherdevice.h>
#include <linux/hashtable.h>
#include <linux/xxhash.h>
#include "prp_main.h"
#include "prp_dev.h"
#include "prp_node.h"
#include "debug.h"

inline void prp_init_node_table(struct prp_priv *priv)
{
	hash_init(priv->node_table);
}

static void free_node(struct node_entry *node)
{
	kfree(node->window);
	kfree(node);
}

/**
 * free_bucket - Clears a hash bucket. Called holding @node_table_lock.
 * 	Deletes the nodes in the bucket and frees them.
 * @bucket: Hash bucket to clear
 */
static inline void free_bucket(struct hlist_head *bucket)
{
	struct node_entry *node;
	struct hlist_node *tmp;

	hlist_for_each_entry_safe(node, tmp, bucket, list) {
		hlist_del(&node->list);
		free_node(node);
	}
}

/**
 * prp_del_node_table - Delete the node table when the device is deleted.
 * @priv: Private data area of the device
 */
void prp_del_node_table(struct prp_priv *priv)
{
	write_lock(&priv->node_table_lock);
	for (int i = 0; i < HASH_SIZE(priv->node_table); ++i)
		free_bucket(&priv->node_table[i]);
	write_unlock(&priv->node_table_lock);
}

/**
 * hash_mac - Compute the index of @mac for a hash table of size @nbuckets.
 *
 * @mac: MAC address
 * @nbuckets: Number of buckets, i.e, size of the hash table.
 */
static unsigned int hash_mac(unsigned char mac[ETH_ALEN], unsigned int nbuckets)
{
	uint64_t seed = 0x533d15deadbeef11;
	unsigned long index = xxhash(mac, ETH_ALEN, seed);

	return index % nbuckets;
}

/**
 * prp_add_node - Allocate and add a new node with @mac to the node table.
 *	Returns the newly allocated node on success. The fields must be set
 *	by the caller. Does NOT check if @mac exists in the node table.
 *	Maybe set time_last_in too; would need LAN_ID.
 *
 *	! Caller must hold the write lock
 *
 * @mac: MAC address to add to the node table.
 * @priv: PRP priv.
 */
struct node_entry *prp_add_node(unsigned char *mac, struct prp_priv *priv)
{
	struct node_entry *newnode;
	unsigned int key;

	newnode = kmalloc(sizeof(*newnode), GFP_ATOMIC);
	if (!newnode)
		return NULL;

	ether_addr_copy(newnode->mac, mac);
	/* window is only needed for DANP, we do not know yet */
	newnode->window = NULL;	
	/* Set both san_a and san_b to true.
	 * So the user can check if node is newly added or not. */
	newnode->san_a = newnode->san_b = true;

	key = hash_mac(mac, HASH_SIZE(priv->node_table));

	/* Add node to list here */
	hlist_add_head(&newnode->list, &(priv->node_table[key]));

	return newnode;
}

/**
 * prp_get_node - Get entry from node table for given mac address.
 * 	If the node entry does not exist, prp_add_node() is called, and the new
 * 	node is returned.
 * 	Caller must be holding the RCU read lock
 *
 * @mac: MAC address of remote node.
 * @priv: PRP priv.
 * @lan: LAN through which the frame was received.
 * 	Used only if new node is being allocated. prp_add_node uses it to set
 * 	the time_last_in[lan] as early as possible.
 */
struct node_entry *prp_get_node(unsigned char *mac, struct prp_priv *priv)
{
	struct node_entry *node;
	unsigned key = hash_mac(mac, HASH_SIZE(priv->node_table));

	hlist_for_each_entry(node, &priv->node_table[key], list) {
		if (ether_addr_equal(node->mac, mac))
			return node;
	}
	return NULL;
}

/**
 * prp_prune_nodes - Remove stale node table entries; ones we have not heard
 * from for HSR_LIFE_CHECK_INTERVAL milliseconds (2 seconds).
 */
void prp_prune_nodes(struct timer_list *t)
{
	struct prp_priv *priv = from_timer(priv, t, prune_timer);
	struct hlist_node *tmp;
	struct node_entry *node;
	unsigned long time_a, time_b;

	write_lock_bh(&priv->node_table_lock);
	for (int i = 0; i < NODETABLE_SIZE; i++) {
		hlist_for_each_entry_safe(node, tmp, &priv->node_table[i],
					  list) {
			time_a = node->time_last_in[0];
			time_b = node->time_last_in[1];
			/* Remove from list if last frame from node was received
			 * longer than NODE_FORGET_TIME ago.
			 */
			if (false /* condition here */) {
				hlist_del(&node->list);
				free_node(node);
			}
		}
	}
	write_unlock_bh(&priv->node_table_lock);

	mod_timer(&priv->prune_timer, jiffies + msecs_to_jiffies(PRUNE_PERIOD));
}
