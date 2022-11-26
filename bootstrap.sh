#!/bin/bash

vagrant plugin install vagrant-vbguest

wget https://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box --no-check-certificate

vagrant box add CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box --name centos7

#wget https://raw.githubusercontent.com/bguedes/cdp_pvc_onenode_demo/main/vagrant/VMSetup.sh
#chmod +x VMSetup.sh
