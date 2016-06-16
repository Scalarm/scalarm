#!/bin/bash
source `dirname $0`/../utils.sh

# constants
export RAILS_ENV=production

info "Packages installation"
if [ -a /etc/redhat-release ]; then
	execute sudo yum install -y curl git sysstat
else
	if [ -a /etc/os-release ] && [ `cat /etc/os-release | grep ID=ubuntu | wc -l` == '1' ]; then
		execute sudo apt-get update
		execute sudo apt-get install -y curl git sysstat
	fi	
fi

info "Installing Ruby from RVM"
execute $SCRIPT_PATH/../install_rvm.sh

info "Go to SCALARM_ROOT: $SCALARM_ROOT"
execute cd $SCALARM_ROOT

info "Cloning scalarm_storage_manager"
execute git clone https://github.com/Scalarm/scalarm_storage_manager

info "Go to scalarm_storage_manager application dir"
execute cd scalarm_storage_manager

info "Checking out \"$GIT_BRANCH\" git branch"
execute git checkout $GIT_BRANCH

info "Installing gems"
execute_optional load_rvm
execute bundle install

if [ -a /etc/redhat-release ]; then
	if [ `cat /etc/redhat-release | grep 7. | wc -l` == '1' ]; then
		MONGODB_PACKAGE_NAME=mongodb-linux-x86_64-rhel70-3.2.7
	fi
	if [ `cat /etc/redhat-release | grep 6. | wc -l` == '1' ]; then
		MONGODB_PACKAGE_NAME=mongodb-linux-x86_64-rhel62-3.2.7
	fi
else
	if [ -a /etc/os-release ] && [ `cat /etc/os-release | grep ID=ubuntu | wc -l` == '1' ]; then
		MONGODB_PACKAGE_NAME=mongodb-linux-x86_64-ubuntu1404-3.2.7
	fi	
fi

execute echo "MONGODB_PACKAGE_NAME: $MONGODB_PACKAGE_NAME"
info "Downloading MongoDB"
execute wget https://fastdl.mongodb.org/linux/$MONGODB_PACKAGE_NAME.tgz

info "Unpacking MongoDB"
execute tar -zxvf $MONGODB_PACKAGE_NAME.tgz

info "Renaming MongoDB directory"
execute mv $MONGODB_PACKAGE_NAME mongodb
