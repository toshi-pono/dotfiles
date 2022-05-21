#!/bin/bash
set -eu

SCRIPT_DIR=$(
  cd $(dirname $0)
  pwd
)

if ! type brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! type brew >/dev/null 2>&1; then
  echo "brew is not found"
  echo "exit"
  exit 1
fi

echo "Updating Homebrew..."
brew update

if [ "$#" = 1 ] && [ "$1" = "-s" ]; then
  echo "Installing Core packages..."
  brew bundle --file "$SCRIPT_DIR/Core"

elif [ "$#" = 1 ] && [ "$1" = "-a" ]; then
  echo "Installing All packages..."
  brew bundle --file "$SCRIPT_DIR/Core"
  brew bundle --file "$SCRIPT_DIR/Sub"
  brew bundle --file "$SCRIPT_DIR/Option"

else
  echo "Installing packages..."
  brew bundle --file "$SCRIPT_DIR/Core"
  brew bundle --file "$SCRIPT_DIR/Sub"
fi

echo ""
echo "brew process finished."
