#!/bin/bash
set -e

# shellcheck source=/dev/null
source dev-container-features-test-lib

_REMOTE_USER=$(whoami)

check "Playwright version" npx --yes playwright --version
check "Chromium is installed" ls -d /home/"$_REMOTE_USER"/.cache/ms-playwright/chromium-*

# Install playwright locally to use it in the node script
# Skip browser download because the feature should have already handled it
export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
npm install playwright

# Create a simple Playwright test script to verify browser launch
cat << EOF > test-playwright.js
const { chromium } = require('playwright');

(async () => {
  try {
    console.log('Launching browser...');
    const browser = await chromium.launch({ headless: true });
    console.log('Browser launched successfully.');
    const page = await browser.newPage();
    await browser.close();
    console.log('Test passed.');
  } catch (error) {
    console.error('Test failed:', error);
    process.exit(1);
  }
})();
EOF

check "Playwright browser launch" node test-playwright.js

# Cleanup
rm test-playwright.js

reportResults
