# Dockerfile for LinkEase based alpine
# Copyright (C) 2020 - 2020 Janson <janson@linkease.com>
# Reference URL:
# https://www.ddnsto.com/linkease/

FROM alpine:latest
LABEL maintainer="Janson <janson@linkease.com>"

COPY linkease-dl.sh /root/linkease-dl.sh
RUN set -ex \
	&& chmod +x /root/linkease-dl.sh \
	&& /root/linkease-dl.sh

VOLUME /linkease/data
ENV TZ=Asia/Shanghai
CMD [ "/usr/bin/linkease"]
