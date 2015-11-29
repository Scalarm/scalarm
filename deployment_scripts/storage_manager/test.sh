#!/bin/bash
source `dirname $0`/../utils.sh

info "Checking if Storage Manager log_bank is responding"
execute $SCRIPT_PATH/../check_status.sh $PUBLIC_LOG_BANK_ADDRESS storage
