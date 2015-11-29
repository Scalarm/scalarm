#!/bin/bash
source `dirname $0`/../utils.sh

export RAILS_ENV=production

# Setting default env variables if not defined
[ -n $INFORMATION_SERVICE_URL ] || export INFORMATION_SERVICE_URL=localhost:11300
[ -n $INFORMATION_SERVICE_LOGIN ] || export INFORMATION_SERVICE_LOGIN=scalarm
[ -n $INFORMATION_SERVICE_PASSWORD ] || export INFORMATION_SERVICE_PASSWORD=scalarm1024
[ -n $SECRET_KEY_BASE ] || export SECRET_KEY_BASE=dfjeiwu38r782781j38nx9

info "Go to Information Service directory"
execute cd $SCALARM_ROOT/scalarm_information_service

info "Starting Information Service"
execute rake service:start

info "Wating few seconds for Information Service to settle down..."
execute sleep 3

info "Checking if Information Service is working"
execute $SCRIPT_PATH/test.sh
