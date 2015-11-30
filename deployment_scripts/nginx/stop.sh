#!/bin/bash
source `dirname $0`/../utils.sh

info "Kill all nginx processes using nginx-scalarm prefix"
NGINX_PID=`ps -eo pid,args | tail -n +2 | grep "[n]ginx.*master process nginx.*nginx-scalarm" | cut -f 1 -d " "`
execute sudo kill $NGINX_PID