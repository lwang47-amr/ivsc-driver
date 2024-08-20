# SPDX-License-Identifier: GPL-2.0
# Copyright (c) 2022 Intel Corporation.

obj-m += ljca.o
ljca-y := drivers/mfd/ljca.o

#obj-m += spi-ljca.o
#spi-ljca-y := drivers/spi/spi-ljca.o

obj-m += gpio-ljca.o
gpio-ljca-y := drivers/gpio/gpio-ljca.o

obj-m += i2c-ljca.o
i2c-ljca-y := drivers/i2c/busses/i2c-ljca.o

KERNELRELEASE ?= $(shell uname -r)
KERNEL_SRC ?= /lib/modules/$(KERNELRELEASE)/build
PWD := $(shell pwd)

ccflags-y += -I$(src)/include/
#ccflags-y += -I$(src)/backport-include/drivers/misc/mei/

all:
	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules

modules_install:
	$(MAKE) INSTALL_MOD_DIR=/updates -C $(KERNEL_SRC) M=$(PWD) modules_install

clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) clean
