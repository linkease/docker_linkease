#!/bin/sh

PLATFORM=$1
if [ -z "$PLATFORM" ]; then
    LINKEASE_FILE="linkease.amd64"
    HEIC_FILE="heif-converter.amd64"
else
    case "$PLATFORM" in
        linux/386)
            LINKEASE_FILE=""
            ;;
        linux/amd64)
            LINKEASE_FILE="linkease.amd64"
            HEIC_FILE="heif-converter.amd64"
            ;;
        linux/arm/v6)
            LINKEASE_FILE="raspi.arm"
            ;;
        linux/arm/v7)
            LINKEASE_FILE="raspi.arm"
            ;;
        linux/arm64|linux/arm64/v8)
            LINKEASE_FILE="raspi.arm64"
            HEIC_FILE="heif-converter.arm64"
            ;;
        linux/ppc64le)
            LINKEASE_FILE=""
            ;;
        linux/s390x)
            LINKEASE_FILE=""
            ;;
        *)
            LINKEASE_FILE=""
            ;;
    esac
fi
[ -z "${LINKEASE_FILE}" ] && echo "Error: Not supported OS Architecture" && exit 1

echo "Downloading binary file: ${LINKEASE_FILE}"
wget -O /usr/bin/linkease https://fw.koolcenter.com/binary/LinkEase/LinuxStorage/${LINKEASE_FILE} > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Error: Failed to download binary file: ${LINKEASE_FILE}" && exit 1
fi
echo "Download binary file: ${LINKEASE_FILE} completed"

if [ ! -z "${HEIC_FILE}" ]; then
wget -O /usr/bin/heif-converter https://fw.koolcenter.com/binary/LinkEase/LinuxStorage/${HEIC_FILE} > /dev/null 2>&1
chmod +x /usr/bin/heif-converter
fi

chmod +x /usr/bin/linkease

