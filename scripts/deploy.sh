#!/bin/bash

source scripts/functions.sh

cd ~

tar -xvf build_artifact.tar
ls -la

echo "----------------------------"
echo "Deploying Package"
echo "----------------------------"

# Ensure docker is installed
if ! which docker > /dev/null 2>&1; then
  install_docker
fi

# Remove any previously built images
if ! require_vars DOCKER_IMAGE; then
  echo "Set required variables"
  exit 1
fi

if sudo docker images -a | awk '{print $1}' | grep $DOCKER_IMAGE > /dev/null 2>&1; then
  for image_id in `docker images -a | grep ^${DOCKER_IMAGE} | awk '{print $3}'`; do 
    sudo docker rmi $image_id
  done
fi

# Build docker image
sudo docker build -t ${DOCKER_IMAGE}:latest -t ${DOCKER_IMAGE}:$TIMESTAMP .

# Push docker image
if ! require_vars DOCKER_USERNAME DOCKER_PASSWORD; then
  echo "Set required variables"
  exit 2
fi
echo $DOCKER_PASSWORD | sudo docker login --username=${DOCKER_USERNAME} --password-stdin
sudo docker push $DOCKER_IMAGE

echo "----------------------------"
echo "Success"
echo "----------------------------"
