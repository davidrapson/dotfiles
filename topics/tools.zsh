#######################################
# Tools
#######################################

if which kubectl > /dev/null 2>&1; then
  alias k=kubectl
fi

if which bundle > /dev/null 2>&1; then
  alias be="bundle exec"
fi
