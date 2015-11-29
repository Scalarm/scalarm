#!/bin/bash
source `dirname $0`/../utils.sh

info "Removing Data Explorer dir"
execute rm -rf $SCALARM_ROOT/scalarm_data_explorer
