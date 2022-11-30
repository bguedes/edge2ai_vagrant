#!/bin/bash

VAGRANT_BOX_LIST=$(vagrant box list)

if [[ $VAGRANT_BOX_LIST != *"centos7"* ]]; then
  wget https://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box --no-check-certificate
  vagrant box add CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box --name centos7
fi

wget https://raw.githubusercontent.com/bguedes/edge2ai_vagrant/main/Vagrantfile --no-check-certificate
wget https://raw.githubusercontent.com/bguedes/edge2ai_vagrant/main/VMSetup.sh --no-check-certificate

chmod +x VMSetup.sh
