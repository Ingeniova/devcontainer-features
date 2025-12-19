#!/bin/bash
set -e

source dev-container-features-test-lib

check "Playwright version" npx playwright --version

# Determine the home directory of the remote user
# In tests, we can check where playwright installs by default
PLAYWRIGHT_CACHE_DIR=$(npx playwright install-deps --dry-run 2>&1 | grep -oE "/[^ ]+/\.cache/ms-playwright" | head -n 1 || echo "$HOME/.cache/ms-playwright")

# Alternatively, just check the current user's home .cache
check "Chromium browser folder exists" ls -d $HOME/.cache/ms-playwright/chromium-* || ls -d /home/node/.cache/ms-playwright/chromium-* || ls -d /home/vscode/.cache/ms-playwright/chromium-*

reportResults