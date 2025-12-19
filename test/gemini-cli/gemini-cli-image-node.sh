#!/bin/bash
set -e

_CONTAINER_USER=${_CONTAINER_USER:-node}

source dev-container-features-test-lib

check "Gemini is installed" gemini --version
check "Gemini is owned by $_CONTAINER_USER" [ "$(stat -c '%U' $(command -v gemini))" = "$_CONTAINER_USER" ]
