## To use from script dir:
# source `dirname $0`/../utils.sh

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

export SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )

# If SCALARM_ROOT not set, use HOME dir
[ -n "$SCALARM_ROOT" ] || export SCALARM_ROOT=$HOME
