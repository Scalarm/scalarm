#!/bin/bash
source `dirname $0`/../../deployment_scripts/utils.sh
SCRIPTS_ROOT=`dirname $0`/../../

info "Source paasage_env"
source ${SCRIPTS_ROOT}/paasage/paasage_env.sh

info "Nginx configuration"
execute ${SCRIPTS_ROOT}/deployment_scripts/nginx/configure.sh

info "Nginx start"
execute ${SCRIPTS_ROOT}/deployment_scripts/nginx/start.sh

info "Experiment Manager configuration"
execute ${SCRIPTS_ROOT}/deployment_scripts/experiment_manager/configure.sh

info "Experiment Manager start"
execute ${SCRIPTS_ROOT}/deployment_scripts/experiment_manager/start.sh

info "Holding on console after start"
execute tail -f /dev/null
