#!/bin/bash
source `dirname $0`/../utils.sh

info "Go to Pathfinder direcotry"
execute cd $SCALARM_ROOT/scalarm_experiment_supervisor

info "Starting Pathfinder"
execute rake service:start

info "Wating few seconds for Pathfinder to settle down..."
execute sleep 5

info "Checking if Pathfinder is working"
execute $SCRIPT_PATH/test.sh

PUBLIC_PATHFINDER_ADDRESS=$PUBLIC_NGINX_ADDRESS/pathfinder

info "Registering Pathfinder in Information Service (using public address: $PUBLIC_PATHFINDER_ADDRESS)"
execute $SCRIPT_PATH/../register_service.sh experiment_supervisors $PUBLIC_PATHFINDER_ADDRESS
