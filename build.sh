#!/bin/bash

#docker buildx build --platform linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 -t linkease/linkease:0.3.60 -f ./Dockerfile.architecture --push .
docker buildx build --platform linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 -t linkease/linkease:latest -f ./Dockerfile.architecture --push .
