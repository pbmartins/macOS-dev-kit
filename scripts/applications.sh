#!/bin/bash

# DESCRIPTION
# Installs OSX applications.

# EXECUTION
# Dropbox
install_dmg_app "$DROPBOX_APP_URL" "Dropbox Installer" "$DROPBOX_APP_NAME"

# Sublime Text
install_dmg_app "$SUBLIME_TEXT_APP_URL" "Sublime Text" "$SUBLIME_TEXT_APP_NAME"

# Google Chrome
install_dmg_app "$CHROME_APP_URL" "Google Chrome" "$CHROME_APP_NAME"

# Firefox
install_dmg_app "$FIREFOX_APP_URL" "Firefox" "$FIREFOX_APP_NAME"

# VirtualBox
install_dmg_pkg "$VIRTUAL_BOX_APP_URL" "VirtualBox" "$VIRTUAL_BOX_APP_NAME"

# Vagrant
install_dmg_pkg "$VAGRANT_APP_URL" "Vagrant" "$VAGRANT_APP_NAME"

# App Cleaner
install_zip_app "$APP_CLEANER_APP_URL" "$APP_CLEANER_APP_NAME"

# Trailer
install_zip_app "$TRAILER_APP_URL" "$TRAILER_APP_NAME"

# Transmission
install_dmg_app "$TRANSMISSION_APP_URL" "Transmission" "$TRANSMISSION_APP_NAME"

# MPlayerX
install_dmg_app "$MPLAYERX_APP_URL" "MPlayerX" "$MPLAYERX_APP_NAME"

# MacTeX
install_pkg_pkg "$MACTEX_APP_URL" "MacTeX" "$MACTEX_APP_NAME"

# OSX-Fuse
install_dmg_pkg "$OSX_FUSE_APP_URL" "Fuse for OS X" "$OSX_FUSE_APP_NAME"

# Skype
install_dmg_app "$SKYPE_APP_URL" "Skype" "$SKYPE_APP_NAME"

# IntelliJ IDEA 15
echo "Do you want to install JetBrains IntelliJ IDEA 15 (professional-version)? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	install_dmg_app "$INTELLIJ_APP_URL" "IntelliJ IDEA 15" "$INTELLIJ_APP_NAME"
fi

# PyCharm
echo "Do you want to install JetBrains PyCharm (professional-version)? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	install_dmg_app "$PYCHARM_APP_URL" "PyCharm" "$PYCHARM_APP_NAME"
fi

# CLion
echo "Do you want to install JetBrains CLion (professional-version)? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
	install_dmg_app "$CLION_APP_URL" "CLion" "$CLION_APP_NAME"
fi