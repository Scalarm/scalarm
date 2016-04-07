## To use from script dir:
# source `dirname $0`/../utils.sh

# Environmental variables
# These variables should be exported before starting any deployment script
# See: env.source.example

export SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )

## Removes leading whitespaces, e.g.: "  xczc" to be "xczc"
# $1 - a string
# prints the string
trim_string() {
  VAL=$1
  echo -e "${VAL}" | sed -e 's/^[[:space:]]*//'
}

strip_address_to_host() {
  VAL=$1
  echo "${VAL}" | cut -d ':' -f 1
}

# If SCALARM_ROOT not set, use HOME dir
[ -n "$SCALARM_ROOT" ] || export SCALARM_ROOT=$HOME

[ -n "$PUBLIC_NGINX_ADDRESS" ] || export PUBLIC_NGINX_ADDRESS=localhost
[ -n "$PUBLIC_HOST" ] || export PUBLIC_HOST=$(strip_address_to_host $PUBLIC_NGINX_ADDRESS)
[ -n "$CLOUD_HOST" ] || export CLOUD_HOST=$PUBLIC_HOST

# Default Information Service config
[ -n "$INFORMATION_SERVICE_URL" ] || export INFORMATION_SERVICE_URL=$PUBLIC_NGINX_ADDRESS/information
[ -n "$INFORMATION_SERVICE_LOGIN" ] || export INFORMATION_SERVICE_LOGIN=scalarm
[ -n "$INFORMATION_SERVICE_PASSWORD" ] || export INFORMATION_SERVICE_PASSWORD=scalarm1024

# Default SECRET_KEY_BASE
[ -n "$SECRET_KEY_BASE" ] || export SECRET_KEY_BASE=dfjeiwu38r782781j38nx9

# If GIT_BRANCH not set, use master
[ -n "$GIT_BRANCH" ] || export GIT_BRANCH=master

# Default RAILS_ENV to production
[ -n "$RAILS_ENV" ] || export RAILS_ENV=production

# Default time to wait for service test after start (seconds)
[ -n "$SCALARM_TEST_TIMEOUT" ] || export SCALARM_TEST_TIMEOUT=180

## Exits script when the value is empty
# $1 - a value that should be not empty
should_be_set() {
  export NAME=$1
  eval VAL=\$$NAME
  if [ -n "$VAL" ]; then
    echo -e "\033[1;32mVariable ${NAME} = ${VAL}\033[0m"
  else
    echo -e "\033[1;31mERROR: Variable '${NAME}' not set to any value\033[0m"
    exit 2
  fi
}

## Validating and printing environmental variables
should_be_set SCRIPT_PATH
should_be_set SCALARM_ROOT
should_be_set INFORMATION_SERVICE_URL
should_be_set INFORMATION_SERVICE_LOGIN
should_be_set INFORMATION_SERVICE_PASSWORD
should_be_set SECRET_KEY_BASE
should_be_set GIT_BRANCH
should_be_set RAILS_ENV
should_be_set PUBLIC_NGINX_ADDRESS
should_be_set PUBLIC_HOST
should_be_set CLOUD_HOST


## Helper functions

info() {
  MSG=$@
  echo -e "\033[1;36m[`date`] ${MSG}\033[0m"
  export LAST_MESSAGE=$MSG
}

execute() {
  MSG=$LAST_MESSAGE
  CMD=$@

  echo -e "\033[1;32mExecuting: ${CMD}\033[0m"

  $CMD
  CMD_CODE=$?
  if [ $CMD_CODE != 0 ]; then
    echo -e "\033[1;31mERROR: Command failed: ${CMD}\033[0m"
    [ "$MSG" != "" ] && echo -e "\033[1;33mLast message: ${MSG}\033[0m"
    exit 1
  fi
}

# TODO: refactor to use execute
execute_optional() {
  MSG=$LAST_MESSAGE
  CMD=$@

  echo -e "\033[1;32mExecuting: ${CMD}\033[0m"

  $CMD
  CMD_CODE=$?
  if [ $CMD_CODE != 0 ]; then
    echo -e "\033[1;31mERROR: Command failed: ${CMD}\033[0m"
    [ "$MSG" != "" ] && echo -e "\033[1;33mLast message: ${MSG}\033[0m"
  fi
}

[ -e $HOME/.rvm/scripts/rvm ] && execute source $HOME/.rvm/scripts/rvm
[ -e /usr/local/rvm/scripts/rvm ] && execute source /usr/local/rvm/scripts/rvm
