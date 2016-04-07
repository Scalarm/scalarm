#!/bin/bash
source `dirname $0`/../../deployment_scripts/utils.sh
SCRIPTS_ROOT=`dirname $0`/../../

info "Source paasage_env"
source ${SCRIPTS_ROOT}/paasage/paasage_env.sh

info "Nginx install"
execute ${SCRIPTS_ROOT}/deployment_scripts/nginx/install.sh

info "Information Service install"
execute ${SCRIPTS_ROOT}/deployment_scripts/information_service/install.sh
