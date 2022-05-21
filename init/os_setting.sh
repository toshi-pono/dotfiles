#!/bin/bash
set -eu

if [ "$(uname)" != 'Darwin' ]; then
  echo "Not macOS!"
  exit 1
fi

echo "Setting macOS..."

# ---------- Menu bar ---------- #
# 日付表示を M月d日(EEE) H:mmに変更
defaults write com.apple.menuextra.clock "DateFormat" -string "M\u6708d\u65e5(EEE)  H:mm"

# ---------- Dock ---------- #
# Dockを右に表示
defaults write com.apple.dock "orientation" -string "right"
# Dockの「最近使用した項目」を表示しない
defaults write com.apple.dock "show-recents" -bool "false"

killall Dock

# TODO
