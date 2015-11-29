#!/bin/bash
source `dirname $0`/../utils.sh

# constants
export RAILS_ENV=production

info "Entering Pathfinder dir"
execute cd $SCALARM_ROOT/scalarm_experiment_supervisor

info "Stopping Pathfinder"
execute_optional rake service:stop

info "Deregistering Pathfinder from Information Service (using public address: $PUBLIC_PATHFINDER_ADDRESS)"
execute_optional $SCRIPT_PATH/../deregister_service.sh experiment_supervisors $PUBLIC_PATHFINDER_ADDRESS
