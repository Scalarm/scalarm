#!/bin/bash
source `dirname $0`/utils.sh

if ruby --version
then
  info "Ruby already installed: $(ruby --version)"
else
  info "RVM keys installation"
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

  info "RVM installation"
  execute eval "curl -sSL https://get.rvm.io | bash -s stable --ruby=2.3.1"

  info "RVM first load"
  if [ -a ~/.profile ]; then
    source ~/.profile;
  fi

  if [ -a /etc/profile.d/rvm.sh ]; then
    source /etc/profile.d/rvm.sh;
  fi

  if [ -a ~/.rvm/scripts/rvm ]; then  	
    source ~/.rvm/scripts/rvm;
  fi

  execute eval "gem install bundler"
fi
