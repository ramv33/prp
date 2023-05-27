#ifndef __PRP_TX_H
#define __PRP_TX_H

#include <linux/netdevice.h>

void prp_send_skb(struct sk_buff *skb, struct net_device *dev);

void prp_send_supervision(struct net_device *prp);

#endif /* __PRP_TX_H */
