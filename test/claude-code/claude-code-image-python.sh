#!/bin/bash
set -e

_CONTAINER_USER=${_CONTAINER_USER:-vscode}

source dev-container-features-test-lib

check "Claude is installed" claude --version
check "Claude is owned by $_CONTAINER_USER" [ "$(stat -c '%U' $(command -v claude))" = "$_CONTAINER_USER" ]
