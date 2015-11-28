#!/bin/bash
source `dirname $0`/../utils.sh

info "Checking if Information Service is responding"
execute `dirname $0`/../check_status.sh localhost:11300 information
