#!/bin/bash
source `dirname $0`/../utils.sh

info "Removing Information Service dir"
execute rm -rf $SCALARM_ROOT/scalarm_information_service