#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

BROWSERS="${BROWSERS:-all}"
VERSION="${VERSION:-latest}"
USERNAME="${_REMOTE_USER}"

echo "Installing Playwright system dependencies..."

# Ensure npx is available
if ! command -v npx > /dev/null 2>&1; then
    echo "Error: 'npx' not found. Please ensure Node.js is installed."
    exit 1
fi

# Define the playwright package with version
if [ "${VERSION}" = "latest" ]; then
    PLAYWRIGHT_PKG="playwright"
else
    PLAYWRIGHT_PKG="playwright@${VERSION}"
fi

# Attempt to install dependencies using Playwright's own tool
# This is more robust across different Debian/Ubuntu versions
echo "Running 'npx ${PLAYWRIGHT_PKG} install-deps'..."
npx ${PLAYWRIGHT_PKG} install-deps

# Clean up apt cache
apt-get clean
rm -rf /var/lib/apt/lists/*

# Install Playwright browsers as the remote user
echo "Installing Playwright browsers as ${USERNAME}: ${BROWSERS}..."
if [ "${BROWSERS}" = "all" ]; then
    su - ${USERNAME} -c "npx ${PLAYWRIGHT_PKG} install"
else
    su - ${USERNAME} -c "npx ${PLAYWRIGHT_PKG} install ${BROWSERS}"
fi

echo "Playwright installed successfully!"