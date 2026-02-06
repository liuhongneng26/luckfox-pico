CURRENT_DIR := $(shell pwd)
export SHELL:=/bin/bash
export SYSDRV_ARCH_TYPE=arm
export SYSDRV_CROSS=arm-rockchip830-linux-uclibcgnueabihf-

NG_TARGET := esp32_spi.ko

NG_BUILD_TARGET := ${CURRENT_DIR}/esp32_spi.ko
NG_BUILD_TARGET_DIR := ${CURRENT_DIR}/esp-hosted/esp_hosted_ng/host

BUILD_TARGET_OUT := ../../out
KERNEL_DIR :=$(CURRENT_DIR)/../../../source/objs_kernel/

all:ng install

install:
	cp ${NG_BUILD_TARGET_DIR}/${NG_TARGET} ${BUILD_TARGET_OUT}/esp32_spi_ng.ko
	cp insmod_esp_hosted_ng.sh ${BUILD_TARGET_OUT}

ng:
	${MAKE} -C ${NG_BUILD_TARGET_DIR} \
	CROSS_COMPILE=$(SYSDRV_CROSS) \
	KERNEL=$(KERNEL_DIR) \
	target=spi ARCH=${SYSDRV_ARCH_TYPE}
	$(SYSDRV_CROSS)strip ${NG_BUILD_TARGET_DIR}/${NG_TARGET} --strip-debug


clean:ng_clean

ng_clean:
	${MAKE} -C ${NG_BUILD_TARGET_DIR} clean \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	KERNEL=$(KERNEL_DIR) \
	target=spi