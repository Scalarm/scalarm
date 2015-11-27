#!/bin/bash
source `dirname $0`/../utils.sh

info "Removing Storage Manager dir"
execute rm -rf $SCALARM_ROOT/scalarm_storage_manager
