#!/bin/bash
source `dirname $0`/../utils.sh

# constants
export RAILS_ENV=production

info "Packages installation"
if [ -a /etc/redhat-release ]; then
	execute sudo yum install -y git curl R zip sysstat golang wget

	info "GSISSH installation - getting Globus repo"
	execute wget http://toolkit.globus.org/ftppub/gt6/installers/repo/globus-toolkit-repo-latest.noarch.rpm -O /tmp/globus-toolkit-repo-latest.noarch.rpm

	info "GSISSH installation - installing Globus repo"
	execute_optional sudo rpm -ivh /tmp/globus-toolkit-repo-latest.noarch.rpm && rm /tmp/globus-toolkit-repo-latest.noarch.rpm

	info "GSISSH installation - installing gsi-openssh-clients"
	execute sudo yum install -y gsi-openssh-clients
else
	if [ -a /etc/os-release ] && [ `cat /etc/os-release | grep ID=ubuntu | wc -l` == '1' ]; then
		execute sudo apt-get update
		execute sudo apt-get install -y curl zip git sysstat r-base-core

		info "GSISSH installation - getting Globus repo"
		execute wget http://downloads.globus.org/toolkit/gt6/stable/installers/repo/deb/globus-toolkit-repo_latest_all.deb-O /tmp/globus-toolkit-repo_latest_all.deb -O /tmp/globus-toolkit-repo_latest_all.deb

		info "GSISSH installation - installing Globus repo"
		execute sudo dpkg -i /tmp/globus-toolkit-repo_latest_all.deb && rm /tmp/globus-toolkit-repo_latest_all.deb

		info "GSISSH installation - installing gsi-openssh-clients"
		execute sudo apt-get update
		execute sudo apt-get install -y gsi-openssh-clients libglobus-gssapi-gsi4
	fi
fi

info "Redis installation in $SCALARM_ROOT..."
export REDIS_VERSION=redis-3.2.1
execute cd $SCALARM_ROOT
execute wget http://download.redis.io/releases/$REDIS_VERSION.tar.gz
execute tar xzf $REDIS_VERSION.tar.gz
execute cd $REDIS_VERSION
execute make
export PATH=$SCALARM_ROOT/$REDIS_VERSION/src:$PATH

info "Go to SCALARM_ROOT: $SCALARM_ROOT"
execute cd $SCALARM_ROOT

info "Installing PLGrid certificates (for gsissh)"
execute_optional $SCRIPT_PATH/../install_plgrid_certs.sh

info "Installing Ruby from RVM"
execute $SCRIPT_PATH/../install_rvm.sh

info "Cloning scalarm_experiment_manager"
execute git clone https://github.com/Scalarm/scalarm_experiment_manager

info "Go to scalarm_experiment_manager application dir"
execute cd scalarm_experiment_manager

info "Checking out \"$GIT_BRANCH\" git branch"
execute git checkout $GIT_BRANCH

info "Installing gems"
execute_optional load_rvm
execute bundle install
