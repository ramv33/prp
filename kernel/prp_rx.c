#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <asm/current.h>
#include "prp_main.h"
#include "prp_dev.h"
#include "prp_rx.h"
#include "debug.h"

/**
 * Check if LSDU size in RCT from received frame is correct, i.e,
 * is equal to the Ethernet payload size.
 */
static inline bool prp_check_lsdu_size(struct sk_buff *skb, struct prp_rct *rct)
{
	struct ethhdr *ethhdr;
	int expected_lsdu_size;

	ethhdr = (struct ethhdr *)skb_mac_header(skb);
	expected_lsdu_size = skb->len - 14;
	return expected_lsdu_size == prp_get_lsdu_size(rct);
}

/**
 *
 */
rx_handler_result_t prp_recv_frame(struct sk_buff **pskb)
{
	struct sk_buff *skb = *pskb;
	struct net_device *dev = skb->dev;
	struct ethhdr *ethhdr;

	PDEBUG("%s:%s: PID=%d", __func__, dev->name, current->pid);

	/* Not sure why; saw this in the net/hsr module */
	if (unlikely(skb->pkt_type == PACKET_LOOPBACK))
		return RX_HANDLER_PASS;

	if (!skb_mac_header_was_set(skb)) {
		WARN_ONCE(1, "%s: skb invalid: mac header not set", __func__);
	}

	ethhdr = eth_hdr(skb);
	if (!ethhdr) {
		PDEBUG("%s: eth_hdr() return NULL", __func__);
		return RX_HANDLER_PASS;
	}
	PDEBUG("%s: eth_hdr->proto = 0x%x", __func__, ntohs(ethhdr->h_proto));

	return RX_HANDLER_PASS;
}
