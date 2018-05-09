#!/usr/bin/env bash


mkdir ~/scm_artifact

touch ~/scm_artifact/file1 ~/scm_artifact/file2 ~/scm_artifact/file3 ~/scm_artifact/file4

tar -cvf ~/scm_artifact.tar ~/scm_artifact
chmod +x ~/scm_artifact.tar

ls -la ~/
