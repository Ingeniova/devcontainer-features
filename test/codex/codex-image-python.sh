#!/bin/bash
set -e

_CONTAINER_USER=${_CONTAINER_USER:-vscode}

source dev-container-features-test-lib

check "Codex is installed" codex --version
check "Codex is owned by $_CONTAINER_USER" [ "$(stat -c '%U' $(command -v codex))" = "$_CONTAINER_USER" ]
