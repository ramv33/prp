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
