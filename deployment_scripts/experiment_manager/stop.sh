#!/bin/bash
source `dirname $0`/../utils.sh

# constants
export RAILS_ENV=production

info "Entering Experiment Manager dir"
execute cd $SCALARM_ROOT/scalarm_experiment_manager

info "Stopping Experiment Manager"
execute_optional rake service:stop

info "Deregistering Experiment Manager from Information Service (using public address: $PUBLIC_EXPERIMENT_MANAGER_ADDRESS)"
execute_optional $SCRIPT_PATH/../deregister_service.sh data_explorers $PUBLIC_EXPERIMENT_MANAGER_ADDRESS
