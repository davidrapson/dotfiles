#######################################
# Node
#######################################

# Install a grunt plugin and save to devDependencies
function gri() {
  npm install --save-dev grunt-"$@"
}

# Check for npm updates
function npmu() {
  if hash npm-check-updates 2>/dev/null; then
    npm-check-updates
  else
    echo "\nYou need to install npm-check-updates first:\n"
    echo "npm install npm-check-updates -g"
  fi
}

# Upgrade package.json and install new versions
function npmui() {
  if hash npm-check-updates 2>/dev/null; then
    npm-check-updates -u && npm install
  else
    echo "\nYou need to install npm-check-updates first:\n"
    echo "npm install npm-check-updates -g"
  fi
}
