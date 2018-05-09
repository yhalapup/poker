#!/usr/bin/env bash

echo "----------------------------"
echo "Fetching Repository"
echo "----------------------------"

# Todo: pull code here
mkdir ~/scm_artifact
touch ~/scm_artifact/file1 ~/scm_artifact/file2 ~/scm_artifact/file3 ~/scm_artifact/file4

echo "----------------------------"
echo "Repository Fetched"
echo "----------------------------"

tar -cvf ~/scm_artifact.tar ~/scm_artifact
ls -l ~/
