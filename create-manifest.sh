#!/bin/bash
if [ -z $1 ]; then
    echo "error: you must specify the version of CNCLI to build."
    echo "usage: $0 <cncli-version>"
    exit 1
fi

docker manifest create "adalove/cncli:$1" \
        "adalove/cncli:$1_amd64" \
        "adalove/cncli:$1_arm" \
        "adalove/cncli:$1_arm64"

docker manifest push --purge "adalove/cncli:$1"