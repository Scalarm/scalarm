#!/bin/bash

mkdir -p $HOME/.scalarm
cd $HOME/.scalarm
rm -r master.tar.gz scalarm-master
wget https://github.com/Scalarm/scalarm/archive/master.tar.gz
tar -zxvf master.tar.gz
scalarm-master/deployment_scripts/local_deploy.sh
