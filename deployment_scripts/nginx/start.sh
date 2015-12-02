#!/bin/bash
source `dirname $0`/../utils.sh

info "Execute nginx with Scalarm configuration"
execute sudo nginx -p $SCALARM_ROOT/nginx-scalarm -c nginx.conf
