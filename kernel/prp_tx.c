#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <linux/if_vlan.h>
#include <asm/current.h>
#include "prp_main.h"
#include "prp_dev.h"
#include "prp_tx.h"
#include "prp_node.h"
#include "debug.h"


/**
 * TX
 */
static inline void prp_set_lsdu_size(struct prp_rct *rct, struct sk_buff *skb)
{
	u16 lsdu_size = skb->len - skb->mac_len;
	u16 temp = rct->lan_id_and_lsdu_size;

	rct->lan_id_and_lsdu_size = htons((ntohs(temp) & 0xf000)
					  | (lsdu_size & 0x0fff));
}

/**
 * TX
 *
 * Sets LAN ID field in the RCT.
 * @lan_id must be either 0xA or 0xB, no check is done here.
 */
static inline void prp_rct_set_lan_id(struct prp_rct *rct, u8 lan_id)
{
	rct->lan_id_and_lsdu_size &= htons(0x0fff);
	rct->lan_id_and_lsdu_size |= htons(lan_id << 12);
}


/**
 * Appends and sets the RCT for the frame.
 */
inline void prp_add_rct(u8 lan, u16 seqnr, struct sk_buff *skb)
{
	struct prp_rct *rct;

	// PDEBUG("skb->data=%p skb->len=%d, skb->tail=%p, skb->tail=%d",
	// 		skb->data, skb->len, skb_tail_pointer(skb), skb->tail);
	rct = skb_put(skb, PRP_RCTLEN);
	// PDEBUG("skb->data=%p skb->len=%d, skb->tail=%p, skb->tail=%d",
	// 		skb->data, skb->len, skb_tail_pointer(skb), skb->tail);
	prp_set_lsdu_size(rct, skb);
	rct->prp_suffix = htons(PRP_SUFFIX);
	rct->seqnr = htons(seqnr);
	prp_rct_set_lan_id(rct, lan);
	// PDEBUG("last 6 bytes of skb");
	// char *tail = (char *)rct + 5;
	// for (char *p = (char *)rct; p <= tail; p++)
	// 	PDEBUG("\t%02hhx", *p);
	// PDEBUG("prp_add_rct done");
}

/**
 * TX
 */
static int prp_prepare_skb(u16 seqnr, u8 lan, struct sk_buff *skb,
			   struct net_device *dev)
{
	struct ethhdr *ethhdr;
	unsigned short proto;

	/* Check if skb contains ethhdr */
	if (skb->mac_len < sizeof(struct ethhdr)) {
		pr_err("prp_prepare_skb failed, skb does not contain ethhdr: %d\n",
			skb->mac_len);
		return -EINVAL;
	}

	ethhdr = (struct ethhdr *)skb_mac_header(skb);
	proto = ethhdr->h_proto;

	prp_add_rct(lan, seqnr, skb);

	return 0;
}

/**
 * prp_pad_frame - Check if frame is a VLAN and pad accordingly.
 * 	Called only for DANPs. See section 4.2.7.4.1 of IEC 62439-3:2016 p. 28
 * @skb: sk_buff received from prp_dev_xmit
 * @dev: PRP device
 */
static int prp_pad_frame(struct sk_buff *skb, struct net_device *dev)
{
	int min_size = ETH_ZLEN;	/* 60 octets */

	if (eth_hdr(skb)->h_proto == htons(ETH_P_8021Q))
		min_size = VLAN_ETH_ZLEN;	/* 64 octets */

	if (skb_put_padto(skb, min_size)) {
		pr_err("%s: failed to pad frame to %d bytes\n",
			__func__, min_size);
		return -1;
	}

	return 0;
}

static void send_san(struct sk_buff *skb, struct prp_priv *priv,
		     bool san_a, bool san_b)
{
	struct prp_port *ports = priv->ports;
	struct sk_buff *skb_clone;

	skb_clone = skb_clone(skb, GFP_ATOMIC);
	if (!skb_clone) {
		pr_err("%s: skb_clone failed\n");
		break;
	}

	if (san_a)
		skb_copy->dev = ports[0].dev;
	else
		skb_copy->dev = ports[1].dev;

	skb_tx_timestamp(skb_copy);
	if (dev_queue_xmit(skb_copy))
		netdev_warn(dev, "failed to send to san_%x\n", san_a ? 0xA : 0xB);

	kfree_skb(skb);
}

/**
 * TX
 *
 * Send skb through both slave interfaces.
 */
void prp_send_skb(struct sk_buff *skb, struct net_device *dev)
{
	struct prp_priv *prp_priv = netdev_priv(dev);
	struct prp_port *ports = prp_priv->ports;
	struct node_entry *node;
	struct sk_buff *skb_copy;
	unsigned char *mac = eth_hdr(skb)->h_dest;
	u16 seqnr;

	PDEBUG("prp_send_skb");

	read_lock(&prp_priv->node_table_lock);
	node = prp_get_node(mac, prp_priv);
	if (node) {
		/* Both false => DANP. Both true => new entry */
		if (node->san_a ^ node->san_b) {
			read_unlock(&prp_priv->node_table_lock);
			send_san(skb, prp_priv, node->san_a, node->san_b);
			return;
		}
	}
	read_unlock(&prp_priv->node_table_lock);

	if (prp_pad_frame(skb, dev) < 0)
		return;

	seqnr = atomic_fetch_add(1, &prp_priv->seqnr) % (1 << 16);
	for (int i = 0; i < 2; ++i) {
		/* Need to copy skb since clone will only clone the skb_buff
		 * and the refcount will be 1. Tailroom is extended for the RCT.
		 */
		if (unlikely(!is_up(ports[i].dev)))
			continue;

		skb_copy = skb_copy_expand(skb, 0, skb_tailroom(skb) + PRP_RCTLEN,
					   GFP_ATOMIC);
		skb_reset_mac_len(skb_copy);
		if (!skb_copy) {
			PDEBUG("%s: skb_copy_expand returned NULL... continuing",
				__func__);
			continue;
		}

		/* Creates PRP tagged frame */
		if (prp_prepare_skb(seqnr, ports[i].lan, skb_copy, dev) < 0)
			return;

		skb_copy->dev = ports[i].dev;

		skb_tx_timestamp(skb_copy);
		if (dev_queue_xmit(skb_copy))
			netdev_warn(dev, "failed to send over port %x", ports[i].lan);
		else
			PDEBUG("%s: sent over port %x: %s\n", __func__, ports[i].lan,
				skb_copy->dev->name);
	}
	kfree_skb(skb);
}

/**
 * prp_init_skb - Create sk_buff for PRP supervision_frame with ETH header
 *
 * @prp: PRP device
 */
static struct sk_buff *prp_init_skb(struct net_device *prp)
{
	struct sk_buff *skb;
	struct prp_priv *priv = netdev_priv(prp);
	int hlen, tlen;

	/* Get needed headroom and tailroom */
	hlen = LL_RESERVED_SPACE(prp);
	tlen = prp->needed_tailroom;

	skb = dev_alloc_skb(sizeof(struct prp_sup_tag)
			    + sizeof(struct prp_sup_payload) + hlen + tlen);
	if (!skb)
		return skb;

	/* Reserve headroom for header */
	skb_reserve(skb, hlen);
	skb->dev = prp;
	skb->priority = TC_PRIO_CONTROL;

	/* Create Ethernet header with proto = ETH_P_PRP */
	if (dev_hard_header(skb, skb->dev, ETH_P_PRP,
			    priv->sup_multicast_addr,
			    skb->dev->dev_addr, skb->len) <= 0)
		goto out;

	// skb_dump(KERN_INFO, skb, false);
	skb_reset_mac_header(skb);
	/* Need to set skb->mac_len since prp_prepare_skb checks it.
	 * How else do I set it? We do not have a network header for this. :/
	 */
	skb_set_network_header(skb, skb->len);
	skb_reset_mac_len(skb);
	skb_reset_transport_header(skb);

	return skb;
out:
	pr_err("%s: failed to create frame with ETH hdr\n", __func__);
	kfree_skb(skb);
	return NULL;
}

/**
 * tag_path_and_ver - Return path_and_ver. Forms the first 16-bits of
 * payload of the supervision frame.
 *
 * @path: SupPath upper 4-bits
 * @ver: SupVersion lower 12-bits
 */
static inline __be16 sup_tag_path_and_ver(unsigned path, unsigned ver)
{
	__be16 path_and_ver = 0;

	path_and_ver |= (path & 0xf) << 12;
	path_and_ver |= (ver & 0xfff);

	return path_and_ver;
}

/**
 * prp_send_supervision: Called when priv->prp_sup_timer expires.
 * 	Send a PRP supervision frame.
 */
void prp_send_supervision(struct net_device *prp)
{
	struct prp_sup_payload *payload;
	struct prp_sup_tag *tag;
	struct prp_priv *priv = netdev_priv(prp);
	struct sk_buff *skb;
	u16 sup_seqnr;

	skb = prp_init_skb(prp);
	if (!skb) {
		WARN_ONCE(1, "PRP: Could not send supervision frame\n");
		return;
	}

	/* set up tag after ETH hdr - path, version, and sup_seqnr */
	tag = skb_put(skb, sizeof(*tag));
	tag->tag.path_and_ver = ntohs(sup_tag_path_and_ver(PRP_SUP_TAG_PATH,
						       PRP_SUP_TAG_VERSION));
	sup_seqnr = atomic_fetch_add(1, &priv->sup_seqnr) & 0xffff;
	tag->tag.sup_seqnr = htons(sup_seqnr);
	tag->tlv.type = PRP_TLV_DUPDISCARD;
	tag->tlv.len = sizeof(*payload);

	/* Set payload - our MAC address */
	payload = skb_put(skb, sizeof(*payload));
	ether_addr_copy(payload->mac, prp->dev_addr);

	/* Pad with zeroes. Implicitly sets TLV0 to mark the end.
	 * TLV0.type = TLV0.len = 0
	 */
	if (skb_put_padto(skb, ETH_ZLEN)) {
		pr_err("%s: failed to pad to %d octets\n", __func__, ETH_ZLEN);
		return;
	}

	pr_info("%s: supervision frame set up\n", __func__);

	/* duplicate and append RCT */
	prp_send_skb(skb, prp);
}
