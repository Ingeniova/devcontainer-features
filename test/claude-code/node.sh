#!/bin/bash
set -e

source dev-container-features-test-lib

_REMOTE_USER=$(whoami)

check "Claude is installed" claude --version
check "Claude is owned by $_REMOTE_USER" [ "$(stat -c '%U' "$(command -v claude)")" = "$_REMOTE_USER" ]
