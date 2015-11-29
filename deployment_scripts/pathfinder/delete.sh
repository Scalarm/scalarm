#!/bin/bash
source `dirname $0`/../utils.sh

info "Removing Pathfinder dir"
execute rm -rf $SCALARM_ROOT/scalarm_experiment_supervisor
