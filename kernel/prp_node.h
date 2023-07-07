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

/**
 * init_window - Initialise the drop window.
 *		 Set .seqnr = -1 for all.
 * @win: Window
 */
static void init_window(struct window *win)
{
	/* use memset(0xff)? */
	for (int i = 0; i < PRP_WINDOW_SIZE; i++)
		win[i].seqnr = -1;
}

#endif /* __PRP_NODE */
