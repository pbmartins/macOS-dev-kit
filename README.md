# OSX

[![Patreon](https://img.shields.io/badge/patreon-donate-brightgreen.svg)](https://www.patreon.com/bkuhlmann)

Shell scripts for automated OS X machine setup.

<!-- Tocer[start]: Auto-generated, don't remove. -->

# Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Setup](#setup)
  - [OS X (El Capitan)](#os-x-el-capitan)
    - [Bootdisk](#bootdisk)
    - [Upgrade](#upgrade)
    - [Reinstall](#reinstall)
  - [Clone Project](#clone-project)
- [Usage](#usage)
  - [Customization](#customization)
- [Additional Software](#additional-software)
  - [App Store](#app-store)
  - [Miscellaneous](#miscellaneous)
  - [Post Install Checklist](#post-install-checklist)
- [Versioning](#versioning)
- [Code of Conduct](#code-of-conduct)
- [Contributions](#contributions)
- [License](#license)
- [History](#history)
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
    - [Vim](http://www.vim.org)
    - [asciinema](https://asciinema.org)
    - [ShellCheck](https://github.com/koalaman/shellcheck)
    - [Colorized Cat](https://github.com/jingweno/ccat)
    - [tmux](http://tmux.sourceforge.net)
    - [Mosh](http://mosh.mit.edu)
    - [Reattach to User Namespace](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard)
    - [Z](https://github.com/rupa/z)
    - [Tree](http://mama.indstate.edu/users/ice/tree)
    - [hr](https://github.com/LuRsT/hr)
    - [Git](http://git-scm.com)
    - [Mecurial](http://mercurial.selenic.com)
    - [Hub](https://github.com/defunkt/hub)
    - [GHI](https://github.com/stephencelis/ghi)
    - [CTags](http://ctags.sourceforge.net)
    - [Tag](https://github.com/jdberry/tag)
    - [Parallel](https://savannah.gnu.org/projects/parallel)
    - [Pigz](http://www.zlib.net/pigz)
    - [jq](http://stedolan.github.com/jq)
    - [The Silver Surfer](https://github.com/ggreer/the_silver_searcher)
    - [Pipe Viewer](http://www.ivarch.com/programs/pv.shtml)
    - [HTTPie](https://github.com/jkbrzt/httpie)
    - [Ioping](https://code.google.com/p/ioping)
    - [Network Grep](http://ngrep.sourceforge.net)
    - [Namebench](https://code.google.com/p/namebench)
    - [ImageMagick](http://www.imagemagick.org)
    - [Graphviz](http://www.graphviz.org)
    - [FLAC](https://www.xiph.org/flac)
    - [FFmpeg](http://ffmpeg.org)
    - [Gifsicle](http://www.lcdf.org/gifsicle)
    - [Node.js](http://nodejs.org)
    - [Phantom.js](http://phantomjs.org)
    - [rbenv](https://github.com/sstephenson/rbenv)
    - [rbenv-build](https://github.com/sstephenson/ruby-build)
    - [rbenv-vars](https://github.com/sstephenson/rbenv-vars)
    - [rbenv-ctags](https://github.com/tpope/rbenv-ctags)
    - [Ruby](http://www.ruby-lang.org)
    - [Rust](https://www.rust-lang.org)
    - [Go](http://golang.org)
    - [FZF](https://github.com/junegunn/fzf)
    - [Peco](https://github.com/peco/peco)
    - [Nginx](http://wiki.nginx.org)
    - [Pow](http://pow.cx)
    - [Memcached](http://memcached.org)
    - [Redis](http://redis.io)
    - [PostgreSQL](http://www.postgresql.org)
    - [pgcli](http://pgcli.com)
    - [Wry](https://github.com/hoop33/wry)
    - [lnav](http://braumeister.org/formula/lnav)
    - [cloc](http://cloc.sourceforge.net)
    - [Terminal Notifier](https://github.com/alloy/terminal-notifier)
    - [Watchman](https://github.com/facebook/watchman)

- Downloads, installs, and configures software applications generally not in the [App Store](http://www.apple.com/macosx/whats-new/app-store.html):
    - [Dropbox](https://www.dropbox.com)
    - [Sublime Text 3](http://www.sublimetext.com)
    - [Google Chrome](http://www.google.com/chrome)
    - [Firefox](http://www.mozilla.com/en-US/firefox)
    - [VirtualBox](https://www.virtualbox.org)
    - [App Cleaner](http://www.freemacsoft.net/appcleaner)
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

# Requirements

0. [OS X](http://www.apple.com/osx)
0. [OS X Software Updates](http://www.apple.com/osx)
0. [Xcode](https://developer.apple.com/downloads) (with accepted license agreement)
0. [Command Line Tools for Xcode](https://developer.apple.com/downloads)

# Setup

Open a terminal window and execute one of the following setup sequences depending on your version preference:

    git clone git://github.com/bkuhlmann/osx.git
    cd osx

# Usage

You can edit any of the *.sh files in the `scripts` folder to your liking and then open a terminal window to execute the
following command:

    ./run.sh

Running the run.sh script will present the following options:

    Setup:
      b:  Apply basic system settings.
      h:  Install Homebrew software.
      a:  Install application software (Homebrew and Cask required).
      x:  Install application (Sublime Text 3) extensions.
      p:  Install Python packages.
      d:  Apply OS and software defaults.
      f:  Apply dotfiles.
      i:  Install everything (i.e. executes all options, listed above, top to bottom).
    Manage:
      C:  Caffeinate machine.
      q:  Quit/Exit.

Choose option 'i' to run all install tasks or select a specific option to run a single task. Each task is designed to
be re-run if necessary. This can also be handy for performing upgrades, re-running a missing/failed install, etc.

It is recommended that the machine be rebooted after all install tasks have completed.

## Customization

You can also modify the install scripts themselves by editing any of the following:

- scripts/homebrew.sh = Installs Homebrew, command line, software.
- scripts/applications.sh = Installs OS X, GUI-based, applications.
- scripts/extensions.sh = Installs Sublime Text 3 extensions.
- scripts/defaults.sh = Applies system and application defaults.
- scripts/python.txt = List of all Python packages.

All Bash functions, used by the scripts defined above, can be found in the `lib` folder of this project.


# License

Copyright (c) 2012 [Alchemists](https://www.alchemists.io).
Read the [LICENSE](LICENSE.md) for details.

# History

Read the [CHANGELOG](CHANGELOG.md) for details.
Built with [Bashsmith](https://github.com/bkuhlmann/bashsmith).

# Credits

Developed by [Brooke Kuhlmann](https://www.alchemists.io) at [Alchemists](https://www.alchemists.io).
