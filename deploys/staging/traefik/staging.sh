#!/bin/bash
cd ../../../yml/staging/traefik
echo "BEGIN DEPLOYMENT"
docker compose -f staging.yml build
docker compose -f staging.yml down --remove-orphans
echo "REMOVE EXTRA CONTAINERS"
docker rm -v -f $(docker ps -qa)
docker compose -f staging.yml up -d
echo "FINISH DEPLOYMENT"
echo "START REMOVING ALL USELESS IMAGES"
docker rmi $(docker images -f dangling=true -q)
echo "END REMOVING ALL USELESS IMAGES"
echo "START REMOVING ALL USELESS VOLUMES"
docker volume rm `docker volume ls -q -f dangling=true`
echo "END REMOVING ALL USELESS VOLUMES"
docker system prune --force
echo "CLEAN DOCKER"