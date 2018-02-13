#!/bin/bash

# DESCRIPTION
# Applies dot files to the system.
source lib/colors.sh

printf "${GOLD}Downloading dotfiles...\n$NORMAL"
cd ~; curl -#L https://github.com/pbmartins/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE}

printf "${GOLD}Git - your name: $NORMAL"
read NAME

printf "${GOLD}Git - your email: $NORMAL"
read EMAIL

printf "${LIGHT_GREEN}Configuring git with your info...\n"
git config --global user.name $NAME
git config --global user.email $EMAIL

if [[ -d /Applications/Sublime\ Text.app ]]; then
  printf "${LIGHT_GREEN}Configuring Sublime Text preferences...\n"
  cp Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
fi

printf "${LIGHT_GREEN}Installing Vim plugins...\n$NORMAL"
git clone --quiet https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
