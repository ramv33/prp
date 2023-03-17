#ifndef PRP_MAIN_H
#define PRP_MAIN_H

struct prp_port {
	struct net_device	*dev;
	struct prp_priv		*master;
	char			lan;		/* LAN_A ('A') or LAN_B ('B') */
};

struct prp_priv {
	struct prp_port	ports[2];
	u16		sup_seqnr;
	unsigned char	sup_multicast_addr[ETH_ALEN] __aligned(sizeof(u16));
	struct dentry	*node_tbl_root;
};

#endif /* PRP_MAIN_H */
