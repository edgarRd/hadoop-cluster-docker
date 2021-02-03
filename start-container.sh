#!/bin/bash

# the default node number is 5
N=${1:-5}

# clean up
docker rm -f hadoop-master &> /dev/null
i=1
while [ $i -lt $N ]
do
        docker rm -f hadoop-slave$i &> /dev/null
	i=$(( $i + 1 ))
done

echo "start hadoop-master container..."
docker run -itd \
                --network=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
                -p 9000:9000 \
                --name hadoop-master \
                --hostname hadoop-master \
                hdfs-cluster:2.8.5 &> /dev/null


# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	echo "start hadoop-slave$i container..."
	docker run -itd \
	                --network=hadoop \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
	                hdfs-cluster:2.8.5 &> /dev/null
	i=$(( $i + 1 ))
done 

# get into hadoop master container
docker exec -it hadoop-master bash
