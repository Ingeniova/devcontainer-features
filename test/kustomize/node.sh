#!/bin/bash
set -e

source dev-container-features-test-lib

_REMOTE_USER=$(whoami)

check "Kustomize is installed" kustomize version
check "Kustomize is owned by root" [ "$(stat -c '%U' "$(command -v kustomize)")" = "root" ]
