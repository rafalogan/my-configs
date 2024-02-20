#!/usr/bin/env zsh 
#
# update Arch Linux
yay -Syu --noconfirm && yay -Yc --noconfirm &&
# install lunarvim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh) &&
# update zsh
source ~/.zshrc &&
echo("LunarVim installed")
