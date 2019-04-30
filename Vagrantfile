# -*- mode: ruby -*-
# vi: set ft=ruby :

#http://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/ClusterSetup.html

MASTER_IP               = '192.168.56.101'
DATA1_IP                = '192.168.56.102'
DATA2_IP                = '192.168.56.103'
OS                      = "ubuntu/trusty64"

Vagrant.configure("2") do |config|

  config.ssh.insert_key = true

  # define Master server
  config.vm.define "master" do |master|
    master.vm.hostname = "hadoop-master"
    master.vm.box = OS
    #master.vm.synced_folder ".", "/home/vagrant/src", mount_options: ["dmode=775,fmode=664"]
    master.vm.network "private_network", ip: MASTER_IP
    master.vm.provider "virtualbox" do |v|
      v.name = "master"
      v.cpus = 2
      v.memory = 3072
    end
    config.vm.provision "file", source:"~/.ssh/id_rsa.pub", destination:"~/.ssh/authorized_keys"
  end

  # define data1 server
  config.vm.define "data1" do |data1|
    data1.vm.hostname = "hadoop-data1"
    data1.vm.box = OS
    data1.vm.network "private_network", ip: DATA1_IP
    data1.vm.provider "virtualbox" do |v|
      v.name = "data1"
      v.cpus = 2
      v.memory = 3072
    end
    config.vm.provision "file", source:"~/.ssh/id_rsa.pub", destination:"~/.ssh/authorized_keys"
  end

  # define data2 server
  config.vm.define "data2" do |data2|
    data2.vm.hostname = "hadoop-data2"
    data2.vm.box = OS
    data2.vm.network "private_network", ip: DATA2_IP
    data2.vm.provider "virtualbox" do |v|
      v.name = "data2"
      v.cpus = 2
      v.memory = 3072
    end
    config.vm.provision "file", source:"~/.ssh/id_rsa.pub", destination:"~/.ssh/authorized_keys"
  end

end
