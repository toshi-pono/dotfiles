#!/bin/bash
set -eu

GITHUB_URL="https://github.com/toshi-pono/"
REPO_NAME="dotfiles"
DOTFILES_PATH="${HOME}/dev/toshi-pono/"

if [ "$(uname)" != 'Darwin' ]; then
  echo "Not macOS!"
  exit 1
fi

if type git >/dev/null 2>&1; then
  $(git clone --recursive "$GITHUB_URL""$REPO_NAME".git "$DOTFILES_PATH""$REPO_NAME")
  #TODO: if git is not found, use curl or wget
else
  echo "git is not found"
  echo "exit"
  exit 1
fi

cd "$DOTFILES_PATH""$REPO_NAME"
if [ $? -ne 0 ]; then
  echo "$DOTFILES_PATH""$REPO_NAME"
  echo "not found..."
  exit 1
fi

make
