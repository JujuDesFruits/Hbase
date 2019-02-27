# Hbase
POC cluster HBase and discover column database

## installation

run the scipt start.sh. By default, it will lunch 1 master and 2 worker of Hbase on hadoop you should get something like this
```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                                                                                                                              NAMES
653a62561a34        aaionap/hbase       "/opt/hbase-server"      37 minutes ago      Up About a minute   2181/tcp, 8080/tcp, 8085/tcp, 9090/tcp, 9095/tcp, 16010/tcp                                                                                        hbase-slave2
2e1a36a4b8e8        aaionap/hbase       "/opt/hbase-server"      37 minutes ago      Up 37 minutes       2181/tcp, 8080/tcp, 8085/tcp, 9090/tcp, 9095/tcp, 16010/tcp                                                                                        hbase-slave1
314deea49820        aaionap/hbase       "/opt/hbase-server"      37 minutes ago      Up About a minute   0.0.0.0:2181->2181/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8085->8085/tcp, 0.0.0.0:9090->9090/tcp, 0.0.0.0:9095->9095/tcp, 0.0.0.0:16010->16010/tcp   hbase-master
```
first you need to go inside the master node and start the hbase cluster
```
docker exec -it hbase-master /bin/bash
```
```
./usr/bin/start-hbase.sh
```
you can now have an acces to your hbase database by doing the command line bellow in the exact same path as before
```
hbase shell
```

All properties could be change in folder **/opt/hbase/conf**
