#######################################
# Network
#######################################

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# All users processes, only executable name, custom output, show processes with no controlling terminal
alias ps='ps -a -c -o pid,command -x'

# File size
alias fs="stat -f '%z bytes'"
alias df="df -h"

function ips() {
  # Show all interface IPs
  ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'
  # Show public ip
  dig +short myip.opendns.com @resolver1.opendns.com
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
# OSX seems to change the way this is done every version
OSXVERSION=$(sw_vers -productVersion)
function flush() {
  if [[ OSXVERSION -eq '10.10' ]]; then
    sudo discoveryutil udnsflushcaches
  elif [[ OSXVERSION -eq '10.9' ]]; then
    dscacheutil -flushcache; sudo killall -HUP mDNSResponder
  else
    sudo killall -HUP mDNSResponder
  fi
}

# Resolve host from url
function resolve() {
  for n in $(dig +short $1)
  do
    dig +short -x $n
  done
}

# Copy my public key to my clipboard
function pubkey() {
  more $HOME/.ssh/id_rsa.pub | pbcopy
  echo '✔ Public key copied to clipboard.'
}
