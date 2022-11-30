#!/bin/bash

VAGRANT_BOX_LIST=$(vagrant box list)

if [[ $VAGRANT_BOX_LIST != *"centos7"* ]]; then
    Invoke-WebRequest -Uri https://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box -UseBasicParsing -OutFile CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box
    vagrant box add CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box --name centos7
fi

Invoke-WebRequest -Uri https://raw.githubusercontent.com/bguedes/edge2ai_vagrant/main/VMSetup.sh -UseBasicParsing -OutFile VMSetup.sh
Invoke-WebRequest -Uri https://raw.githubusercontent.com/bguedes/edge2ai_vagrant/main/Vagrantfile -UseBasicParsing -OutFile Vagrantfile
