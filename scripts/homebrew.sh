#!/bin/bash

# DESCRIPTION
# Installs Homebrew software.

# EXECUTION
# Homebrew
if ! command -v brew > /dev/null; then
  ruby -e "$(curl --location --fail --silent --show-error https://raw.githubusercontent.com/Homebrew/install/master/install)"
  export PATH="/usr/local/bin:$PATH"
  printf "export PATH=\"/usr/local/bin:$PATH\"\n" >> $HOME/.bash_profile
fi

# Readline
brew install readline

# OpenSSL
brew install openssl
brew link openssl --force

# GPG
brew install gpg

# Bash
brew install bash

# Bash Completion
brew install bash-completion

# Vim
brew install vim

# asciinema
brew install asciinema

# ShellCheck
brew install shellcheck

# Colorized Cat
brew install ccat

# Tree
brew install tree

# hr
brew install hr

# Git
brew install git

# GitHub
brew install hub

# Pigz
brew install pigz

# Pipe Viewer
brew install pv

# HTTPie
brew install httpie

# Ioping
brew install ioping

# Network Grep
brew install ngrep

# Namebench
brew install namebench

# FLAC
brew install flac

# FFmpeg
brew install ffmpeg

# JPEG
brew install jpeg

# Gifsicle
brew install gifsicle

# Node
brew install node

# rbenv
brew install rbenv
brew install ruby-build
brew install rbenv-vars

# Rust
brew install rust

# Go
brew install go

# Peco
brew install peco

# exiv2
brew install exiv2

# findutils
brew install findutils

# ntfs-3g
brew install ntfs-3g

# Jokes
brew install cowsay
brew install sl

# gdbm
brew install gdbm

# mysql
brew install mysql

# sqlite3
brew install sqlite

# Python
brew install python
brew install python3