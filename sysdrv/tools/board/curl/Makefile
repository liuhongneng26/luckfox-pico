SYSDRV_ARCH_TYPE=arm
SYSDRV_CROSS=arm-rockchip830-linux-uclibcgnueabihf


export LC_ALL=C
SHELL:=/bin/bash
CURRENT_DIR := $(shell pwd)

PKG_TARBALL_CURL := curl-8.15.0.tar.gz
PKG_NAME_CURL := curl-8.15.0

PKG_BIN := out


all:
	@test -f $(CURRENT_DIR)/$(PKG_BIN)/bin/curl ||(\
	tar -xf ${PKG_TARBALL_CURL}; \
	mkdir -p $(CURRENT_DIR)/$(PKG_BIN); \
	pushd $(CURRENT_DIR)/$(PKG_NAME_CURL)/; \
			./configure \
			--host=$(SYSDRV_CROSS) \
			--prefix=$(CURRENT_DIR)/$(PKG_BIN) --with-mbedtls=$(CURRENT_DIR)/target  --without-libpsl --without-ssl; \
		make -j$(SYSDRV_JOBS) || exit -1; \
		make install > /dev/null; \
	popd; )

distclean:
	-rm -rf $(PKG_BIN) $(PKG_NAME_CURL)