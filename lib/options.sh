#!/bin/bash

# DESCRIPTION
# Defines command line prompt options.

# Process option selection.
# Parameters:
# $1 = The option to process.
process_option() {
  case $1 in
    'b')
      scripts/basic.sh
      break;;
    'h')
      scripts/homebrew.sh
      break;;
    'a')
      scripts/applications.sh
      break;;
    'x')
      scripts/extensions.sh
      break;;
    'p')
      CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments sudo -E pip install -r scripts/python.txt
      break;;
    'd')
      scripts/defaults.sh
      break;;
    'f')
      scripts/dotfiles.sh
      break;;
    'i')
      caffeinate_machine
      scripts/basic.sh
      scripts/homebrew.sh
      scripts/applications.sh
      scripts/extensions.sh
      CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments sudo -E pip install -r scripts/python.txt
      scripts/defaults.sh
      scripts/dotfiles.sh
      break;;
    'q')
      break;;
    *)
      printf "ERROR: Invalid option.\n"
      break;;
  esac
}
export -f process_option
