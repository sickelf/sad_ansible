#!/bin/bash

for i in {1..5}; do
  if docker ps -a --format '{{.Names}}' | grep -q toy-srv-$i; then
    docker rm -f toy-srv-$i
  fi
done
