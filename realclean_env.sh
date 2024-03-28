#!/bin/bash

for container in `ansible toy_srv_linux --list-hosts | awk 'NR!=1'`; do
  docker rm -f $container
done
