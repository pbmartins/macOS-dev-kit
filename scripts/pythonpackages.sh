#!/bin/bash

# DESCRIPTION
# Installs Python packages.

printf "Checking for pip... "
if ! command -v pip > /dev/null; then
	echo "WARNING: Python pip is not installed. First install Python and pip to install all the packges."
else
	echo "Python pip instaled."
fi

packages=(
	'appnope>=0.1.0'
	'backports-abc>=0.4'
	'backports.shutil-get-terminal-size>=1.0.0'
	'backports.ssl-match-hostname>=3.5.0.1'
	'BeautifulSoup>=3.2.1'
	'beautifulsoup4>=4.4.1'
	'certifi>=2015.11.20.1'
	'chardet>=2.3.0'
	'CherryPy>=4.0.0'
	'columnize>=0.3.8'
	'coverage>=4.0.3'
	'crypto>=1.4.1'
	'decorator>=4.0.6'
	'Django>=1.9.1'
	'dropbox>=4.0'
	'feedparser>=5.2.1'
	'gitdb>=0.6.4'
	'GitPython>=1.0.1'
	'gnureadline>=6.3.3'
	'import-relative>=0.2.3'
	'ipdb>=0.8.1'
	'ipython>=4.0.3'
	'ipython-genutils>=0.1.0'
	'lxml>=3.5.0'
	'MySQL-python>=1.2.5'
	'Naked>=0.1.31'
	'netifaces>=0.10.4'
	'nose>=1.3.7'
	'oauthlib>=1.0.3'
	'path.py>=8.1.2'
	'pdb>=0.1'
	'pexpect>=4.0.1'
	'pickleshare>=0.6'
	'Pillow>=3.1.0'
	'psutil>=3.4.2'
	'ptyprocess>=0.5'
	'py>=1.4.31'
	'pyasn1>=0.1.9'
	'PyAudio>=0.2.9'
	'pycrypto>=2.6.1'
	'pyficache>=0.3.0'
	'Pygments>=2.1'
	'PyMySQL>=0.7.1'
	'pyowm>=2.3.0'
	'pysqlite>=2.8.1'
	'pytest>=2.8.6'
	'python-gnupg>=0.3.8'
	'python-twitter>=2.2'
	'pytube>=6.1.5'
	'PyYAML>=3.11'
	'requests>=2.9.1'
	'requests-oauthlib>=0.6.0'
	'shellescape>=3.4.1'
	'simplegeneric>=0.8.1'
	'singledispatch>=3.4.0.3'
	'six>=1.10.0'
	'smmap>=0.9.0'
	'timeout>=0.1.2'
	'tornado>=4.3'
	'tracer>=0.3.2'
	'traitlets>=4.1.0'
	'tweepy>=3.5.0'
	'urllib3>=1.14'
	'vboxapi>=1.0'
	'virtualenv>=14.0.1'
	'wget>=3.2'
	'wheel>=0.26.0'
)

if [[ $# == 0 ]]; then
	echo "Installing python packages..."

	for ((i=0; i < ${#packages[@]}; i++))
	do
		printf "Do you want to install ${packages[$i]}? (y/n)  "
		read -r response
		if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
			CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments sudo -E pip install ${packages[$i]}
		fi
	done
else
	echo "Installing all python packages..."
	CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments sudo -E pip install ${packages[@]}
fi
