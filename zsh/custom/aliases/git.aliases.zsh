# Git
# ===

# More Git aliases in ~/.gitconfig
# Inspired by Thoughtbot
# http://robots.thoughtbot.com/post/4747482956/streamline-your-git-workflow-with-aliases
# These extend the default oh-my-zsh git plugin

alias gitbox='open -a /Applications/Gitbox.app .'
alias ungit="find . -name '.git' -exec rm -rf {} \;"

# Some of these git aliases use the `git-smart` gem
# `gem install git-smart` & `rbenv rehash`
# and the `omglog` gem
# `gem install omglog` & `rbenv rehash`

alias gm='git smart-merge'
alias gmr='git merge --ff-only'
alias gup='git smart-pull'
alias gomg='omglog'