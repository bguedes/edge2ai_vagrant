#!/bin/bash

namespace=$1
cluster_count=$2
launch_web_server=$3
owner=$4
enddate=$5
tag_project=$6
aws_region=$7
aws_profile=$8
aws_access_key_id=$9
aws_secret_access_key=${10}
web_server_admin_email=${11}
web_server_admin_password=${12}
cdp_base_version=${13}
cdp_username=${14}
cdp_password=${15}

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

    sudo yum update -y
    sudo yum install awscli -y
fi

sudo chown vagrant /var/run/docker.sock

cd ~
git clone https://github.com/asdaraujo/edge2ai-workshop.git

cd edge2ai-workshop

echo "Configuring stack.sh file"
if [[ $cdp_base_version == "7.1.6" ]]; then
cp ./setup/terraform/resources/stack.cdp716p.sh ./setup/terraform/resources/stack.sh
fi

if [[ $cdp_base_version == "7.1.7" ]]; then
cp ./setup/terraform/resources/stack.cdp717p.sh ./setup/terraform/resources/stack.sh
fi

if [[ $cdp_base_version == "7.1.8" ]]; then
cp ./setup/terraform/resources/stack.cdp718p.sh ./setup/terraform/resources/stack.sh
fi
sed -i "s/REMOTE_REPO_USR=<YOUR_USERNAME_HERE>/REMOTE_REPO_USR=$cdp_username/g" ./setup/terraform/resources/stack.sh
sed -i "s/REMOTE_REPO_PWD=<YOUR_PASSWORD_HERE>/REMOTE_REPO_PWD=$cdp_password/g" ./setup/terraform/resources/stack.sh

if [[ $namespace == "default" ]]; then
cp ./setup/terraform/.env.template ./setup/terraform/.env
env_filename="env"
fi

if [[ $namespace != "default" ]]; then
cp ./setup/terraform/.env.template ./setup/terraform/.env.$namespace
env_filename="env.$namespace"
fi

echo "> Configure AWS"
mkdir ~/.aws
cat - > ~/.aws/credentials <<EOF
[$owner]
aws_access_key_id = $aws_access_key_id
aws_secret_access_key = $aws_secret_access_key
region = $aws_region
EOF

echo "Configuring .env file"
sed -i "s/TF_VAR_owner=<CHANGE_ME>/TF_VAR_owner=$owner/g" ./setup/terraform/.$env_filename
sed -i "s/TF_VAR_web_server_admin_email=<CHANGE_ME>/TF_VAR_web_server_admin_email=$web_server_admin_email/g" ./setup/terraform/.$env_filename
sed -i "s/TF_VAR_web_server_admin_password=<CHANGE_ME>/TF_VAR_web_server_admin_password=$web_server_admin_password/g" ./setup/terraform/.$env_filename
sed -i "s/export TF_VAR_enddate=<CHANGE_ME>/export TF_VAR_enddate=$enddate/g" ./setup/terraform/.$env_filename
sed -i "s/TF_VAR_project=\x22<CHANGE_ME>\x22/TF_VAR_project=$tag_project/g" ./setup/terraform/.$env_filename
sed -i "s/TF_VAR_aws_region=us-west-2/export TF_VAR_aws_region=$aws_region/g" ./setup/terraform/.$env_filename
sed -i "s/TF_VAR_aws_profile=/TF_VAR_aws_profile=$aws_profile/g" ./setup/terraform/.$env_filename
