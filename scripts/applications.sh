#!/bin/bash

# DESCRIPTION
# Installs OSX applications.

printf "Checking for Homebrew... "
if ! command -v brew > /dev/null; then
	echo "WARNING: Homebrew is not installed. First install Homebrew and its binaries to install all the apps."
else
	echo "Homebrew instaled."
fi

apps=(
	# work
	sublime-text3
	virtualbox
	mactex
	vagrant
	intellij-idea
	pycharm
	clion

	# productivity, core, runtimes
	appcleaner
	osxfuse
	java
	switchresx
	flux
	the-unarchiver

	# sharing
	dropbox
    google-drive

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

names=(
	'Sublime Text 3'
	'VirtualBox'
	'MacTeX'
	'Vagrant'
	'IntelliJ IDEA - Professional Version'
	'PyCharm - Professional Version'
	'CLion - Professional Version'
	'AppCleaner'
	'OSXFuse'
	'JavaSDK'
	'SwitchResX - Paid Version'
	'flux'
	'The Unarchiever'
	'Dropbox'
    'Google-Drive'
	'Google Chrome'
	'Mozilla Firefox'
	'Skype'
	'Spotify'
	'MPlayerX'
	'Transmission'
)

if [[ $# == 0 ]]; then
	echo "Installing apps to /Applications..."

	for ((i=0; i < ${#apps[@]}; i++))
	do
		printf "Do you want to install ${names[$i]}? (y/n)  "
		read -r response
		if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
			brew cask install --appdir="/Applications" ${apps[$i]}
		fi
	done
else
	echo "Installing all apps to /Applications..."
	brew cask install --appdir="/Applications" ${apps[@]}
fi

echo "Cleaning Homebrew Cask chache..."
brew cask cleanup
echo "Selected applications instaled!"
