#!/usr/bin/env zsh

# Enviroment Variables #
########################
export NVM_DIR=$HOME/.nvm
source $NVM_DIR/nvm.sh

# Formulas #
############
FORMULAS=(
	awscli
	ffmpeg
	composer
	gnupg
	jq
  jsonlint
	nvm
	tree
	wget
	svn
  azure-cli
  pyenv
  cmake
  ninja
  rust
  bat
  exa
  dust
  ncdu
  htop
  ytop
  sqlite
)

# zsh-autosuggestions
# Casks #
#########
CASKS=(
	twitch
	robo-3t
	4k-video-downloader
	# android-sdk
	firefox-developer-edition
	sequel-pro-nightly
	# webtorrent
	# forticlient
	mysqlworkbench
	# signal
	zoom
	adoptopenjdk8
	discord
	google-chrome
	phpstorm
	visual-studio-code
	amazon-music
	docker
	iterm2
	postman
	vlc
  figma
  # github
  font-fira-code-nerd-font
  font-hack-nerd-font
  font-meslo-lg-nerd-font
  free-download-manager
  spotify
  microsoft-teams
  anydesk
)

# Install brew taps #
####################
brew tap homebrew/cask-versions &&
  brew tap homebrew/cask-fonts


# Install Git #
####################
brew update && brew upgrade &&
  brew install git git-flow

# Install Formula #
###################
for formula in ${FORMULAS[*]}; do
	if (! $formula --version); then
		brew install $formula &&
			echo "$formula installed with success!"
	else
		brew reinstall $formula &&
			echo "$formula upgrade with success!"
	fi
done

# Install neovim #
##################
if (! nvim --version); then
  brew install --HEAD neovim
else
  brew reinstall neovim
fi

# Install rvm #
###############
command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import - &&
  command curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import - &&
  \curl -sSL https://get.rvm.io | bash -s stable

# Install Casks #
#################
for cask in ${CASKS[*]}; do
	if (! brew list --cask $cask); then
		brew install --cask $cask &&
			echo "$cask instaled with success!"
	else
		brew reinstall --cask $cask &&
			echo "$cask upgrade with success!"
	fi
done

# Update Homebrew and clear trash #
###################################
brew update && brew upgrade && brew upgrade --casks --greedy;

