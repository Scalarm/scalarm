#!/bin/bash
source `dirname $0`/../utils.sh

# constants
export RAILS_ENV=production
export REDIS_VERSION=redis-3.2.1
export PATH=$SCALARM_ROOT/$REDIS_VERSION/src:$PATH

info "Entering Experiment Manager dir"
execute cd $SCALARM_ROOT/scalarm_experiment_manager

info "Stopping Experiment Manager"
execute_optional rake service:stop

PUBLIC_EXPERIMENT_MANAGER_ADDRESS=$PUBLIC_NGINX_ADDRESS

info "Deregistering Experiment Manager from Information Service (using public address: $PUBLIC_EXPERIMENT_MANAGER_ADDRESS)"
execute_optional $SCRIPT_PATH/../deregister_service.sh experiment_managers $PUBLIC_EXPERIMENT_MANAGER_ADDRESS
