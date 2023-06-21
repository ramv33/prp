#ifndef __PRP_NODE
#define __PRP_NODE

#include "prp_main.h"

void prp_init_node_table(struct prp_priv *priv);

void prp_del_node_table(struct prp_priv *priv);

void prp_prune_nodes(struct timer_list *t);

struct node_entry *prp_add_node(unsigned char *mac, struct prp_priv *priv);

struct node_entry *prp_get_node(unsigned char *mac, struct prp_priv *priv);

static inline struct window *alloc_window(int winsize)
{
	return kmalloc(sizeof(struct window) * winsize, GFP_ATOMIC);
}

#endif /* __PRP_NODE */
