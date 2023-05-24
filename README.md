## 使用说明

易有云尽可能使用点对点进行网络传输，所以在使用 Docker 的时候，为了避免给易有云增加了一层 NAT，建议网络配置使用：

Network Type

1. Host 模式，即用本主机的网络，减少了一层 NAT
2. Custom br0 模式，即把 Docker 里面的网络连接到一个局域网中，最好是得到根主机一个网段的 IP，也能少一层 NAT

否则会让易有云无法充分利用本地局域网的网络通信，影响网速，同时影响网络发现、远程 samba 等等功能特性。（即可以通过易有云远程访问局域网其它的 samba 共享路径）

## Usage

```
docker run -d \
    --cap-add=NET_ADMIN \
    -p 8897:8897 \
    --name=<container name> \
    -v <path for data files>:/linkease-data \
    -v <path for config files>:/linkease-config \
    -v /etc/localtime:/etc/localtime:ro \
    -e PUID=<uid for user> \
    -e PGID=<gid for user> \
    linkease/linkease
```

## 镜像地址

https://hub.docker.com/r/linkease/linkease/

## Test

docker run -it --entrypoint /bin/sh linkease/linkease:1.1.9

