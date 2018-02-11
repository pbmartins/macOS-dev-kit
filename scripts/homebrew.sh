#!/bin/bash

# DESCRIPTION
# Installs Homebrew software.

# EXECUTION
# Homebrew
printf "Checking for Homebrew... "
if ! command -v brew > /dev/null; then
	echo "Homebrew not installed!"
	echo "Installing Homebrew..."
 	ruby -e "$(curl --location --fail --silent --show-error https://raw.githubusercontent.com/Homebrew/install/master/install)"
	export PATH="/usr/local/bin:$PATH"
	printf "export PATH=\"/usr/local/bin:$PATH\"\n" >> $HOME/.bash_profile
else
	echo "Homebrew installed."
fi

echo "Updating Homebrew..."
brew update

echo "Installing GNU core utils (those that come with OS X are outdated)..."
echo "Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`."
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

echo "Install some other useful utilities like 'sponge'."
brew install moreutils

echo "Install GNU 'find', 'locate', 'updatedb', and 'xargs', 'g'-prefixed."
brew install findutils

echo "Installing new version of Bash..."
brew install bash
brew tap homebrew/versions
brew install bash-completion2

echo "Adding the newly installed shell to the list of allowed shells"
# Add the new shell to the list of allowed shells
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell
chsh -s /usr/local/bin/bash

echo "Adding brew-command-not-found..."
brew tap homebrew/command-not-found
echo "Add the following line to your .bashrc:"
echo "if brew command command-not-found-init > /dev/null 2>&1; then eval '$(brew command-not-found-init)'; fi"

echo "Installing more recent versions of some OS X tools..."
brew tap homebrew/dupes
brew install homebrew/dupes/grep

echo "Installing and linking OpenSSL..."
brew install openssl
brew link openssl --force

echo "Installing Cask and Cask Upgrade..."
brew tap caskroom/cask
brew tap buo/cask-upgrade

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
	hr
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
	numpy
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
	telnet
	tree
	vim
	wget
	x264
)

if [[ $# == 0 ]]; then
	echo "Installing Homebrew binaries..."

	for ((i=0; i < ${#homebrew_binaries[@]}; i++))
	do
		printf "Do you want to install ${homebrew_binaries[$i]}? (y/n)  "
		read -r response
		if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
			brew install ${homebrew_binaries[$i]}
		fi
	done
else
	echo "Installing all Homebrew binaries..."
	brew install ${homebrew_binaries[@]}
fi

echo "Cleaning up..."
brew cleanup

echo "All selected Homebrew binaries installed!"
