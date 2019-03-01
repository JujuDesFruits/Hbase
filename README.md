# Hbase
POC cluster HBase and discover column database

for this project you will need Virtualbox and Ansible to manage your different node on each Centos representing different server.

You will find:
- [start.sh]() who is charged of creating 3 machines with virtualbox
- [playbook_base]() that will configure all prerequisites for each machines
- [playbook_master]() which will be responsible of the master node
- [playbook_slave]() do the same thing for slave node

#### info Centos
If you want to make your own machine and don't use the script **start.sh** here is a brief description of what I suggest for Centos.
The centos use 2Go in RAM and Max 16Go for space on each machines  
To connect the login is **root** and password is **raclette**  
For network we use a private bridge and a nat to acces machine with ssh and to access to internet.  
To allow ssh I've done
```
passwdroot
```
and I've changed **/etc/ssh/sshd_config**
```
# Authentication:
LoginGraceTime 2m
PermitRootLogin yes
StrictModes yes
```
and **/etc/sysconfig/network-scripts/ifcfg-enp0s9**
```
ONBOOT=yes
```
and finally
```
sudo reboot
```
## installation

## bibliography

- [Hadoop installation](https://doctuts.readthedocs.io/en/latest/hadoop.html#single-node-installation)
- []()
