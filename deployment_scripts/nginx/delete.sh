#!/bin/bash
source `dirname $0`/../utils.sh

info "Removing Scalarm nginx config dir"
execute rm -rf $SCALARM_ROOT/nginx-scalarm
