#!/usr/bin/env bash

cd ~

echo "----------------------------"
echo "Fetching Repository"
echo "----------------------------"

# Todo: pull code here
mkdir scm_artifact
echo "file1" > scm_artifact/file1 
echo "file2" > scm_artifact/file2
echo "file3" > scm_artifact/file3 
echo "file4" > scm_artifact/file4

echo "----------------------------"
echo "Repository Fetched"
echo "----------------------------"

tar -cvf scm_artifact.tar scm_artifact
ls -l
