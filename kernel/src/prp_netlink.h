#ifndef __PRP_NETLINK_H
#define __PRP_NETLINK_H

enum {
	IFLA_PRP_UNSPEC,
	IFLA_PRP_SLAVE1,
	IFLA_PRP_SLAVE2,
	IFLA_PRP_SUPADDR,

	__IFLA_PRP_MAX,
};
#define IFLA_PRP_MAX (__IFLA_PRP_MAX - 1)

int __init prp_netlink_init(void);
void __exit prp_netlink_exit(void);

#endif /* __PRP_NETLINK_H */
