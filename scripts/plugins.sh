#!/bin/bash

# DESCRIPTION
# Installs application extensions.

printf "${GOLD}Checking for Atom... "
if [[ ! -d /Applications/Atom.app ]]; then
	printf "${RED}WARNING: Atom is not installed! Please install it first!\n$NORMAL"
else
	printf "${LIGHT_GREEN}Atom installed.\n$NORMAL"

    packages=(
        atom-beautify
        ex-mode
        file-icons
        open-terminal-here
        vim-mode-plus
    )

    printf "${GOLD}Installing Atom packages...\n"
    apm install ${packages[@]}
    printf "${LIGHT_GREEN}Atom packages installed!\n$NORMAL"
fi

printf "${GOLD}Checking for Sublime Text... "
if [[ ! -d /Applications/Sublime\ Text.app ]]; then
    printf "${RED}WARNING: Sublime Text is not installed! Please install it first!\n$NORMAL"
else
    printf "${LIGHT_GREEN}Sublime Text installed.\n$NORMAL"

    printf "${GOLD}Downloading Sublime Text Package Control...\n"
    curl -L https://packagecontrol.io/Package%20Control.sublime-package >> ~/Library/Application Support/Sublime Text 3/Installed\ Packages/Package\ Control.sublime-package
    printf "${LIGHT_GREEN}Sublime Text Package Control downloaded!\n$NORMAL"
fi