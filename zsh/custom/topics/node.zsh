# Server
# ======

# Functions
# ---------

# Install a grunt plugin and save to devDependencies
function gri() {
  npm install --save-dev grunt-"$@"
}

function npmui() {
  if hash npm-check-updates 2>/dev/null; then
    npm-check-updates -u && npm install
  else
    echo "\nYou need to install npm-check-updates first:\n"
    echo "npm install npm-check-updates -g"
  fi
}
