#include <linux/init.h>
#include <linux/module.h>

static int __init prp_init(void)
{
	printk(KERN_INFO "Loading PRP\n");
	return 0;
}

static void __exit prp_exit(void)
{
	printk(KERN_INFO "Unloading PRP\n");
}

MODULE_LICENSE("GPL");

module_init(prp_init);
module_exit(prp_exit);
