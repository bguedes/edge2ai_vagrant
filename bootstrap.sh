#!/bin/bash

wget https://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box --no-check-certificate

vagrant box add CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box --name centos7

git clone https://github.com/bguedes/edge2ai_vagrant.git
cd edge2ai_vagrant
