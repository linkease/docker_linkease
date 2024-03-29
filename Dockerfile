# Dockerfile for LinkEase based alpine
# Copyright (C) 2020 - 2020 Janson <janson@linkease.com>
# Reference URL:
# https://www.ddnsto.com/linkease/

FROM alpine:latest
LABEL maintainer="Janson <janson@linkease.com>"

#ARG TARGETPLATFORM
ADD dest /dest
RUN set -ex \
  cd /dest && /dest/linkease-install.sh "${TARGETPLATFORM}" && cd / && rm -rf /dest

EXPOSE 8897

VOLUME /linkease-data

VOLUME /linkease-config

ENV TZ=Asia/Shanghai

ENV LINKEASE_PORT=8897
ENV LINKEASE_CONFIG=/linkease-config

CMD [ "/usr/bin/linkease"]
