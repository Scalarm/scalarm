#!/bin/bash
source `dirname $0`/utils.sh

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

if [ -f /etc/rc.d/rc.local ]; then
  if [ `cat /etc/rc.d/rc.local | grep deployment_scripts/nginx/start.sh | wc -l` == "0" ]; then
    cat ../util_scripts/init.sh >> /etc/rc.d/rc.local
  fi
fi
