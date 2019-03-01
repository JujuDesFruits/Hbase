# Hbase
POC cluster HBase and discover column database

for this project you will need Virtualbox and Ansible to manage your different node on each Centos representing different server.

You will find:
- [start.sh]() who is charged of creating 3 machines with virtualbox
- [playbook_base]() that will configure all prerequisites for each machines
- [playbook_master]() which will be responsible of the master node
- [playbook_slave]() do the same thing for slave node

#### info Ubuntu
If you want to make your own machine and don't use the script **start.sh** here is a brief description of what I suggest for Ubuntu.  
The Ubuntu use 2Go in RAM on master machines  and 1Go for workers. I didn't defined space for storage so It use dynamic spaces.  
To connect the login is **vagrant** and password is **vagrant**  
For network we use a private bridge and a nat to acces machine with ssh and to access to internet.  

## installation
you only have to lunch **start.sh** to create and configure cluster or you can create your own machines and lunch separately each playbook if you change there environement config.  
Description of playbook is linked at the top of this short presentation.

## bibliography

- [Hadoop installation](https://doctuts.readthedocs.io/en/latest/hadoop.html#single-node-installation)
- [vagrant config](https://github.com/coreos/coreos-vagrant/blob/master/Vagrantfile)
