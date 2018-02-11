#!/bin/bash

# DESCRIPTION
# Installs application extensions.

printf "Checking for Atom... "
if [[ ! -d /Applications/Atom.app ]]; then
	echo "WARNING: Atom is not installed! Please install it first!"
	exit
else
	echo "Atom installed."
fi

packages=(
	atom-beautify
	ex-mode
	file-icons
	open-terminal-here
	vim-mode-plus
)

echo "Installing Atom packages..."
apm install ${packages[@]}
