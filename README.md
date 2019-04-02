# Hbase
POC cluster HBase and discover column database

for this project you will need Virtualbox, Vagrant and Ansible to manage your different node on each Ubuntu representing different server.

You will find:
- [start.sh](https://github.com/JujuDesFruits/Hbase/blob/master/start.sh) who is charged of creating 3 machines with virtualbox and lunch playbook
- [playbook_base](https://github.com/JujuDesFruits/Hbase/blob/master/roles/base/base.md) that will configure all prerequisites for each machines
- [playbook_cluster](https://github.com/JujuDesFruits/Hbase/blob/master/roles/base/master.md) configure node for hadoop
- [playbook_hbase](https://github.com/JujuDesFruits/Hbase/blob/master/roles/base/slave.md) configure node for hbase

#### info Ubuntu
If you want to make your own machine and don't use the script **start.sh** here is a brief description of what I suggest for Ubuntu.  
The Ubuntu use 2Go in RAM on master machines  and 1Go for workers. I didn't defined space for storage so It use dynamic spaces.  
To connect the login is **vagrant** and password is **vagrant**  
For network we use a private bridge and a nat to acces machine with ssh and to access to internet.  

## installation
you only have to lunch **start.sh** to create and configure cluster or you can create your own machines and lunch separately each playbook if you change there environement config.  
Description of playbook is linked at the top of this short presentation.   
then go to
