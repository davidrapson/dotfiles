# Git
# ===

# Aliases
# -------

# More Git aliases in ~/.gitconfig
# Inspired by Thoughtbot
# http://robots.thoughtbot.com/post/4747482956/streamline-your-git-workflow-with-aliases
# These extend the default oh-my-zsh git plugin

# Wrap git with hub
# brew install hub
hub_path=$(which hub)
if [[ -f $hub_path ]]
then
  alias git=$hub_path
fi

# Some of these git aliases use the `git-smart` and `omglog` gems
# `gem install git-smart omglog` then `rbenv rehash`
alias gca='git commit --amend'
alias gh='git browse'
alias gl='git smart-log'
alias gm='git smart-merge'
alias gmr='git merge --ff-only'
alias go='git_overview'
alias gomg='omglog'
alias gp='git add --patch'
alias gst='git status --branch --short'
alias gs='git status --branch --short'
alias gup='git smart-pull'
alias gce='git config user.email david@davidrapson.co.uk'
alias gcew='git config user.email david.rapson@mademedia.co.uk'
alias ungit="find . -name '.git' -exec rm -rf {} \;"

# Open any files marked as “modified” in default editor.
alias changed='$EDITOR `git status --porcelain | sed -ne "s/^ M //p"`'

# Functions
# ---------

# Git Sandbox user/repo
function sandbox() {
  cd ~/Developer/code/sandbox && git clone $1 && cd `last_modified`
}

# Requires legit (brew install legit) and gbrt (gbrt in bin/)
function git_overview() {

  echo '\nBranch Status'
  echo '=============================================\n'
  legit branches

  echo '\n'
  gbrt

}
