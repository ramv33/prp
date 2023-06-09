#include <linux/kernel.h>
#include <net/rtnetlink.h>
#include <net/genetlink.h>
#include "prp_main.h"
#include "prp_link.h"
#include "prp_netlink.h"
#include "prp_dev.h"
#include "debug.h"

static const struct nla_policy prp_policy[IFLA_PRP_MAX + 1] = {
	[IFLA_PRP_SLAVE1]	= { .type = NLA_U32 },
	[IFLA_PRP_SLAVE2]	= { .type = NLA_U32 },
	[IFLA_PRP_SUPADDR]	= { .len = ETH_ALEN },
};

/* net_device has already been allocated for us with the priv size we specified
 * in the rtnl_link_ops structure. The .setup function has also been called for
 * us. :)
 */
static int prp_newlink(struct net *src_net, struct net_device *dev,
			struct nlattr *tb[], struct nlattr *data[],
			struct netlink_ext_ack *extack)
{
	struct net_device *slave[2];

	if (!data) {
		NL_SET_ERR_MSG_MOD(extack, "No slave devices specified");
		printk(KERN_INFO "[prp] No slave devices specified");
		return -EINVAL;
	}
	if (!data[IFLA_PRP_SLAVE1]) {
		NL_SET_ERR_MSG_MOD(extack, "Slave1 device not specified");
		printk(KERN_INFO "[prp] Slave1 not specified");
		return -EINVAL;
	}
	if (!data[IFLA_PRP_SLAVE2]) {
		NL_SET_ERR_MSG_MOD(extack, "Slave2 device not specified");
		printk(KERN_INFO "[prp] Slave2 not specified");
		return -EINVAL;
	}

	slave[0] = __dev_get_by_index(src_net, nla_get_u32(data[IFLA_PRP_SLAVE1]));
	if (!slave[0]) {
		NL_SET_ERR_MSG_MOD(extack, "Slave1 does not exist");
		printk(KERN_ERR "[prp] Slave1 does not exist");
		return -EINVAL;
	}

	slave[1] = __dev_get_by_index(src_net, nla_get_u32(data[IFLA_PRP_SLAVE2]));
	if (!slave[1]) {
		NL_SET_ERR_MSG_MOD(extack, "Slave2 does not exist");
		printk(KERN_ERR "[prp] Slave1 does not exist");
		return -EINVAL;
	}

	return prp_dev_finalize(dev, slave, extack);
}

static void prp_dellink(struct net_device *dev, struct list_head *head)
{
	struct prp_priv *priv = netdev_priv(dev);

	/*
	 * TODO:
	 * 	delete timer for PRUNE
	 */
	prp_del_port(&priv->ports[0]);
	prp_del_port(&priv->ports[1]);

	del_timer(&priv->sup_timer);

	prp_del_node_table(priv);

	unregister_netdevice_queue(dev, head);
}

static struct rtnl_link_ops prp_link_ops __read_mostly = {
	.kind		= "prp",
	/* Highest device specific netlink attribute number */
	.maxtype	= IFLA_PRP_MAX,
	/* Netlink policy for device specific attribute validation */
	.policy		= prp_policy,
	/* Size of private data in net_device to be allocated */
	.priv_size	= sizeof(struct prp_priv),
	/* net_device setup function */
	.setup		= prp_dev_setup,
	/* Function for configuring and registering a new device */
	.newlink	= prp_newlink,
	.dellink	= prp_dellink,
	/* Function to dump device specific netlink attributes */
	.fill_info	= NULL,
};

// static struct genl_family prp_genl_family __ro_after_init = {
// 	/* Let genl controller assign the channel when we register */
// 	.id = GENL_ID_GENERATE,
// 	.hdrsize = 0,		/* does not make use of family specific header */
// 	.name = "PRP",		/* key the controller uses to lookup channel numbers */
// 	.module = THIS_MODULE,
// 	.netnsok = true,	/* can handle network namespaces */
// };

int __init prp_netlink_init(void)
{
	int ret;

	ret = rtnl_link_register(&prp_link_ops);
	return ret;
}

void __exit prp_netlink_exit(void)
{
	rtnl_link_unregister(&prp_link_ops);
}
