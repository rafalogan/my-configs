#!/usr/bin/env zsh 
#update Arch yay
yay -Syyuu &&
# Install development tools
yay -Syu --devel --timeupdate &&
# AUR helpers and other packages
yay -S gparted &&
# Install zsh
yay -S zsh &&
# clean up all unwanted dependencies
yay -Yc && 
# Set zsh as default shell
chsh -s $(which zsh) &&
echo("Zsh Installed")
