# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/focal64"
  
    config.vm.define "jenkins-vm" do |jenkins_vm|
        jenkins_vm.vm.hostname = "jenkins-server"
        jenkins_vm.vm.provider "virtualbox" do |vb|
            vb.name = "jenkins-server"
            vb.cpus = 2
            vb.memory = 2048
        end
    jenkins_vm.vm.network "private_network", ip: "192.168.33.10"
    end
end
