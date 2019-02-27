#!/bin/bash

# the default node number is 3
N=${1:-3}

sudo docker network create --driver=bridge hbase

# start hbase master container
sudo docker rm -f hbase-master &> /dev/null
echo "start hbase-master container..."
sudo docker run -itd \
                --net=hbase \
                -p 2181:2181 \
                -p 8080:8080 \
                -p 8085:8085 \
                -p 9090:9090 \
                -p 9095:9095 \
                -p 16010:16010 \
                --name hbase-master \
                --hostname hbase-master \
                aaionap/hbase &> /dev/null


# start hbase slave container
i=1
while [ $i -lt $N ]
do
	sudo docker rm -f hbase-slave$i &> /dev/null
	echo "start hbase-slave$i container..."
	sudo docker run -itd \
	                --net=hbase \
	                --name hbase-slave$i \
	                --hostname hbase-slave$i \
	                aaionap/hbase &> /dev/null
	i=$(( $i + 1 ))
done

# get into hbase master container
sudo docker exec -it hbase-master bash
