# Network
# =======

# Aliases
# -------

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# View HTTP traffic
# brew install ngrep
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Add aliases for HTTP verbs
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# All users processes, only executable name, custom output, show processes with no controlling terminal
alias ps='ps -a -c -o pid,command -x'

# File size
alias fs="stat -f '%z bytes'"
alias df="df -h"

# Copy my public key to my clipboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '✔ Public key copied to clipboard.'"

# Functions
# ---------

# Show both local and public IP addresses
function network() {
  echo -e " Local IP: $(ipconfig getifaddr en0)"
  echo -e "Public IP: $(curl -s icanhazip.com)";
}

# Get local IP and copy it to the clipboard
function localip() {
  if [[ OSXVERSION -eq '10.8' ]]; then
    ipconfig getifaddr en0 | tr -d '\n' | tee >(pbcopy) | echo '✔ Local IP copied to clipboard.'
  else
    ifconfig en1 | grep inet | grep -v inet6 | cut -c 7-17
  fi
}

# Get public IP and copy it to the clipboard
function publicip() {
  dig +short myip.opendns.com @resolver1.opendns.com | pbcopy| echo '✔ Public IP copied to clipboard.'
}

# All the dig info
function digga() {
  dig +nocmd "$1" any +multiline +noall +answer
}

# Just dig MX records
function mx() {
  dig "$1" mx
}

# Flush Directory Service cache
OSXVERSION=$(sw_vers | grep ProductVersion | cut -c 17-20)
function flush() {
  if [[ OSXVERSION -eq '10.8' ]]; then
    sudo killall -HUP mDNSResponder
  else
    dscacheutil -flushcache
  fi
}

# Load Chrome without certificate warnings
function chrome-danger() {
  open /Applications/Google\ Chrome.app --args --ignore-certificate-errors --allow-running-insecure-content
}
