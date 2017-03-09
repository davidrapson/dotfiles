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

function gzipped() {
  if hash gnumfmt 2>/dev/null; then
    cat $1 | gzip -9 | wc -c | gnumfmt --to=iec-i --suffix=B --format="%3f"
  else
    echo "\nCouldn't find gnumfmt. You need to install coreutils first:\n"
    echo "brew install coreutils"
  fi
}

function portcheck() {
   sudo lsof -i :${1:-80}
}

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
function flush() {
  sudo killall -HUP mDNSResponder
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

# Start up a local server for the current directory.
# Defaults to port 8000
function local_server() {
  open "http://localhost:${1:-8000}" && python -m SimpleHTTPServer ${1:-8000}
}

# Start up a local PHP server for the current directory.
# Defaults to port 8000
function local_server_php() {
  php -S localhost:${1:-8000}
}

# Start up a public server for the current directory using ngrok
# brew install ngrok
function public_server() {
  python -m SimpleHTTPServer ${1:-8080} &
  ngrok ${1:-8080}
}
