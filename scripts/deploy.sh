#!/bin/bash

set -o errexit -o pipefail # Exit on error
source scripts/functions.sh

cp Dockerfile ~/
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

sudo service docker start

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


# Push docker image
if ! require_vars AWS_SECRET_ACCESS_KEY AWS_ACCESS_KEY_ID AWS_ECR_REPO DOCKER_IMAGE; then

  echo "Set required variables"
  exit 2
fi

# Install/Upgrade AWS CLI
pip install awscli --upgrade --user

$(aws ecr get-login --no-include-email --region us-east-1)

sudo docker build -t ${DOCKER_IMAGE} .
sudo docker tag ${DOCKER_IMAGE}:latest ${AWS_ECR_REPO}/${DOCKER_IMAGE}:latest
sudo docker push ${AWS_ECR_REPO}/${DOCKER_IMAGE}:latest

echo "----------------------------"
echo "Success"
echo "----------------------------"
