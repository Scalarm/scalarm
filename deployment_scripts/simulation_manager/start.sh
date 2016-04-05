#!/bin/bash
source `dirname $0`/../utils.sh

info "Go to SiM direcotry"
execute cd $SCALARM_ROOT/scalarm_simulation_manager

info "Starting Simulation Manager"
execute chmod +x scalarm_simulation_manager
execute ./scalarm_simulation_manager
