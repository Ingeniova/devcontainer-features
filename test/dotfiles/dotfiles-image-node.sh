#!/bin/bash
set -e

_CONTAINER_USER=${_CONTAINER_USER:-node}

source dev-container-features-test-lib

# Check if dotfiles repo is cloned
check "Dotfiles is installed" bash -c "[ -d /home/$_CONTAINER_USER/$(basename ${DOTFILES_REPO_URL%.*}) ]"
check "Dotfiles is owned by $_CONTAINER_USER" bash -c "[ \"\$(stat -c '%U' /home/$_CONTAINER_USER/$(basename ${DOTFILES_REPO_URL%.*}))\" = \"$_CONTAINER_USER\" ]"

# Check if ~/.zshrc is symlinked to the dotfiles repo
check "Zshrc is symlinked to dotfiles" bash -c "[ -L /home/$_CONTAINER_USER/.zshrc ]"
check "Zshrc symlink is owned by $_CONTAINER_USER" bash -c "[ \"\$(stat -c '%U' /home/$_CONTAINER_USER/.zshrc)\" = \"$_CONTAINER_USER\" ]"
