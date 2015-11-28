#!/bin/bash
source `dirname $0`/../utils.sh

info "Checking if Experiment Manager log_bank is responding"
execute `dirname $0`/../check_status.sh $PUBLIC_EXPERIMENT_MANAGER_ADDRESS experiment
