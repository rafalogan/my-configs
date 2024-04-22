#!/usr/bin/env zsh 

FONTS=(
  font-fira-code
  font-hack-nerd-font
  font-meslo-lg-nerd-font
)

# install fontts cacks
brew tap homebrew/cask-fonts

# isntall fonts
for font in ${FONTS[*]}; do
  if (brew list --cask $font); then
    brew reinstall --cask $font
  else
    brew install --cask $font
  fi
done

# finish
echo "Fonts installed!"

