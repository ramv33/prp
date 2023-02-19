KVERSION = $(shell uname -r)

obj-m += prp.o

prp-objs += prp_main.o

all:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) clean
