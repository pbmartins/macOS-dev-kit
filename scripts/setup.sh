#!/bin/bash

# DESCRIPTION
# Sets up and launches (if necessary) installed software.

# Bash
sudo bash -c "printf '/usr/local/bin/bash\n' >> /etc/shells"

# Bash Completion
chsh -s /usr/local/bin/bash

# rbenv
export PATH="/usr/local/bin:$PATH"
eval "$(rbenv init -)"
rbenv install $MRI
rbenv global $MRI

# Ruby
printf "%s\n" "---" > "$HOME/.gemrc"
printf "%s\n" "gem: --no-document" >> "$HOME/.gemrc"
git clone git://github.com/bkuhlmann/ruby_setup.git
(
  cd ruby_setup
  git checkout $REPO_RUBY_SETUP
  rbenv shell $MRI
  ./run.sh i
)
rm -rf ruby_setup

# Go
install_git_project "git://github.com/bkuhlmann/go_setup.git" $REPO_GO_SETUP "go_setup" "./run.sh i"

# NPM
install_git_project "git://github.com/bkuhlmann/npm_setup.git" $REPO_NPM_SETUP "npm_setup" "./run.sh i"

# Sublime Text Setup
if [ ! -e "/usr/bin/sublime" ]; then
  sudo ln -sv "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime
fi
install_git_project "git://github.com/bkuhlmann/sublime_text_setup.git" $REPO_SUBLIME_TEXT_SETUP "sublime_text_setup" "./run.sh i"

# Dotfiles
#rm -f $HOME/.bash_profile
#install_git_project "git://github.com/bkuhlmann/dotfiles.git" $REPO_DOTFILES "dotfiles" "./run.sh i"
#source $HOME/.bashrc
