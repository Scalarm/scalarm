#!/bin/bash
source `dirname $0`/../utils.sh

info "Copying Scalarm nginx config to SCALARM_ROOT"
execute cp -r $SCRIPT_PATH/nginx-scalarm $SCALARM_ROOT/