#include <linux/init.h>
#include <linux/module.h>
#include <linux/netdevice.h>
#include "prp_main.h"
#include "prp_netlink.h"
#include "debug.h"

static int prp_netdev_notifier(struct notifier_block *nb, unsigned long event,
				void *ptr)
{
	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
	/* Check if it is our device, i.e, PRP virtual interface */
	PDEBUG("%s: ", dev->name);
	switch (event) {
	case NETDEV_UP:
		PDEBUG("up\n");
		break;
	case NETDEV_DOWN:
		PDEBUG("down\n");
		break;
	case NETDEV_CHANGEADDR:
		PDEBUG("change addr\n");
		break;
	case NETDEV_CHANGENAME:
		PDEBUG("change name\n");
		break;
	case NETDEV_CHANGEMTU:
		/* assert (MTU <= min(MTU of slaves) - RCT length) */
		PDEBUG("change mtu\n");
		break;
	case NETDEV_UNREGISTER:
		PDEBUG("unregister\n");
		break;
	case NETDEV_PRE_TYPE_CHANGE:
		/* PRP only for Ethernet devices, return error */
		PDEBUG("change type\n");
		break;
	case NETDEV_REGISTER:
		PDEBUG("register\n");
		break;
	}
	return NOTIFY_OK;
}

static struct notifier_block prp_nb = {
	.notifier_call = prp_netdev_notifier,
};

static int __init prp_module_init(void)
{
	register_netdevice_notifier(&prp_nb);
	prp_netlink_init();
	printk(KERN_INFO "[PRP] Loading PRP\n");
	PDEBUG("Debug enabled\n");
	return 0;
}

static void __exit prp_module_exit(void)
{
	unregister_netdevice_notifier(&prp_nb);
	prp_netlink_exit();
	printk(KERN_INFO "[PRP] Unloading PRP\n");
}

MODULE_LICENSE("GPL");

module_init(prp_module_init);
module_exit(prp_module_exit);
