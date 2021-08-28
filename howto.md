#kms docker_linkease

## prepare

```
docker run --rm --privileged docker/binfmt:a7996909642ee92942dcd6cff44b9b95f08dad64
docker buildx create --name mybuilder --driver docker-container
docker buildx use mybuilder
docker buildx ls
```

## build 
1. docker buildx build --platform linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 -t linkease/linkease -o type=local,dest=~/.docker -f ./Dockerfile.architecture .
2. docker buildx build --platform linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64 -t linkease/linkease --push -f ./Dockerfile.architecture .

## update version 2

```
sudo apt-get install qemu-user-static -y
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx rm mybuilder
docker buildx create --name mybuilder --driver docker-container --use
docker buildx inspect --bootstrap
```

other from network

```
#https://medium.com/@srivathsalachary/on-ubuntu-if-you-get-the-below-error-follow-these-steps-7c764837a181
sudo apt-get install qemu-user-static -y
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes i
docker buildx rm multibuilder
docker buildx create --name multibuilder
docker buildx ls
docker buildx inspect multibuilder
docker buildx inspect multibuilder --bootstrap
docker buildx use multibuilder
docker ps -a
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t <youruserid>/hello --push .
```

TODO

sudo systemctl restart docker

fixed it !

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes

