#!/bin/bash

mkdir scm_artifact

cd scm_artifact && touch file1 file2 file3 file4

tar -cvf scm_artifact.tar scm_artifact

ls -la
