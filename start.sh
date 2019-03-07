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

echo "____________________________________________________________________________________________________"
echo "building first layer for all servers"
echo "____________________________________________________________________________________________________"

ansible-playbook playbook_base.yml -i ALL --extra-vars "ansible_user=vagrant ansible_password=vagrant"


sshpass -p 'hduser' scp hduser@192.168.56.101:/home/hduser/.ssh/id_rsa.pub id_rsa_1.pub
sshpass -p 'hduser' scp hduser@192.168.56.102:/home/hduser/.ssh/id_rsa.pub id_rsa_2.pub
sshpass -p 'hduser' scp hduser@192.168.56.103:/home/hduser/.ssh/id_rsa.pub id_rsa_3.pub
touch authorized_keys
cat id_rsa_1.pub >> authorized_keys
cat id_rsa_2.pub >> authorized_keys
cat id_rsa_3.pub >> authorized_keys
cp authorized_keys roles/master/files/authorized_keys
cp authorized_keys roles/slave/files/authorized_keys
rm authorized_keys
rm id_rsa*

echo "____________________________________________________________________________________________________"
echo "building second layer for slaves"
echo "____________________________________________________________________________________________________"
ansible-playbook playbook_slave.yml -i SLAVE --extra-vars "ansible_user=hduser ansible_password=hduser ansible_become_pass=hduser"

echo "____________________________________________________________________________________________________"
echo "building second layer for master"
echo "____________________________________________________________________________________________________"
ansible-playbook playbook_master.yml -i MASTER --extra-vars "ansible_user=hduser ansible_password=hduser ansible_become_pass=hduser"
