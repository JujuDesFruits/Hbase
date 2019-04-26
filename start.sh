#!/bin/bash

hadoop_download_url= http://www-eu.apache.org/dist/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz
hbase_download_url= http://apache.crihan.fr/dist/hbase/1.4.9/hbase-1.4.9-bin.tar.gz
htrace_download_url= http://repo1.maven.org/maven2/org/apache/htrace/htrace-core/3.1.0-incubating/htrace-core-3.1.0-incubating.jar
tmp=0


function creator() {
  ###### TO RESET SSH ########
  ssh-keygen -f "/home/vstk8105/.ssh/known_hosts" -R "192.168.56.101"
  ssh-keygen -f "/home/vstk8105/.ssh/known_hosts" -R "192.168.56.102"
  ssh-keygen -f "/home/vstk8105/.ssh/known_hosts" -R "192.168.56.103"

  echo "simulating new servers"
  vagrant up

  echo "____________________________________________________________________________________________________"
  echo "building layer hadoop"
  echo "____________________________________________________________________________________________________"
  ansible-playbook playbook_cluster.yml -i hosts-dev


  echo "____________________________________________________________________________________________________"
  echo "building layer Hbase"
  echo "____________________________________________________________________________________________________"
  ansible-playbook playbook_hbase.yml -i hosts-dev

  echo "____________________________________________________________________________________________________"
  echo "building layer ssh"
  echo "__________  echo ""__________________________________________________________________________________________"
  scp vagrant@192.168.56.101:/home/hadoop/.ssh/id_rsa.pub id_rsa_1.pub
  scp vagrant@192.168.56.102:/home/hadoop/.ssh/id_rsa.pub id_rsa_2.pub
  scp vagrant@192.168.56.103:/home/hadoop/.ssh/id_rsa.pub id_rsa_3.pub
  touch authorized_keys
  cat ~/.ssh/id_rsa.pub >> authorized_keys
  cat id_rsa_1.pub >> authorized_keys
  cat id_rsa_2.pub >> authorized_keys
  cat id_rsa_3.pub >> authorized_keys
  cp authorized_keys roles/ssh/files/authorized_keys
  rm authorized_keys
  rm id_rsa*

  ansible-playbook playbook_ssh.yml -i hosts-dev
}


if [! -d "roles/common/templates/hadoop-3.1.2.tar.gz"]
then
  echo "Some Packages are needed for ansible to install hadoop and hbase"
  while [ $tmp == 0 ]; do
    read -p "These will take over 3GB internet, do you agree to download them now ? (Yes/No)" answer
	  if [[ "$answer" == "YES" || "$answer" == "yes" || "$answer" == "Yes" || "$answer" == "Y" || 		"$answer" == "y" ]];
	  then
	     wget $hadoop_download_url -P roles/common/templates/
       wget $hbase_download_url -P roles/hbase/templates/
       creator()
		   tmp=$(($tmp + 1))
    elif [[ "$answer" == "NO" || "$answer" == "no" || "$answer" == "No" || "$answer" == "N" || 			"$answer" == "n" ]];
	  then
		    echo "come back when you're ready to download them"
		    tmp=$(($tmp + 1))
	  else
		    echo "Please answer yes or no."
	  fi
  done;
else
creator()
fi
