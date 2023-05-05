#!/usr/bin/env zsh 

# Install XCode or Update #
########################### 
if (! xcode-select -p); then
	xcode-select --install &&
	sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
fi

# Install HomeBrew #
####################
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&
  brew update &&
  brew upgrade &&

# Update Zsh #
##############
brew info zsh &&
  brew install zsh &&
  sudo echo "/usr/local/bin/zsh" >> /usr/local/bin/zsh &&
  chsh -s /usr/local/bin/zsh &&

# Update Openssl #
##################
brew info openssl &&
  brew install openssl &&
  brew link --force openssl && 

# openssl version #
###################
openssl version -a  

# End init configs #
####################
echo "if need user command  mv /usr/bin/openssl /usr/bin/openssl_OLD  to craarte old oppenssl" 
