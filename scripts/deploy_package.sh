#!/bin/bash

cd ~

tar -xvf build_artifact.tar
ls -la

echo "----------------------------"
echo "Deploying Package"
echo "----------------------------"

sleep 30 # Work Goes Here
cat scm_artifact/webpage.html

echo "----------------------------"
echo "Success"
echo "----------------------------"
