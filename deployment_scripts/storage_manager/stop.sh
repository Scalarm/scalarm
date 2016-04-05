#!/bin/bash
source `dirname $0`/../utils.sh

# constants
export RAILS_ENV=production

info "Entering Storage Manager dir"
execute cd $SCALARM_ROOT/scalarm_storage_manager

info "Stopping Storage Manager"
execute_optional rake service:stop_single

info "Deregistering log_bank in Information Service (using public address: $PUBLIC_LOG_BANK_ADDRESS)"
execute_optional $SCRIPT_PATH/../deregister_service.sh storage_managers $PUBLIC_LOG_BANK_ADDRESS
