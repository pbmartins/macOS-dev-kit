#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Step 1: Update the OS and Install Xcode Tools
printf "${LIGHT_GREEN}Updating macOS... If this requires a restart, run the script again.\n"
sudo softwareupdate -ia

# Step 2: Install Xcode command line tools
printf "${LIGHT_GREEN}Installing Xcode Command Line Tools, if necessary.\n"
set -e xcode-select --install
