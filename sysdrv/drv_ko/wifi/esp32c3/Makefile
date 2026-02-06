CURRENT_DIR := $(shell pwd)
export SHELL:=/bin/bash
export SYSDRV_ARCH_TYPE=arm
export SYSDRV_CROSS=arm-rockchip830-linux-uclibcgnueabihf-

NG_BUILD_TARGET_DIR := ${CURRENT_DIR}/esp-hosted/esp_hosted_ng/host
NG_TARGET := ${NG_BUILD_TARGET_DIR}/esp32_spi.ko

FG_BUILD_TARGET_DIR := ${CURRENT_DIR}/esp-hosted/esp_hosted_fg/host/linux/host_driver/esp32
FG_TARGET := ${FG_BUILD_TARGET_DIR}/esp32_spi.ko

BUILD_TARGET_OUT := ../../out
KERNEL_DIR :=$(CURRENT_DIR)/../../../source/objs_kernel/

all:fg ng

ng:
	${MAKE} -C ${NG_BUILD_TARGET_DIR} \
	CROSS_COMPILE=$(SYSDRV_CROSS) \
	KERNEL=$(KERNEL_DIR) \
	target=spi ARCH=${SYSDRV_ARCH_TYPE}
	$(SYSDRV_CROSS)strip ${NG_TARGET} --strip-debug
	cp ${NG_TARGET} ${BUILD_TARGET_OUT}/esp32_spi_ng.ko
	cp insmod_esp_hosted_ng.sh ${BUILD_TARGET_OUT}


fg:
	${MAKE} -C ${FG_BUILD_TARGET_DIR} \
	CROSS_COMPILE=$(SYSDRV_CROSS) \
	KERNEL=$(KERNEL_DIR) \
	target=spi ARCH=${SYSDRV_ARCH_TYPE}
	$(SYSDRV_CROSS)strip ${FG_TARGET} --strip-debug
	cp ${FG_TARGET} ${BUILD_TARGET_OUT}/esp32_spi_fg.ko
	cp insmod_esp_hosted_fg.sh ${BUILD_TARGET_OUT}

clean:ng_clean fg_clean

ng_clean:
	${MAKE} -C ${NG_BUILD_TARGET_DIR} clean \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	KERNEL=$(KERNEL_DIR) \
	target=spi

fg_clean:
	${MAKE} -C ${FG_BUILD_TARGET_DIR} clean \
	CROSS_COMPILE=$(CROSS_COMPILE) \
	KERNEL=$(KERNEL_DIR) \
	target=spi