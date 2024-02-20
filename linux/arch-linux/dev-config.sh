#!/usr/bin/env zsh 
#
# update Arch yay
yay -Syu &&
# Install dependencies
yay -S git base-devel rust python-pynvim docker &&
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash &&
# Install bum 
curl -fsSL https://github.com/owenizedd/bum/raw/main/install.sh | bash &&
  echo "dependencies installed"
