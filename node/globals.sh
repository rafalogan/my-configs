#!/usr/bin/env zsh
# Variables #
# indirect plugins #
####################
GULP="gulp-cli"
VUE="@vue/cli"

# Direct Plugins npm #
######################
DIRECT_PLUGINS=(
  knex
  ipt
	npmrc
	verdaccio
	fkill
	npkill
)

# Constants #
#############
LTS_DEPS="${0%/*}/globals-lts.sh"

# Install lts DEPS #
####################
zsh "$LTS_DEPS"

# Install or update Gulp #
##########################
if ( ! gulp --version ); then
    echo "Instalando - $GULP" &&
		npm i -g $GULP
else
  echo "Atualizando - $GULP" &&
	npm i -g $GULP@latest
fi

# Install vue #
############################
if ( ! vue --version ); then
  echo "Instalando - $VUE" &&
	npm i -g $VUE
else
	old_version="$(vue --version)"
  echo "Atualizando - $VUE" &&
  npm i -g $VUE@latest
fi

# Install or update plugins #
#############################
for plugin in ${DIRECT_PLUGINS[*]}; do
  if ( ! $plugin --version ); then
    echo "Instalando - $plugin" &&
		npm i -g $plugin;
  else
    echo "Atualizando - $plugin" &&
    npm i -g $plugin@latest &&
    echo "$plugin foi atualizado";
  fi
done

# ending #
##########
echo "Instalação finalizada com sucesso!"
