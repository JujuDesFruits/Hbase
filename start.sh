#!/bin/bash

echo "simulating new servers"
vagrant up

###### TO RESET SSH ########
ssh-keygen -f "/home/vstk8105/.ssh/known_hosts" -R "192.168.56.101"
ssh-keygen -f "/home/vstk8105/.ssh/known_hosts" -R "192.168.56.102"
ssh-keygen -f "/home/vstk8105/.ssh/known_hosts" -R "192.168.56.103"
echo "____________________________________________________________________________________________________"
echo "building layer ssh"
echo "____________________________________________________________________________________________________"

ansible-playbook playbook_base.yml -i hosts-dev --extra-vars "ansible_user=vagrant ansible_password=vagrant"

sshpass -p 'vagrant' scp vagrant@192.168.56.101:/home/vagrant/.ssh/id_rsa.pub id_rsa_1.pub
sshpass -p 'vagrant' scp vagrant@192.168.56.102:/home/vagrant/.ssh/id_rsa.pub id_rsa_2.pub
sshpass -p 'vagrant' scp vagrant@192.168.56.103:/home/vagrant/.ssh/id_rsa.pub id_rsa_3.pub
touch authorized_keys
cat id_rsa_1.pub >> authorized_keys
cat id_rsa_2.pub >> authorized_keys
cat id_rsa_3.pub >> authorized_keys
cp authorized_keys roles/base/files/authorized_keys
rm authorized_keys
rm id_rsa*

ansible-playbook playbook_base.yml -i hosts-dev --extra-vars "ansible_user=vagrant ansible_password=vagrant"


echo "____________________________________________________________________________________________________"
echo "building layer hadoop"
echo "____________________________________________________________________________________________________"

ansible-playbook playbook_cluster.yml -i hosts-dev --extra-vars "ansible_user=vagrant ansible_password=vagrant"


echo "____________________________________________________________________________________________________"
echo "building layer Hbase"
echo "____________________________________________________________________________________________________"

ansible-playbook playbook_hbase.yml -i hosts-dev --extra-vars "ansible_user=vagrant ansible_password=vagrant"
ansible-playbook playbook_hbase.yml -i hosts-dev --extra-vars "ansible_user=vagrant ansible_password=vagrant"
ansible-playbook playbook_hbase.yml -i hosts-dev --extra-vars "ansible_user=vagrant ansible_password=vagrant"
