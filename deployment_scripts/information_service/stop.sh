#!/bin/bash
source `dirname $0`/../utils.sh

# constants
export RAILS_ENV=production

cd $SCALARM_ROOT/scalarm_information_service

info "Stopping information_service"
execute rake service:stop

