#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <errno.h>
#include <net/if.h>
#include <netlink/socket.h>
#include <netlink/genl/genl.h>
#include <linux/nl80211.h>
#include "prp_link.h"

struct nl_sock *setup_nl(void);
struct nl_msg *build_msg(int slave1_index, int slave2_index);
int recv_nlmsgs(struct nl_sock *sk);

int main(int argc, char *argv[])
{
	struct nl_sock	*sk;
	struct nl_msg	*msg;
	int		slave1_index, slave2_index;
	int		ret;
	
	sk = setup_nl();
	if (!sk)
		return EXIT_FAILURE;
	puts("[+] nl setup success");

	if (argc == 3) {
		slave1_index = if_nametoindex(argv[1]);
		if (!slave1_index)
			fprintf(stderr, "invalid interface '%s': %s\n", argv[1], strerror(errno));
		slave2_index = if_nametoindex(argv[2]);
		if (!slave2_index)
			fprintf(stderr, "invalid interface '%s': %s\n", argv[2], strerror(errno));
	}

	msg = build_msg(slave1_index, slave2_index);
	if (!msg)
		goto fail;
	ret = nl_send_auto(sk, msg);
	if (ret < 0) {
		nl_perror(ret, "nl_send_auto");
		ret = EXIT_FAILURE;
		goto fail;
	}

	recv_nlmsgs(sk);
	ret = 0;
	
fail:
	if (sk)
		nl_socket_free(sk);
	if (msg)
		nlmsg_free(msg);
	return EXIT_FAILURE;
}

struct nl_msg *build_msg(int slave1_index, int slave2_index)
{
	struct nl_msg *msg;
	struct nlattr *info;
	struct ifinfomsg ifi = {
		.ifi_family = AF_UNSPEC,
		.ifi_index = 0,
	};

	if (!(msg = nlmsg_alloc_simple(RTM_NEWLINK, NLM_F_EXCL|NLM_F_CREATE)))
		return NULL;
	if (nlmsg_append(msg, &ifi, sizeof(ifi), NLMSG_ALIGNTO) < 0)
		goto nla_put_failure;

	/* Append a container for nested attributes to carry link info */
	if (!(info = nla_nest_start(msg, IFLA_LINKINFO)))
		goto nla_put_failure;
	NLA_PUT_STRING(msg, IFLA_INFO_KIND, "prp");
	NLA_PUT_U32(msg, IFLA_PRP_SLAVE1, slave1_index);
	NLA_PUT_U32(msg, IFLA_PRP_SLAVE2, slave2_index);
	/* Finish nesting link info and close container */
	nla_nest_end(msg, info);

	// if (!(info = nla_nest_start(msg, IFLA_INFO_DATA)))
	// 	goto nla_put_failure;
	// "\x08\x00\x01\x00\x03\x00\x00\x00\x08\x00\x02\x00\x02\x00\x00\x00"
	// nla_nest_end(msg, info);

	return msg;

nla_put_failure:
	nlmsg_free(msg);
	return NULL;
}

int recv_nlmsgs(struct nl_sock *sk)
{
	return nl_recvmsgs_default(sk);
}

struct nl_sock *setup_nl(void)
{
	struct nl_sock *sk = nl_socket_alloc();
	if (!sk) {
		perror("nl_socket_alloc");
		return NULL;
	}
	int ret = nl_connect(sk, NETLINK_ROUTE);
	if (ret < 0) {
		nl_perror(ret, "nl_connect:NETLINK_ROUTE");
		nl_socket_free(sk);
	}
	return sk;
fail:
	nl_socket_free(sk);
	return NULL;
}
