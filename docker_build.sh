#!/bin/bash

# if docker container is running, stop it
if [ "$(docker ps -q -f name=ubuntu_host)" ]; then
    docker stop ubuntu_host
fi

# if docker container exists, remove it
if [ "$(docker ps -aq -f status=exited -f name=ubuntu_host)" ]; then
    docker rm ubuntu_host
fi

docker build -t ubuntu_host .
