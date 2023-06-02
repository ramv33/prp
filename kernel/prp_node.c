#include <linux/hashtable.h>
#include "prp_main.h"
#include "prp_dev.h"
#include "prp_node.h"
#include "debug.h"

inline void prp_init_node_table(struct prp_priv *priv)
{
	hash_init(priv->node_table);
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
		hlist_del_rcu(&node->list);
		kfree_rcu(node, rcu);
	}
}

/**
 * prp_del_node_table - Delete the node table when the device is deleted.
 * @priv: Private data area of the device
 */
void prp_del_node_table(struct prp_priv *priv)
{
	spin_lock(&priv->node_table_lock);
	for (int i = 0; i < HASH_SIZE(priv->node_table); ++i)
		free_bucket(&priv->node_table[i]);
	spin_unlock(&priv->node_table_lock);
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
	unsigned long index = xxhash(addr, ETH_ALEN, seed);

	return index % nbuckets;
}

/**
 * prp_add_node - Allocate and add a new node with @mac to the node table.
 *	Returns the newly allocated node on success. The fields must be set
 *	by the caller. Does NOT check if @mac exists in the node table.
 *
 * @mac: MAC address to add to the node table.
 * @priv: PRP priv.
 */
struct node_entry *prp_add_node(unsigned char *mac, struct prp_priv *priv)
{
	struct node_entry *newnode;
	unsigned int key;

	newnode = kmalloc(sizeof(*newnode), GFP_ATOMIC);
	ether_addr_copy(newnode->mac, mac);
	key = hash_mac(mac, HASH_SIZE(priv->node_table));

	spin_lock(&priv->node_table_lock);

	/* Add node to list here */
	hash_add_rcu(priv->node_table, &newnode->list, key);

	spin_unlock(&priv->node_table_lock);

	synchronize_rcu();

	return newnode;
	/*
	 * 1. Allocate a new node_entry, with .mac = mac
	 * 2. Compute hash(mac)
	 * 3. spin_lock(&priv->node_table_lock)
	 * 4. Add node to priv->node-table.
	 * 5. spin_unlock(&priv->node_table_lock)
	 * 6. synchronize_rcu()
	 * 7. return new node
	 */
}

/**
 * prp_get_node - Get entry from node table for given mac address.
 * 	If the node entry does not exist, prp_add_node() is called, and the new
 * 	node is returned.
 * 	Caller must be holding the RCU read lock
 *
 * @mac: MAC address of remote node.
 * @priv: PRP priv.
 */
struct node_entry *prp_get_node(unsigned char *mac, struct prp_priv *priv)
{
	struct node_entry *node;
	unsigned key = hash_mac(mac, HASH_SIZE(priv->node_table));

	hlist_for_each_entry_rcu(node, &priv->node_table[key], list) {
		if (ether_addr_equal(node->mac, mac))
			return node;
	}
	/* Not found, add a new node and return it. */
	return prp_add_node(mac, priv);
}
