#!/bin/bash
source `dirname $0`/../utils.sh

# constants
export RAILS_ENV=production

# TODO: each supervisor should have install_dependencies_ubuntu.sh script

info "Packages installation"
if [ -a /etc/redhat-release ]; then
	execute sudo yum install -y curl git sysstat

	info "Installing dependencies for supervisor: Sensitivity Analysis R"
	execute sudo yum install -y R

	info "Installing dependencies for supervisor: Sensitivity Analysis C#"
	execute sudo yum install -y yum-utils
	execute sudo rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
	execute sudo yum-config-manager --add-repo http://download.mono-project.com/repo/centos/
	execute sudo yum install -y mono-complete

	info "Installing dependencies for supervisor: Response Surface Method"
	execute sudo yum install -y python scipy python-setuptools python-pip python-setuptools python-dev python-numpy python-scipy python-pandas python-statsmodels
	execute sudo easy_install pyDOE

	info "Installing dependencies for supervisor: Simulated Annealing"
	execute sudo yum install -y python scipy
else
	if [ -a /etc/os-release ] && [ `cat /etc/os-release | grep ID=ubuntu | wc -l` == '1' ]; then
		execute sudo apt-get update
		execute sudo apt-get install -y curl git sysstat

		info "Installing dependencies for supervisor: Sensitivity Analysis R"
		execute sudo apt-get install -y r-base-core

		info "Installing dependencies for supervisor: Sensitivity Analysis C#"
		execute sudo apt-get install -y mono-runtime

		info "Installing dependencies for supervisor: Response Surface Method"
		execute sudo apt-get install -y python2.7 python-setuptools python-dev python-numpy python-scipy python-pandas python-statsmodels
		execute sudo easy_install pyDOE

		info "Installing dependencies for supervisor: Simulated Annealing"
		execute sudo apt-get install -y python2.7 python-scipy
	fi	
fi


info "Go to SCALARM_ROOT: $SCALARM_ROOT"
execute cd $SCALARM_ROOT

info "Installing Ruby from RVM"
execute $SCRIPT_PATH/../install_rvm.sh

info "Cloning scalarm_experiment_supervisor"
execute git clone https://github.com/Scalarm/scalarm_experiment_supervisor

info "Go to scalarm_experiment_supervisor application dir"
execute cd scalarm_experiment_supervisor

info "Checking out \"$GIT_BRANCH\" git branch"
execute git checkout $GIT_BRANCH

info "Installing gems"
execute bundle install
