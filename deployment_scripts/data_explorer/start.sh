#!/bin/bash
source `dirname $0`/../utils.sh

export RAILS_ENV=production

# Setting default env variables if not defined
[ -n $INFORMATION_SERVICE_URL ] || export INFORMATION_SERVICE_URL=localhost:11300
[ -n $INFORMATION_SERVICE_LOGIN ] || export INFORMATION_SERVICE_LOGIN=scalarm
[ -n $INFORMATION_SERVICE_PASSWORD ] || export INFORMATION_SERVICE_PASSWORD=scalarm1024
[ -n $SECRET_KEY_BASE ] || export SECRET_KEY_BASE=dfjeiwu38r782781j38nx9
[ -n $DB_SECRET_KEY ] || export SECRET_KEY_BASE=zxcg6as7d7qh29d5f6fdsa

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

# If PUBLIC_EXPERIMENT_MANAGER_ADDRESS not set, use localhost
[ -n "$PUBLIC_DATA_EXPLORER_ADDRESS" ] || export PUBLIC_DATA_EXPLORER_ADDRESS=localhost:25000

info "Registering Data Explorer in Information Service (using public address: $PUBLIC_DATA_EXPLORER_ADDRESS)"
execute $SCRIPT_PATH/../register_service.sh data_explorers $PUBLIC_DATA_EXPLORER_ADDRESS
