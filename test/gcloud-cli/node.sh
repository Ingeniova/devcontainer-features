#!/bin/bash
set -e

# shellcheck source=/dev/null
source dev-container-features-test-lib

_REMOTE_USER=$(whoami)

check "GCloud is installed" gcloud --version
check "GCloud is owned by root" [ "$(stat -c '%U' "$(command -v gcloud)")" = "root" ]
