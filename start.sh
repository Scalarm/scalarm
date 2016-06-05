#!/bin/sh
. `dirname $0`/deployment_scripts/utils.sh

should_be_set PUBLIC_NGINX_ADDRESS

execute cd $SCRIPT_PATH/deployment_scripts

execute_optional nginx/start.sh

execute_optional information_service/start.sh
execute_optional storage_manager/start.sh
execute_optional experiment_manager/start.sh
execute_optional data_explorer/start.sh
execute_optional pathfinder/start.sh
