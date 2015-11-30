#!/bin/bash
source `dirname $0`/../utils.sh

info "Checking if Pathfinder is responding"
execute $SCRIPT_PATH/../check_status.sh $PUBLIC_NGINX_ADDRESS/pathfinder
