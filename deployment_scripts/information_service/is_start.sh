#!/bin/bash
source `dirname $0`/../utils.sh

# context variables
export _INFORMATION_SERVICE_LOGIN=$INFORMATION_SERVICE_LOGIN
export _INFORMATION_SERVICE_PASSWORD=$INFORMATION_SERVICE_PASSWORD
export _SECRET_KEY_BASE=$SECRET_KEY_BASE

export RAILS_ENV=production

cd scalarm_information_service

req "Starting information_service" \
  "rake service:start"

req "Wating few seconds for IS to settle down..." \
  "sleep 3"
opt "Checking if IS is working" \
  "[ $(curl -skw '%{http_code}' https://localhost:11300/status -o /dev/null) == "200" ]"
