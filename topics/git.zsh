#######################################
# Git
#######################################

# Aliases
# More Git aliases in ~/.gitconfig
# Inspired by Thoughtbot
# http://robots.thoughtbot.com/post/4747482956/streamline-your-git-workflow-with-aliases
alias gc='git commit'
alias gco='git checkout'
alias gca='git commit --amend'
alias gcar='git commit --amend --reset-author'
alias gp='git add --patch'
alias gcp='git cherry-pick'
alias gst='git status --branch --short'
alias gl='git log --pretty="format:%C(bold)%h %d%C(reset) %s %C(dim) %an %ar%C(reset)" --graph'

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
alias gup='ggpull'
