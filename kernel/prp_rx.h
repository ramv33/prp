#ifndef __PRP_RX_H
#define __PRP_RX_H

#include <linux/netdevice.h>

rx_handler_result_t prp_recv_frame(struct sk_buff **pskb);

#endif /* __PRP_RX_H */
