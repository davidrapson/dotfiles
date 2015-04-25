#######################################
# Git
#######################################

# Wrap git with hub
# brew install hub
if (( $+commands[hub] )) ; then
  alias git=$hub_path
fi

# OMGLOG
# gem install omglog
if (( $+commands[omglog] )) ; then
    alias gomg='omglog'
fi

# Aliases
# More Git aliases in ~/.gitconfig
# Inspired by Thoughtbot
# http://robots.thoughtbot.com/post/4747482956/streamline-your-git-workflow-with-aliases
# Some of these git aliases use the `git-smart` and `omglog` gems
# `gem install git-smart omglog` then `rbenv rehash`
alias gc='git commit'
alias gco='git checkout'
alias gau='git add --update'
alias gca='git commit --amend'
alias gh='git browse'
alias gl='git smart-log'
alias gm='git smart-merge'
alias gmr='git merge --ff-only'
alias gp='git add --patch'
alias gcp='git cherry-pick'
alias gst='git status --branch --short'
alias gs='git status --branch --short'
alias gra='git commit --amend --reset-author'
alias gup='git smart-pull'
alias gups='git smart-pull && git submodule sync && git submodule update --init'

if (( $+commands[omglog] )) ; then
    alias gomg='omglog'
fi

# Open any files marked as “modified” in default editor.
alias gchanged='$EDITOR `git status --porcelain | sed -ne "s/^ M //p"`'

# Ungit
alias ungit="find . -name '.git' -exec rm -rf {} \;"

# Will return the current branch name
# Usage example: git pull origin $(current_branch)
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# These aliases take advantage of the current_branch function
alias ggpull='git pull origin $(current_branch)'
alias ggpur='git pull --rebase origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
