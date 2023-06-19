#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <asm/current.h>
#include "prp_main.h"
#include "prp_dev.h"
#include "prp_rx.h"
#include "prp_node.h"
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
bool valid_rct(struct sk_buff *skb, struct prp_port *port)
{
	struct prp_rct *rct;

	rct = prp_get_rct(skb);
	/* NULL if PRP suffix not valid, i.e, 0x88FB */
	if (!rct)
		return false;

	/* TODO: need to increment error counter: CntErrWrongLanX */
	if (port->lan != prp_get_lan_id(rct))
		return false;

	if (!prp_check_lsdu_size(skb, rct))
		return false;

	return true;
}

/**
 * is_supervision_frame - Return true if supervision frame.
 * 	Maybe also get the node table entry here and store it in an argument.
 */
static bool is_supervision_frame(struct sk_buff *skb, struct prp_priv *priv)
{
	struct ethhdr *ethhdr;
	struct prp_tag *tag;
	struct prp_sup_tlv *sup_tlv;
	struct prp_sup_payload *payload;
	int pulled = 0;

	WARN_ON_ONCE(!skb_mac_header_was_set(skb));
	ethhdr = eth_hdr(skb);

	if (!ether_addr_equal(ethhdr->h_dest, priv->sup_multicast_addr))
		return false;

	if (ethhdr->h_proto != htons(ETH_P_PRP))
		return false;

	/* Pull Ethernet header to get start of supervision frame
	 * (TODO: deal with VLAN?)
	 */
	if (!pskb_may_pull(skb, sizeof(*ethhdr)))
		return false;
	pulled += sizeof(struct ethhdr);
	tag = skb_pull(skb, sizeof(*ethhdr));

	/* Get tag - path, version, and sup_seqnr */
	if (!pskb_may_pull(skb, sizeof(*tag)))
		return false;
	pulled += sizeof(*tag);
	sup_tlv = skb_pull(skb, sizeof(*tag));

	/* Verify initial TLV1 type */
	if (sup_tlv->type != PRP_TLV_DUPACCEPT
	    && sup_tlv->type != PRP_TLV_DUPDISCARD)
		goto out_false;
	/* Verify TLV1 length; has to be 6 octets for MAC address */
	if (sup_tlv->len != sizeof(struct prp_sup_payload))
		goto out_false;
	/* Get payload; move past sup_tlv */
	if (!pskb_may_pull(skb, sizeof(*sup_tlv)))
		goto out_false;
	pulled += sizeof(*sup_tlv);
	payload = skb_pull(skb, sizeof(*sup_tlv));
	/* TODO: Process MAC */

	/* Get RedBox MAC (TLV2), or TLV0 (end of TLVs); move past TLV1 */
	if (!pskb_may_pull(skb, sizeof(*payload)))
		goto out_false;
	pulled += sizeof(*payload);
	sup_tlv = skb_pull(skb, sizeof(*payload));
	/* If anything other than RedBox MAC or end of TLV, return false */
	if (sup_tlv->type == PRP_TLV_REDBOX_MAC) {
		if(sup_tlv->len != sizeof(*payload))
			return false;

		/* Get next TLV, should be TLV0 */
		if (!pskb_may_pull(skb, sizeof(*sup_tlv)))
			goto out_false;
		pulled += sizeof(*sup_tlv);
		sup_tlv = skb_pull(skb, sizeof(*sup_tlv));
	}

	if (!(sup_tlv->type == 0 && sup_tlv->len == 0)) {
		goto out_false;
	}

	/* Reset skb */
	skb_push(skb, pulled);
	return true;

out_false:
	/* Reset skb->data */
	skb_push(skb, pulled);
	return false;
}

static inline void node_set_san(struct node_entry *node, struct prp_port *port)
{
	/* We should NOT be getting non-PRP frames from the same source
	 * over both the ports. May need to check for it...
	 */
	if (port->lan == 0xA) {
		node->san_a = true;
		node->san_b = false;
	} else {
		node->san_a = false;
		node->san_b = true;
	}
}


/**
 * prp_handle_sup - Process supervision frame and update node table.
 * 	Caller must hold the WRITE lock
 * @skb: sk_buff
 * @node: Node table entry
 * @port: Port through which we received the skb
 */
static void prp_handle_sup(struct sk_buff *skb, struct node_entry *node,
			   struct prp_port *port)
{
	struct prp_tag *tag;
	struct prp_sup_tlv *sup_tlv;
	struct prp_sup_payload *payload;
	struct prp_priv *priv = netdev_priv(port->master);
	unsigned char *source_mac;
	int mode = 0;	/* duplicate discard or accept */
	u16 sup_seqnr;

	/* No need to check if we can pull since is_supervision_frame() did */
	tag = skb_pull(skb, sizeof(struct ethhdr));
	sup_seqnr = tag->sup_seqnr;

	/* Get TLV1 */
	sup_tlv = skb_pull(skb, sizeof(*tag));
	mode = sup_tlv->type;
	/* Get TLV1 payload, i.e, source MAC */
	payload = skb_pull(skb, sizeof(*sup_tlv));
	source_mac = payload->mac;

	/* What to do with RedBox MAC? */

	ether_addr_copy(node->mac, source_mac);
	/* node->san_a = node->san_b is set only here.
	 * If both are false, window has already been allocated.
	 * But it is possible, that allocation failed.
	 */
	if (node->san_a || node->san_b) {
		node->san_a = node->san_b = false;
		if (!node->window)
			node->window = kmalloc(sizeof(*node->window), GFP_ATOMIC);
		/* maybe delete node if it fails, so that we do not have
		 * to check if it is not null everytime. */
		if (unlikely(!node->window)) {
			pr_warn("%s: failed to allocate window", __func__);
		} else {
			init_window(node->window);
		}
	}

	if (likely(node->window))
		node->window->last_jiffies = node->time_last_in[port->lan&0x1];

	pr_info("%s: handled supervision frame\n", __func__);

	return;
}

/**
 * prp_is_duplicate - Return true if frame is duplicate.
 * 	Updates node table.
 * @skb: socket buff
 * @node: Node table entry
 * @port: Port through which @skb was received
 */
static bool prp_is_duplicate(struct sk_buff *skb, struct node_entry *node,
			     struct prp_port *port)
{
	struct prp_rct *rct;
	unsigned char *mac;

	rct = prp_get_rct(skb);
	pr_info("%s: seqnr=%d\n", __func__, ntohs(rct->seqnr));

	mac = node->mac;
	pr_info("%s: source=%02x:%02x:%02x:%02x:%02x:%02x, node@%p\n", __func__,
		mac[0], mac[1], mac[2], mac[3], mac[4], mac[5], node);

	return false;
	/* TODO:
	 * 	Check if DUPLICATE frame by checking node entry @node
	 */
}

/**
 * prp_net_if - Forward frame to upper layer after stripping Ethernet header.
 *		All processing for PRP is assumed to be done if it is a
 *		PRP-tagged frame.
 * @prp: Is a PRP-tagged frame?
 * @skb: Socket buffer
 * @dev: PRP master device; master's stats are updated.
 */
static void prp_net_if(bool prp, struct sk_buff *skb, struct net_device *dev)
{
	struct sk_buff	*clone_skb;
	bool		multicast;
	int		len, res;

	multicast = skb->pkt_type == PACKET_MULTICAST;

	/* Remove RCT */
	if (prp)
		skb_trim(skb, skb->len - PRP_RCTLEN);

	clone_skb = skb_clone(skb, GFP_ATOMIC);
	if (!clone_skb) {
		PDEBUG("%s: skb_clone returned NULL, not forwarding\n", __func__);
		return;
	}

	/* Remove Ethernet header */
	skb_pull(clone_skb, ETH_HLEN);
	len = clone_skb->len;
	res = netif_rx(clone_skb);
	if (res == NET_RX_DROP) {
		PDEBUG("%s:%s: netif_rx DROPPED\n", __func__, dev->name);
		/* TODO: Update stats */
	} else {
		PDEBUG("%s:%s: netif_rx SUCCESS\n", __func__, dev->name);
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
	struct prp_priv *priv;
	struct ethhdr *ethhdr;
	struct prp_port *port;
	struct node_entry *node;
	unsigned char *source_mac;
	bool is_prp = true;

	// PDEBUG("%s:%s: PID=%d", __func__, dev->name, current->pid);

	/* Not sure why; saw this in the net/hsr module */
	if (unlikely(skb->pkt_type == PACKET_LOOPBACK))
		return RX_HANDLER_PASS;

	if (!skb_mac_header_was_set(skb)) {
		WARN_ONCE(1, "%s: skb invalid: mac header not set", __func__);
		return RX_HANDLER_PASS;
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

	priv = netdev_priv(port->master);

	// PDEBUG("%s: mac_header=%d, network_header=%d", __func__, skb->mac_header,
	// 	skb->network_header);
	skb_push(skb, ETH_HLEN);
	skb_reset_mac_header(skb);
	skb_reset_mac_len(skb);

	skb->dev = port->master;

	source_mac = eth_hdr(skb)->h_source;
	/* Unlock only at the end. */
	write_lock(&priv->node_table_lock);
	/* Get node table entry creating one if it does not exist. */
	node = prp_get_node(source_mac, priv);
	/* Create entry? */
	if (!node) {
		/* NOTE: if this is a supervision frame, prp_handle_sup will
		 * replace the MAC address with the one in the supervision
		 * frame's payload. */
		node = prp_add_node(source_mac, priv);
		if (!node) {
			pr_warn("%s: cannot add node to node table\n", __func__);
			goto finish_pass;
		}
	}
	node->time_last_in[port->lan&0x1] = jiffies;

	/* Not a PRP frame */
	if (!valid_rct(skb, port)) {
		node_set_san(node, port);
		is_prp = false;
		PDEBUG("%s: PID=%d: not PRP-tagged frame\n", __func__, current->pid);
		goto forward_upper;
	}

	if (is_supervision_frame(skb, priv)) {
		unsigned char *mac = eth_hdr(skb)->h_source;
		pr_info("%s: supervision frame from %08x:%08x:%08x:%08x:%08x:%08x\n",
			__func__, mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]);
		prp_handle_sup(skb, node, port);
		goto finish_consumed;
	}

	if (prp_is_duplicate(skb, node, port)) {
		kfree_skb(skb);
		goto finish_consumed;
	}

forward_upper:
	/* Forward to upper layer after removing any header and trailer */
	prp_net_if(is_prp, skb, port->master);
	kfree_skb(skb);

finish_consumed:
	write_unlock(&priv->node_table_lock);
	return RX_HANDLER_CONSUMED;

finish_pass:
	return RX_HANDLER_PASS;
}
