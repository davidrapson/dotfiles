# Server
# ======

# Aliases
# -------

alias apache_error='less +F /var/log/apache2/error_log'
alias apache_access='less +F /var/log/apache2/access_log'

# Functions
# ---------

# Start up a local server for the current directory
# Defaults to port 8000 but you can pass a port number as an argument
# Automatically open a browser window for the local server
function local_server() {
  open "http://localhost:${1:-8000}" && python -m SimpleHTTPServer ${1:-8000}
}

# Start up a public server for the current directory
# brew install ngrok
function public_server() {
  python -m SimpleHTTPServer 8080 &
  ngrok 8080
}
