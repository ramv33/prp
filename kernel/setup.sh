#!/bin/bash
# SPDX-License-Identifier: GPL-2.0

ret=0
ksft_skip=4
ipv6=true

optstring="h4"
usage() {
	echo "Usage: $0 [OPTION]"
	echo -e "\t-4: IPv4 only: disable IPv6 tests (default: test both IPv4 and IPv6)"
}

while getopts "$optstring" option;do
	case "$option" in
	"h")
		usage $0
		exit 0
		;;
	"4")
		ipv6=false
		;;
	"?")
		usage $0
		exit 1
		;;
esac
done

sec=$(date +%S)
ns1="ns1-$sec"
ns2="ns2-$sec"

cleanup()
{
	local netns
	for netns in "$ns1" "$ns2"; do
		ip netns del $netns
	done
}

ip -Version > /dev/null 2>&1
if [ $? -ne 0 ];then
	echo "SKIP: Could not run test without ip tool"
	exit $ksft_skip
fi

for i in "$ns1" "$ns2" ;do
	ip netns add $i || exit $ksft_skip
	ip -net $i link set lo up
done

echo "INFO: preparing interfaces."
# Three HSR nodes. Each node has one link to each of its neighbour, two links in total.
#
#    ns1eth1 ----- ns2eth1
#      prp0         prp1
#    ns1eth2 ----- ns2eth2
#
# ip link add ns1eth1 netns "$ns1" type veth peer name ns2eth1 netns "$ns2"
# ip link add ns1eth2 netns "$ns1" type veth peer name ns3eth1 netns "$ns3"
# ip link add ns3eth2 netns "$ns3" type veth peer name ns2eth2 netns "$ns2"
ip link add ns1eth1 netns "$ns1" type veth peer name ns2eth1 netns "$ns2"
ip link add ns1eth2 netns "$ns1" type veth peer name ns2eth2 netns "$ns2"

# set MAC to be same here
echo "[+] Setting MAC to be same"
NS1MAC=$(ip -net "$ns1" l show ns1eth1 | tail -1 | awk '{ print $2 }')
NS2MAC=$(ip -net "$ns2" l show ns2eth1 | tail -1 | awk '{ print $2 }')
ip -net "$ns1" link set ns1eth2 address $NS1MAC
ip -net "$ns2" link set ns2eth2 address $NS2MAC
ip -net "$ns1" link show
ip -net "$ns2" link show

# Create interface
echo "[+] Creating PRP interface on $ns1 and $ns2"
ip netns exec "$ns1" ./mkprp.out ns1eth1 ns1eth2
ip netns exec "$ns2" ./mkprp.out ns2eth1 ns2eth2
# ip -net "$ns1" link add name prp0 type hsr slave1 ns1eth1 slave2 ns1eth2 supervision 45 version 0 proto 0
# ip -net "$ns2" link add name prp1 type hsr slave1 ns2eth1 slave2 ns2eth2 supervision 45 version 0 proto 0
# ip -net "$ns3" link add name prp2 type hsr slave1 ns3eth1 slave2 ns3eth2 supervision 45 version 0 proto 0

# IP for the slaves
# ip -net "$ns1" addr add 100.64.0.1/24 dev ns1eth1
# ip -net "$ns1" addr add 100.64.0.1/24 dev ns1eth2
# ip -net "$ns1" addr add dead:beef:1::1/64 dev ns1eth1 nodad
# ip -net "$ns1" addr add dead:beef:1::1/64 dev ns1eth2 nodad
# ip -net "$ns2" addr add 100.64.0.2/24 dev ns2eth1
# ip -net "$ns2" addr add 100.64.0.2/24 dev ns2eth2
# ip -net "$ns2" addr add dead:beef:1::2/64 dev ns2eth1 nodad
# ip -net "$ns2" addr add dead:beef:1::2/64 dev ns2eth2 nodad

# IP for HSR
ip -net "$ns1" addr add 100.64.0.1/24 dev prp0
ip -net "$ns1" addr add dead:beef:1::1/64 dev prp0 nodad
ip -net "$ns2" addr add 100.64.0.2/24 dev prp0
ip -net "$ns2" addr add dead:beef:1::2/64 dev prp0 nodad

# All Links up
ip -net "$ns1" link set ns1eth1 up
ip -net "$ns1" link set ns1eth2 up
ip -net "$ns1" link set prp0 up

ip -net "$ns2" link set ns2eth1 up
ip -net "$ns2" link set ns2eth2 up
ip -net "$ns2" link set prp0 up

