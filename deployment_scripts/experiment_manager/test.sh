#!/bin/bash
source `dirname $0`/../utils.sh

info "Checking if Experiment Manager is responding"
execute $SCRIPT_PATH/../check_status.sh $PUBLIC_EXPERIMENT_MANAGER_ADDRESS
