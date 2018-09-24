#!/bin/bash

# DESCRIPTION
# Applies system and application defaults.

# Ask for the administrator password upfront
sudo -v

# EXECUTION
source lib/colors.sh

###############################################################################
# Overall System                                                              #
###############################################################################

printf "$GOLD==>$LIGHT_GREEN System - Login window message."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    printf "Your contact for Login message: "
    read CONTACT
    sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "This laptop is attached to an iCloud account. If you've found it, please contact $CONTACT"
fi

printf "$GOLD==>$LIGHT_GREEN System - Disable boot sound effects."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo nvram SystemAudioVolume=%80
fi

printf "$GOLD==>$LIGHT_GREEN System - Reveal IP address, hostname, OS version, etc. when clicking the login window clock."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
fi

printf "$GOLD==>$LIGHT_GREEN System - Expand save panel by default."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
fi

printf "$GOLD==>$LIGHT_GREEN System - Disable the 'Are you sure you want to open this application?' dialog."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.LaunchServices LSQuarantine -bool false
fi

printf "$GOLD==>$LIGHT_GREEN System - Enable Dark Mode."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark
fi

printf "$GOLD==>$LIGHT_GREEN System - Disable transparency in the menu bar and elsewhere."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo defaults write com.apple.universalaccess reduceTransparency -bool true
fi

printf "$GOLD==>$LIGHT_GREEN System - Increase window resize speed for Cocoa applications."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain NSWindowResizeTime -float 0.1
fi

printf "$GOLD==>$LIGHT_GREEN System - Setting up new Wallpaper Image."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    # Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
    # all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
    rm -rf ~/Library/Application Support/Dock/desktoppicture.db
    sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
    cp dependencies/wallpaper.jpg ~/Pictures/wallpaper.jpg
    sudo ln -s ~/Pictures/wallpaper.jpg /System/Library/CoreServices/DefaultDesktop.jpg
fi

printf "$GOLD==>$LIGHT_GREEN System - Set Scale effect to minimize windows."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dock mineffect -string scale
fi

printf "$GOLD==>$LIGHT_GREEN System - Enable AirDrop over Ethernet and on unsupported Macs running Lion."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
fi

printf "$GOLD==>$LIGHT_GREEN System - Require password immediately after sleep or screen saver begins."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.screensaver askForPassword -int 1
    defaults write com.apple.screensaver askForPasswordDelay -int 0
fi

printf "$GOLD==>$LIGHT_GREEN System - Check for software updates daily, not just once per week."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
fi

printf "$GOLD==>$LIGHT_GREEN System - Disable hibernation (speeds up entering sleep mode)."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo pmset -a hibernatemode 0
fi

printf "$GOLD==>$LIGHT_GREEN System - Disable the sudden motion sensor as it’s not useful for SSDs."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo pmset -a sms 0
fi

printf "$GOLD==>$LIGHT_GREEN System - Speeding up wake from sleep to 2 hours from an hour."
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo pmset -a standbydelay 7200
fi

printf "$GOLD==>$LIGHT_GREEN System - Disable System Crash Report - prevents sending reports to Apple."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.CrashReporter DialogType none
fi

printf "$GOLD==>$LIGHT_GREEN System - Disable Bonjour Multicast Advertisments."
# https://www.trustwave.com/Resources/SpiderLabs-Blog/mDNS---Telling-the-world-about-you-(and-your-device)/
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES
fi


###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, WiFi and input            #
###############################################################################

printf "$GOLD==>$LIGHT_GREEN Keyboard - Automatically illuminate built-in MacBook keyboard in low light."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.BezelServices kDim -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Keyboard - Turn off keyboard illumination when computer is not used for 5 minutes."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.BezelServices kDimTime -int 300
fi

printf "$GOLD==>$LIGHT_GREEN Keyboard - Disable press-and-hold for keys in favor of key repeat."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
fi

printf "$GOLD==>$LIGHT_GREEN Keyboard - Increase a blazingly fast keyboard repeat rate."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain KeyRepeat -int 2
    defaults write NSGlobalDomain InitialKeyRepeat -int 30
fi

printf "$GOLD==>$LIGHT_GREEN Keyboard - Disable auto-correct."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
fi

printf "$GOLD==>$LIGHT_GREEN Trackpad - Enable tap to click for current user and the login screen."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
    defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
fi

printf "$GOLD==>$LIGHT_GREEN Bluetooth - Increase sound quality for headphones/headsets."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
fi

printf "$GOLD==>$LIGHT_GREEN WiFi - Set default mode as Strongest signal."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs joinMode=Strongest
fi

###############################################################################
# Dock, Dashboard, and Menu Bar                                               #
###############################################################################

printf "$GOLD==>$LIGHT_GREEN Menu Bar - Show only Bluetooth, Airport, TimeMachine, Battery and Clock."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    for domain in $HOME/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
      defaults write "${domain}" dontAutoLoad -array "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"
    done

    defaults write com.apple.systemuiserver menuExtras -array \
      "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
      "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
      "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
      "/System/Library/CoreServices/Menu Extras/Battery.menu" \
      "/System/Library/CoreServices/Menu Extras/Clock.menu"
fi

printf "$GOLD==>$LIGHT_GREEN Dock - Remove all default app icons."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dock persistent-apps -array
fi

printf "$GOLD==>$LIGHT_GREEN Dock - Disable Dashboard."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dashboard mcx-disabled -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Dock - Don’t show Dashboard as a Space."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dock "dashboard-in-overlay" -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Dock - Set the icon size of Dock items to 22 pixels."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dock tilesize -int 22
fi

printf "$GOLD==>$LIGHT_GREEN Dock - Show indicator lights for open applications in the Dock."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dock show-process-indicators -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Dock - Speed up Mission Control animations."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dock expose-animation-duration -float 0.5
fi

printf "$GOLD==>$LIGHT_GREEN Dock - Speed up Launchpad animations."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dock springboard-show-duration -float 0.1
    defaults write com.apple.dock springboard-hide-duration -float 0.1
fi

###############################################################################
# Finder                                                                      #
###############################################################################

printf "$GOLD==>$LIGHT_GREEN iCloud - Save to disk by default."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
fi

printf "$GOLD==>$LIGHT_GREEN Finder - Show filename extensions."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Finder - Disable the warning when changing a file extension."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
fi

printf "$GOLD==>$LIGHT_GREEN Finder - Show path bar."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.finder ShowPathbar -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Finder - Show the ~/Library folder"
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    chflags nohidden ~/Library
fi

printf "$GOLD==>$LIGHT_GREEN Finder - Use list view in all Finder windows."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
fi

printf "$GOLD==>$LIGHT_GREEN Finder - Disable the warning before emptying the Trash."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.finder WarnOnEmptyTrash -bool false
fi

printf "$GOLD==>$LIGHT_GREEN Finder - Allow text selection in Quick Look."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.finder QLEnableTextSelection -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Finder - Expand the following File Info panes: “General”, “Open with”, and “Sharing & Permissions”."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.finder FXInfoPanesExpanded -dict \
    	General -bool true \
    	OpenWith -bool true \
    	Privileges -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Finder - Avoid creating .DS_Store files on network volumes."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
fi

###############################################################################
# Safari                                                                      #
###############################################################################

printf "$GOLD==>$LIGHT_GREEN Safari - Set home page to 'about:blank' for faster loading."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.Safari HomePage -string "about:blank"
fi

printf "$GOLD==>$LIGHT_GREEN Safari - Hide bookmarks bar."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.Safari ShowFavoritesBar -bool false
fi

printf "$GOLD==>$LIGHT_GREEN Safari - Use Contains instead of Starts With in search banners."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
fi

printf "$GOLD==>$LIGHT_GREEN Safari - Enable debug menu."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Safari - Enable the Develop menu and the Web Inspector."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.Safari IncludeDevelopMenu -bool true
    defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
    defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Safari - Add a context menu item for showing the Web Inspector in web views."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Safari - Disable sending search queries to Apple."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.Safari UniversalSearchEnabled -bool false
    defaults write com.apple.Safari SuppressSearchSuggestions -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Safari - Prevent Safari from opening ‘safe’ files automatically after downloading."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
fi

printf "$GOLD==>$LIGHT_GREEN Safari - Press Tab to highlight each item on a web page."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
    defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true
fi

###############################################################################
# Mail                                                                        #
###############################################################################

printf "$GOLD==>$LIGHT_GREEN Mail - Copy email addresses as 'foo@example.com' instead of 'Foo Bar <foo@example.com>'."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
fi

printf "$GOLD==>$LIGHT_GREEN Mail - Disable send animation."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.mail DisableSendAnimations -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Mail - Disable reply animation."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.mail DisableReplyAnimations -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Mail - Enable COMMAND+ENTER to send mail."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"
fi

###############################################################################
# Spotlight                                                                   #
###############################################################################
printf "$GOLD==>$LIGHT_GREEN Spotlight - Disable Spotlight Suggestions in both the Spotlight preferences and Safari's Search preferences to avoid your search queries being sent to Apple.."
printf "$GOLD \n==>$LIGHT_GREEN Spotlight - Also change the indexing order of some search results."
#   MENU_DEFINITION
#   MENU_CONVERSION
#   MENU_EXPRESSION
#   MENU_SPOTLIGHT_SUGGESTIONS (send search queries to Apple)
#   MENU_WEBSEARCH             (send search queries to Apple)
#   MENU_OTHER
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.spotlight orderedItems -array \
        '{"enabled" = 1;"name" = "APPLICATIONS";}' \
        '{"enabled" = 1;"name" = "MENU_CONVERSION";}' \
        '{"enabled" = 1;"name" = "MENU_EXPRESSION";}' \
        '{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
        '{"enabled" = 1;"name" = "DIRECTORIES";}' \
        '{"enabled" = 1;"name" = "PDF";}' \
        '{"enabled" = 1;"name" = "FONTS";}' \
        '{"enabled" = 1;"name" = "CONTACT";}' \
        '{"enabled" = 0;"name" = "DOCUMENTS";}' \
        '{"enabled" = 0;"name" = "MESSAGES";}' \
        '{"enabled" = 0;"name" = "EVENT_TODO";}' \
        '{"enabled" = 0;"name" = "IMAGES";}' \
        '{"enabled" = 0;"name" = "BOOKMARKS";}' \
        '{"enabled" = 0;"name" = "MUSIC";}' \
        '{"enabled" = 0;"name" = "MOVIES";}' \
        '{"enabled" = 0;"name" = "PRESENTATIONS";}' \
        '{"enabled" = 0;"name" = "SPREADSHEETS";}' \
        '{"enabled" = 0;"name" = "SOURCE";}' \
        '{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
        '{"enabled" = 0;"name" = "MENU_OTHER";}' \
        '{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
        '{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'
    # Load new settings before rebuilding the index
    killall mds > /dev/null 2>&1
    # Make sure indexing is enabled for the main volume
    sudo mdutil -i on / > /dev/null
    # Rebuild the index from scratch
    sudo mdutil -E / > /dev/null
fi

###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################

printf "$GOLD==>$LIGHT_GREEN Terminal - Only use UTF-8."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.terminal StringEncodings -array 4
fi

printf "$GOLD==>$LIGHT_GREEN Terminal - Add new version of Bash - Install using Homebrew."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
    chsh -s /usr/local/bin/bash
fi

printf "$GOLD==>$LIGHT_GREEN Terminal - Use Vouga by default in Terminal.app."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    cp dependencies/Consolas.ttf /Library/Fonts/
    osascript <<EOD
    tell application "Terminal"
        local allOpenedWindows
        local initialOpenedWindows
        local windowID
        set themeName to "Vouga"

        (* Store the IDs of all the open terminal windows. *)
        set initialOpenedWindows to id of every window

        (* Open the custom theme so that it gets added to the list
           of available terminal themes (note: this will open two
           additional terminal windows). *)
        do shell script "open 'dependencies/" & themeName & ".terminal'"

        (* Wait a little bit to ensure that the custom theme is added. *)
        delay 1

        (* Set the custom theme as the default terminal theme. *)
        set default settings to settings set themeName

        (* Get the IDs of all the currently opened terminal windows. *)
        set allOpenedWindows to id of every window

        repeat with windowID in allOpenedWindows
            (* Close the additional windows that were opened in order
               to add the custom theme to the list of terminal themes. *)
            if initialOpenedWindows does not contain windowID then
                close (every window whose id is windowID)

            (* Change the theme for the initial opened terminal windows
               to remove the need to close them in order for the custom
               theme to be applied. *)
            else
                set current settings of tabs of (every window whose id is windowID) to settings set themeName
            end if
        end repeat
    end tell
EOD
fi



start_if_needed() {
  local grep_name="[${1:0:1}]${1:1}"

  if [[ -z $(ps aux | grep -e "${grep_name}") ]]; then
    if [ -e ~/Applications/$1.app ]; then
      open ~/Applications/$1.app
    else
      if [ -e /Applications/$1.app ]; then
        open /Applications/$1.app
      fi
    fi
  fi

  true
}

printf "$GOLD==>$LIGHT_GREEN iTerm2 - Install Vouga color theme."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    start_if_needed iTerm
    open "dependencies/Vouga.itermcolors"
fi

printf "$GOLD==>$LIGHT_GREEN iTerm2 - Don’t display the annoying prompt when quitting iTerm."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.googlecode.iterm2 PromptOnQuit -bool false
fi

###############################################################################
# Time Machine                                                                #
###############################################################################
printf "$GOLD==>$LIGHT_GREEN Time Machine - Prevent prompting to use new hard drives as backup volume."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
fi

###############################################################################
# Address Book, Dashboard, iCal, TextEdit, Printer and Disk Utility           #
###############################################################################

printf "$GOLD==>$LIGHT_GREEN Address Book - Enable debug menu."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.addressbook ABShowDebugMenu -bool true
fi

printf "$GOLD==>$LIGHT_GREEN iCal - Enable debug menu."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.iCal IncludeDebugMenu -bool true
fi

printf "$GOLD==>$LIGHT_GREEN TextEdit - Use plain text mode for new documents."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.TextEdit RichText -int 0
fi

printf "$GOLD==>$LIGHT_GREEN TextEdit - Open and save files as UTF-8 encoding."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.TextEdit PlainTextEncoding -int 4
    defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
fi

printf "$GOLD==>$LIGHT_GREEN Disk Utility - Enable debug menu."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
    defaults write com.apple.DiskUtility advanced-image-options -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Printer - Expand print panel by default."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Printer - Automatically quit printer app once the print jobs complete."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
fi

###############################################################################
# Mac App Store                                                               #
###############################################################################

printf "$GOLD==>$LIGHT_GREEN App Store - Enable the WebKit Developer Tools in the Mac App Store."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.appstore WebKitDeveloperExtras -bool true
fi

printf "$GOLD==>$LIGHT_GREEN App Store - Enable Debug Menu in the Mac App Store."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.appstore ShowDebugMenu -bool true
fi

###############################################################################
# Google Chrome & Google Chrome Canary                                        #
###############################################################################

printf "$GOLD==>$LIGHT_GREEN Google Chrome - Allow installing user scripts via GitHub Gist or Userscripts.org."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.google.Chrome ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"
fi

printf "$GOLD==>$LIGHT_GREEN Google Chrome - Disable the all too sensitive backswipe on trackpads."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
fi

printf "$GOLD==>$LIGHT_GREEN Google Chrome - Disable the all too sensitive backswipe on Magic Mouse."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
fi

printf "$GOLD==>$LIGHT_GREEN Google Chrome - Use the system-native print preview dialog."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.google.Chrome DisablePrintPreview -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Google Chrome - Expand the print dialog by default."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
fi

###############################################################################
# Transmission                                                                #
###############################################################################

printf "$GOLD==>$LIGHT_GREEN Transmission - Don’t prompt for confirmation before downloading."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write org.m0k.transmission DownloadAsk -bool false
fi

printf "$GOLD==>$LIGHT_GREEN Transmission - Trash original torrent files."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write org.m0k.transmission DeleteOriginalTorrent -bool true
fi

printf "$GOLD==>$LIGHT_GREEN Transmission - Hide the donate message."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write org.m0k.transmission WarningDonate -bool false
fi

printf "$GOLD==>$LIGHT_GREEN Transmission - Hide the legal disclaimer."
printf "$GOLD \nDo you want to apply this setting? (y/n) $NORMAL"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write org.m0k.transmission WarningLegal -bool false
fi

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
	"Dock" "Finder" "Mail" "Messages" "Photos" "Safari" "Google Chrome" \
    "SystemUIServer" "Transmission" "iCal"; do
	killall "${app}" &> /dev/null
done
printf "$LIGHT_GREEN Done. Note that some of these changes require a logout/reboot to take effect."
