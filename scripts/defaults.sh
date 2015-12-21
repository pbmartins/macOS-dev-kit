#!/bin/bash

# DESCRIPTION
# Applies system and application defaults.

# EXECUTION
printf "System - Disable boot sound effects\n"
sudo nvram SystemAudioVolume=" "

printf "System - Reveal IP address, hostname, OS version, etc. when clicking the login window clock\n"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

printf "System - Expand save panel by default\n"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

printf "System - Disable the 'Are you sure you want to open this application?' dialog\n"
defaults write com.apple.LaunchServices LSQuarantine -bool false

printf "System - Increase window resize speed for Cocoa applications\n"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.1

printf "System - Set Scale effect to minimize windows\n"
defaults write com.apple.dock mineffect -string scale

printf "System - Enable AirDrop over Ethernet and on unsupported Macs running Lion\n"
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

printf "System - Require password immediately after sleep or screen saver begins\n"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

printf "System - Avoid creating .DS_Store files on network volumes\n"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

printf "System - Check for software updates daily, not just once per week\n"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

printf "System - Disable hibernation (speeds up entering sleep mode)\n"
sudo pmset -a hibernatemode 0

printf "System - Disable the sudden motion sensor as it’s not useful for SSDs\n"
sudo pmset -a sms 0

printf "System - Speeding up wake from sleep to 24 hours from an hour\n"
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
sudo pmset -a standbydelay 86400

printf "Keyboard - Automatically illuminate built-in MacBook keyboard in low light\n"
defaults write com.apple.BezelServices kDim -bool true

printf "Keyboard - Turn off keyboard illumination when computer is not used for 5 minutes\n"
defaults write com.apple.BezelServices kDimTime -int 300

printf "Trackpad - Enable tap to click for current user and the login screen\n"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

printf "Bluetooth - Increase sound quality for headphones/headsets\n"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

printf "Menu Bar - Show only Bluetooth and Airport\n"
for domain in $HOME/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
  defaults write "${domain}" dontAutoLoad -array "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"
done

defaults write com.apple.systemuiserver menuExtras -array \
  "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
  "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
  "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
  "/System/Library/CoreServices/Menu Extras/Battery.menu" \
  "/System/Library/CoreServices/Menu Extras/Clock.menu"

printf "Dock - Remove all default app icons\n"
defaults write com.apple.dock persistent-apps -array

printf "Dock - Disable Dashboard\n"
defaults write com.apple.dashboard mcx-disabled -bool true

printf "Dock - Don’t show Dashboard as a Space\n"
defaults write com.apple.dock "dashboard-in-overlay" -bool true

printf "Dock - Set the icon size of Dock items to 38 pixels"
defaults write com.apple.dock tilesize -int 38

printf "Dock - Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

printf "Dock - Speed up Mission Control animations"
defaults write com.apple.dock expose-animation-duration -float 0.12

printf "Dock - Speed up Launchpad animations"
defaults write com.apple.dock springboard-show-duration -float 0.1
defaults write com.apple.dock springboard-hide-duration -float 0.1

printf "iCloud - Save to disk by default\n"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

printf "Finder - Show filename extensions\n"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

printf "Finder - Disable the warning when changing a file extension\n"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

printf "Finder - Show path bar\n"
defaults write com.apple.finder ShowPathbar -bool true

printf "Finder - Use list view in all Finder windows\n"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

printf "Finder - Disable the warning before emptying the Trash\n"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

printf "Finder - Allow text selection in Quick Look\n"
defaults write com.apple.finder QLEnableTextSelection -bool true

printf "Finder - Expand the following File Info panes: “General”, “Open with”, and “Sharing & Permissions”\n"
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

printf "Safari - Set home page to 'about:blank' for faster loading\n"
defaults write com.apple.Safari HomePage -string "about:blank"

printf "Safari - Hide bookmarks bar\n"
defaults write com.apple.Safari ShowFavoritesBar -bool false

printf "Safari - Use Contains instead of Starts With in search banners\n"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

printf "Safari - Enable debug menu\n"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

printf "Safari - Enable the Develop menu and the Web Inspector\n"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

printf "Safari - Add a context menu item for showing the Web Inspector in web views\n"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

printf "Safari - Disable sending search queries to Apple.\n"
defaults write com.apple.Safari UniversalSearchEnabled -bool false

printf "Safari - Prevent Safari from opening ‘safe’ files automatically after downloading"
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

printf "Chrome - Prevent native print dialog, use system dialog instead\n"
defaults write com.google.Chrome DisablePrintPreview -boolean true

printf "Mail - Copy email addresses as 'foo@example.com' instead of 'Foo Bar <foo@example.com>'\n"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

printf "Mail - Disable send animation\n"
defaults write com.apple.mail DisableSendAnimations -bool true

printf "Mail - Disable reply animation\n"
defaults write com.apple.mail DisableReplyAnimations -bool true

printf "Mail - Enable COMMAND+ENTER to send mail\n"
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"

printf "Address Book - Enable debug menu\n"
defaults write com.apple.addressbook ABShowDebugMenu -bool true

printf "iCal - Enable debug menu\n"
defaults write com.apple.iCal IncludeDebugMenu -bool true

printf "TextEdit - Use plain text mode for new documents\n"
defaults write com.apple.TextEdit RichText -int 0

printf "TextEdit - Open and save files as UTF-8 encoding\n"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

printf "Disk Utility - Enable debug menu\n"
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

printf "Time Machine - Prevent prompting to use new hard drives as backup volume\n"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

printf "Printer - Expand print panel by default\n"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

printf "Printer - Automatically quit printer app once the print jobs complete\n"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

printf "App Store - Enable the WebKit Developer Tools in the Mac App Store\n"
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

printf "App Store - Enable Debug Menu in the Mac App Store\n"
defaults write com.apple.appstore ShowDebugMenu -bool true

printf "Terminal - Only use UTF-8"
defaults write com.apple.terminal StringEncodings -array 4

printf "Terminal - Use Pro theme by default"
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"