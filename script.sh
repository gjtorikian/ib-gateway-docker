#!/bin/bash

CONTAINER_ID=$(docker ps | grep -Po "(^\S+)(?=\s+ib)")

if [ -n "$var" ]; then
  echo "Restarting $CONTAINER_ID"
  docker rm $CONTAINER_ID --force
fi

docker-compose up

pm2 restart orderer

echo "Restarted orderer...you may need to reboot it again after IB docker is connected"
