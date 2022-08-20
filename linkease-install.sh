#!/bin/sh

PLATFORM=$1
if [ -z "$PLATFORM" ]; then
    LINKEASE_FILE="linkease.x86_64"
    HEIC_FILE="heif-converter.x86_64"
    MEDIA_FILE="linkease-media.x86_64"
else
    case "$PLATFORM" in
        linux/386)
            LINKEASE_FILE=""
            ;;
        linux/amd64)
            LINKEASE_FILE="linkease.x86_64"
            HEIC_FILE="heif-converter.x86_64"
            MEDIA_FILE="linkease-media.x86_64"
            ;;
        linux/arm/v6)
            LINKEASE_FILE="linkease.arm"
            MEDIA_FILE="linkease-media.arm"
            ;;
        linux/arm/v7)
            LINKEASE_FILE="linkease.arm"
            MEDIA_FILE="linkease-media.arm"
            ;;
        linux/arm64|linux/arm64/v8)
            LINKEASE_FILE="linkease.aarch64"
            HEIC_FILE="heif-converter.aarch64"
            MEDIA_FILE="linkease-media.aarch64"
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

cp /dest/linkease-binary/${LINKEASE_FILE} /usr/bin/linkease
cp /dest/linkease-binary/${MEDIA_FILE} /usr/bin/linkease-media
if [ ! -z "${HEIC_FILE}" ]; then
  cp /dest/linkease-binary/${HEIC_FILE} /usr/bin/heif-converter
  chmod +x /usr/bin/heif-converter
fi

chmod +x /usr/bin/linkease
chmod +x /usr/bin/linkease-media

