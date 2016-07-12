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

# Setting up initialization script
if [ -f /etc/rc.d/rc.local ]; then
  if [ `cat /etc/rc.d/rc.local | grep deployment_scripts/nginx/start.sh | wc -l` == "0" ]; then
    cat &>/tmp/scalarm.rc.local <<EOS

# Start the Scalarm platform

# 1. add $PUBLIC_NGINX_ADDRESS to hostname
if [ \`cat /etc/hosts | grep $PUBLIC_NGINX_ADDRESS | wc -l\` == "0" ]; then
  echo "127.0.0.1  $PUBLIC_NGINX_ADDRESS" >> /etc/hosts
fi

# 2. start scalarm if available
SCALARM_DIR=$HOME/.scalarm/scalarm-master
if [ -f \$SCALARM_DIR/start.sh ]; then
  echo "Starting Scalarm..."
  PUBLIC_NGINX_ADDRESS=$PUBLIC_NGINX_ADDRESS
  HOME=/home/tutorial sh \$SCALARM_DIR/deployment_scripts/nginx/start.sh
  su tutorial -l -c "sh \$SCALARM_DIR/start.sh"
else
  echo "Scalarm not found"
fi
EOS

    sudo bash -c 'cat /tmp/scalarm.rc.local &> /etc/rc.d/rc.local'
  fi
fi
