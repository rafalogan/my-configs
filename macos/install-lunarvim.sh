#!/usr/bin/env zsh

BREW_DEPS=(
  git
  pyenv
  cmake
  ninja
  rust
)

# Update brew #
###############
brew update && 
  brew upgrade && 

# install neovim #
##################
if (! nvim --version); then
  brew install --HEAD neovim &&
else
  brew reinstall neovim &&
fi  

# Install Lvim dep's # 
#######################
npm i -g pnpm &&

for dep in ${BREW_DEPS[*]}; do 
  if (! $dep --version); then
    brew install $dep &&
   else
    brew upgrade $dep &&
  fi
done

# Install Lunarvim Nightly #
############################
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
