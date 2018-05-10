#!/usr/bin/env bash

set -o errexit -o pipefail # Exit on error

source scripts/functions.sh

# Set the timestamp for building/testing the canary page
if require_vars TDDIUM TDDIUM_SESSION_ID; then
  export ARTIFACT_DIR=${HOME}/results/${TDDIUM_SESSION_ID}/session
else
  export ARTIFACT_DIR=`mktemp -d -t canary-artifacts.XXXXXXX`
fi
mkdir -p $ARTIFACT_DIR
TIMESTAMP=`date +%s` # Use a consistent value of time 

# Ensure jq is installed
if ! which jq > /dev/null 2>&1; then
  install_jq
fi

# Determine $REPO_ID, $REPO_NAME, $BRANCH_ID, and $BRANCH_NAME for current session using API
# http://solano-api-docs.nfshost.com/
rm -f ${ARTIFACT_DIR}/repo_info.html.txt
if ! require_vars SOLANO_API_KEY; then
  echo "ERROR: \$SOLANO_API_KEY needs to be set" | tee -a $ARTIFACT_DIR/errors.txt
elif ! fetch_current_session_info; then
  echo "ERROR: Could not fetch current session information" | tee -a $ARTIFACT_DIR/errors.txt
fi

# Only searxh for previous results if we could lookup current session info above
if [ -f ${ARTIFACT_DIR}/repo_info.html.txt ]; then
  rm -f ${ARTIFACT_DIR}/previous_sessions.html.txt
  if ! fetch_previous_sessions_info; then
    echo "ERROR: Could not fetch previous session information" | tee -a $ARTIFACT_DIR/errors.txt
  fi
fi

# Build the canary page
./scripts/build_canary_webpage.sh $TIMESTAMP

# Ensure the canary page has the correct values
./scripts/test_canary_webpage.sh $TIMESTAMP
