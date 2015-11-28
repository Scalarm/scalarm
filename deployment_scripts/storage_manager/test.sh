#!/bin/bash
source `dirname $0`/../utils.sh

info "Checking if Storage Manager log_bank is responding"
execute `dirname $0`/../check_status.sh localhost:20000 storage
