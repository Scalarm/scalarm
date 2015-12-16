#!/bin/bash
source `dirname $0`/../utils.sh

# constants
export RAILS_ENV=production

info "Packages installation"
execute sudo apt-get update
execute sudo apt-get install -y curl git sysstat r-base-core

info "Go to SCALARM_ROOT: $SCALARM_ROOT"
execute cd $SCALARM_ROOT

info "Installing Ruby from RVM"
execute $SCRIPT_PATH/../install_rvm.sh

info "Cloning scalarm_data_explorer"
execute git clone https://github.com/Scalarm/scalarm_data_explorer

info "Go to scalarm_data_explorer application dir"
execute cd scalarm_data_explorer

info "Checking out \"$GIT_BRANCH\" git branch"
execute git checkout $GIT_BRANCH

info "Installing gems"
execute bundle install
