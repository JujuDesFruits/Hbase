#!/bin/bash

###### TO RESET SSH ########
ssh-keygen -f "/home/vstk8105/.ssh/known_hosts" -R "192.168.56.101"
ssh-keygen -f "/home/vstk8105/.ssh/known_hosts" -R "192.168.56.102"
ssh-keygen -f "/home/vstk8105/.ssh/known_hosts" -R "192.168.56.103"

echo "simulating new servers"
vagrant up

echo "____________________________________________________________________________________________________"
echo "THIS SHOULD RETURN AN ERROR THE FIRST TIME"
#This is to add known_hosts. It will return an UNREACHABLE error
ansible -m ping all -i hosts-dev
echo "____________________________________________________________________________________________________"
echo "\n\n"
echo "____________________________________________________________________________________________________"
echo "building layer hadoop"
echo "____________________________________________________________________________________________________"

ansible-playbook playbook_cluster.yml -i hosts-dev --extra-vars "ansible_user=vagrant"

sshpass -p 'vagrant' scp vagrant@192.168.56.101:/home/hadoop/.ssh/id_rsa.pub id_rsa_1.pub
sshpass -p 'vagrant' scp vagrant@192.168.56.102:/home/hadoop/.ssh/id_rsa.pub id_rsa_2.pub
sshpass -p 'vagrant' scp vagrant@192.168.56.103:/home/hadoop/.ssh/id_rsa.pub id_rsa_3.pub
touch authorized_keys
cat ~/.ssh/id_rsa.pub >> authorized_keys
cat id_rsa_1.pub >> authorized_keys
cat id_rsa_2.pub >> authorized_keys
cat id_rsa_3.pub >> authorized_keys
cp authorized_keys roles/base/files/authorized_keys
rm authorized_keys
rm id_rsa*

echo "____________________________________________________________________________________________________"
echo "building layer ssh"
echo "____________________________________________________________________________________________________"

ansible-playbook playbook_ssh.yml -i hosts-dev --extra-vars "ansible_user=vagrant"


echo "____________________________________________________________________________________________________"
echo "building layer Hbase"
echo "____________________________________________________________________________________________________"

ansible-playbook playbook_hbase.yml -i hosts-dev --extra-vars "ansible_user=vagrant"
ansible-playbook playbook_hbase.yml -i hosts-dev --extra-vars "ansible_user=vagrant"
ansible-playbook playbook_hbase.yml -i hosts-dev --extra-vars "ansible_user=vagrant"
