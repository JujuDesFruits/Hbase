# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.define :master do |master_config|
      master_config.vm.host_name = "hbase-master"
      master_config.vm.network "private_network", ip:"192.168.56.101"
      master_config.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "2048"]
          vb.customize ["modifyvm", :id, "--cpus", "2"]
      end
  end

  config.vm.define :slave1 do |slave1_config|
      slave1_config.vm.host_name = "hbase-slave1"
      slave1_config.vm.network "private_network", ip:"192.168.56.102"
      slave1_config.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "1024"]
          vb.customize ["modifyvm", :id, "--cpus", "2"]
      end
  end

  config.vm.define :slave2 do |slave2_config|
      slave2_config.vm.host_name = "hbase-slave2"
      slave2_config.vm.network "private_network", ip:"192.168.56.103"
      slave2_config.vm.provider :virtualbox do |vb|
          vb.customize ["modifyvm", :id, "--memory", "1024"]
          vb.customize ["modifyvm", :id, "--cpus", "2"]
      end
  end
end
