#!/bin/bash

echo ""

echo -e "\nbuild docker hdfs image\n"
docker build -t hdfs-cluster:2.8.5 .

echo ""
