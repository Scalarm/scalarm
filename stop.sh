#!/bin/sh
. `dirname $0`/deployment_scripts/utils.sh

should_be_set PUBLIC_NGINX_ADDRESS

execute cd $SCRIPT_PATH/deployment_scripts

execute_optional pathfinder/stop.sh
execute_optional data_explorer/stop.sh
execute_optional experiment_manager/stop.sh
execute_optional storage_manager/stop.sh
execute_optional information_service/stop.sh

execute_optional nginx/stop.sh
