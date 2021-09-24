# CNCLI Docker Images (Ubuntu)

[CNCLI](https://github.com/AndrewWestberg/cncli) is a community-based cardano-node CLI tool, mainly developed by Andrew Westberg. This repository maintains a Dockerfile for creating a basic container image of the CNCLI application. The image is based on `blockblu/ubuntu:20.04` (see Github [repository](https://github.com/blockblu-io/cardano-base-container)), which adds necessary libraries to the Ubuntu base image in order to run Cardano applications such as `cardano-node` or in this case `cncli`. 

The resulting container images are around 50 MB and based on Ubuntu 20.04 LTS. You can find prebuilt images on [Dockerhub](https://hub.docker.com/repository/docker/blockblu/cncli).

## Build

```
make amd64
```

```
make arm64
```

## Run

```
docker run blockblu/cncli:<cncli-version>
```

### Examples
#### Sending a Ping

```
docker run blockblu/cncli ping --host lin.relay.staking.outofbits.com --port 3333
```

## Contributions

Feel free to submit tickets and pull requests. This repository is maintained by:

* [Kevin Haller](mailto:kevin.haller@blockblu.io) (Operator of the [SOBIT](https://staking.outofbits.com/) stake pool)