#ifndef PRP_MAIN_H
#define PRP_MAIN_H

/**
 * PRP Redundancy Control Trailer (RCT) as specified in IEC 62439-3:2016 (p. 20)
 * Appended to frames.
 *
 * @seqnr:			16-bit sequence number
 * @lan_id_and_lsdu_size:	4-bit LAN ID and 12-bit frame size
 * 				LSDU size is the size of the Ethernet payload
 * 				including the RCT, upto and excluding the FCS
 * @prp_suffix:			16-bit PRP suffix (0x88FB)
 */
struct prp_rct {
	__be16	seqnr;
	/* 4-bit LAN identifier and 12-bit frame size */
	__be16	lan_id_and_lsdu_size;
	__be16	prp_suffix;
} __packed ;

struct prp_port {
	struct net_device	*dev;
	struct prp_priv		*master;
	u8			lan;		/* LAN_A (0xA) or LAN_B (0xB) */
};

struct prp_priv {
	struct prp_port	ports[2];
	u16		sup_seqnr;
	unsigned char	sup_multicast_addr[ETH_ALEN] __aligned(sizeof(u16));
	struct dentry	*node_tbl_root;
};

#endif /* PRP_MAIN_H */
