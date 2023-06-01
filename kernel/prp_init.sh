#!/bin/bash

if [ `id -u` -ne 0 ] ; then
	echo "must be run as root"
	exit 1
fi

if [ $# -lt 3 ] ; then
	echo "Usage: $0 <slave1> <slave2> <prp-IP>"
	exit 2
fi

#ETH0=eno1	# onboard
#ETH1=enp2s0

ETH0=$1
ETH1=$2
IP=$3
err=0

insmod ./prp.ko

ifconfig $1 > /dev/null 2>&1 || { echo "Invalid interface $1"; exit 1; }
ifconfig $2 > /dev/null 2>&1 || { echo "Invalid interface $2"; exit 1; }

MAC=$(ifconfig $ETH0 | grep ether | awk '{print $2}')
ifconfig $ETH0 0.0.0.0 down
ifconfig $ETH1 0.0.0.0 down
ifconfig $ETH1 hw ether $MAC && echo "set mac of $ETH1 to $MAC"
ifconfig $ETH0 up
ifconfig $ETH1 up

./mkprp.out $ETH0 $ETH1
ip addr add $IP dev prp0 && echo "prp0 assigned IP: $IP"

#ip route add default via 10.76.0.1 dev prp0
