#!/bin/bash
cd ../../../../yml/production/traefik/back
echo "BEGIN DEPLOYMENT"
docker compose -f production.yml build
docker compose -f production.yml down --remove-orphans
echo "REMOVE EXTRA CONTAINERS"
docker rm -v -f $(docker ps -qa)
docker compose -f production.yml up -d
echo "FINISH DEPLOYMENT"
echo "START REMOVING ALL USELESS IMAGES"
docker rmi $(docker images -f dangling=true -q)
echo "END REMOVING ALL USELESS IMAGES"
echo "START REMOVING ALL USELESS VOLUMES"
docker volume rm `docker volume ls -q -f dangling=true`
echo "END REMOVING ALL USELESS VOLUMES"
docker system prune --force
echo "CLEAN DOCKER"