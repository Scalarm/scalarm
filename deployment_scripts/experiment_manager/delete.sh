#!/bin/bash
source `dirname $0`/../utils.sh

info "Removing Experiment Manager dir"
execute rm -rf $SCALARM_ROOT/scalarm_experiment_manager
