#!/bin/bash

# TODO: this address is changed periodically, so it must be copied to other location!
URL=https://dist.eugridpma.info/distribution/igtf/current/accredited/RPMS/ca_PolishGrid-1.73-1.noarch.rpm

sudo apt-get install -y rpm
wget $URL -O plg-certs.rpm
sudo rpm -i --replacepkgs plg-certs.rpm
