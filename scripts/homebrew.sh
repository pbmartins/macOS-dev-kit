#!/bin/bash

# DESCRIPTION
# Installs Homebrew software.

# EXECUTION
# Homebrew
echo "Checking for Homebrew..."
if ! command -v brew > /dev/null; then
	echo "Installing Homebrew..."
 	ruby -e "$(curl --location --fail --silent --show-error https://raw.githubusercontent.com/Homebrew/install/master/install)"
	export PATH="/usr/local/bin:$PATH"
	printf "export PATH=\"/usr/local/bin:$PATH\"\n" >> $HOME/.bash_profile
fi

echo "Updating brew..."
brew update

echo "Installing GNU core utils (those that come with OS X are outdated)..."
brew install coreutils

echo "Installing more recent versions of some OS X tools..."
brew tap homebrew/dupes
brew install homebrew/dupes/grep

echo "Installing and linking OpenSSL"
brew install openssl
brew link openssl --force

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

echo "Installing Homebrew binaries..."
brew install ${homebrew_binaries[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing Cask..."
brew install caskroom/cask/brew-cask

echo "Adding nightly/beta Cask versions..."
brew tap caskroom/versions