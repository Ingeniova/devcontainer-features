#!/bin/bash
set -e

_CONTAINER_USER=${_CONTAINER_USER:-vscode}

source dev-container-features-test-lib

check "GCloud is installed" gcloud --version
