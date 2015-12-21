#!/bin/bash

# DESCRIPTION
# Defines global settings.

# SETTINGS
# General
set -o nounset # Exit, with error message, when attempting to use an undefined variable.
set -o errexit # Abort script at first error, when a command exits with non-zero status.
set -o pipefail # Returns exit status of the last command in the pipe that returned a non-zero return value.
IFS=$'\n\t' # Defines how Bash splits words and iterates arrays. This defines newlines and tabs as delimiters.
#export SYSTEM_LABEL="MacBook Pro de Pedro" # Placeholder for system display name.
#export SYSTEM_NAME="pedromartins" # Placeholder for system name.
export WORK_PATH=/tmp/downloads # Temporary location for processing of file downloads and installers.

# Ruby
export MRI=2.2.3

# Repositories
export REPO_RUBY_SETUP=v3.0.0
export REPO_GO_SETUP=v0.2.0
export REPO_NPM_SETUP=v0.7.0
export REPO_SUBLIME_TEXT_SETUP=v3.2.0
export REPO_DOTFILES=v18.1.0

# Applications
export DROPBOX_APP_NAME="Dropbox.app"
export DROPBOX_APP_URL="https://www.dropbox.com/download?src=index&plat=mac"

export SUBLIME_TEXT_APP_NAME="Sublime Text.app"
export SUBLIME_TEXT_APP_URL="http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203083.dmg"

export SUBLIME_TEXT_EXTENSION_ROOT="$HOME/Library/Application Support/Sublime Text 3/Packages"
export GIT_GUTTER_EXTENSION_PATH="$SUBLIME_TEXT_EXTENSION_ROOT/GitGutter"
export GIT_GUTTER_EXTENSION_URL="git://github.com/jisaacks/GitGutter.git"
export CTAGS_EXTENSION_PATH="$SUBLIME_TEXT_EXTENSION_ROOT/CTags"
export CTAGS_EXTENSION_URL="git://github.com/SublimeText/CTags.git"
export APPLY_SYNTAX_EXTENSION_PATH="$SUBLIME_TEXT_EXTENSION_ROOT/ApplySyntax"
export APPLY_SYNTAX_EXTENSION_URL="git://github.com/facelessuser/ApplySyntax.git"
export CHANGE_QUOTES_EXTENSION_PATH="$SUBLIME_TEXT_EXTENSION_ROOT/SublimeChangeQuotes"
export CHANGE_QUOTES_EXTENSION_URL="git://github.com/colinta/SublimeChangeQuotes.git"
export CHANGE_QUOTES_EXTENSION_OPTIONS="--branch st2"
export BRACKET_HIGHLIGHTER_EXTENSION_PATH="$SUBLIME_TEXT_EXTENSION_ROOT/BracketHighlighter"
export BRACKET_HIGHLIGHTER_EXTENSION_URL="git://github.com/facelessuser/BracketHighlighter.git"
export GUTTER_COLOR_EXTENSION_PATH="$SUBLIME_TEXT_EXTENSION_ROOT/Gutter Color"
export GUTTER_COLOR_EXTENSION_URL="git://github.com/ggordan/GutterColor.git"
export AUTOFILENAME_EXTENSION_PATH="$SUBLIME_TEXT_EXTENSION_ROOT/AutoFileName"
export AUTOFILENAME_EXTENSION_URL="git://github.com/BoundInCode/AutoFileName.git"
export AUTOFILENAME_EXTENSION_OPTIONS="--branch st3"
export AUTOPREFIXER_EXTENSION_PATH="$SUBLIME_TEXT_EXTENSION_ROOT/Autoprefixer"
export AUTOPREFIXER_EXTENSION_URL="git://github.com/sindresorhus/sublime-autoprefixer.git"
export EMMET_EXTENSION_PATH="$SUBLIME_TEXT_EXTENSION_ROOT/Emmet"
export EMMET_EXTENSION_URL="git://github.com/sergeche/emmet-sublime.git"
export WEB_INSPECTOR_EXTENSION_PATH="$SUBLIME_TEXT_EXTENSION_ROOT/Web Inspector"
export WEB_INSPECTOR_EXTENSION_URL="git://github.com/sokolovstas/SublimeWebInspector.git"
export MARKDOWN_EXTENSION_PATH="$SUBLIME_TEXT_EXTENSION_ROOT/sublime-markdown-extended"
export MARKDOWN_EXTENSION_URL="git://github.com/jonschlinkert/sublime-markdown-extended.git"
export CSSCOMB_EXTENSION_PATH="$SUBLIME_TEXT_EXTENSION_ROOT/CSScomb"
export CSSCOMB_EXTENSION_URL="git://github.com/csscomb/csscomb-for-sublime.git"
export HTML_PRETTIFY_EXTENSION_PATH="$SUBLIME_TEXT_EXTENSION_ROOT/Sublime-HTMLPrettify"
export HTML_PRETTIFY_EXTENSION_URL="https://github.com/victorporof/Sublime-HTMLPrettify.git"
export FLATLAND_THEME_EXTENSION_PATH="$SUBLIME_TEXT_EXTENSION_ROOT/Theme - Flatland"
export FLATLAND_THEME_EXTENSION_URL="https://github.com/thinkpixellab/flatland.git"

export CHROME_APP_NAME="Google Chrome.app"
export CHROME_APP_URL="https://dl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg"

export FIREFOX_APP_NAME="Firefox.app"
export FIREFOX_APP_URL="https://download.mozilla.org/?product=firefox-43.0.1-SSL&os=osx&lang=en-US"

export VIRTUAL_BOX_APP_NAME="VirtualBox.app"
export VIRTUAL_BOX_APP_URL="http://download.virtualbox.org/virtualbox/5.0.10/VirtualBox-5.0.10-104061-OSX.dmg"

export VAGRANT_APP_NAME="Vagrant.app"
export VAGRANT_APP_URL="https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4.dmg"

export APP_CLEANER_APP_NAME="AppCleaner.app"
export APP_CLEANER_APP_URL="https://freemacsoft.net/downloads/AppCleaner_3.2.1.zip"

export TRAILER_APP_NAME="Trailer.app"
export TRAILER_APP_URL="http://ptsochantaris.github.io/trailer/trailer1311.zip"

export TRANSMISSION_APP_NAME="Transmission.app"
export TRANSMISSION_APP_URL="http://download.transmissionbt.com/files/Transmission-2.84.dmg"

export MPLAYERX_APP_NAME="MPlayerX.app"
export MPLAYERX_APP_URL="http://downloads.sourceforge.net/project/mplayerx-osx/MPlayerX-1.1.1.dmg"

export MACTEX_APP_NAME="MacTeX.app"
export MACTEX_APP_URL="http://tug.org/cgi-bin/mactex-download/MacTeX.pkg"

export OSX_FUSE_APP_NAME="OSXFUSE.app"
export OSX_FUSE_APP_URL="http://sourceforge.net/projects/osxfuse/files/osxfuse-2.8.2/osxfuse-2.8.2.dmg"

export SKYPE_APP_NAME="Skype.app"
export SKYPE_APP_URL="http://download.skype.com/macosx/4a5fc3cf1bccef621f2de406441fe15e/Skype_7.18.341.dmg"

export INTELLIJ_APP_NAME="IntelliJ IDEA 15.app"
export INTELLIJ_APP_URL="https://d1opms6zj7jotq.cloudfront.net/idea/ideaIU-15.0.2-custom-jdk-bundled.dmg"

export PYCHARM_APP_NAME="PyCharm.app"
export PYCHARM_APP_URL="https://d1opms6zj7jotq.cloudfront.net/python/pycharm-professional-5.0.2-jdk-bundled.dmg"

export CLION_APP_NAME="CLion.app"
export CLION_APP_URL="https://d1opms6zj7jotq.cloudfront.net/cpp/CLion-1.2.2-custom-jdk-bundled.dmg"
