#!/bin/bash

# DESCRIPTION
# Installs application extensions.

printf "Checking for Sublime Text... "
if [[ ! -d /Applications/Sublime\ Text.app ]]; then
	echo "WARNING: Sublime Text is not installed! Plase install it first!"
	exit
else
	echo "Sublime Text installed."
fi

printf "Checking for wget... "
if ! command -v wget > /dev/null; then
	echo "WARNING: wget is not installed. First install it to install all the extensions."
else
	echo "wget installed."
fi

# SETUP
echo "Downloading and installing Sublime Text Packge Control..."
wget https://sublime.wbond.net/Package\ Control.sublime-package && mv Package\ Control.sublime-package ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages

echo "Downloading and installing Sublime Text Extensions..."
wget https://rawgit.com/pbmartins/dotfiles/master/Package%20Control.sublime-settings && mv Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

echo "Downloading and applying Sublime Text preferences..."
wget https://rawgit.com/pbmartins/dotfiles/master/Preferences.sublime-settings && mv Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User