#!/bin/bash

docker buildx build --platform linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 -t linkease/linkease:1.1.9_dev2 -f ./Dockerfile.architecture --push .
#docker buildx build \
#	--build-arg "HTTP_PROXY=http://192.168.88.2:1282/" \
#        --build-arg "HTTPS_PROXY=http://192.168.88.2:1282/" \
#	--platform linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 -t linkease/linkease:latest -f ./Dockerfile.architecture --push .

