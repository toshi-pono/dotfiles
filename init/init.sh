#!/bin/bash
set -u

SCRIPT_DIR=$(
  cd $(dirname $0)
  pwd
)

if [ "$(uname)" != 'Darwin' ]; then
  echo "Not macOS!"
  exit 1
fi

echo "Installing Command Line Tools..."

# TODO: Command Line Toolsがインストールされてるかちゃんとは確認できてない……？
xcode-select -p
if [ $? -ne 0 ]; then
  xcode-select --install
fi
