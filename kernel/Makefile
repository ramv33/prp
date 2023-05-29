ifeq ($(DEBUG), 1)
	EXTRA_CFLAGS = -O -g -DPRP_DEBUG
endif

KVERSION = $(shell uname -r)

obj-m += prp.o

prp-objs += prp_main.o prp_netlink.o prp_dev.o prp_tx.o prp_rx.o prp_node.o

all:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) clean
	rm -vf mkprp

mkprp:	mkprp.c
	$(CC) -I /usr/include/libnl3 -lnl-3 -lnl-genl-3 mkprp.c -o mkprp.out -g
