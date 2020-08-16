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

