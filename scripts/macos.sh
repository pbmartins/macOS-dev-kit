#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Step 1: Update the OS and Install Xcode Tools
echo "Updating macOS... If this requires a restart, run the script again."
sudo softwareupdate -iva

# Step 2: Install Xcode command line tools
echo "Installing Xcode Command Line Tools..."
xcode-select --install
