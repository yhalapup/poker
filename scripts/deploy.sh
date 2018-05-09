#!/bin/bash

tar -xvf build_artifact.tar -C ~/

ls -la

echo "Deploying Package"

touch ~/scm_artifact/webpage.html

tar -cvf ~/build_artifact.tar ~/scm_artifact

ls -la
