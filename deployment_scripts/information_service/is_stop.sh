#!/bin/bash
req() {
  MSG=$1
  CMD=$2

  echo -e "\033[1;32m${MSG}\033[0m"
  echo -e "\033[1;32mExecuting: ${CMD}\033[0m"

  eval $CMD

  if [ $? != 0 ]; then
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


# constants
export RAILS_ENV=production

pushd scalarm_information_service

opt "Stopping information_service" \
  "rake service:stop"

popd # scalarm_information_service
