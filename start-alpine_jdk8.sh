#!/bin/bash

set -e

CONTAINERS_RUNNING=`docker ps -a --filter "name=alpine_" -q`
echo ".$CONTAINERS_RUNNING."
if [ ".$CONTAINERS_RUNNING." != '..' ]; then
    echo "••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••"
    echo "••• `date` ATENÇÃO: EXISTEM CONTEINERES ALPINE QUE PODEM CONFLITAR. VERIFIQUE •••"
    echo "••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••"
    docker ps -a --format "table {{.Names}}\t{{.ID}}" | sort
    exit
fi

docker run -d  \
       -p 8088:8088 \
       --name alpine_java8 \
       parana/alpine_jdk8

sleep 2
docker exec -i -t alpine_java8 cat /etc/hosts | grep $IP_PREFIX | sort
docker logs alpine_java8 \
    && echo "docker exec -i -t  alpine_java8 bash " 
