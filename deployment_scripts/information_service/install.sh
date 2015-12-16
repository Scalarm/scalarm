#!/bin/bash
source `dirname $0`/../utils.sh

# constants
export REPO_BASE_URL='http://scalarm.com/repository/'
export RAILS_ENV=production

info "Packages installation"
execute sudo apt-get update
execute sudo apt-get install -y curl git

info "Installing Ruby from RVM"
execute $SCRIPT_PATH/../install_rvm.sh

info "Go to SCALARM_ROOT"
execute cd $SCALARM_ROOT

info "Cloning scalarm_information_service"
execute git clone https://github.com/Scalarm/scalarm_information_service

info "Go to Information Service dir"
execute cd $SCALARM_ROOT/scalarm_information_service

info "Checking out $GIT_BRANCH branch"
execute git checkout $GIT_BRANCH

info "Installing gems"
execute bundle install
