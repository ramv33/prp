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
static inline void prp_set_lsdu_size(struct sk_buff *skb, struct prp_rct *rct)
{
	u16 lsdu_size = skb->mac_len - 14;
	u16 temp = rct->lan_id_and_lsdu_size;

	rct->lan_id_and_lsdu_size = ntohs((htons(temp) & 0xf000)
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
	rct->lan_id_and_lsdu_size &= 0x0fff;
	rct->lan_id_and_lsdu_size |= lan_id << 12;
}


/**
 * Appends and sets the RCT for the frame.
 * Sets everything in the RCT except the sequence number.
 */
inline void prp_add_rct(struct sk_buff *skb)
{
	struct prp_rct *rct;

	PDEBUG("skb->data=%p skb->len=%d, skb->tail=%p, skb->tail=%d",
			skb->data, skb->len, skb_tail_pointer(skb), skb->tail);
	rct = skb_put(skb, PRP_RCTLEN);
	PDEBUG("skb->data=%p skb->len=%d, skb->tail=%p, skb->tail=%d",
			skb->data, skb->len, skb_tail_pointer(skb), skb->tail);
	prp_set_lsdu_size(skb, rct);
	rct->prp_suffix = ntohs(PRP_SUFFIX);
	// PDEBUG("last 6 bytes of skb");
	// char *tail = (char *)rct + 5;
	// for (char *p = (char *)rct; p <= tail; p++)
	// 	PDEBUG("\t%02hhx", *p);
	PDEBUG("prp_add_rct done");
}

/**
 * TX
 */
static int prp_prepare_skb(struct sk_buff *skb, struct net_device *dev)
{
	struct prp_priv *prp_priv = netdev_priv(dev);
	struct ethhdr *ethhdr;
	unsigned short proto;

	PDEBUG("prp_prepare_skb");
	/* Check if skb contains ethhdr */
	if (skb->mac_len < sizeof(struct ethhdr)) {
		PDEBUG("prp_prepare_skb failed, skb does not contain ethhdr");
		return -EINVAL;
	}

	ethhdr = (struct ethhdr *)skb_mac_header(skb);
	proto = ethhdr->h_proto;
	PDEBUG("proto = %x", ntohs(proto));

	// TODO: Check if skb contains supervision frame
	// TODO: Check node table for destination frame

	/* Replace mac address with that of master which should be the same
	 * as that of the two slaves (both slaves have same MAC address)
	 */
	ether_addr_copy(eth_hdr(skb)->h_source, dev->dev_addr);
	prp_add_rct(skb);
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

	PDEBUG("prp_send_skb");
	if (prp_prepare_skb(skb, dev) < 0)
		return;
	for (int i = 0; i < 2; ++i) {
		/* maybe try incrementing refcount instead */
		struct sk_buff *skb_c = skb_clone(skb, GFP_ATOMIC);
		if (!skb_c) {
			PDEBUG("skb_clone returned NULL... continuing");
			continue;
		}
		skb_c->dev = ports[i].dev;
		rct = prp_get_rct(skb_c);
		prp_rct_set_lan_id(rct, ports[i].lan);
		PDEBUG("sending over port %x: %s", ports[i].lan, skb_c->dev->name);
		// if (!dev_queue_xmit(skb))
		// 	netdev_warn(dev, "failed to send over port %x", ports[i].lan);
	}
}
