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
    - [Knox](https://agilebits.com/knox)
    - [iTerm2](http://www.iterm2.com)
    - [GitUp](http://gitup.co)
    - [Sublime Text 3](http://www.sublimetext.com)
    - [Sublime Text URL Handler](https://github.com/asuth/subl-handler)
    - [Alfred](http://www.alfredapp.com)
    - [TextExpander](http://www.smilesoftware.com/TextExpander)
    - [Path Finder](http://cocoatech.com)
    - [Tor Browser](https://www.torproject.org)
    - [Google Chrome](http://www.google.com/chrome)
    - [Firefox](http://www.mozilla.com/en-US/firefox)
    - [Opera](http://www.opera.com)
    - [OmniGraffle](http://www.omnigroup.com/applications/omnigraffle)
    - [Transmit](https://panic.com/transmit)
    - [iStat Menus](http://bjango.com/apps/istatmenus)
    - [Bartender](http://www.macbartender.com)
    - [DoubleTake](http://echoone.com/doubletake)
    - [ImageOptim](http://imageoptim.pornel.net)
    - [Iconjar](http://geticonjar.com)
    - [VLC](http://www.videolan.org/vlc)
    - [pgAdmin](http://www.pgadmin.org/index.php)
    - [PSequel](http://www.psequel.com)
    - [Sequel Pro](http://www.sequelpro.com)
    - [Cheatsheet](http://www.cheatsheetapp.com/CheatSheet)
    - [OpenOffice](http://www.openoffice.org)
    - [Cloak](https://www.getcloak.com)
    - [Screenhero](http://screenhero.com)
    - [Speak](http://speak.io)
    - [VirtualBox](https://www.virtualbox.org)
    - [Doxie](http://www.getdoxie.com)
    - [Sonos](http://www.sonos.com)
    - [App Cleaner](http://www.freemacsoft.net/appcleaner)
    - [Hazel](http://www.noodlesoft.com/hazel.php)
    - [Trailer](http://ptsochantaris.github.io/trailer)
    - [Carbon Copy Cloner](http://www.bombich.com)
    - [QuickLook Plain Text](https://github.com/whomwah/qlstephen)
    - [KeyCastr](https://github.com/keycastr/keycastr)
    - [ksdiff](http://www.kaleidoscopeapp.com/ksdiff2)
- Downloads, installs, and configures software extensions:
    - [Vim Pathogen](https://github.com/tpope/vim-pathogen)
    - [Vim Fugitive](https://github.com/tpope/vim-fugitive)
    - [Vim Unimpaired](https://github.com/tpope/vim-unimpaired)
    - [Vim Commentary](https://github.com/tpope/vim-commentary)
    - [Vim Git Gutter](https://github.com/airblade/vim-gitgutter)
    - [Vim Bundler](https://github.com/tpope/vim-bundler)
    - [Vim Ruby](https://github.com/vim-ruby/vim-ruby)
    - [Vim Text Object User](https://github.com/kana/vim-textobj-user)
    - [Vim Text Object Ruby Block](https://github.com/nelstrom/vim-textobj-rubyblock)
    - [Vim Rails](https://github.com/tpope/vim-rails)
    - [Sublime Text 3 Git Gutter](https://github.com/jisaacks/GitGutter)
    - [Sublime Text 3 Gist](https://github.com/condemil/Gist)
    - [Sublime Text 3 Keymaps](https://github.com/MiroHibler/sublime-keymaps)
    - [Sublime Text 3 Local History](https://github.com/vishr/local-history)
    - [Sublime Text 3 CTags](https://github.com/SublimeText/CTags)
    - [Sublime Text 3 Sidebar Enhancements](https://github.com/titoBouzout/SideBarEnhancements)
    - [Sublime Text 3 Advanced New File](https://github.com/skuroda/Sublime-AdvancedNewFile)
    - [Sublime Text 3 Move Tab](https://github.com/SublimeText/MoveTab)
    - [Sublime Text 3 Apply Syntax](https://github.com/facelessuser/ApplySyntax)
    - [Sublime Text 3 Change Quotes](https://github.com/colinta/SublimeChangeQuotes)
    - [Sublime Text 3 Bracket Highlighter](https://github.com/facelessuser/BracketHighlighter)
    - [Sublime Text 3 Trailing Spaces](https://github.com/SublimeText/TrailingSpaces)
    - [Sublime Text 3 Gutter Color](https://github.com/ggordan/GutterColor)
    - [Sublime Text 3 Color Highlighter](https://github.com/Monnoroch/ColorHighlighter)
    - [Sublime Text 3 Alignment](https://github.com/wbond/sublime_alignment)
    - [Sublime Text 3 Wrap+](https://github.com/ehuss/Sublime-Wrap-Plus)
    - [Sublime Text 3 AutoFileName](https://github.com/BoundInCode/AutoFileName)
    - [Sublime Text 3 Autoprefixer](https://github.com/sindresorhus/sublime-autoprefixer)
    - [Sublime Text 3 Easy Motion](https://github.com/tednaleid/sublime-EasyMotion)
    - [Sublime Text 3 Emmet](http://emmet.io)
    - [Sublime Text 3 Emmet LiveStyle](http://livestyle.emmet.io)
    - [Sublime Text 3 Web Inspector](http://sokolovstas.github.com/SublimeWebInspector)
    - [Sublime Text 3 Sublime Linter](https://github.com/SublimeLinter/SublimeLinter)
    - [Sublime Text 3 JSCS Linter](https://github.com/SublimeLinter/SublimeLinter-jscs)
    - [Sublime Text 3 JSCS Formatter](https://github.com/TheSavior/SublimeJSCSFormatter)
    - [Sublime Text 3 Ruby Extract Method](https://github.com/pashamur/ruby-extract-method)
    - [Sublime Text 3 Ruby Slim](https://github.com/slim-template/ruby-slim.tmbundle)
    - [Sublime Text 3 Rubocop](https://github.com/pderichs/sublime_rubocop)
    - [Sublime Text 3 Markdown Extended](https://github.com/jonschlinkert/sublime-markdown-extended)
    - [Sublime Text 3 SCSS](https://github.com/MarioRicalde/SCSS.tmbundle/tree/SublimeText2)
    - [Sublime Text 3 SCSS Lint](https://github.com/attenzione/SublimeLinter-scss-lint)
    - [Sublime Text 3 CSScomb](https://github.com/csscomb/csscomb-for-sublime)
    - [Sublime Text 3 Coffee Script](https://github.com/Xavura/CoffeeScript-Sublime-Plugin)
    - [Sublime Text 3 HTML Prettify](https://github.com/victorporof/Sublime-HTMLPrettify)
    - [Sublime Text 3 DashDoc](https://github.com/farcaller/DashDoc)
    - [Sublime Text 3 Table Editor](https://github.com/vkocubinsky/SublimeTableEditor)

# Requirements

0. [OS X](http://www.apple.com/osx)
0. [OS X Software Updates](http://www.apple.com/osx)
0. [Xcode](https://developer.apple.com/downloads) (with accepted license agreement)
0. [Command Line Tools for Xcode](https://developer.apple.com/downloads)
0. [Java SE Development Kit](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)

# Setup

## OS X (El Capitan)

### Bootdisk

0. Insert a USB drive (8GB or higher is best).
0. Open Disk Utility and format the USB drive (leave the label as "Untitled").
0. Download OS X El Capitan via the App Store but *DO NOT INSTALL*.
0. Run this command to turn the USB drive into bootable image:

        sudo "/Applications/Install OS X El Capitan.app/Contents/Resources/createinstallmedia" --volume /Volumes/Untitled --applicationpath "/Applications/Install OS X El Capitan.app" --nointeraction
0. Exit the OS X El Capitan install.
0. Eject the USB drive.

### Upgrade

0. Insert the USB bootdisk into the machine to be upgraded.
0. Reboot the machine.
0. Hold down the OPTION key while the machine is rebooting.
0. Select the USB bootdisk from the menu.
0. Format the machine using Disk Utility.
0. Install the new OS.

### Reinstall

If you have already installed OS X but want to reinstall it, simply reboot the machine and hold down *COMMAND+R*.
This will load the installer from the recovery partition and allow you to use Disk Utility, reinstall the system, etc.

## Clone Project

Open a terminal window and execute one of the following setup sequences depending on your version preference:

Current Version (stable):

    git clone git://github.com/bkuhlmann/osx.git
    cd osx
    git checkout v11.1.0

Master Version (unstable):

    git clone git://github.com/bkuhlmann/osx.git
    cd osx

# Usage

Edit any of the *.sh files in the `scripts` folder to your liking and then open a terminal window to execute the
following command:

    ./run.sh

Running the run.sh script will present the following options:

    Setup:
      b:  Apply basic system settings.
      h:  Install Homebrew software.
      a:  Install application software.
      x:  Install application extensions.
      d:  Apply software defaults.
      s:  Setup and configure installed software.
      i:  Install everything (i.e. executes all options, listed above, top to bottom).
    Manage:
      c:  Check status of managed software.
      C:  Caffeinate machine.
      ua: Uninstall application software.
      ux: Uninstall application extension.
      ra: Reinstall application software.
      rx: Reinstall application extension.
      w:  Clean work (temp) directory.
      q:  Quit/Exit.

Choose option 'i' to run all install tasks or select a specific option to run a single task. Each task is designed to
be re-run if necessary. This can also be handy for performing upgrades, re-running a missing/failed install, etc.

The options prompt can be skipped by passing the desired option directly to the run.sh script. For example, executing
"./run.sh i" will execute the complete software install process.

It is recommended that the machine be rebooted after all install tasks have completed. Feel free to delete the osx
project directory afterwards...or keep it around for future upgrades.

## Customization

While the default settings for this project are opinionated and tailored for my specific setup, you can easily fork
this project and customize the settings to your specific environment. Start by editing the files located in the
settings project:

- settings/settings.sh = Defines settings for machine name, applications, extensions, versions, paths, etc.

*TIP*: The installer determines which applications/extensions to install as defined by the settings.sh script.
Applications defined with the "APP_NAME" suffix and extensions defined with the "EXTENSION_PATH" suffix inform
the installer what to care about. Removing/commenting out these applications/extensions within the settings.sh file
will cause the installer to skip these applications/extensions.

You can also modify the install scripts themselves by editing any of the following:

- scripts/basic.sh = Applies basic system settings.
- scripts/homebrew.sh = Installs Homebrew, command line, software.
- scripts/applications.sh = Installs OS X, GUI-based, applications.
- scripts/extensions.sh = Installs application extensions.
- scripts/defaults.sh = Applies system and application defaults.
- scripts/setup.sh = Configures and launches (if necessary) installed software.

All Bash functions, used by the scripts defined above, can be found in the `lib` folder of this project.

# Additional Software

## App Store

I also recommend installing the following software found via the
[App Store](http://www.apple.com/macosx/whats-new/app-store.html):

- [DaisyDisk](http://www.daisydiskapp.com)
- [Keymo](http://manytricks.com/keymo)
- [Moom](http://manytricks.com/moom)
- [1Password](http://agilewebsolutions.com/products/1Password)
- [Fantastical](http://flexibits.com/fantastical)
- [Dash](http://kapeli.com/dash)
- [PDFpenPro](http://www.smilesoftware.com/PDFpenPro/index.html)
- [Marked 2](http://marked2app.com)
- [OmniOutliner](http://www.omnigroup.com/applications/omnioutliner)
- [OmniFocus](http://www.omnigroup.com/applications/omnifocus)
- [Patterns](http://krillapps.com/patterns)
- [ColorSnapper](http://colorsnapper.com)
- [Gradient](http://www.gradientapp.com)
- [xScope](http://iconfactory.com/software/xscope)
- [Ember](http://realmacsoftware.com/ember)
- [CloudApp](https://www.getcloudapp.com)
- [Acorn](https://secure.flyingmeat.com/acorn)
- [Pixelmator](http://www.pixelmator.com)
- [Sketch](http://bohemiancoding.com/sketch)
- [GIF Brewery](http://www.helloresolven.com/portfolio/gifbrewery)
- [Prepo](http://wearemothership.com/work/prepo)
- [Name Mangler](http://manytricks.com/namemangler)
- [Kaleidoscope](http://www.kaleidoscopeapp.com)
- [Paw](http://luckymarmot.com/paw)
- [Cocoa JSON Editor](http://www.cocoajsoneditor.com)
- [AquaPath](http://ditchnet.org/aquapath)
- [Day One](http://dayoneapp.com)
- [Kindle](http://www.amazon.com/gp/feature.html?docId=1000464931)
- [iMovie](http://www.apple.com/ilife/imovie)
- [iPhoto](http://www.apple.com/ilife/iphoto)
- [GarageBand](http://www.apple.com/ilife/garageband)
- [CCMenu](http://ccmenu.sourceforge.net)
- [WiFi Explorer](http://www.adriangranados.com/apps/wifi-explorer)
- [MoneyWell](http://nothirst.com/moneywell)
- [Slack](https://slack.com)
- [Tweetbot](http://tapbots.com/tweetbot/mac)

## Miscellaneous

The following software is optional:

- [Hardware IO Tools for Xcode](https://developer.apple.com/downloads) - Includes the Network Link Conditioner, etc.
- [VMWare Fusion](http://www.vmware.com/products/fusion) (requires a registered account, download only)
- [Logitech Harmony Remote](https://support.logitech.com/en_us/product/harmony-890-advanced-universal-remote)

## Post Install Checklist

The following is a checklist of additional steps worth completing after the scripts have been executed:

- Configure System Preferences:
  - Security & Privacy:
    - Enable FileVault and record the recovery key.
    - Require password immediately after sleep or screen saver begins.
    - Show a message when the screen is locked. Example: `<twitter> | <email> | <phone> | <url>`.
  - Internet Accounts:
    - Add all accounts used by Mail.
  - Configure iCloud:
    - Enable Find My Mac.
  - Users & Groups:
    - Update avatar.
    - Remove unused login items.
  - Configure printers and scanners.
- Configure Wi-Fi.

# Versioning

Read [Semantic Versioning](http://semver.org) for details. Briefly, it means:

- Patch (x.y.Z) - Incremented for small, backwards compatible bug fixes.
- Minor (x.Y.z) - Incremented for new, backwards compatible public API enhancements and/or bug fixes.
- Major (X.y.z) - Incremented for any backwards incompatible public API changes.

# Code of Conduct

Please note that this project is released with a [CODE OF CONDUCT](CODE_OF_CONDUCT.md). By participating in this project
you agree to abide by its terms.

# Contributions

Read [CONTRIBUTING](CONTRIBUTING.md) for details.

# License

Copyright (c) 2012 [Alchemists](https://www.alchemists.io).
Read the [LICENSE](LICENSE.md) for details.

# History

Read the [CHANGELOG](CHANGELOG.md) for details.
Built with [Bashsmith](https://github.com/bkuhlmann/bashsmith).

# Credits

Developed by [Brooke Kuhlmann](https://www.alchemists.io) at [Alchemists](https://www.alchemists.io).
