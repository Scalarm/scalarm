#!/bin/bash

sudo apt-get install -y rpm
wget https://dist.eugridpma.info/distribution/igtf/current/accredited/RPMS/ca_PolishGrid-1.70-1.noarch.rpm -O plg-certs.rpm
sudo rpm -i --replacepkgs plg-certs.rpm
