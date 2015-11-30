#!/bin/bash
source `dirname $0`/../utils.sh

info "Kill all nginx processes using nginx-scalarm prefix"
# TODO: does not work sometimes because there is trailing space before PID
NGINX_PID=`ps -eo pid,args | tail -n +2 | grep "[n]ginx.*master process nginx.*nginx-scalarm" | cut -f 1 -d " "`
execute_optional sudo kill $NGINX_PID
# TODO: workaround
execute_optional sudo killall nginx
