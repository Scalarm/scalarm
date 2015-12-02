#!/bin/bash
source `dirname $0`/utils.sh

[ -n "$PUBLIC_NGINX_ADDRESS" ] || export PUBLIC_NGINX_ADDRESS=localhost

should_be_set PUBLIC_NGINX_ADDRESS

execute cd $SCRIPT_PATH

execute nginx/install.sh
execute nginx/configure.sh
execute nginx/start.sh

execute information_service/install.sh
execute storage_manager/install.sh
execute experiment_manager/install.sh
execute data_explorer/install.sh
execute pathfinder/install.sh

execute information_service/configure.sh
execute storage_manager/configure.sh
execute experiment_manager/configure.sh
execute data_explorer/configure.sh
execute pathfinder/configure.sh

execute information_service/start.sh
execute storage_manager/start.sh
execute experiment_manager/start.sh
execute data_explorer/start.sh
execute pathfinder/start.sh
