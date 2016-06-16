#!/bin/bash
source `dirname $0`/../utils.sh

info "Go to SCALARM_ROOT: $SCALARM_ROOT"
execute cd $SCALARM_ROOT

if nginx -v; then
  echo "nginx already installed at versin $(nginx -v)"
else
	if [ -a /etc/redhat-release ]; then
		info "This is RHEL"
		info "Adding epel yum repository"
		execute sudo yum install -y epel-release

		info "Installing nginx"
		execute sudo yum install -y nginx wget man curl zip
	else
		if [ -a /etc/os-release ] && [ `cat /etc/os-release | grep ID=ubuntu | wc -l` == '1' ]; then
			info "This is Ubuntu"
			info "Adding nginx/stable apt repository"
			execute sudo apt-get update
			execute sudo apt-get -y install python-software-properties software-properties-common
			execute sudo add-apt-repository -y ppa:nginx/stable
			execute sudo apt-get update

			info "Installing nginx"
			execute sudo apt-get install -y nginx
		fi	
	fi

	execute_optional sudo id -u www-data &>/dev/null || sudo useradd www-data
fi
