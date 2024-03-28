#!/bin/bash

# VARIABLES
NUM_SERVERS=30  # Number of containers to spin up
CHAOS_CHANCE=20 # Chance percentage of introducing unexpected change
CHAOS=0         # Total chaos

# Pull image
docker pull zarcen/toy-srv:p3

# Demolish containers
echo -e "\nRemoving existing containers..."
for container in `ansible toy_srv_linux --list-hosts | awk 'NR!=1'`; do
  docker rm -f $container
done

# Standup containers
echo -e "\nCreating new containers..."
for ((i=NUM_SERVERS;i>=1;i--)); do
  docker run -d --label project=sad_ansible --name toy-srv-$i zarcen/toy-srv:p3
done

# Inject chaos
echo -e "\nReleasing chaos monkeys..."
for ((i=1;i<=NUM_SERVERS;i++)); do
  RAND_INT=$((1 + RANDOM % 100))
  if [[ $RAND_INT -le $CHAOS_CHANCE ]]; then
    RAND_INT=$((1 + RANDOM % 3))
    case $RAND_INT in

      1)
        echo "Monkeys are wrecking SRV_CONFIG on toy-serv-$i..."
        docker exec toy-srv-$i rm SRV_CONFIG
        ;;

      2)
        echo "Monkeys are hammering jquery on toy-serv-$i..."
        docker exec toy-srv-$i apk del jq
        ;;

      3)
        echo "Monkeys are pounding toy-serv-$i..."
        docker exec toy-srv-$i rm SRV_CONFIG
        docker exec toy-srv-$i apk del jq
        ;;

    esac

    CHAOS=$((CHAOS+1))
  fi
done

# Make sure at least 1 server gets some chaos
if [[ $CHAOS -eq 0 ]]; then
  RAND_INT=$((1 + RANDOM % $NUM_SERVERS))
  echo " Monkeys attacked toy-serv-$RAND_INT..."
  docker exec toy-srv-$RAND_INT rm SRV_CONFIG
fi
