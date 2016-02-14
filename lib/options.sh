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
		'ha')
			scripts/homebrew.sh 1
			break;;
		'a')
			scripts/applications.sh
			break;;
		'aa')
			scripts/applications.sh 1
			break;;
		'x')
			scripts/extensions.sh
			break;;
		'p')
			scripts/pythonpackages.sh
			break;;
		'pa')
			scripts/pythonpackages.sh 1
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
			scripts/homebrew.sh 1
			scripts/applications.sh 1
			scripts/extensions.sh
			scripts/pythonpackages.sh 1
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
