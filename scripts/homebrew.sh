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

echo "Updating brew..."
brew update

echo "Installing GNU core utils (those that come with OS X are outdated)..."
brew install coreutils

echo "Installing more recent versions of some OS X tools..."
brew tap homebrew/dupes
brew install homebrew/dupes/grep

echo "Installing and linking OpenSSL..."
brew install openssl
brew link openssl --force

echo "Installing Cask..."
brew install caskroom/cask/brew-cask

homebrew_binaries=(
	readline
	gpg
	bash
	bash-completion
	vim
	asciinema
	shellcheck
	ccat
	tree
	hr
	git
	hub
	pigz
	pv
	httpie
	ioping
	ngrep
	namebench
	node
	flac
	ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-libass --with-libquvi --with-libvorbis --with-libvpx --with-opus --with-x265
	jpeg
	gifsicle
	rbenv
	ruby-build
	rbenv-vars
	rust
	go
	peco
	exiv2
	findutils
	ntfs-3g
	cowsay
	sl
	gdbm
	mysql
	sqlite
	pkg-config
	python
	python3
	portaudio
	wget
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