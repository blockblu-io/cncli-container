#!/bin/bash
if [ -z $1 ]; then
    echo "error: you must specify the version of CNCLI to build."
    echo "usage: $0 <cncli-version>"
    exit 1
fi

./build-amd64.sh $1
./build-arm.sh $1
./build-arm64.sh $1

./create-maifest.sh $1

