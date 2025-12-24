#!/bin/bash
set -e

# shellcheck source=/dev/null
source dev-container-features-test-lib

_REMOTE_USER=$(whoami)

check "Gemini is installed" gemini --version
check "Gemini is owned by $_REMOTE_USER" [ "$(stat -c '%U' "$(command -v gemini)")" = "$_REMOTE_USER" ]
