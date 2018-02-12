#!/bin/bash

# DESCRIPTION
# Installs OSX applications.

source lib/colors.sh

printf "${GOLD}Checking for Homebrew...\n"
if ! command -v brew > /dev/null; then
	echo "WARNING: Homebrew is not installed. First install Homebrew and its binaries to install all the apps."
else
	echo "Homebrew installed."
fi

apps=(
	# text-editors
	atom
	macvim
	sublime-text

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
	'Sublime Text 3'

	# ides
	'IntelliJ IDEA - Professional Version (Not Free)'
	'PyCharm - Professional Version (Not Free)'
	'CLion - Professional Version (Not Free)'
	'WebStorm - Professional Version (Not Free)'

	# dev-tools
	'Dash'
	'Docker'
	'Docker Toolbox'
	'Filezilla'
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
	printf "${LIGHT_GREEN}Installing apps to /Applications...\n"

	for ((i=0; i < ${#apps[@]}; i++))
	do
		printf "$GOLD==> Do you want to install ${names[$i]}? (y/n) $NORMAL"
		read -r response
		if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
			brew cask install --appdir="/Applications" ${apps[$i]}
			if [[ ${names[$i]} = 'FUSE for macOS' ]]; then
				"Installing also NTFS-3G package."
				brew install ntfs-3g;
			fi
		fi
	done
else
	printf "${LIGHT_GREEN}Installing all apps to /Applications...\n"
	brew cask install --appdir="/Applications" ${apps[@]}
fi

printf "${LIGHT_GREEN}Cleaning Homebrew Cask chache...\n"
brew cask cleanup
printf "${LIGHT_GREEN}Selected applications instaled!\n"
