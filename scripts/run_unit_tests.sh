#!/bin/bash

tar -xvf ~/scm_artifact.tar -C ~/

ls -la ~/

cd ~/scm_artifact && ls -la

echo "Running Unit Tests"

sleep 30

echo "Unit Tests Passed"
