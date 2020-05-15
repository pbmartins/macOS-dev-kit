#!/bin/bash

# DESCRIPTION
# Installs Homebrew software.
source lib/colors.sh

# EXECUTION
# Homebrew
printf "${GOLD}Checking for Homebrew... "
if ! command -v brew > /dev/null; then
	printf "${LIGHT_GREEN}Homebrew not installed! ${GOLD}Installing Homebrew...\n"
 	ruby -e "$(curl --location --fail --silent --show-error https://raw.githubusercontent.com/Homebrew/install/master/install)"
	export PATH="/usr/local/bin:$PATH"
	printf "export PATH=\"/usr/local/bin:$PATH\"\n" >> $HOME/.bash_profile
else
	printf "$NORMAL${LIGHT_GREEN}Homebrew installed.\n"
fi

printf "${LIGHT_GREEN}Updating Homebrew...\n"
brew update

printf "${LIGHT_GREEN}Installing GNU core utils (those that come with OS X are outdated)...\n"
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

printf "${LIGHT_GREEN}Installing some other useful utilities like 'sponge'.\n"
brew install moreutils

printf "${LIGHT_GREEN}Installing GNU 'find', 'locate', 'updatedb', and 'xargs', 'g'-prefixed.\n"
brew install findutils

printf "${LIGHT_GREEN}Installing new version of Bash...\n"
brew install bash
brew install bash-completion2

printf "${LIGHT_GREEN}Adding the newly installed shell to the list of allowed shells\n"
# Add the new shell to the list of allowed shells
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell
chsh -s /usr/local/bin/bash

printf "${LIGHT_GREEN}Adding brew-command-not-found...\n"
brew tap homebrew/command-not-found
printf "${GOLD}Add the following line to your .bashrc:\n"
printf "${GOLD}if brew command command-not-found-init > /dev/null 2>&1; then eval '$(brew command-not-found-init)'; fi\n"

printf "${LIGHT_GREEN}Installing more recent versions of some OS X tools...\n"
brew install grep

printf "${LIGHT_GREEN}Installing and linking OpenSSL...\n"
brew install openssl
brew link openssl --force

printf "${LIGHT_GREEN}Installing Cask and Cask Upgrade...\n"
brew tap caskroom/cask
brew tap buo/cask-upgrade

printf "${LIGHT_GREEN}Installing fuzzyfinder...\n"
brew install fzf
/usr/local/opt/fzf/install

homebrew_binaries=(
	adns
	asciinema
	autoconf
	automake
	binutils
	cmake
	curl
	dnscrypt-proxy
	docker
	doxygen
	exiv2
	ffmpeg
	fontconfig
	gcc
	gdbm
	ghex
	git
	git-lfs
	gpac
	gpg
	graphviz
	htop
	httpie
	iperf3
	iproute2mac
	minicom
	mongodb
	mysql
	namebench
	ngrep
	nmap
	node
	ntfs-3g
	peco
	perl
	pkg-config
	pv
	python
	python3
	rbenv
	rbenv-vars
	ruby-build
	shellcheck
	sqlite
	tree
	vim
	wget
	x264
)

if [[ $# == 0 ]]; then
	printf "${LIGHT_GREEN}Installing Homebrew binaries...\n"

	for ((i=0; i < ${#homebrew_binaries[@]}; i++))
	do
		printf "${GOLD}Do you want to install ${homebrew_binaries[$i]}? (y/n) $NORMAL"
		read -r response
		if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
			brew install ${homebrew_binaries[$i]}
		fi
	done
else
	printf "${LIGHT_GREEN}Installing all Homebrew binaries...\n"
	brew install ${homebrew_binaries[@]}
fi

printf "${LIGHT_GREEN}Cleaning up...\n"
brew cleanup

printf "${LIGHT_GREEN}Selected Homebrew binaries installed!\n$NORMAL"
