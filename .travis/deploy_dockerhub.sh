#!/bin/sh
docker login --username $DOCKER_USER --password $DOCKER_PASS
DOCKER_PATH=$DOCKER_USER/$DOCKERHUB_REPO:latest
docker build -f Dockerfile -t $DOCKER_PATH:latest .
docker push $DOCKER_PATH