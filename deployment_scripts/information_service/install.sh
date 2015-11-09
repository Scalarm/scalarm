#!/bin/bash
source `dirname $0`/../utils.sh

# constants
export REPO_BASE_URL='http://scalarm.com/repository/'
export RAILS_ENV=production

info "Packages installation"
execute sudo apt-get install -y curl git

if ruby --version
then
  info "Ruby already installed: $(ruby --version)"
else
  info "RVM keys installation"
  execute gpg --keyserver 213.133.103.71 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  
  info "RVM installation"
  execute "\\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1"
  
  info "RVM first load"
  source /home/$USER/.rvm/scripts/rvm
fi

cd $SCALARM_ROOT

info "Cloning scalarm_information_service"
execute git clone https://github.com/Scalarm/scalarm_information_service

cd scalarm_information_service

info "Installing gems"
execute bundle install
