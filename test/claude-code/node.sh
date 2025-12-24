#!/bin/bash
set -e

# shellcheck source=/dev/null
source dev-container-features-test-lib

_REMOTE_USER=$(whoami)

check "Claude is installed" claude --version
check "Claude is owned by $_REMOTE_USER" [ "$(stat -c '%U' "$(command -v claude)")" = "$_REMOTE_USER" ]
