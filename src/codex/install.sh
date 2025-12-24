#!/bin/bash
set -e

VERSION=${VERSION:-"latest"}
USERNAME="${_REMOTE_USER}"

if [ "${VERSION}" = "latest" ]; then
  PACKAGE="@openai/codex"
else
  PACKAGE="@openai/codex@${VERSION}"
fi

if ! command -v npm > /dev/null 2>&1; then
  echo "Error: 'npm' not found. Please ensure Node.js is installed (e.g., via 'ghcr.io/devcontainers/features/node:1')."
  exit 1
fi

echo "Installing ${PACKAGE} for user ${USERNAME}..."
su - "${USERNAME}" -c "npm install -g ${PACKAGE}"
