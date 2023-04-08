#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include "prp_main.h"
#include "prp_dev.h"
#include "debug.h"

static struct device_type prp_type = {
	.name = "prp"
};

static int prp_dev_change_mtu(struct net_device *net, int mtu)
{
	/* TODO: Ensure it does not exceed max MTU of either slave */
	PDEBUG("[PRP] prp_dev_change_mtu to %d\n", mtu);
	return 0;
}

/* Called when network device transitions to the UP state */
static int prp_dev_open(struct net_device *dev)
{
	/*
	 * TODO:
	 * Check if both slaves up
	 */
	PDEBUG("prp_dev_open\n");
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

	/*
	 * TODO:
	 * 	Call another function that adds the RCT and forwards
	 */
	PDEBUG("[PRP] prp_dev_xmit\n");
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
	dev->hw_features = NETIF_F_SG		/* Scatter/gather IO */
			| NETIF_F_FRAGLIST 	/* Scatter/gather IO */
			| NETIF_F_HIGHDMA	/* Can DMA to high memory */
			| NETIF_F_GSO_MASK 	/* Segmentation offload feature mask */
			| NETIF_F_HW_CSUM 	/* Can checksum all packets */
			;
	dev->features = dev->hw_features;
	/* cannot handle VLAN */
	dev->features |= NETIF_F_VLAN_CHALLENGED;
	PDEBUG("prp_dev_setup done\n");
}

/* Registers net_device for prp. */
int prp_dev_finalize(struct net_device *prp_dev, struct net_device *slave[2])
{
	struct prp_priv *prp;
	int ret = 0;

	PDEBUG("prp_dev_finalize\n");
	prp = netdev_priv(prp_dev);
	eth_hw_addr_set(prp_dev, slave[0]->dev_addr);
	netif_carrier_off(prp_dev);
	ret = register_netdevice(prp_dev);
	if (!ret)
		PDEBUG("registered successfully\n");
	else
		PDEBUG("registration failed\n");
	/* TODO: set slave in prp_priv */

	return ret;
}
