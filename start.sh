#!/bin/bash

echo "preparing repo and vagrantfile"
repo=${PWD}
cd
mkdir vagrant
cd vagrant/
cp $repo/Vagrantfile .

echo "simulating new servers"
vagrant up

cd $repo
echo "building first layer for all servers"
ansible-playbook playbook_base.yml -i ALL --extra-vars "ansible_user=vagrant ansible_password=vagrant"

ansible-playbook playbook_master.yml -i MASTER --extra-vars "ansible_user=hduser ansible_password=hduser ansible_become_pass=hduser"

ansible-playbook playbook_slave.yml -i SLAVE --extra-vars "ansible_user=hduser ansible_password=hduser ansible_become_pass=hduser"
