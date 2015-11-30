#!/bin/bash
source `dirname $0`/utils.sh

execute cd $SCRIPT_PATH

execute_optional pathfinder/stop.sh
execute_optional data_explorer/stop.sh
execute_optional experiment_manager/stop.sh
execute_optional storage_manager/stop.sh
execute_optional information_service/stop.sh

execute_optional pathfinder/delete.sh
execute_optional data_explorer/delete.sh
execute_optional experiment_manager/delete.sh
execute_optional storage_manager/delete.sh
execute_optional information_service/delete.sh

execute_optional nginx/stop.sh
execute_optional nginx/delete.sh