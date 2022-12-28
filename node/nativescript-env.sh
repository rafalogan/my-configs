#!/usr/bin/env zsh
# Variables
# EXEC
# Install the dependencies for iOS development
# Run the App Store and download Xcode.
# Start Xcode and you will be prompted to install Command Line Tools for Xcode.
if (! xcodebuild -version); then
  xcode-select --install &&
  sudo xcode-select -s /Applications/Xcode.app/Contents/Developer;
else
  xcodebuild -version &&
  sudo xcode-select -s /Applications/Xcode.app/Contents/Developer &&
  echo "Comand line já instalado, use [Software Update] para instalar atualizações"
fi

# Install Homebrew to simplify the installation process.
if ( ! brew --version ); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&
  brew update
else
  # Update brew
  brew update &&
  brew upgrade &&
  brew tap homebrew/cask-versions
fi

# Install the latest Node.js or update
if (! node --version); then
  nvm i node
fi

#ruby version
if (! brew list ruby@2.7); then
  brew install ruby@2.7 &&
  brew link ruby@2.7
else
  brew link ruby@2.7
fi

# Add rubygems to the path
if ( -d "/opt/homebrew/lib/ruby/gems/2.7.0/bin"); then
  export PATH=/opt/homebrew/lib/ruby/gems/2.7.0/bin:$PATH
else
  export PATH=/usr/local/lib/ruby/gems/2.7.0/bin:$PATH
fi

# Install CocoaPods
# Setup CocoaPods
if (! pod --version ); then
  sudo gem install cocoapods
else
  sudo gem update cocoapods
fi

# Install the xcodeproj ruby gem with the following command.
if ( ! gem list --local xcodeproj ); then
	sudo gem install xcodeproj
else
	sudo gem update xcodeproj
fi

# Install pip
# Install python six package
sudo ln -s $(which python3) /usr/local/bin/python
# set the global python version to 2.7.18
# link the installed python version to be available to XCode
#instal pip
python3 -m pip install --upgrade pip
python3 -m pip install six

# Install the Android SDK.
# In the terminal, run the following command:
if ( ! brew list --cask  temurin11 ); then
  brew tap homebrew/cask-versions &&
  brew install --cask temurin11
else
  brew tap homebrew/cask-versions &&
	brew upgrade --cask temurin11
fi
# Next, run the following command to set the ANDROID_HOME system environment variable:
export ANDROID_HOME=$HOME/Library/Android/sdk
# In addition, install all packages for the Android SDK Platform 28, Android SDK Build-Tools 28.0.3 or later,
# Android Support Repository, Google Repository and any other SDKs that you may need.
# You can alternatively use the following command, which will install all required packages.
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Setup Android Emulators (AVD) by following the article
# 'https://docs.nativescript.org/angular/tooling/android-virtual-devices'
# Install the NativeScript CLI.
if ( ! ns --version ); then
  echo "Instalado Nativescript..."
  npm i -g nativescript
else
	echo "Atualizando NativeScript..." &&
  npm i -g nativescript@latest
fi
# Restart the command prompt.
ns doctor &&
echo "[nativescript] - Instalado e configurado"
echo "To finish this configuration Insert in your  ~/.bash_profile, ~/.bashrc or ~/.zshrc
# Add rubygems to the path
export PATH=/opt/homebrew/lib/ruby/gems/2.7.0/bin:$PATH
# or
export PATH=/usr/local/lib/ruby/gems/2.7.0/bin:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
"
