#!/bin/bash
source `dirname $0`/../utils.sh

info "Go to Information Service directory"
execute cd $SCALARM_ROOT/scalarm_information_service

info "Starting Information Service"
execute rake service:start

info "Wating few seconds for Information Service to settle down..."
execute sleep 3

info "Checking if Information Service is working"
execute $SCRIPT_PATH/test.sh
