# Build the vendor modules as external modules against a kernel_common-6.18 build:
#   make KERNEL_SRC=<kernel_common-6.18> KERNEL_OUT=<its O= dir> OUT=<output dir>
# LIST and CONFIG choose the module set and the vendor Kconfig values.
LIST ?= fp6/base.list
CONFIG ?= defconfig
VENDOR_ROOT := $(CURDIR)

all:
	python3 -I build/kbuild.py $(LIST) $(CONFIG) $(OUT) $(KERNEL_OUT)/include/config/auto.conf
	$(MAKE) -C $(KERNEL_SRC) O=$(KERNEL_OUT) M=$(VENDOR_ROOT) MO=$(OUT) \
		VENDOR_ROOT=$(VENDOR_ROOT) VENDOR_OUT=$(OUT) modules

.PHONY: all
