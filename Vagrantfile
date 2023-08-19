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

    config.vm.define "docker-vm" do |docker_vm|
        docker_vm.vm.hostname = "docker-server"
        docker_vm.vm.provider "virtualbox" do |vb|
            vb.name = "docker-server"
            vb.cpus = 2
            vb.memory = 4096
        end
        docker_vm.vm.network "private_network", ip: "192.168.33.20"
    end

    config.vm.define "sonar-vm" do |sonar_vm|
        sonar_vm.vm.hostname = "sonar-server"
        sonar_vm.vm.provider "virtualbox" do |vb|
            vb.name = "sonar-server"
            vb.cpus = 2
            vb.memory = 4096
        end
        sonar_vm.vm.network "private_network", ip: "192.168.33.30"
    end
end
