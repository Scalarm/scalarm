#!/bin/bash
source `dirname $0`/../../deployment_scripts/utils.sh
SCRIPTS_ROOT=`dirname $0`/../../

info "Source paasage_env"
source ${SCRIPTS_ROOT}/paasage/paasage_env.sh

info "Nginx configuration"
execute ${SCRIPTS_ROOT}/deployment_scripts/nginx/configure.sh

info "Nginx start"
execute ${SCRIPTS_ROOT}/deployment_scripts/nginx/start.sh

info "Information Service configuration"
execute ${SCRIPTS_ROOT}/deployment_scripts/information_service/configure.sh

info "Information Service start"
execute ${SCRIPTS_ROOT}/deployment_scripts/information_service/start.sh

info "Holding on console after start"
execute tail -f /dev/null