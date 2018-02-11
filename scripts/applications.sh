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
	# text-editors
	atom
	macvim

	# ides
	intellij-idea
	pycharm
	clion
	webstorm

	# dev-tools
	dash
	docker
	docker-toolbox
	filezilla
	gns3
	java
	mactex
	meld
	vagrant
	virtualbox
	tuntap
	xquartz

	# web-browsers
	google-chrome
	firefox
	opera

	# file-sharing
	dropbox
	google-backup-and-sync

	# communication
	franz
	skype
	slack

	# utilities
	appcleaner
	flux
	osxfuse
	istat-menus
	little-snitch
	logitech-options
	spectacle
	spotify
	stremio
	vlc
	the-unarchiver
	transmission
)

names=(
	# text-editors
	'Atom'
	'MacVim'

	# ides
	'IntelliJ IDEA - Professional Version (Not Free)'
	'PyCharm - Professional Version (Not Free)'
	'CLion - Professional Version (Not Free)'
	'WebStorm - Professional Version (Not Free)'

	# dev-tools
	'Dash'
	'Docker'
	'Docker Toolbox'
	'GNS3'
	'JavaSDK'
	'MacTeX'
	'Meld'
	'Vagrant'
	'VirtualBox'
	'TUNTAP'
	'XQuartz'

	# web-browsers
	'Google Chrome'
	'Mozilla Firefox'
	'Opera'

	# file-sharing
	'Dropbox'
	'Google Backup and Sync'

	# communication
	'Franz'
	'Skype'
	'Slack'

	# utilities
	'AppCleaner'
	'flux'
	'FUSE for macOS'
	'iStat Menus'
	'Little Snitch'
	'Logitech Options'
	'Spectacle'
	'Spotify'
	'Stremio'
	'VLC'
	'The Unarchiver'
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
