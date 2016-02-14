#!/bin/bash

# DESCRIPTION
# Installs OSX applications.

echo "Checking for Homebrew..."
if ! command -v brew > /dev/null; then
	echo "WARNING: Homebrew is not installed. First install Homebrew and its binaries to install all the apps."
fi

apps=(
	# work
	sublime-text3
	virtualbox
	mactex
	vagrant

	# productivity, core, runtimes
	appcleaner
	osxfuse
	java
	switchresx
	flux
	the-unarchiver

	# sharing
	dropbox

	# browsers
	google-chrome
	firefox

	# communication
	skype

 	# entertainment
	spotify
	mplayerx

	# file sharing
	transmission
)

echo "Installing apps to /Applications..."
brew cask install --appdir="/Applications" ${apps[@]}

ide=(
	intellij-idea
	pycharm
	clion
)


# IntelliJ IDEA 15
echo "Do you want to install JetBrains IntelliJ IDEA 15 (professional-version)? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	brew cask install --appdir="/Applications" ${ide[0]}
fi

# PyCharm
echo "Do you want to install JetBrains PyCharm (professional-version)? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	brew cask install --appdir="/Applications" ${ide[1]}
fi

# CLion
echo "Do you want to install JetBrains CLion (professional-version)? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	brew cask install --appdir="/Applications" ${ide[2]}
fi

brew cask cleanup