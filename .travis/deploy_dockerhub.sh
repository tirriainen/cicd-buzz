#!/bin/sh
docker login --username $DOCKER_USER --password $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
DOCKER_PATH=$DOCKER_USER/$DOCKERHUB_REPO:$TAG
DOCKER_TAG=$DOCKERHUB_REPO:$TAG
docker build --file Dockerfile --tag $DOCKER_PATH .
docker push $DOCKER_PATH