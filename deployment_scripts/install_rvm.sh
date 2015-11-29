#!/bin/bash
source `dirname $0`/utils.sh

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