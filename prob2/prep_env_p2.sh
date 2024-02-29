#!/bin/bash

docker pull zarcen/toy-srv:p2

for i in {1..3}; do
  if docker ps -a --format '{{.Names}}' | grep -q toy-srv-$i; then
    docker rm -f toy-srv-$i
  fi
done
 

docker run -d --label project=sad_ansible --name toy-srv-1 zarcen/toy-srv:p2
docker run -d --label project=sad_ansible --name toy-srv-2 zarcen/toy-srv:p2
docker run -d --label project=sad_ansible --name toy-srv-3 zarcen/toy-srv:p2
