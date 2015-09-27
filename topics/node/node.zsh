#######################################
# Node
#######################################

# Check for npm updates
function npmu() {
  if hash david 2>/dev/null; then
    david
  else
    echo "\nYou need to install david first:\n"
    echo "npm install david -g"
  fi
}

# List globally installed dependencies (first level only)
function npmg() {
    npm list -g --depth 0
}
