#!/bin/bash
source `dirname $0`/../utils.sh

# constants
export RAILS_ENV=production

info "Packages installation"
execute sudo apt-get install -y curl git sysstat

if ruby --version
then
  info "Ruby already installed: $(ruby --version)"
else
  info "RVM keys installation"
  execute gpg --keyserver 213.133.103.71 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  
  info "RVM installation"
  execute "\\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1"
  
  info "RVM first load"
  execute source $HOME/.rvm/scripts/rvm
fi

info "Go to SCALARM_ROOT: $SCALARM_ROOT"
execute cd $SCALARM_ROOT

info "Cloning scalarm_storage_manager"
execute git clone https://github.com/Scalarm/scalarm_storage_manager

info "Go to scalarm_storage_manager application dir"
execute cd scalarm_storage_manager

info "Checking out \"$GIT_BRANCH\" git branch"
execute git checkout $GIT_BRANCH

info "Installing gems"
execute bundle install

MONGODB_PACKAGE_NAME=mongodb-linux-x86_64-ubuntu1404-3.0.7

info "Downloading MongoDB"
execute wget https://fastdl.mongodb.org/linux/$MONGODB_PACKAGE_NAME.tgz

info "Unpacking MongoDB"
execute tar -zxvf $MONGODB_PACKAGE_NAME.tgz

info "Renaming MongoDB directory"
execute mv $MONGODB_PACKAGE_NAME mongodb