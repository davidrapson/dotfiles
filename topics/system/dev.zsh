#######################################
# Dev
#######################################

# Browsers
alias safari="open -a safari"
alias firefox="open -a firefox"
alias opera="open -a opera"
alias chrome="open -a google\ chrome"
alias canary="open -a google\ chrome\ canary"
# Load Chrome without certificate warnings
alias chrome-danger="open -a google\ chrome\ canary --args --ignore-certificate-errors --allow-running-insecure-content"

# Launch installed browsers for a specific URL
# Usage: browsers "http://www.google.com"
function browsers(){
  chrome $1
  firefox $1
  safari $1
}
