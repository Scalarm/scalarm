#!/bin/bash

mkdir -p $HOME/.scalarm
cd $HOME/.scalarm
wget https://github.com/Scalarm/scalarm/archive/scalarm-master.tar.gz
tar -zxvf scalarm-master.tar.gz
scalarm-master/deployment_scripts/local_deploy.sh
