#!/bin/bash
source `dirname $0`/../utils.sh

export REDIS_VERSION=redis-3.2.1

info "Removing Experiment Manager dir"
execute rm -rf $SCALARM_ROOT/scalarm_experiment_manager
execute rm -rf $SCALARM_ROOT/$REDIS_VERSION
