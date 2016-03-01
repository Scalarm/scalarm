#!/bin/bash

URL=https://dist.eugridpma.info/distribution/igtf/current/accredited/RPMS/ca_PolishGrid-1.72-1.noarch.rpm

sudo apt-get install -y rpm
wget $URL -O plg-certs.rpm
sudo rpm -i --replacepkgs plg-certs.rpm
