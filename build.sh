#!/bin/bash

#docker buildx build --platform linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 -t linkease/linkease:0.3.60 -f ./Dockerfile.architecture --push .

docker buildx build \
        --build-arg "HTTP_PROXY=http://127.0.0.1:11282/" \
        --build-arg "HTTPS_PROXY=http://127.0.0.1:11282/" \
        --platform linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 -t linkease/linkease:latest -f ./Dockerfile.architecture --push .



