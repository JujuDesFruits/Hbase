#!/bin/bash

echo "preparing repo and vagrantfile"
repo=${PWD}
cp Vagrantfile /tmp/
cd
mkdir vagrant
cd vagrant/
cp /tmp/Vagrantfile .

echo "simulating new servers"
vagrant up
