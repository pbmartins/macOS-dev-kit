#!/bin/bash

# DESCRIPTION
# Applies dot files to the system.

echo "Downloading and applying Sublime Text Packge Control..."
git clone --quiet https://github.com/pbmartins/dotfiles ~/
rm -f "Package Control.sublime-settings"
rm -f "Preferences.sublime-settings"

printf "Git - your name: "
read NAME

printf "Git - your email: "
read EMAIL

echo "Configuring git with your info..."
git config --global user.name $NAME
git config --global user.email $EMAIL