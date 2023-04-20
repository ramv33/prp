#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <asm/current.h>
#include "prp_main.h"
#include "prp_dev.h"
#include "prp_rx.h"
#include "debug.h"

/**
 * Check if LSDU size in RCT from received frame is correct, i.e,
 * is equal to the Ethernet payload size.
 */
static inline bool prp_check_lsdu_size(struct sk_buff *skb, struct prp_rct *rct)
{
	struct ethhdr *ethhdr;
	int expected_lsdu_size;

	ethhdr = (struct ethhdr *)skb_mac_header(skb);
	expected_lsdu_size = skb->len - 14;
	return expected_lsdu_size == prp_get_lsdu_size(rct);
}
