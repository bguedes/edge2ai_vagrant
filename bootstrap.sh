#!/bin/bash

vagrant plugin install vagrant-vbguest

wget https://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box --no-check-certificate

vagrant box add CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box --name centos7

echo "> Installing required tools"
if  [ -n "$(command -v yum)" ]; then
    echo ">> Detected yum-based Linux"
    sudo yum install -y util-linux
    sudo yum install -y lvm2
    sudo yum install -y e2fsprogs
    sudo yum install -y git
    sudo yum install -y yum-utils
    echo "> Installing docker"
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    sudo systemctl start docker
fix

cd ~
git clone https://github.com/asdaraujo/edge2ai-workshop.git
cd edge2ai-workshop.git

cp edge2ai-workshop/setup/terraform/resources/stack.stack.cdp717p.sh edge2ai-workshop/setup/terraform/resources/stack.sh
