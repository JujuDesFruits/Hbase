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
ansible playbook_base -i ALL
