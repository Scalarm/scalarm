#!/bin/bash
source `dirname $0`/../utils.sh

# constants
export REPO_BASE_URL='http://scalarm.com/repository/'
export RAILS_ENV=production

# req "Packages installation" \
#   "sudo apt-get install -y curl git"
if ruby --version
then
	echo "Ruby already installed"
else
	req "RVM keys installation" \
	  "gpg --keyserver 213.133.103.71 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3"
  req "RVM installation" \
	  "\\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1"
	req "RVM first load" \
	  "source /etc/profile.d/rvm.sh"
fi

req "Cloning scalarm_information_service" \
  "git clone https://github.com/Scalarm/scalarm_information_service"

cd scalarm_information_service

req "Installing gems" \
  "bundle install"
