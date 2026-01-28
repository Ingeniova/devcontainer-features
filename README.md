# Ingeniova devcontainer-features

A collection of **Dev Container Features** maintained by Ingeniova to enhance your development environment.

## Features

| Feature                                      | Description                                                     |
| :------------------------------------------- | :-------------------------------------------------------------- |
| **[claude-code](src/claude-code/README.md)** | Installs the Claude Code CLI using native installer.            |
| **[codex](src/codex/README.md)**             | Installs `@openai/codex` CLI.                                   |
| **[dotfiles](src/dotfiles/README.md)**       | Clones and sets up dotfiles from a git repository.              |
| **[gcloud-cli](src/gcloud-cli/README.md)**   | Installs the Google Cloud SDK and GKE Auth Plugin.              |
| **[gemini-cli](src/gemini-cli/README.md)**   | Installs `@google/gemini-cli`.                                  |
| **[kustomize](src/kustomize/README.md)**     | Installs Kubernetes `kustomize`.                                |
| **[playwright](src/playwright/README.md)**   | Installs Playwright browsers and dependencies for Debian 12/13. |

## Usage

To use these features, add them to your `devcontainer.json`.

**Example:**

```json
{
  "features": {
    "ghcr.io/ingeniova/devcontainer-features/claude-code:0": {
      "version": "latest"
    },
    "ghcr.io/ingeniova/devcontainer-features/gcloud-cli:0": {},
    "ghcr.io/ingeniova/devcontainer-features/playwright:0": {
      "version": "latest",
      "browsers": "chromium firefox"
    }
  }
}
```

## Contributing

1. Add your feature to the `src` directory.
2. Create a test in the `test` directory.
3. Run tests using `devcontainer features test`.
