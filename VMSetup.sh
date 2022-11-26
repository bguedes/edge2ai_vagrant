#!/bin/bash
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
    sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    sudo systemctl start docker
fix

cd ~
git clone https://github.com/bguedes/edge2ai_vagrant.git
cd cdp_pvc_onenode_demo