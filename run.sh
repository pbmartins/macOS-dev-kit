#!/bin/bash

# DESCRIPTION
# Executes the command line interface.

# USAGE
# ./run.sh OPTION

# SETTINGS
set -o nounset # Exit, with error message, when attempting to use an undefined variable.
set -o errexit # Abort script at first error, when a command exits with non-zero status.
set -o pipefail # Returns exit status of the last command in the pipe that returned a non-zero return value.

# LIBRARY
source lib/options.sh

# EXECUTION
while true; do
  if [[ $# == 0 ]]; then
    printf "\nUsage: run OPTION\n"
    printf "\nOSX Options:\n"
    printf "  Setup:\n"
    printf "    b:  Apply basic system settings.\n"
    printf "    h:  Install Homebrew software.\n"
    printf "    a:  Install application software (Homebrew and Cask required).\n"
    printf "    x:  Install application (Sublime Text 3) extensions.\n"
    printf "    p:  Install Python packages.\n"
    printf "    d:  Apply OS and software defaults.\n"
    printf "    f:  Apply dotfiles.\n"
    printf "    i:  Install everything (i.e. executes all options, listed above, top to bottom).\n"
    printf "  Manage:\n"
    printf "    C:  Caffeinate machine.\n"
    printf "    q:  Quit/Exit.\n\n"
    read -p "Enter selection: " response
    printf "\n"
    process_option $response
  else
    process_option $1
  fi
done
