#!/bin/bash

# DESCRIPTION
# Applies basic system settings.

# EXECUTION
printf "${LIGHT_GREEN}Cleaning default directories (Documents, Downloads)...\n"
rm -rf $HOME/Documents/*
rm -rf $HOME/Downloads/*

printf "${LIGHT_GREEN}Displayed computer name: $NORMAL"
  read DISPLAYED_COMPUTER_NAME

printf "${LIGHT_GREEN}Computer name: $NORMAL"
  read COMPUTER_NAME

printf "${LIGHT_GREEN}Setting system label and name...\n"
sudo scutil --set ComputerName $DISPLAYED_COMPUTER_NAME
sudo scutil --set HostName $COMPUTER_NAME
sudo scutil --set LocalHostName $COMPUTER_NAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME
