# OSX Developer Kit

Shell scripts for automated OS X machine setup.

<!-- Tocer[start]: Auto-generated, don't remove. -->

# Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Setup](#setup)
- [Usage](#usage)
  - [Customization](#customization)
- [Credits](#credits)

<!-- Tocer[finish]: Auto-generated, don't remove. -->

# Features

- Provides a command line interface for installation and management of OSX software.
- Downloads, installs, and configures [Homebrew](http://brew.sh) command line software:
    - [Readline](http://tiswww.case.edu/php/chet/readline/rltop.html)
    - [OpenSSL](https://openssl.org)
    - [GPG](https://www.gnupg.org)
    - [Bash](https://www.gnu.org/software/bash)
    - [Bash Completion](http://bash-completion.alioth.debian.org)
    - [Bison](https://www.gnu.org/software/bison/)
    - [Graphviz](http://graphviz.org)
    - [MacVim](https://github.com/b4winckler/macvim)
    - [Vim](http://www.vim.org)
    - [asciinema](https://asciinema.org)
    - [ShellCheck](https://github.com/koalaman/shellcheck)
    - [Colorized Cat](https://github.com/jingweno/ccat)
    - [Tree](http://mama.indstate.edu/users/ice/tree)
    - [hr](https://github.com/LuRsT/hr)
    - [Git](http://git-scm.com)
    - [Hub](https://github.com/defunkt/hub)
    - [Pigz](http://www.zlib.net/pigz)
    - [Pipe Viewer](http://www.ivarch.com/programs/pv.shtml)
    - [HTTPie](https://github.com/jkbrzt/httpie)
    - [Ioping](https://code.google.com/p/ioping)
    - [Network Grep](http://ngrep.sourceforge.net)
    - [Namebench](https://code.google.com/p/namebench)
    - [FLAC](https://www.xiph.org/flac)
    - [Flex](http://flex.sourceforge.net)
    - [FFmpeg](http://ffmpeg.org)
    - [Node.js](http://nodejs.org)
    - [rbenv](https://github.com/sstephenson/rbenv)
    - [rbenv-build](https://github.com/sstephenson/ruby-build)
    - [rbenv-vars](https://github.com/sstephenson/rbenv-vars)
    - [Rust](https://www.rust-lang.org)
    - [Go](http://golang.org)
    - [Peco](https://github.com/peco/peco)
    - [exiv2](http://www.exiv2.org)
    - [findutils](http://www.gnu.org/software/findutils/)
    - [NTFS-3G](http://www.tuxera.com/community/open-source-ntfs-3g/)
    - [cowsay](https://github.com/sckott/cowsay)
    - [sl](https://github.com/mtoyoda/sl)
    - [GDBM](http://www.gnu.org.ua/software/gdbm/)
    - [MySQL](https://www.mysql.com)
    - [SQLite](https://www.sqlite.org)
    - [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config)
    - [Python](https://www.python.org)
    - [Python 3](https://www.python.org)
    - [PortAudio](http://www.portaudio.com)
    - [wget](https://www.gnu.org/software/wget/)

- Downloads and installs:
    - [Sublime Text 3](http://www.sublimetext.com)
    - [VirtualBox](https://www.virtualbox.org)
    - [MacTeX](https://www.tug.org/mactex)
    - [Vagrant](https://www.vagrantup.com)
    - [IntelliJ IDEA](https://www.jetbrains.com/idea/)
    - [PyCharm](https://www.jetbrains.com/pycharm)
    - [CLion](https://www.jetbrains.com/clion)
    - [App Cleaner](http://www.freemacsoft.net/appcleaner)
    - [OSXFuse](https://osxfuse.github.io)
    - [JavaDK](http://www.oracle.com/technetwork/java/javase/index.html)
    - [Flux](https://justgetflux.com)
    - [SwitchResX](http://www.madrau.com)
    - [The Unarchiever](http://wakaba.c3.cx/s/apps/unarchiver.html)
    - [Dropbox](https://www.dropbox.com)
    - [Google Chrome](http://www.google.com/chrome)
    - [Firefox](http://www.mozilla.com/en-US/firefox)
    - [Skype](http://www.skype.com)
    - [Spectacle](https://www.spectacleapp.com/)
    - [Spotify](https://www.spotify.com)
    - [MPlayerX](http://mplayerx.org)
    - [Transmission](http://www.transmissionbt.com)

- Downloads, installs, and configures software extensions:
    - [Sublime Text 3 Git Gutter](https://github.com/jisaacks/GitGutter)
    - [Sublime Text 3 CTags](https://github.com/SublimeText/CTags)
    - [Sublime Text 3 Apply Syntax](https://github.com/facelessuser/ApplySyntax)
    - [Sublime Text 3 Change Quotes](https://github.com/colinta/SublimeChangeQuotes)
    - [Sublime Text 3 Bracket Highlighter](https://github.com/facelessuser/BracketHighlighter)
    - [Sublime Text 3 Gutter Color](https://github.com/ggordan/GutterColor)
    - [Sublime Text 3 AutoFileName](https://github.com/BoundInCode/AutoFileName)
    - [Sublime Text 3 Autoprefixer](https://github.com/sindresorhus/sublime-autoprefixer)
    - [Sublime Text 3 Web Inspector](http://sokolovstas.github.com/SublimeWebInspector)
    - [Sublime Text 3 Markdown Extended](https://github.com/jonschlinkert/sublime-markdown-extended)
    - [Sublime Text 3 CSScomb](https://github.com/csscomb/csscomb-for-sublime)
    - [Sublime Text 3 Coffee Script](https://github.com/Xavura/CoffeeScript-Sublime-Plugin)
    - [Sublime Text 3 HTML Prettify](https://github.com/victorporof/Sublime-HTMLPrettify)
    - [Sublime Text 3 Flatland - Theme](https://github.com/thinkpixellab/flatland)

- Downloads and installs Python packages:
    - all
    - appnope
    - backports-abc
    - backports.shutil-get-terminal-size
    - backports.ssl-match-hostname
    - BeautifulSoup
    - beautifulsoup4
    - certifi
    - chardet
    - CherryPy
    - columnize
    - coverage
    - crypto
    - decorator
    - Django
    - dropbox
    - feedparser
    - gitdb
    - GitPython
    - gnureadline
    - import-relative
    - ipdb
    - ipython
    - ipython-genutils
    - lxml
    - MySQL-python
    - Naked
    - netifaces
    - nose
    - oauthlib
    - path.py
    - pdb
    - pexpect
    - pickleshare
    - Pillow
    - psutil
    - ptyprocess
    - py
    - pyasn1
    - PyAudio
    - pycrypto
    - pyficache
    - Pygments
    - PyMySQL
    - pyowm
    - pysqlite
    - pytest
    - python-gnupg
    - python-twitter
    - pytube
    - PyYAML
    - requests
    - requests-oauthlib
    - shellescape
    - simplegeneric
    - singledispatch
    - six
    - smmap
    - timeout
    - tornado
    - tracer
    - traitlets
    - tweepy
    - urllib3
    - vboxapi
    - virtualenv
    - wget
    - wheel

- Downloads and applies the dotfiles from this [repository](https://github.com/pbmartins/dotfiles).

# Requirements

0. [OS X](http://www.apple.com/osx)
0. [OS X Software Updates](http://www.apple.com/osx)
0. [Xcode](https://developer.apple.com/downloads) (with accepted license agreement)
0. [Command Line Tools for Xcode](https://developer.apple.com/downloads)

# Setup

Open a terminal window and execute one of the following setup sequences depending on your version preference:

    git clone git://github.com/pbmartins/osx-developer-kit.git
    cd osx-developer-kit

# Usage

You can edit any of the *.sh files in the `scripts` folder to your liking and then open a terminal window to execute the
following command:

    ./run.sh

Running the run.sh script will present the following options:

    Setup:
        b:   Apply basic system settings.
        h:   Install Homebrew software.
        ha:  Install ALL Homebrew software.
        a:   Install application software (Homebrew and Cask required).
        aa:  Install ALL application software (Homebrew and Cask required).
        x:   Install application (Sublime Text 3) extensions.
        p:   Install Python packages (Python pip required).
        pa:  Install ALL Python packages (Python pip required).
        d:   Apply OS and software defaults.
        f:   Apply dotfiles.
        i:   Install everything (i.e. executes all options, listed above, top to bottom).
    Manage:
        C:  Caffeinate machine.
        q:  Quit/Exit.

Choose option 'i' to run all install tasks or select a specific option to run a single task. Each task is designed to
be re-run if necessary. This can also be handy for performing upgrades, re-running a missing/failed install, etc.

It is recommended that the machine be rebooted after all install tasks have completed.

## Customization

You can also modify the install scripts themselves by editing any of the following:

- scripts/homebrew.sh = Installs Homebrew, command line, software (if you don't choose to select ALL binaries, each one will ask you if you want to install it).
- scripts/applications.sh = Installs OS X, GUI-based, applications (if you don't choose to select ALL apps, each one will ask you if you want to install it).
- scripts/extensions.sh = Installs Sublime Text 3 extensions.
- scripts/defaults.sh = Applies system and application defaults.
- scripts/pythonpackages.sh = Installs all Python packages (if you don't choose to select ALL packages, each one will ask you if you want to install it).

# Credits

Based on the OSX guide developed by [Brooke Kuhlmann](https://www.alchemists.io) at [Alchemists](https://www.alchemists.io).

Feel free to suggest any software, binary or package. Hope you enjoy it!
Pedro Martins
