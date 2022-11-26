# -*- mode: ruby -*-
# vi: set ft=ruby :

# Fail if the vagrant-disksize plugin is not installed
unless Vagrant.has_plugin?("vagrant-vbguest")
  raise 'vagrant-vbguest is not installed!'
end

Vagrant.configure("2") do |config|
  config.vm.box = "centos7"
  config.vm.define "edge2ai"
  config.vbguest.installer_options = { allow_kernel_upgrade: true }
  config.vm.network "public_network", ip: "192.168.1.10"

  config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     #vb.gui = true
     # Customize the amount of memory on the VM:
     vb.memory = "8000"
     vb.cpus = "4"
   end
end