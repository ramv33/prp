#ifndef __PRP_TX_H
#define __PRP_TX_H

#include <linux/netdevice.h>
#include <linux/if_ether.h>

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
};

/* Values for prp_sup-tag.path_and_ver */
#define PRP_SUP_TAG_PATH	0x0
#define PRP_SUP_TAG_VERSION	0x1

/* TLV Types for PRP supervision frame */
#define PRP_SUP_TLV_DUPDISCARD	0x20
#define PRP_SUP_TLV_DUPACCEPT	0x21
#define PRP_SUP_TLV_REDBOX_MAC	0x30

/**
 * prp_sup_tag - Added after the Ethernet header for supervision frames.
 *
 * @path_and_ver: path = 0, and version = 1 for PRP.
 * @sup_seqnr: Supervision frame sequence number.
 * @tlv: ?
 */
struct prp_sup_tag {
	__be16			path_and_ver;
	__be16			sup_seqnr;
	struct prp_sup_tlv	tlv;		/* TLV1 for MAC of DANP */
};

struct prp_sup_payload {
	unsigned char mac[ETH_ALEN];
};

void prp_send_skb(struct sk_buff *skb, struct net_device *dev);

void prp_send_supervision(struct net_device *prp);

#endif /* __PRP_TX_H */
