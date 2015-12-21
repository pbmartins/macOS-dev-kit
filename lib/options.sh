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
    's')
      scripts/setup.sh
      break;;
    'i')
      caffeinate_machine
      scripts/basic.sh
      scripts/homebrew.sh
      scripts/applications.sh
      scripts/extensions.sh
      CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments sudo -E pip install -r scripts/python.txt
      scripts/defaults.sh
      scripts/setup.sh
      clean_work_path
      break;;
    'c')
      verify_homebrews
      verify_applications
      verify_extensions
      break;;
    'C')
      caffeinate_machine
      break;;
    'ua')
      uninstall_application
      break;;
    'ux')
      uninstall_extension
      break;;
    'ra')
      reinstall_application
      break;;
    'rx')
      reinstall_extension
      break;;
    'w')
      clean_work_path
      break;;
    'q')
      break;;
    *)
      printf "ERROR: Invalid option.\n"
      break;;
  esac
}
export -f process_option
