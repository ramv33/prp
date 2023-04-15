#ifndef __PRP_DEV_H
#define __PRP_DEV_H

#include <linux/netdevice.h>

bool is_prp_master(struct net_device *dev);

/* Called from rtnl_link_ops on setup */
void prp_dev_setup(struct net_device *dev);

int prp_dev_finalize(struct net_device *dev, struct net_device *slave[2]);

#endif /* __PRP_DEV_H */
