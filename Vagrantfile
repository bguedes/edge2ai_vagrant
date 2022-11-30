# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos7"
  config.vm.define "edge2ai"
  config.vbguest.installer_options = { allow_kernel_upgrade: true }
  config.vm.network "public_network", ip: "192.168.1.10"

  config.vm.provision "shell", path: "VMSetup.sh", args: [
    "default",                   #Project namespace
    "1",                         #Number of nodes
    "y",                         #Use a web server for getting links (y/n)
    "owner",                     #Owner
    "end_date",                  #End Date ddmmyyyy
    "tag",                       #Tag for aws instance
    "eu-west-1",                 #AWS region
    "bguedes",                   #AWS profile
    "aws_access_key_id",         #AWS key id
    "aws_secret_access_key",     #AWS access key
    "web_server_admin_email",    #Web server links admin email
    "web_server_admin_password", #Web server admin password
    "7.1.7",                     #CDP Base version
    "cdp_login",                 #CDP license username
    "cdp_password"],             #CDP license password
    privileged: false

  config.vm.provider "virtualbox" do |vb|
     # Customize the amount of memory on the VM:
     vb.memory = "4000"
     vb.cpus = "2"
   end
end
