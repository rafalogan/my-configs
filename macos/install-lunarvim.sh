#!/usr/bin/env zsh

# Update brew #
###############
brew update && 
  brew upgrade && 

# install neovim #
##################
if (! nvim --version); then
  brew install --HEAD neovim
else
  brew reinstall neovim
fi  

# Install Lunarvim Nightly #
############################
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
