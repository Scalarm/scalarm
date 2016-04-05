#!/bin/bash
source `dirname $0`/utils.sh

if ruby --version
then
  info "Ruby already installed: $(ruby --version)"
else
  info "Adding ppa:brightbox/ruby-ng repository"
  execute sudo apt-get -y install software-properties-common
  execute sudo add-apt-repository -y ppa:brightbox/ruby-ng
  execute sudo apt-get update

  info "Installing dev dependencies of Ruby"
  execute sudo apt-get -y gawk g++ gcc make libc6-dev libreadline6-dev zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgmp-dev libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev

  info "Installing Ruby from ppa:brightbox/ruby-ng repository"
  execute sudo apt-get install -y ruby2.1 ruby2.1-dev
  execute gem install bundler

  info "Checking installed ruby version"
  execute ruby --version
fi
