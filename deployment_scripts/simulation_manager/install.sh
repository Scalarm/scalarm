#!/bin/bash
source `dirname $0`/../utils.sh

# constants
export RAILS_ENV=production

info "Go to Scalarm ROOT and create SiM dir"
execute cd $SCALARM_ROOT
execute mkdir scalarm_simulation_manager
execute cd scalarm_simulation_manager

info "Downloading Simulation Manager"
execute wget http://scalarm.com/repository/linux_amd64/scalarm_simulation_manager.xz

info "Installing XZ and unpacking"
execute sudo apt-get install xz-utils
execute scalarm_simulation_manager.xz

info "Starting Simulation Manager"
execute chmod +x scalarm_simulation_manager
execute ./scalarm_simulation_manager
