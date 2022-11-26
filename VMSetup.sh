#!/bin/bash

echo "> Installing required tools"
if  [ -n "$(command -v yum)" ]; then
    echo ">> Detected yum-based Linux"
    sudo yum install -y git
    sudo yum install -y yum-utils
    echo "> Installing docker"
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
    
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo systemctl restart docker
fi

sudo chown vagrant /var/run/docker.sock

su vagrant

echo "> Installing AWS Cli"
yum update -y
yum install awscli -y

cd ~
git clone https://github.com/asdaraujo/edge2ai-workshop.git

cp edge2ai-workshop/setup/terraform/resources/stack.stack.cdp717p.sh edge2ai-workshop/setup/terraform/resources/stack.sh
