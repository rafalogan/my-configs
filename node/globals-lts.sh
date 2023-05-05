#!/usr/bin/env zsh
# Variables
# indirect plugins
####################
TYPESCRIPT="typescript"
ANGULAR="@angular/cli"
IONIC="@ionic/cli"
IONIC_DEPS=(
	cordova
	native-run
	cordova-res
)

# Direct Plugins npm #
######################
DIRECT_PLUGINS=(
	eslint
  pm2
	tree-sitter-cli
	eslint_d
	markdownlint-cli
	prettier
	stylelint
	write-good
)

# Nativescript Install #
########################
# NATIVESCIRPT_ENV="${0%/*}/nativescript-env.sh"

# Install or update pnpm #
##########################
if (! pnpm --version ); then
  echo "Instalando - pnpm" &&
    npm i -g pnpm
 else
    echo "Atulaizando - pnpm" &&
      npm up -g pnpm
fi

# Install or update Typescript #
################################
if ( ! tsc --version ); then
    echo "Instalando - $TYPESCRIPT" &&
		npm i -g $TYPESCRIPT
else
  echo "Atualizando - $TYPESCRIPT" &&
  npm i -g $TYPESCRIPT@latest
fi

# Install or update Angular/cli #
#################################
if ( ! ng --version ); then
  echo "Instalando - $ANGULAR" &&
	npm i -g $ANGULAR
else
  echo "Atualizando - $ANGULAR" &&
  npm i -g $ANGULAR@latest
fi

# Install Nativescript #
########################
# zsh "$NATIVESCIRPT_ENV";

# Install IONIC #
#################
if ( ! ionic --version ); then
  echo "Instalando - $IONIC" &&
	npm i -g $IONIC
else
  echo "Atualizando - $IONIC" &&
  npm i -g $IONIC@latest
fi

# Install IONIC dependencies #
##############################
for dep in ${IONIC_DEPS[*]}; do
  if ( ! $dep --version ); then
    echo "Instalando - $dep" &&
		npm i -g $dep;
  else
    echo "Atualizando - $dep" &&
    npm i -g $dep@latest
  fi
done

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
echo "Instalação finalizada com sucesso! LTS"
