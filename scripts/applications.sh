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
    vimr
	sublime-text

	# ides
	intellij-idea
	pycharm
	clion
	webstorm

	# dev-tools
	dash
	docker
	filezilla
	gns3
    iterm2
	java
	mactex
	meld
	vagrant
	virtualbox
	tuntap
    wireshark
	xquartz

	# web-browsers
	google-chrome
	firefox
	brave-browser

	# file-sharing
	dropbox
	google-backup-and-sync

	# communication
	franz
	skype
	slack
    whatsapp

	# utilities
	appcleaner
    omnidisksweeper
    tunnelblick
	osxfuse
	istat-menus
	little-snitch
	spectacle
	spotify
	mpv
	iina
	the-unarchiver
	transmission
)

names=(
	# text-editors
	'Atom'
	'MacVim'
    'VimR'
	'Sublime Text 3'

	# ides
	'IntelliJ IDEA - Professional Version (Not Free)'
	'PyCharm - Professional Version (Not Free)'
	'CLion - Professional Version (Not Free)'
	'WebStorm - Professional Version (Not Free)'

	# dev-tools
	'Dash'
	'Docker'
	'Filezilla'
	'GNS3'
    'iTerm2'
	'JavaSDK'
	'MacTeX'
	'Meld'
	'Vagrant'
	'VirtualBox'
	'TUNTAP'
    'Wireshark'
	'XQuartz'

	# web-browsers
	'Google Chrome'
	'Mozilla Firefox'
	'Brave Browser'

	# file-sharing
	'Dropbox'
	'Google Backup and Sync'

	# communication
	'Franz'
	'Skype'
	'Slack'
    'WhatsApp'

	# utilities
	'AppCleaner'
    'OmniDiskSweeper'
    'Tunnelblick'
	'FUSE for macOS'
	'iStat Menus'
	'Little Snitch'
	'Spectacle'
	'Spotify'
	'mpv'
	'IINA'
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
				printf "${GOLD}Installing also NTFS-3G package.\n$NORMAL"
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
