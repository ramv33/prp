#ifndef __PRP_TX_H
#define __PRP_TX_H

#include <linux/netdevice.h>

void prp_send_skb(struct sk_buff *skb, struct net_device *dev);

#endif /* __PRP_TX_H */
