#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <asm/current.h>
#include "prp_main.h"
#include "prp_dev.h"
#include "prp_tx.h"
#include "debug.h"

static int prp_dev_open(struct net_device *dev);
static int prp_dev_change_mtu(struct net_device *dev, int mtu);
static int prp_dev_close(struct net_device *dev);
static netdev_tx_t prp_dev_xmit(struct sk_buff *skb, struct net_device *dev);

unsigned char prp_def_multicast_addr[ETH_ALEN] __aligned(2) = {
	0x01, 0x15, 0x4e, 0x00, 0x01, 0x00
};

static bool is_up(struct net_device *dev)
{
	return dev && (dev->flags && IFF_UP) && netif_oper_up(dev);
}

static struct device_type prp_type = {
	.name = "prp"
};

/**
 * Return true if dev is PRP interface
 */
bool is_prp_master(struct net_device *dev)
{
	return dev->netdev_ops->ndo_start_xmit == prp_dev_xmit;
}

/**
 * Get minimum MTU of the slaves to set for master
 */
int prp_get_max_mtu(struct prp_port ports[2])
{
	int mtu_max;

	mtu_max = min(ports[0].dev->mtu, ports[1].dev->mtu);
	/* Subtract for RCT */
	if (mtu_max < PRP_RCTLEN)
		return 0;
	return mtu_max - PRP_RCTLEN;
}

static int prp_dev_change_mtu(struct net_device *dev, int mtu)
{
	/* TODO: Ensure it does not exceed max MTU of either slave */
	struct prp_priv *prp;
	int max_mtu;

	PDEBUG("[PRP] prp_dev_change_mtu to %d\n", mtu);
	prp = netdev_priv(dev);
	max_mtu = prp_get_max_mtu(prp->ports);
	if (mtu > max_mtu) {
		netdev_info(dev, "MTU must be <= (min(slaves' mtu) - PRP_RCTLEN(6))\n"
				"For this device, it is %d octets\n", max_mtu);
		return -EINVAL;
	}
	dev->mtu = mtu;

	return 0;
}

/**
 * Called when network device transitions to the UP state.
 * Check if both slave devices are up - warn if not
 */
static int prp_dev_open(struct net_device *dev)
{
	struct prp_priv *prp = netdev_priv(dev);

	PDEBUG("prp_dev_open\n");
	if (!is_up(prp->ports[0].dev))
		netdev_warn(dev, "Slave A is not up\n");
	if (!is_up(prp->ports[1].dev))
		netdev_warn(dev, "Slave B is not up\n");

	return 0;
}

/* Called when network device transitions to the DOWN state */
static int prp_dev_close(struct net_device *dev)
{
	/* Nothing to do here I think */
	PDEBUG("[PRP] prp_dev_close\n");
	return 0;
}

/* Transmit packet */
static netdev_tx_t prp_dev_xmit(struct sk_buff *skb, struct net_device *dev)
{
	struct prp_dev *prp = netdev_priv(dev);

	PDEBUG("prp_dev_xmit by PID=%d\n", current->pid);

	skb_reset_mac_header(skb);
	skb_reset_mac_len(skb);
	/* set source MAC address to master's MAC which should be same as that
	 * of the two slaves
	 */
	ether_addr_copy(eth_hdr(skb)->h_source, dev->dev_addr);
	/* Forward to be sent through both slave devices */
	prp_send_skb(skb, dev);

	return NETDEV_TX_OK;
}

/*
 * Adjust requested feature flags and return the resulting flags.
 * Must not modify the device state
 */
// static netdev_features_t prp_fix_features(struct net_device *dev,
// 						netdev_features_t features)
// {
// 	return 0;
// }

static const struct net_device_ops prp_device_ops = {
	.ndo_change_mtu = prp_dev_change_mtu,
	.ndo_open = prp_dev_open,
	.ndo_stop = prp_dev_close,
	.ndo_start_xmit = prp_dev_xmit,
	// .ndo_fix_features = prp_fix_features,
};

static const struct header_ops prp_header_ops = {
	.create	= eth_header,
	.parse	= eth_header_parse,
};

/* Called from rtnl_link_ops. */
void prp_dev_setup(struct net_device *dev)
{
	eth_hw_addr_random(dev);
	ether_setup(dev);
	dev->min_mtu = 0;
	dev->header_ops = &prp_header_ops;
	dev->netdev_ops = &prp_device_ops;

	SET_NETDEV_DEVTYPE(dev, &prp_type);
	dev->priv_flags |= IFF_NO_QUEUE | IFF_DISABLE_NETPOLL;
	dev->needs_free_netdev = true;		/* unregister should perform free_netdev */
	dev->hw_features = NETIF_F_SG		/* Scatter/gather IO */
			| NETIF_F_FRAGLIST 	/* Scatter/gather IO */
			| NETIF_F_HIGHDMA	/* Can DMA to high memory */
			| NETIF_F_GSO_MASK 	/* Segmentation offload feature mask */
			| NETIF_F_HW_CSUM 	/* Can checksum all packets */
			;
	dev->features = dev->hw_features;
	/* prevent recursive tx locking? */
	dev->features |= NETIF_F_LLTX;
	/* cannot handle VLAN */
	dev->features |= NETIF_F_VLAN_CHALLENGED;
	/* "Does not change network namespaces" */
	dev->features |= NETIF_F_NETNS_LOCAL;

	PDEBUG("prp_dev_setup done\n");
}

int prp_add_ports(struct prp_priv *prp, struct net_device *prp_dev,
		  struct net_device *slave[2])
{
	PDEBUG("Adding the ports");
	prp->ports[0].dev = slave[0];
	prp->ports[0].master = prp_dev;
	prp->ports[0].lan = 0xA;
	prp->ports[1].dev = slave[1];
	prp->ports[1].master = prp_dev;
	prp->ports[1].lan = 0xB;
	return 0;
}

/* Registers net_device for prp. */
int prp_dev_finalize(struct net_device *prp_dev, struct net_device *slave[2])
{
	struct prp_priv *prp = netdev_priv(prp_dev);
	int ret = 0;

	PDEBUG("prp_dev_finalize\n");
	/* set hwaddr to be that of first slave's */
	eth_hw_addr_set(prp_dev, slave[0]->dev_addr);

	spin_lock_init(&prp->sup_seqnr_lock);
	prp->sup_seqnr = 0;

	/* May need to provide parameter for last byte of mcast addr */
	ether_addr_copy(prp->sup_multicast_addr, prp_def_multicast_addr);

	/* Set slaves */
	prp_add_ports(prp, prp_dev, slave);

	dev_set_mtu(prp_dev, prp_get_max_mtu(prp->ports));

	/* TODO:
	 * 	Set timers for supervision and prune
	 * 	Set up node table
	 * 	Set up sysfs entry for node table
	 */
	netif_carrier_off(prp_dev);		// why?
	ret = register_netdevice(prp_dev);
	if (!ret)
		PDEBUG("registered successfully\n");
	else
		PDEBUG("registration failed\n");

	return ret;
}

static void prp_set_operstate(struct net_device *dev, int state)
{
	if (dev->operstate == state)
		return;
	write_lock(&dev_base_lock);
	dev->operstate = state;
	write_unlock(&dev_base_lock);
	netdev_state_change(dev);
}

void prp_check_carrier_and_operstate(struct net_device *prp_dev)
{
	struct prp_priv *prp = netdev_priv(prp_dev);
	struct prp_port *ports = prp->ports;

	/* netif_carrier_on if atleast one slave is up */
	if (is_up(ports[0].dev) || is_up(ports[1].dev)) {
		netif_carrier_on(prp_dev);
		if (prp_dev->flags && IFF_UP)
			prp_set_operstate(prp_dev, IF_OPER_UP);
		else
			prp_set_operstate(prp_dev, IF_OPER_DOWN);
	} else {
		netif_carrier_off(prp_dev);
		if (prp_dev->flags && IFF_UP)	/* only slave ("lower layer") is down */
			prp_set_operstate(prp_dev, IF_OPER_LOWERLAYERDOWN);
		else
			prp_set_operstate(prp_dev, IF_OPER_DOWN);
	}
}
