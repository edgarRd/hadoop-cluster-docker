#!/bin/bash

echo ""

echo -e "\nbuild docker hadoop image\n"
docker build -t hadoop-cluster:1.0 .

echo ""
