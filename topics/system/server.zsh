# Server
# ======

# Aliases
# -------

alias apache_error='tail -f /var/log/apache2/error_log'
alias apache_access='tail -f /var/log/apache2/access_log'

# Functions
# ---------

# Start up a local server for the current directory
# Defaults to port 8000 but you can pass a port number as an argument
# Automatically open a browser window for the local server
function local_server() {
  open "http://localhost:${1:-8000}" && python -m SimpleHTTPServer ${1:-8000}
}

# Start up a public server (using show.io through the show gem) for the current directory
function public_server() {
  python -m SimpleHTTPServer 8080 &
  show 8080
}

# Change owner of directory and children to apache
function chowww() {
  sudo chown -R _www:_www $1
}

function bo_clean() {
  php app/console cache:clear --env="${1}"
  php app/console cache:warmup --env="${1}"
  php app/console assetic:dump --env="${1}"
  php app/console assets:install web --symlink --env="${1}"
}
