#include <linux/init.h>
#include <linux/module.h>
#include <linux/netdevice.h>
#include "prp_main.h"
#include "prp_dev.h"
#include "prp_netlink.h"
#include "debug.h"

/* PRP constants - set them up as module parameters allowing change */
static unsigned int life_check_interval  = LIFE_CHECK_INTERVAL;
static unsigned int node_forget_time 	  = NODE_FORGET_TIME;
static unsigned int entry_forget_time	  = ENTRY_FORGET_TIME;
static unsigned int node_reboot_interval = NODE_REBOOT_INTERVAL;

module_param(life_check_interval, uint, S_IRUGO|S_IWUSR);
MODULE_PARM_DESC(life_check_interval, "Interval between two successive"
					"supervision frames");
module_param(node_forget_time, uint, S_IRUGO|S_IWUSR);
MODULE_PARM_DESC(node_forget_time, "Time to wait after the last frame"
		"received from a node, before removing it from the node table");
module_param(entry_forget_time, uint, S_IRUGO|S_IWUSR);
MODULE_PARM_DESC(entry_forget_time, "Maximum time a frame with a sequence"
		"number from a source is remembered for discarding");
module_param(node_reboot_interval, uint, S_IRUGO|S_IWUSR);
MODULE_PARM_DESC(node_reboot_interval, "Time to remain silent after rebooting");

static int prp_netdev_notifier(struct notifier_block *nb, unsigned long event,
			       void *ptr)
{
	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
	/* Check if it is our device, i.e, PRP virtual interface
	 * Also need to handle changes for slave devices like:
	 * 	MTU change
	 * 	Unregister
	 */
	if (!is_prp_master(dev))
		return NOTIFY_DONE;
	switch (event) {
	case NETDEV_UP:		/* ifconfig <interface> up */
	case NETDEV_DOWN:	/* ifconfig <interface> down */
	case NETDEV_CHANGE:	/* Link/carrier state change */
		prp_check_carrier_and_operstate(dev);
		break;
	case NETDEV_CHANGEADDR:
		PDEBUG("%s: change addr\n", dev->name);
		break;
	case NETDEV_CHANGENAME:
		PDEBUG("%s: change name\n", dev->name);
		break;
	case NETDEV_CHANGEMTU:
		/* assert (MTU <= min(MTU of slaves) - RCT length) */
		PDEBUG("%s: change mtu\n", dev->name);
		break;
	case NETDEV_UNREGISTER:
		PDEBUG("%s: unregister\n", dev->name);
		break;
	case NETDEV_PRE_TYPE_CHANGE:
		/* PRP only for Ethernet devices, return error */
		return NOTIFY_BAD;
	case NETDEV_REGISTER:
		PDEBUG("%s: register\n", dev->name);
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
