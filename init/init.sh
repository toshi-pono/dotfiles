#!/bin/bash
set -eu

SCRIPT_DIR=$(
  cd $(dirname $0)
  pwd
)

if ["$(uname)" != 'Darwin']; then
  echo "Not macOS!"
  exit 1
fi

echo "Installing Command Line Tools..."
xcode-select --install
