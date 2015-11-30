#!/bin/bash
source `dirname $0`/../utils.sh

info "Kill all nginx processes using nginx-scalarm prefix"
NGINX_PID=`ps -eo pid,args | tail -n +2 | grep "[n]ginx.*master process nginx.*nginx-scalarm"`
NGINX_PID=`trim_string $NGINX_PID`
NGINX_PID=`echo $NGINX_PID | cut -f 1 -d " "`
execute_optional sudo kill $NGINX_PID
