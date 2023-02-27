#undef PDEBUG
#ifdef DEBUG
#	ifdef __KERNEL__
#		define PDEBUG(fmt, args...) printk(KERN_DEBUG "scull: " fmt, ## args)
#	else
#		define PDEBUG(fmt, args...) fprintf(stderr, fmt, ## args)
#	endif
#else
#	define PDEBUG(fmt, args...)	/* not debugging: nothing */
#endif
