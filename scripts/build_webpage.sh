#!/bin/bash

tar -xvf ~/scm_artifact.tar -C ~/
ls -l ~/scm_artifact

echo "----------------------------"
echo "Building Webpage"
echo "----------------------------"

# Run CURL Commands to get details about build
touch ~/scm_artifact/webpage.html

echo "----------------------------"
echo "Webpage Built"
echo "----------------------------"

tar -cvf ~/build_artifact.tar ~/scm_artifact
ls -l ~/
