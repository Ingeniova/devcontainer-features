# Playwright (playwright)

Installs Playwright browsers and system dependencies for Debian 12/13

## Example Usage

```json
"features": {
    "ghcr.io/ingeniova/devcontainer-features/playwright:0": {}
}
```

## Options

| Options Id | Description                                                                         | Type   | Default Value |
| ---------- | ----------------------------------------------------------------------------------- | ------ | ------------- |
| version    | Select the version of Playwright to use for installing browsers.                    | string | latest        |
| browsers   | Browsers to install: chromium, firefox, webkit, all, or space-separated combination | string | all           |

---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/ingeniova/devcontainer-features/blob/main/src/playwright/devcontainer-feature.json). Add additional notes to a `NOTES.md`._
