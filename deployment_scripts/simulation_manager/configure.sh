#!/bin/bash
source `dirname $0`/../utils.sh

create_sim_config() {
  cat >config.json <<EOS
{
  "information_service_url":"${INFORMATION_SERVICE_URL}",
  "experiment_manager_user":"scalarm",
  "experiment_manager_pass":"scalarm",
  "insecure_ssl":true
}
EOS
}

info "Generating config for SiM"
execute cd $SCALARM_ROOT/scalarm_simulation_manager
execute create_sim_config
