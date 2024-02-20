#!/usr/bin/env zsh 
#
# Istall Dependencies
sudo pacman -Syyuu &&
sudo pacman -S --noconfirm --needed git base-devel &&
# open temp dir
cd /tmp &&
# Clone Yay
sudo git clone https://aur.archlinux.org/yay-git.git &&
# change permissions on yay-git
sudo chown -R $USER:$USER yay-git &&
# change directory to yay-git
cd yay-git &&
# build and install yay
makepkg -si &&
echo("Yay Installed")
