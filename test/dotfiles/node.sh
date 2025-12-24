#!/bin/bash
set -e

# shellcheck source=/dev/null
source dev-container-features-test-lib

_REMOTE_USER=$(whoami)
DOTFILES_REPO_URL="https://github.com/jmcejudo/dotfiles.git"
REPO_NAME=$(basename "${DOTFILES_REPO_URL%.*}")
REPO_DIR="/home/$_REMOTE_USER/$REPO_NAME"
ZSHRC="/home/$_REMOTE_USER/.zshrc"

# Check if dotfiles repo is cloned
check "Dotfiles repo exists at $REPO_DIR" [ -d "$REPO_DIR" ]
check "Dotfiles repo is owned by $_REMOTE_USER" [ "$(stat -c '%U' "$REPO_DIR")" = "$_REMOTE_USER" ]

# Check if ~/.zshrc is symlinked to the dotfiles repo
check "Zshrc exists" [ -L "$ZSHRC" ]
check "Zshrc is owned by $_REMOTE_USER" [ "$(stat -c '%U' "$ZSHRC")" = "$_REMOTE_USER" ]
