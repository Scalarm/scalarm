#!/bin/bash
source `dirname $0`/../utils.sh

export RAILS_ENV=production

# Setting default env variables if not defined
[ -n $INFORMATION_SERVICE_URL ] || export INFORMATION_SERVICE_URL=localhost:11300
[ -n $INFORMATION_SERVICE_LOGIN ] || export INFORMATION_SERVICE_LOGIN=scalarm
[ -n $INFORMATION_SERVICE_PASSWORD ] || export INFORMATION_SERVICE_PASSWORD=scalarm1024
[ -n $SECRET_KEY_BASE ] || export SECRET_KEY_BASE=dfjeiwu38r782781j38nx9
[ -n $DB_SECRET_KEY ] || export SECRET_KEY_BASE=zxcg6as7d7qh29d5f6fdsa

info "Go to Experiment Manager direcotry"
execute cd $SCALARM_ROOT/scalarm_experiment_manager

info "Precompiling assets"
execute rake service:non_digested

# TODO: configure user name and password
info "Creating Scalarm user: scalarm"
execute rails r $SCRIPT_PATH/ruby_scripts/create_user.rb

info "Starting Experiment Manager"
execute rake service:start

info "Wating few seconds for Data Explorer to settle down..."
execute sleep 5

info "Checking if Experiment Manager is working"
execute $SCRIPT_PATH/test.sh

PUBLIC_EXPERIMENT_MANAGER_ADDRESS=$PUBLIC_NGINX_ADDRESS

info "Registering Experiment Manager in Information Service (using public address: $PUBLIC_EXPERIMENT_MANAGER_ADDRESS)"
execute $SCRIPT_PATH/../register_service.sh experiment_managers $PUBLIC_EXPERIMENT_MANAGER_ADDRESS
