#!/bin/bash

sudo -E apt-get update
sudo -E apt-get install -y unzip python-pip python-virtualenv python-dev
sudo -E pip install ansible

### Use heat (an orchestration tool to provision in OpenStack) to prepare servers for Hadoop ###
# create python virtualenv in ~/venv
virtualenv venv
chown -R vagrant:vagrant venv
# install heat client
apt-get install -y libffi-dev libssl-dev
/home/vagrant/venv/bin/pip install python-heatclient python-openstackclient pyopenssl ndg-httpsclient pyasn1

#sudo su - hadoop
#/usr/local/hadoop/bin/hdfs namenode -format
#/usr/local/hadoop/sbin/start-dfs.sh
#/usr/local/hadoop/sbin/start-yarn.sh
#/home/hadoop/hbase/hbase-2.1.4/bin/start-hbase.sh
