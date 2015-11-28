#!/bin/bash
source `dirname $0`/../utils.sh

# constants
export RAILS_ENV=production

info "Packages installation"
execute sudo apt-get install -y curl zip git sysstat r-base-core

info "Go to SCALARM_ROOT: $SCALARM_ROOT"
execute cd $SCALARM_ROOT

info "GSISSH installation - getting Globus repo"
execute wget http://toolkit.globus.org/ftppub/gt6/installers/repo/globus-toolkit-repo_latest_all.deb -O /tmp/globus-toolkit-repo_latest_all.deb

info "GSISSH installation - installing Globus repo"
execute sudo dpkg -i /tmp/globus-toolkit-repo_latest_all.deb && rm /tmp/globus-toolkit-repo_latest_all.deb

info "GSISSH installation - installing gsi-openssh-clients"
execute sudo apt-get update
execute sudo apt-get install gsi-openssh-clients libglobus-gssapi-gsi4

# TODO: /etc/grid-security/certificates

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

info "Cloning scalarm_experiment_manager"
execute git clone https://github.com/Scalarm/scalarm_experiment_manager

info "Go to scalarm_experiment_manager application dir"
execute cd scalarm_experiment_manager

info "Checking out \"$GIT_BRANCH\" git branch"
execute git checkout $GIT_BRANCH

info "Installing gems"
execute bundle install

info "Precompiling assets"
execute rake service:non_digested
