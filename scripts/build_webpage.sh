#!/bin/bash

tar -xvf scm_artifact.tar

ls -la

cd scm_artifact && ls -la

echo "Building Webpage"

touch scm_artifact/webpage.html

tar -cvf build_artifact.tar scm_artifact

ls -la
