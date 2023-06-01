#ifndef PRP_MAIN_H
#define PRP_MAIN_H

#include <linux/if_ether.h>
#include <linux/spinlock.h>

#define NODETABLE_SIZE	256

#define PRP_RCTLEN	6
#define PRP_SUFFIX	0x88fb

/*
 * PRP Constants defaults as in Table 8 of the IEC 62439-3:2016 std.
 * We allow changing these as module parameters.
 * (in milliseconds)
 */
/* Interval between two successive supervision frames */
#define LIFE_CHECK_INTERVAL	2000
/* Time to wait after the last frame received from a node, before removing it
 * from the node table */
#define NODE_FORGET_TIME	60000
/* Maximum time a frame with a sequence number from a source is remembered
 * for discarding */
#define ENTRY_FORGET_TIME	400
/* A node that reboots remains silent for this period */
#define NODE_REBOOT_INTERVAL	500

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
 * struct window - to implement the duplicate discard.
 * TODO
 */
struct window {
	u16	seq_in;
};

/**
 * Node table entry - Each entry is part of a linked list in a hash bucket.
 */
struct node_entry {
	struct hlist_node	list;
	struct rcu_head		rcu;
	/* remote node address */
	unsigned char		mac[ETH_ALEN];
	/* time the last frame arrived through the ports */
	unsigned long		time_last_in[2];
	struct window		*window;
	/* Store the last supervision seqnr received */
	atomic_t		sup_seqnr;
	bool			san_a;
	bool			san_b;
};

/**
 * PRP net_device.priv structure
 * 
 * @ports:		Slave devices
 * @node_table:		Node table (TODO)
 * @sup_seqnr:		Sequence number for supervision frames
 * @seqnr:		Sequence number for other frames
 * @sup_multicast_addr:	Multicast address to which supervision frames are sent
 * @dev_stats:		Device statistics
 * @sup_timer:		Timer for sending out supervision frames
 * @node_tbl_root:	sysfs entry for displaying nodes table
 */
struct prp_priv {
	struct prp_port			ports[2];
	struct hlist_head		node_table[NODETABLE_SIZE]; // TODO
	spinlock_t			node_table_lock;
	struct timer_list		sup_timer;
	atomic_t			sup_seqnr;
	atomic_t			seqnr;
	unsigned char			sup_multicast_addr[ETH_ALEN] __aligned(sizeof(u16));
					/* ether_addr_equal requires alignment to u16 */
	struct rtnl_link_stats64	*stats;
	struct dentry			*node_tbl_root;
};


/**
 * PRP Supervision frame format
 * See Table 6 - PRP_Supervision frame contents (IEC 62439-3:2016, p. 32).
 *	------------------------------------------
 *	|        ETH HDR, proto=0x88FB           |
 *	------------------------------------------
 *	|    path (4)  |     version (12) < 64   |
 *	------------------------------------------
 *	|             sup seqnr (16)             |
 *	------------------------------------------
 *	| TLV1.Type=20/21 (8) | TLV1.Length=6 (8)|
 *	------------------------------------------
 *	|           MAC Address of DANP (48)     |
 *	------------------------------------------
 *	| TLV2.Type=30 (8)  | TLV2.Length=6 (8)  |
 *	------------------------------------------
 *	|           Redbox MAC Address (48)      |
 *	------------------------------------------
 *	| TLV0.Type = 0 (8) | TLV.Length=0 (8)   |
 *	------------------------------------------
 *	| Padding to 70/74 octets (No VLAN/VLAN) |
 *	------------------------------------------
 *	|                 PRP RCT (48)           |
 *	------------------------------------------
 *	|                 FCS (32)               |
 *	------------------------------------------
 * NOTE:
 * 	TLV2 is only appended by a Redbox acting on behalf of a VDAN.c:w
 * 	TLV1.Type = 20 for duplicate discard, 21 for duplicate accept.
 *
 */

struct prp_sup_tlv {
	u8	type;
	u8	len;
} __packed;

/* Values for prp_sup-tag.path_and_ver */
#define PRP_SUP_TAG_PATH	0x0
#define PRP_SUP_TAG_VERSION	0x1

/* TLV Types for PRP supervision frame */
#define PRP_TLV_DUPDISCARD	20
#define PRP_TLV_DUPACCEPT	21
#define PRP_TLV_REDBOX_MAC	30

struct prp_tag {
	__be16	path_and_ver;
	__be16	sup_seqnr;
} __packed ;

/**
 * prp_sup_tag - Added after the Ethernet header for supervision frames.
 *
 * @path_and_ver: path = 0, and version = 1 for PRP.
 * @sup_seqnr: Supervision frame sequence number.
 * @tlv: ?
 */
struct prp_sup_tag {
	struct prp_tag		tag;
	struct prp_sup_tlv	tlv;		/* TLV1 for MAC of DANP */
} __packed;

struct prp_sup_payload {
	unsigned char mac[ETH_ALEN];
} __packed;

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

static inline int prp_get_lan_id(struct prp_rct *rct)
{
	return (ntohs(rct->lan_id_and_lsdu_size) & 0xf000) >> 12;

}

#endif /* PRP_MAIN_H */
