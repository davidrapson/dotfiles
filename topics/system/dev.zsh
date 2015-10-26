#######################################
# Dev
#######################################

# Browsers
alias safari="open -a safari"
alias firefox="open -a firefox"
alias opera="open -a opera"
alias chrome="open -a google\ chrome"
alias canary="open -a google\ chrome\ canary"
# Load Chrome Canary without certificate warnings
alias chrome-danger="open -a google\ chrome\ canary --args --ignore-certificate-errors --allow-running-insecure-content"

# Launch installed browsers for a specific URL
# Usage: browsers "http://www.google.com"
function browsers() {
  chrome $1
  firefox $1
  safari $1
}

function follow() {
  less +F $1
}

alias numfmt="gnumfmt"

function gzipped() {
  if hash gnumfmt 2>/dev/null; then
    cat $1 | gzip -9 | wc -c | gnumfmt --to=iec-i --suffix=B --format="%3f"
  else
    echo "\nCouldn't find gnumfmt. You need to install coreutils first:\n"
    echo "brew install coreutils"
  fi
}

function ssnips() {
  snips list | ag $1
}
