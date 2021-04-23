#!/bin/bash
if [ -z $1 ]; then
    echo "error: the version of CNCLI that shall be built no specified."
    echo "usage: $0 <cncli-version>"
    exit 1
fi

docker build --platform linux/amd64 \
	--build-arg CNCLI_VERSION=$1 \
	--no-cache \
	--pull \
	-t "adalove/cncli:$1_amd64" .

docker push "adalove/cncli:$1_amd64"

docker build --platform linux/arm/v7 \
	--build-arg CNCLI_VERSION=$1 \
	--no-cache \
	--pull \
	-t "adalove/cncli:$1_arm" .

docker push "adalove/cncli:$1_arm"

docker build --platform linux/arm64/v8 \
	--build-arg CNCLI_VERSION=$1 \
	--no-cache \
	--pull \
	-t "adalove/cncli:$1_arm64" .

docker push "adalove/cncli:$1_arm64"

docker manifest create "adalove/cncli:$1" \
	"adalove/cncli:$1_amd64" \
	"adalove/cncli:$1_arm" \
	"adalove/cncli:$1_arm64"

docker manifest push --purge "adalove/cncli:$1"