#!/bin/bash
if [ -z $1 ]; then
    echo "error: you must specify the version of CNCLI to build."
    echo "usage: $0 <cncli-version>"
    exit 1
fi

docker build --platform linux/arm/v7 \
	--build-arg CNCLI_VERSION=$1 \
	--no-cache \
	--pull \
	-t "adalove/cncli:$1_arm" .

docker push "adalove/cncli:$1_arm"