#!/bin/bash

# DESCRIPTION
# Installs application extensions.

# SETUP
echo "Downloading and installing Sublime Text Packge Control..."
wget https://sublime.wbond.net/Package\ Control.sublime-package && mv Package\ Control.sublime-package ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages

echo "Downloading and installing Sublime Text Extensions..."
wget https://rawgit.com/pbmartins/dotfiles/master/Package%20Control.sublime-settings && mv Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

echo "Downloading and applying Sublime Text preferences..."
wget https://rawgit.com/pbmartins/dotfiles/master/Preferences.sublime-settings && mv Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User