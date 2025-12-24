#!/bin/bash
set -e

# shellcheck source=/dev/null
source dev-container-features-test-lib

_REMOTE_USER=$(whoami)

check "Codex is installed" codex --version
check "Codex is owned by $_REMOTE_USER" [ "$(stat -c '%U' "$(command -v codex)")" = "$_REMOTE_USER" ]
