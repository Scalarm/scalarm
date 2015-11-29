#!/bin/bash
source `dirname $0`/../utils.sh

# constants
export RAILS_ENV=production

info "Entering Data Explorer dir"
execute cd $SCALARM_ROOT/scalarm_data_explorer

info "Stopping Data Explorer"
execute_optional rake service:stop

info "Deregistering Data Explorer from Information Service (using public address: $PUBLIC_DATA_EXPLORER_ADDRESS)"
execute_optional $SCRIPT_PATH/../deregister_service.sh data_explorers $PUBLIC_DATA_EXPLORER_ADDRESS
