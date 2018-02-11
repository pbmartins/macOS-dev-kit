#!/bin/bash

# DESCRIPTION
# Applies system and application defaults.

# Ask for the administrator password upfront
sudo -v

# EXECUTION

###############################################################################
# Overall System                                                              #
###############################################################################

echo "System - Login window message."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    printf "Your contact for Login message: "
    read CONTACT
    sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "This laptop is attached to an iCloud account. If you've found it, please contact $CONTACT"
fi

echo "System - Disable boot sound effects."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo nvram SystemAudioVolume=%80
fi

echo "System - Reveal IP address, hostname, OS version, etc. when clicking the login window clock."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
fi

echo "System - Expand save panel by default."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
fi

echo "System - Disable the 'Are you sure you want to open this application?' dialog."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.LaunchServices LSQuarantine -bool false
fi

echo "System - Enable Dark Mode."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark
fi

echo "System - Disable transparency in the menu bar and elsewhere."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.universalaccess reduceTransparency -bool true
fi

echo "System - Increase window resize speed for Cocoa applications."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain NSWindowResizeTime -float 0.1
fi

echo "System - Setting up new Wallpaper Image."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    # Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
    # all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
    rm -rf ~/Library/Application Support/Dock/desktoppicture.db
    sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
    cp dependencies/wallpaper.jpg ~/wallpaper.jpg
    sudo ln -s ~/wallpaper.jpg /System/Library/CoreServices/DefaultDesktop.jpg
fi

echo "System - Set Scale effect to minimize windows."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dock mineffect -string scale
fi

echo "System - Enable AirDrop over Ethernet and on unsupported Macs running Lion."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
fi

echo "System - Require password immediately after sleep or screen saver begins."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.screensaver askForPassword -int 1
    defaults write com.apple.screensaver askForPasswordDelay -int 0
fi

echo "System - Check for software updates daily, not just once per week."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
fi

echo "System - Disable hibernation (speeds up entering sleep mode)."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo pmset -a hibernatemode 0
fi

echo "System - Disable the sudden motion sensor as it’s not useful for SSDs."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo pmset -a sms 0
fi

echo "System - Speeding up wake from sleep to 2 hours from an hour."
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo pmset -a standbydelay 7200
fi

echo "System - Disable System Crash Report - prevents sending reports to Apple."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.CrashReporter DialogType none
fi

echo "System - Disable Bonjour Multicast Advertisments."
# https://www.trustwave.com/Resources/SpiderLabs-Blog/mDNS---Telling-the-world-about-you-(and-your-device)/
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool YES
fi


###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, WiFi and input            #
###############################################################################

echo "Keyboard - Automatically illuminate built-in MacBook keyboard in low light."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.BezelServices kDim -bool true
fi

echo "Keyboard - Turn off keyboard illumination when computer is not used for 5 minutes."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.BezelServices kDimTime -int 300
fi

echo "Keyboard - Disable press-and-hold for keys in favor of key repeat."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
fi

echo "Keyboard - Increase a blazingly fast keyboard repeat rate."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain KeyRepeat -int 2
    defaults write NSGlobalDomain InitialKeyRepeat -int 30
fi

echo "Trackpad - Enable tap to click for current user and the login screen."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
    defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
fi

echo "Bluetooth - Increase sound quality for headphones/headsets."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
fi

echo "WiFi - Set default mode as Strongest signal."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs joinMode=Strongest
fi

###############################################################################
# Dock, Dashboard, and Menu Bar                                               #
###############################################################################

echo "Menu Bar - Show only Bluetooth, Airport, TimeMachine, Battery and Clock."
printf "Do you want to apply this setting? (y/n) "
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

echo "Dock - Remove all default app icons."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dock persistent-apps -array
fi

echo "Dock - Disable Dashboard."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dashboard mcx-disabled -bool true
fi

echo "Dock - Don’t show Dashboard as a Space."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dock "dashboard-in-overlay" -bool true
fi

echo "Dock - Set the icon size of Dock items to 22 pixels."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dock tilesize -int 22
fi

echo "Dock - Show indicator lights for open applications in the Dock."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dock show-process-indicators -bool true
fi

echo "Dock - Speed up Mission Control animations."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dock expose-animation-duration -float 0.5
fi

echo "Dock - Speed up Launchpad animations."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.dock springboard-show-duration -float 0.1
    defaults write com.apple.dock springboard-hide-duration -float 0.1
fi

###############################################################################
# Finder                                                                      #
###############################################################################

echo "iCloud - Save to disk by default."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
fi

echo "Finder - Show filename extensions."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
fi

echo "Finder - Disable the warning when changing a file extension."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
fi

echo "Finder - Show path bar."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.finder ShowPathbar -bool true
fi

echo "Finder - Show the ~/Library folder"
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    chflags nohidden ~/Library
fi

echo "Finder - Use list view in all Finder windows."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
fi

echo "Finder - Disable the warning before emptying the Trash."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.finder WarnOnEmptyTrash -bool false
fi

echo "Finder - Allow text selection in Quick Look."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.finder QLEnableTextSelection -bool true
fi

echo "Finder - Expand the following File Info panes: “General”, “Open with”, and “Sharing & Permissions”."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.finder FXInfoPanesExpanded -dict \
    	General -bool true \
    	OpenWith -bool true \
    	Privileges -bool true
fi

echo "Finder - Avoid creating .DS_Store files on network volumes."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
fi

###############################################################################
# Safari                                                                      #
###############################################################################

echo "Safari - Set home page to 'about:blank' for faster loading."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.Safari HomePage -string "about:blank"
fi

echo "Safari - Hide bookmarks bar."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.Safari ShowFavoritesBar -bool false
fi

echo "Safari - Use Contains instead of Starts With in search banners."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
fi

echo "Safari - Enable debug menu."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
fi

echo "Safari - Enable the Develop menu and the Web Inspector."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.Safari IncludeDevelopMenu -bool true
    defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
    defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
fi

echo "Safari - Add a context menu item for showing the Web Inspector in web views."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
fi

echo "Safari - Disable sending search queries to Apple.."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.Safari UniversalSearchEnabled -bool false
    defaults write com.apple.Safari SuppressSearchSuggestions -bool true
fi

echo "Safari - Prevent Safari from opening ‘safe’ files automatically after downloading."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
fi

echo "Safari - Press Tab to highlight each item on a web page."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
    defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true
fi

###############################################################################
# Mail                                                                        #
###############################################################################

echo "Mail - Copy email addresses as 'foo@example.com' instead of 'Foo Bar <foo@example.com>'."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
fi

echo "Mail - Disable send animation."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.mail DisableSendAnimations -bool true
fi

echo "Mail - Disable reply animation."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.mail DisableReplyAnimations -bool true
fi

echo "Mail - Enable COMMAND+ENTER to send mail."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"
fi

###############################################################################
# Spotlight                                                                   #
###############################################################################
echo "Spotlight - Disable Spotlight Suggestions in both the Spotlight preferences and Safari's Search preferences to avoid your search queries being sent to Apple.."
echo "Spotlight - Also change the indexing order of some search results"
#   MENU_DEFINITION
#   MENU_CONVERSION
#   MENU_EXPRESSION
#   MENU_SPOTLIGHT_SUGGESTIONS (send search queries to Apple)
#   MENU_WEBSEARCH             (send search queries to Apple)
#   MENU_OTHER
printf "Do you want to apply this setting? (y/n) "
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

echo "Terminal - Only use UTF-8."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.terminal StringEncodings -array 4
fi

echo "Terminal - Add new version of Bash - Install using Homebrew."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
    chsh -s /usr/local/bin/bash
fi

echo "Terminal - Use Vouga by default in Terminal.app."
printf "Do you want to apply this setting? (y/n) "
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

        (* Set the custom font. *)
        set the font name of window 1 to \"Consolas\"

        (* Get the IDs of all the currently opened terminal windows. *)
        set allOpenedWindows to id of every window
        set the font size of window 1 to 14

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

echo "iTerm2 - Install Vouga theme."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    start_if_needed iTerm
    open "dependencies/Vouga.itermcolors"
fi

echo "iTerm2 - Don’t display the annoying prompt when quitting iTerm."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.googlecode.iterm2 PromptOnQuit -bool false
fi

###############################################################################
# Time Machine                                                                #
###############################################################################
echo "Time Machine - Prevent prompting to use new hard drives as backup volume."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
fi

###############################################################################
# Address Book, Dashboard, iCal, TextEdit, Printer and Disk Utility           #
###############################################################################

echo "Address Book - Enable debug menu."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.addressbook ABShowDebugMenu -bool true
fi

echo "iCal - Enable debug menu."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.iCal IncludeDebugMenu -bool true
fi

echo "TextEdit - Use plain text mode for new documents."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.TextEdit RichText -int 0
fi

echo "TextEdit - Open and save files as UTF-8 encoding."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.TextEdit PlainTextEncoding -int 4
    defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
fi

echo "Disk Utility - Enable debug menu."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
    defaults write com.apple.DiskUtility advanced-image-options -bool true
fi

echo "Printer - Expand print panel by default."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
fi

echo "Printer - Automatically quit printer app once the print jobs complete."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
fi

###############################################################################
# Mac App Store                                                               #
###############################################################################

echo "App Store - Enable the WebKit Developer Tools in the Mac App Store."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.appstore WebKitDeveloperExtras -bool true
fi

echo "App Store - Enable Debug Menu in the Mac App Store."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.apple.appstore ShowDebugMenu -bool true
fi

###############################################################################
# Google Chrome & Google Chrome Canary                                        #
###############################################################################

echo "Google Chrome - Allow installing user scripts via GitHub Gist or Userscripts.org."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.google.Chrome ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"
fi

echo "Google Chrome - Disable the all too sensitive backswipe on trackpads."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
fi

echo "Google Chrome - Disable the all too sensitive backswipe on Magic Mouse."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
fi

echo "Google Chrome - Use the system-native print preview dialog."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.google.Chrome DisablePrintPreview -bool true
fi

echo "Google Chrome - Expand the print dialog by default."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
fi

###############################################################################
# Transmission                                                                #
###############################################################################

echo "Transmission - Don’t prompt for confirmation before downloading."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write org.m0k.transmission DownloadAsk -bool false
fi

echo "Transmission - Trash original torrent files."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write org.m0k.transmission DeleteOriginalTorrent -bool true
fi

echo "Transmission - Hide the donate message."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write org.m0k.transmission WarningDonate -bool false
fi

echo "Transmission - Hide the legal disclaimer."
printf "Do you want to apply this setting? (y/n) "
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    defaults write org.m0k.transmission WarningLegal -bool false
fi

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
	"Dock" "Finder" "Mail" "Messages" "Photos" "Safari" "Google Chrome" \
    "SystemUIServer" "Terminal" "Transmission" "iCal"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/reboot to take effect."
