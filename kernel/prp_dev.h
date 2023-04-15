#ifndef __PRP_DEV_H
#define __PRP_DEV_H

#include <linux/netdevice.h>

bool is_prp_master(struct net_device *dev);

void prp_check_carrier_and_operstate(struct net_device *dev);

/* Called from rtnl_link_ops on setup */
void prp_dev_setup(struct net_device *dev);

int prp_dev_finalize(struct net_device *dev, struct net_device *slave[2]);

int prp_get_max_mtu(struct prp_port ports[2]);

#endif /* __PRP_DEV_H */
