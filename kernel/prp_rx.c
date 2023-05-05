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
 * get_rx_handler_data - Get RCU protected rx_handler_data from slave.
 * 	Checks is rx_handler for slave is our PRP rx handler (is this necessary?), and
 *	returns NULL if not, else returns the rx_handler which is the port for the slave.
 * @dev: Pointer to slave device
 */
static inline struct prp_port *get_rx_handler_data(struct net_device *dev)
{
	if (rcu_access_pointer(dev->rx_handler) == prp_recv_frame)
		return rcu_dereference(dev->rx_handler_data);
	return NULL;
}

/**
 *
 */
rx_handler_result_t prp_recv_frame(struct sk_buff **pskb)
{
	struct sk_buff *skb = *pskb;
	struct net_device *dev = skb->dev;
	struct ethhdr *ethhdr;
	struct prp_port *port;

	// PDEBUG("%s:%s: PID=%d", __func__, dev->name, current->pid);

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
	PDEBUG("%s: dev='%s': PID=%ld: eth_hdr->proto = 0x%x", __func__,
		current->pid, dev->name, ntohs(ethhdr->h_proto));

	port =  get_rx_handler_data(dev);
	if (!port)
		goto finish_pass;

finish_pass:
	return RX_HANDLER_PASS;
}
