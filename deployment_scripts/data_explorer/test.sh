#!/bin/bash
source `dirname $0`/../utils.sh

info "Checking if Data Explorer is responding"
execute $SCRIPT_PATH/../check_status.sh $PUBLIC_DATA_EXPLORER_ADDRESS
