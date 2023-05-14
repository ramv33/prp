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
 * valid_rct - Return true if skb has a valid PRP RCT
 */
bool valid_rct(struct sk_buff *skb)
{
	struct prp_rct *rct;

	rct = prp_get_rct(skb);
	/* NULL if PRP suffix not valid, i.e, 0x88FB */
	if (!rct)
		return false;

	if (!prp_check_lsdu_size(skb, rct))
		return false;

	return true;
}

/**
 * prp_is_supervision_frame - Return true if supervision frame.
 */
static inline bool prp_is_supervision_frame(struct sk_buff *skb)
{
	return false;
}

/**
 * prp_handle_supervision_frame - Process supervision frame and update
 *	 node table.
 */
static void prp_handle_supervision_frame(struct sk_buff *skb)
{
	return;
}

/**
 * prp_is_duplicate - Return true if frame is duplicate.
 * 	Updates node table.
 */
static bool prp_is_duplicate(struct sk_buff *skb, struct prp_port *port)
{
	static int drop = 0;

	return false;
	/* TODO:
	 * 	Check if DUPLICATE frame by checking node table
	 * 		? Do we add to node table if not present?
	 * 		? Or can we assume that only nodes from which we
	 * 		  received SUPERVISION frames are DANPs? I.e, if
	 * 		  node is not in node table, it is a SANP and so we
	 * 		  need not check if it is a duplicate.
	 */
}

/**
 * prp_net_if - Forward frame to upper layer after stripping ETH_HDR.
 *	All processing for PRP is assumed to be done, we simply forward
 *	the skb to the upper layer.
 * @skb: Socket buffer
 * @dev: PRP master device; master's stats are updated.
 */
static void prp_net_if(struct sk_buff *skb, struct net_device *dev)
{
	struct sk_buff	*clone_skb;
	static int	drop = 0;
	bool		multicast;
	int		len, res;

	skb->dev = dev;
	PDEBUG("%s: dev='%s' @ %p\n\n", __func__, dev->name, dev);
	PDEBUG("%s: skb->dev='%s' @ %p\n", __func__, skb->dev->name, skb->dev);
	clone_skb = skb_clone(skb, GFP_ATOMIC);
	if (!clone_skb) {
		PDEBUG("%s: skb_clone returned NULL, not forwarding\n", __func__);
		return;
	}

	multicast = clone_skb->pkt_type == PACKET_MULTICAST;
	skb_pull(clone_skb, ETH_HLEN);
	res = netif_receive_skb(clone_skb);
	if (res == NET_RX_DROP) {
		PDEBUG("%s: netif_rx DROPPED\n", __func__);
		/* TODO: Update stats */
	} else {
		PDEBUG("%s: netif_rx SUCCESS\n", __func__);
		/* TODO: Update stats */
	}
}

/**
 * prp_recv_frame - Callback for frame reception by slave devices.
 * 	Does the following:
 * 		Check for a valid PRP RCT; forward to upper layer if not.
 *		Handle supervision frame and update node table.
 *		Duplicate discard and update node table.
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
	PDEBUG("%s: dev='%s': PID=%d: eth_hdr->proto = 0x%x", __func__,
		dev->name, current->pid, ntohs(ethhdr->h_proto));

	port =  get_rx_handler_data(dev);
	if (!port)
		goto finish_pass;

	// PDEBUG("%s: mac_header=%d, network_header=%d", __func__, skb->mac_header,
	// 	skb->network_header);
	skb_push(skb, ETH_HLEN);
	skb_reset_mac_header(skb);
	skb_reset_mac_len(skb);
	// PDEBUG("%s: mac_header=%d, network_header=%d", __func__, skb->mac_header,
	// 	skb->network_header);

	/* Processing starts here */
	if (!valid_rct(skb))
		goto forward_upper;

	if (prp_is_supervision_frame(skb))
		prp_handle_supervision_frame(skb);

	if (prp_is_duplicate(skb, port)) {
		kfree_skb(skb);
		goto finish_consumed;
	}

forward_upper:
	prp_net_if(skb, port->master);

finish_consumed:
	return RX_HANDLER_CONSUMED;

finish_pass:
	return RX_HANDLER_PASS;
}
