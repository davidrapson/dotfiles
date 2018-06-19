#######################################
# Node
#######################################

# List globally installed dependencies (first level only)
function npmg() {
  npm list -g --depth 0
}
