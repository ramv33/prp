ifeq ($(DEBUG), 1)
	EXTRA_CFLAGS = -O -g -DPRP_DEBUG -v
endif

KVERSION = $(shell uname -r)

obj-m += prp.o

prp-objs += prp_main.o

all:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) clean
