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

static int prp_newlink(struct net *src_net, struct net_device *dev,
			struct nlattr *tb[], struct nlattr *data[],
			struct netlink_ext_ack *extack)
{
	struct net_device *slave[2];

	PDEBUG("newlink called\n");
	if (!data) {
		NL_SET_ERR_MSG_MOD(extack, "No slave devices specified");
		return -EINVAL;
	}
	if (!data[IFLA_PRP_SLAVE1]) {
		NL_SET_ERR_MSG_MOD(extack, "Slave1 device not specified");
		return -EINVAL;
	}
	if (!data[IFLA_PRP_SLAVE2]) {
		NL_SET_ERR_MSG_MOD(extack, "Slave2 device not specified");
		return -EINVAL;
	}

	slave[0] = __dev_get_by_index(src_net, nla_get_u32(data[IFLA_PRP_SLAVE1]));
	if (!slave[0]) {
		NL_SET_ERR_MSG_MOD(extack, "Slave1 does not exist");
		return -EINVAL;
	}
	printk(KERN_INFO "[PRP] Slave 1 verified");
	slave[1] = __dev_get_by_index(src_net, nla_get_u32(data[IFLA_PRP_SLAVE2]));
	if (!slave[1]) {
		NL_SET_ERR_MSG_MOD(extack, "Slave2 does not exist");
		return -EINVAL;
	}
	printk(KERN_INFO "[PRP] Slave 2 verified");

	return 0;
}

static void prp_dellink(struct net_device *dev, struct list_head *head)
{
	unregister_netdevice_queue(dev, head);
}

static struct rtnl_link_ops prp_link_ops __read_mostly = {
	.kind		= "prp",
	.maxtype	= IFLA_PRP_MAX,
	.policy		= prp_policy,
	.priv_size	= sizeof(struct prp_priv),
	.setup		= prp_dev_setup,
	.newlink	= prp_newlink,
	.dellink	= prp_dellink,
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
	if (ret)
		return ret;

	return 0;
}

void __exit prp_netlink_exit(void)
{
	rtnl_link_unregister(&prp_link_ops);
}
