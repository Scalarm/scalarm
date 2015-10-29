
## To use from script dir:
# source `dirname $0`/../utils.sh

req() {
  MSG=$1
  CMD=$2

  echo -e "\033[1;32m${MSG}\033[0m"
  echo -e "\033[1;32mExecuting: ${CMD}\033[0m"

  eval $CMD
  CMD_CODE=$?
  if [ $CMD_CODE != 0 ]; then
    echo -e "\033[1;33mCommand failed: ${CMD}\033[0m"
    [ "$MSG" != "" ] && echo -e "\033[1;33mDescription: ${MSG}\033[0m"
    exit 1
  fi
}

opt() {
  MSG=$1
  CMD=$2

  echo -e "\033[1;32m${MSG}\033[0m"
  echo -e "\033[1;32mExecuting (optional): ${CMD}\033[0m"

  eval $CMD

  if [ $? != 0 ]; then
    echo -e "\033[1;33mOptional command failed: ${CMD}\033[0m"
    [ "$MSG" != "" ] && echo -e "\033[1;33mDescription: ${MSG}\033[0m"
  fi
}

## req_var VAR_NAME
## 
