#ifndef PRP_MAIN_H
#define PRP_MAIN_H

#define NODETABLE_SIZE	256

#define PRP_RCTLEN	6
#define PRP_SUFFIX	0x88fb

/**
 * PRP Redundancy Control Trailer (RCT) as specified in IEC 62439-3:2016 (p. 20)
 * Appended to frames.
 *
 * @seqnr:			16-bit sequence number
 * @lan_id_and_lsdu_size:	4-bit LAN ID and 12-bit frame size
 * 				LSDU size is the size of the Ethernet payload
 * 				including the RCT, upto and excluding the FCS
 * 				LSDU size is the least 12 bits (AND with 0x0fff)
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
	struct net_device	*master;
	u8			lan;		/* LAN_A (0xA) or LAN_B (0xB) */
};


/**
 * PRP net_device.priv structure
 * 
 * @ports:		Slave devices
 * @node_table:		Node table (TODO)
 * @sup_seqnr:		Sequence number for supervision frames
 * @sup_multicast_addr:	Multicast address to which supervision frames are sent
 * @dev_stats:		Device statistics
 * @node_tbl_root:	sysfs entry for displaying nodes table
 */
struct prp_priv {
	struct prp_port			ports[2];
	struct hlist_head		node_table[NODETABLE_SIZE]; // TODO
	u16				sup_seqnr;
	spinlock_t			sup_seqnr_lock;
	unsigned char			sup_multicast_addr[ETH_ALEN] __aligned(sizeof(u16));
	struct rtnl_link_stats64	*dev_stats;
	struct dentry			*node_tbl_root;
};


/**
 * RX, TX
 *
 * Get PRP RCT from the tail of skb and return IF valid PRP suffix,
 * else return NULL.
 */
static inline struct prp_rct *prp_get_rct(struct sk_buff *skb)
{
	unsigned char *tail = skb_tail_pointer(skb) - PRP_RCTLEN;
	struct prp_rct *rct = (struct prp_rct *)tail;

	if (rct->prp_suffix == htons(ETH_P_PRP))
		return rct;
	return NULL;
}

/**
 * RX
 */
static inline int prp_get_lsdu_size(struct prp_rct *rct)
{
	return ntohs(rct->lan_id_and_lsdu_size) & 0x0fff;

}

#endif /* PRP_MAIN_H */
