#include <linux/init.h>
#include <linux/module.h>
#include <linux/netdevice.h>

static int prp_netdev_notifier(struct notifier_block *nb, unsigned long event,
				void *ptr)
{
	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
	/* Check if it is our device, i.e, PRP virtual interface */
	printk(KERN_INFO "[PRP] %s: ", dev->name);
	switch (event) {
	case NETDEV_UP:
		printk(KERN_INFO "up\n");
		break;
	case NETDEV_DOWN:
		printk(KERN_INFO "down\n");
		break;
	case NETDEV_CHANGEADDR:
		printk(KERN_INFO "change addr\n");
		break;
	case NETDEV_CHANGENAME:
		printk(KERN_INFO "change name\n");
		break;
	case NETDEV_CHANGEMTU:
		/* assert (MTU <= min(MTU of slaves) - RCT length) */
		printk(KERN_INFO "change mtu\n");
		break;
	case NETDEV_UNREGISTER:
		printk(KERN_INFO "unregister\n");
		break;
	case NETDEV_PRE_TYPE_CHANGE:
		/* PRP only for Ethernet devices, return error */
		printk(KERN_INFO "change type\n");
		break;
	case NETDEV_REGISTER:
		printk(KERN_INFO "register\n");
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
	printk(KERN_INFO "Loading PRP\n");
	return 0;
}

static void __exit prp_module_exit(void)
{
	unregister_netdevice_notifier(&prp_nb);
	printk(KERN_INFO "Unloading PRP\n");
}

MODULE_LICENSE("GPL");

module_init(prp_module_init);
module_exit(prp_module_exit);
