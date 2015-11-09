#!/bin/bash
source `dirname $0`/../utils.sh

info "Checking if Information Service is responding"
execute eval test '$(curl -skw "%{http_code}" https://localhost:11300/status)' == "200"
