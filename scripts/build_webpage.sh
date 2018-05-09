#!/bin/bash

tar -xvf ~/scm_artifact.tar -C ~/scm_artifact

ls -l ~/scm_artifact

echo "Building Webpage"

touch ~/scm_artifact/webpage.html

tar -cvf ~/build_artifact.tar ~/scm_artifact

ls -l ~/
