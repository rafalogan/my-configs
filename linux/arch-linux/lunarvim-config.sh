#!/usr/bin/env zsh 
#
# update Arch Linux
yay -Syu --noconfirm && yay -Yc --noconfirm &&
# install firaCode
yay -S --noconfirm ttf-fira-code &&
# install nerd-fonts
yay -S --noconfirm nerd-fonts-complete &&
# install mesloLGS
yay -S --noconfirm ttf-meslo-nerd-font-powerlevel10k &&
# install lunarvim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh) &&
# update zsh
source ~/.zshrc &&
lvim +LvimUpdate +q &&
echo("LunarVim installed")
