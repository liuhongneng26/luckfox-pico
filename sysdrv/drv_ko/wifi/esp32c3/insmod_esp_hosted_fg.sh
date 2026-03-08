#!/bin/sh

RSETET_PIN=145
SPI_HANDSHAKE_PIN=34
SPI_DATAREADY_PIN=4
SPI_CS_PIN=0
SPI_CLOCKS_SPEED=20
SPI_BUS=0
SPI_MODE=0


cd /oem/usr/ko/
./hosted_daemon.out
insmod esp32_spi_fg.ko resetpin=${RSETET_PIN} \
    spi_bus=${SPI_BUS} \
    spi_cs=${SPI_CS_PIN} \
    spi_mode=${SPI_MODE} \
    spi_handshake=${SPI_HANDSHAKE_PIN} \
    spi_dataready=${SPI_DATAREADY_PIN} \
    clockspeed=${SPI_CLOCKS_SPEED}
