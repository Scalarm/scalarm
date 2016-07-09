#!/bin/bash
source `dirname $0`/../utils.sh

export RAILS_ENV=production

info "Go to Data Explorer direcotry"
execute cd $SCALARM_ROOT/scalarm_data_explorer

info "Precompiling assets"
execute rake service:non_digested

info "Starting Data Explorer"
execute rake service:start

info "Wating few seconds for Data Explorer to settle down..."
execute sleep 5

info "Checking if Data Explorer is working"
execute $SCRIPT_PATH/test.sh

export PUBLIC_DATA_EXPLORER_ADDRESS=$PUBLIC_NGINX_ADDRESS/data_explorer

info "Registering Data Explorer in Information Service (using public address: $PUBLIC_DATA_EXPLORER_ADDRESS)"
execute $SCRIPT_PATH/../register_service.sh data_explorers $PUBLIC_DATA_EXPLORER_ADDRESS
