#!/bin/bash
set -e

_CONTAINER_USER=${_CONTAINER_USER:-node}

source dev-container-features-test-lib

check "Kustomize is installed" kustomize version
