#!/bin/bash

VAGRANT_BOX_LIST=$(vagrant box list)

if [[ $VAGRANT_BOX_LIST != *"centos7"* ]]; then
  wget https://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box --no-check-certificate
fi


https://raw.githubusercontent.com/bguedes/edge2ai_vagrant/main/Vagrantfile
https://raw.githubusercontent.com/bguedes/edge2ai_vagrant/main/VMSetup.sh

chmod +x VMSetup.sh
