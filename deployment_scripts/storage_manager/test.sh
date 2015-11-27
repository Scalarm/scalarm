#!/bin/bash
source `dirname $0`/../utils.sh

info "Checking if Storage Manager log_bank is responding"
execute eval test '$(curl -skw "%{http_code}" https://localhost:20000/status)' == "200"
