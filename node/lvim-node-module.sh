#!/usr/bin/env zsh
# Variables #
# Direct plugins npm #
######################
PLUGINS=(
  pnpm
	eslint
	eslint_d
	tree-sitter-cli
  markdownlint-cli
  prettier
  stylelint
  write-good
  emmet-ls
)

TYPESCRIPT="typescript"

# Install npm #
#############################
npm i -g npm && npm -v

# Install or update plugins #
#############################
for plugin in ${PLUGINS[*]}; do
  if ( ! $plugin --version ); then
    echo "Instalando - $plugin" &&
		npm i -g $plugin;
  else
    echo "Atualizando - $plugin" &&
    npm i -g $plugin@latest &&
    echo "$plugin foi atualizado";
  fi
done

# Install or update Typescript #
################################
if ( ! tsc --version ); then
    echo "Instalando - $TYPESCRIPT" &&
		npm i -g $TYPESCRIPT
else
  echo "Atualizando - $TYPESCRIPT" &&
  npm up -g $TYPESCRIPT
fi

# ending #
##########
echo "Instalação finalizada com sucesso! NVIM/LVIM"
