#!/bin/bash

# DESCRIPTION
# Installs application extensions.

# SETUP

# EXECUTION

# Sublime Text - Git Gutter
install_git_app "$GIT_GUTTER_EXTENSION_URL" "$GIT_GUTTER_EXTENSION_PATH"

# Sublime Text - CTags
install_git_app "$CTAGS_EXTENSION_URL" "$CTAGS_EXTENSION_PATH"

# Sublime Text - Apply Syntax
install_git_app "$APPLY_SYNTAX_EXTENSION_URL" "$APPLY_SYNTAX_EXTENSION_PATH"

# Sublime Text - Change Quotes
install_git_app "$CHANGE_QUOTES_EXTENSION_URL" "$CHANGE_QUOTES_EXTENSION_PATH" "$CHANGE_QUOTES_EXTENSION_OPTIONS"

# Sublime Text - Bracket Highlighter
install_git_app "$BRACKET_HIGHLIGHTER_EXTENSION_URL" "$BRACKET_HIGHLIGHTER_EXTENSION_PATH"

# Sublime Text - Gutter Color
install_git_app "$GUTTER_COLOR_EXTENSION_URL" "$GUTTER_COLOR_EXTENSION_PATH"

# Sublime Text - AutoFileName
install_git_app "$AUTOFILENAME_EXTENSION_URL" "$AUTOFILENAME_EXTENSION_PATH" "$AUTOFILENAME_EXTENSION_OPTIONS"

# Sublime Text - Autoprefixer
install_git_app "$AUTOPREFIXER_EXTENSION_URL" "$AUTOPREFIXER_EXTENSION_PATH"

# Sublime Text - Emmet
install_git_app "$EMMET_EXTENSION_URL" "$EMMET_EXTENSION_PATH"

# Sublime Text - Web Inspector
install_git_app "$WEB_INSPECTOR_EXTENSION_URL" "$WEB_INSPECTOR_EXTENSION_PATH"

# Sublime Text - Markdown Extended
install_git_app "$MARKDOWN_EXTENSION_URL" "$MARKDOWN_EXTENSION_PATH"

# Sublime Text - CSScomb
install_git_app "$CSSCOMB_EXTENSION_URL" "$CSSCOMB_EXTENSION_PATH"

# Sublime Text - HTML Prettify
install_git_app "$HTML_PRETTIFY_EXTENSION_URL" "$HTML_PRETTIFY_EXTENSION_PATH"

# Sublime Text - Flatland Theme
install_git_app "$FLATLAND_THEME_EXTENSION_URL" "$FLATLAND_THEME_EXTENSION_PATH"