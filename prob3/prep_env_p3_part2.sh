#!/bin/bash

docker run -d --label project=sad_ansible --name toy-srv-4 zarcen/toy-srv:p3
docker run -d --label project=sad_ansible --name toy-srv-5 zarcen/toy-srv:p3 
