# CNCLI Docker Images (Ubuntu)

[CNCLI](https://github.com/AndrewWestberg/cncli) is a community-based cardano-node CLI tool, mainly developed by Andrew Westberg. This repository maintains a Dockerfile for creating a basic container image of the CNCLI application. The application is based on the `adalove/ubuntu:20.04` image (see Github [repository](https://github.com/outofbits/cardano-base-images)), which adds necessary libraries to the Ubuntu base image in order to run Cardano applications such as `cardano-node` or in this case `cncli`. 

The resulting container images are around 110 MB and based on Ubuntu 20.04 LTS. You can find prebuilt images on [Dockerhub](https://hub.docker.com/repository/docker/adalove/cncli).

## Build

```
./build.sh <cncli-version>
```

## Run

```
docker run adalove/cncli:<cncli-version>
```

## Maintainer

* Kevin Haller - [kevin.haller@outofbits.com](mailto:kevin.haller@outofbits.com)