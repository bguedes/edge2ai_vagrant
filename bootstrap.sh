#!/bin/bash

VAGRANT_BOX_LIST="vagrant vbox list"

if [[ ! $VAGRANT_BOX_LIST == *"centos7"* ]]; then
  wget https://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box --no-check-certificate
fi

git clone https://github.com/bguedes/edge2ai_vagrant.git
cd ./edge2ai_vagrant
