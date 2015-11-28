#!/bin/bash
source `dirname $0`/utils.sh

cd `dirname $0`

execute_optional experiment_manager/stop.sh
execute_optional storage_manager/stop.sh
execute_optional information_service/stop.sh

execute_optional experiment_manager/delete.sh
execute_optional storage_manager/delete.sh
execute_optional information_service/delete.sh
