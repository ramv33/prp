#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <asm/current.h>
#include "prp_main.h"
#include "prp_dev.h"
#include "prp_tx.h"
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
inline void prp_add_rct(u16 seqnr, struct sk_buff *skb)
{
	struct prp_rct *rct;

	// PDEBUG("skb->data=%p skb->len=%d, skb->tail=%p, skb->tail=%d",
	// 		skb->data, skb->len, skb_tail_pointer(skb), skb->tail);
	rct = skb_put(skb, PRP_RCTLEN);
	// PDEBUG("skb->data=%p skb->len=%d, skb->tail=%p, skb->tail=%d",
	// 		skb->data, skb->len, skb_tail_pointer(skb), skb->tail);
	prp_set_lsdu_size(rct, skb);
	rct->prp_suffix = htons(PRP_SUFFIX);
	rct->seqnr = seqnr;
	// PDEBUG("last 6 bytes of skb");
	// char *tail = (char *)rct + 5;
	// for (char *p = (char *)rct; p <= tail; p++)
	// 	PDEBUG("\t%02hhx", *p);
	// PDEBUG("prp_add_rct done");
}

/**
 * TX
 */
static int prp_prepare_skb(u16 seqnr, struct sk_buff *skb, struct net_device *dev)
{
	struct prp_priv *prp_priv = netdev_priv(dev);
	struct ethhdr *ethhdr;
	unsigned short proto;

	/* Check if skb contains ethhdr */
	if (skb->mac_len < sizeof(struct ethhdr)) {
		printk(KERN_ERR "prp_prepare_skb failed, skb does not contain ethhdr");
		return -EINVAL;
	}

	ethhdr = (struct ethhdr *)skb_mac_header(skb);
	proto = ethhdr->h_proto;

	// TODO: Check node table for destination frame

	/* Replace mac address with that of master which should be the same
	 * as that of the two slaves (both slaves have same MAC address)
	 */
	ether_addr_copy(eth_hdr(skb)->h_source, dev->dev_addr);
	prp_add_rct(seqnr, skb);

	return 0;
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
	struct prp_rct *rct;
	struct sk_buff *skb_copy;
	u16 seqnr;

	PDEBUG("prp_send_skb");

	seqnr = atomic_fetch_add(1, &prp_priv->seqnr) % (1 << 16);
	barrier();
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
		if (prp_prepare_skb(seqnr, skb_copy, dev) < 0)
			return;

		skb_copy->dev = ports[i].dev;
		rct = prp_get_rct(skb_copy);
		prp_rct_set_lan_id(rct, ports[i].lan);

		if (dev_queue_xmit(skb_copy))
			netdev_warn(dev, "failed to send over port %x", ports[i].lan);
		else
			PDEBUG("%s: sent over port %x: %s\n", __func__, ports[i].lan,
				skb_copy->dev->name);
	}
}
