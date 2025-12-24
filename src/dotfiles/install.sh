#!/usr/bin/env bash

set -e

# Exit if DOTFILES_REPO_URL is not set
if [ -z "${DOTFILES_REPO_URL}" ]; then
  echo "DOTFILES_REPO_URL is not set. Exiting."
  exit 0
fi

# Use the standard variables provided by the Dev Container CLI
USERNAME="${_REMOTE_USER}"
HOME_DIR="${_REMOTE_USER_HOME}"

# Install zsh if not already installed
if ! command -v zsh &> /dev/null; then
  echo "zsh not found, installing..."
  apt-get update
  apt-get install -y zsh
fi

# Install oh-my-zsh if not already installed
if [ ! -d "${HOME_DIR}/.oh-my-zsh" ]; then
  echo "oh-my-zsh not found, installing..."
  su - "${USERNAME}" -c "sh -c \"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\" --unattended"
fi

# If the repository uses GitHub SSH, switch to HTTPs for cloning
if [[ "${DOTFILES_REPO_URL}" == git@github.com:* ]]; then
  DOTFILES_REPO_URL="https://github.com/${DOTFILES_REPO_URL#*:}"
fi

# Clone or update the dotfiles repository
REPO_NAME=$(basename "${DOTFILES_REPO_URL%.*}")
REPO_DIR="${HOME_DIR}/${REPO_NAME}"

if [ -d "${REPO_DIR}" ]; then
  echo "Dotfiles repository already exists at ${REPO_DIR}. Updating..."
  su - "${USERNAME}" -c "cd ${REPO_DIR} && git pull"
else
  echo "Cloning dotfiles from ${DOTFILES_REPO_URL}"
  su - "${USERNAME}" -c "git clone ${DOTFILES_REPO_URL} ${REPO_DIR}"
fi

# Run the bootstrap script as the specified user
cd "${REPO_DIR}"
for script in bootstrap.sh install.sh setup.sh; do
  if [ -f "$script" ]; then
    echo "Running ${script} from dotfiles repository"
    chmod +x "$script"
    su - "${USERNAME}" -c "${REPO_DIR}/${script}"
    break # Only run the first bootstrap script found
  fi
done