#!/bin/bash
source `dirname $0`/../utils.sh

info "Go to SCALARM_ROOT: $SCALARM_ROOT"
execute cd $SCALARM_ROOT

if nginx -v; then
  echo "nginx already installed at versin $(nginx -v)"
else
  info "Adding nginx/stable apt repository"
  execute sudo apt-get -y install python-software-properties software-properties-common
  execute sudo add-apt-repository -y ppa:nginx/stable
  execute sudo apt-get update

  info "Installing nginx"
  execute sudo apt-get install -y nginx
fi
