#!/usr/bin/env zsh
#variables



SNAPAPPS=(

)
# update Arch Linux
yay -Syu --noconfirm && yay -Yc --noconfirm
# install packages
yay -S --noconfirm alacritty broot cava fd fzf htop jq ripgrep starship tree unzip xclip &&
# install docker and docker-desktop
yay -S --noconfirm docker docker-compose docker-desktop &&
# install cargo packages
cargo install bat exa dust tokei ytop tealdeer grex rmesg zoxide delta &&
# install asdf
yay -S --noconfirm asdf-vm &&
# install nodejs
nvm install node &&
# install snap store
# change to temp dir
cd /tmp &&
# clone snapd
git clone https://aur.archlinux.org/snapd.git &&
# change to snapd dir
cd snapd &&
# build and install snapd
makepkg -si &&
# enable snapd
sudo systemctl enable --now snapd.socket &&
sudo ln -s /var/lib/snapd/snap /snap
# install apps
yay -S  firefox-developer-edition google-chrome vlc anydesk docker nerd-fonts-fira-code tilix warp --noconfirm &&
echo "Installed $app"


# install snap apps
for app in ${SNAPAPPS[@]}; do
  sudo snap install figma-linux "code --classic" slack spotify zoom-client postman mysql-workbench-community robo3t-snap discord telegram-desktop trello-desktop &&
  echo "Installed $app"
done

fc-cache -fv &&

echo("All apps installed")
