#!/bin/bash
if [ -z $1 ]; then
    echo "error: the version of CNCLI that shall be built no specified."
    echo "usage: $0 <cncli-version>"
    exit 1
fi

docker build --build-arg CNCLI_VERSION=$1 --no-cache --pull -t adalove/cncli:$1 .