#!/bin/sh
docker login --username $DOCKER_USER --password $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
DOCKER_PATH=$DOCKER_USER/$DOCKERHUB_REPO:$TAG
docker build -f Dockerfile -t $DOCKER_PATH:$TAG .
docker push $DOCKER_PATH