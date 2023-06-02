#ifndef __PRP_NODE
#define __PRP_NODE

#include "prp_main.h"

void prp_init_node_table(struct prp_priv *priv);

void prp_del_node_table(struct prp_priv *priv);

struct node_entry *prp_add_node(unsigned char *mac, struct prp_priv *priv,
				u8 lan);

struct node_entry *prp_get_node(unsigned char *mac, struct prp_priv *priv,
				u8 lan);

#endif /* __PRP_NODE */
