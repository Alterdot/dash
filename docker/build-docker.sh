#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-alterdot/alterdotd-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/alterdotd docker/bin/
cp $BUILD_DIR/src/alterdot-cli docker/bin/
cp $BUILD_DIR/src/alterdot-tx docker/bin/
strip docker/bin/alterdotd
strip docker/bin/alterdot-cli
strip docker/bin/alterdot-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
