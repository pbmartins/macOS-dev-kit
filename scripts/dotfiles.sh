#!/bin/bash

# DESCRIPTION
# Applies dot files to the system.

echo "Downloading dotfiles..."
git clone --quiet https://github.com/pbmartins/dotfiles ~/

printf "Git - your name: "
read NAME

printf "Git - your email: "
read EMAIL

echo "Configuring git with your info...\n"
git config --global user.name $NAME
git config --global user.email $EMAIL

printf "Installing Vim plugins...\n"
vim +PluginInstall +qall
