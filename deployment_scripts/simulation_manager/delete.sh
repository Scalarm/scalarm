#!/bin/bash
source `dirname $0`/../utils.sh

info "Removing SiM dir"
execute rm -rf $SCALARM_ROOT/scalarm_simulation_manager
