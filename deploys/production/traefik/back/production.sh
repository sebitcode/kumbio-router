#!/bin/bash
cd ../../../../yml/production/traefik/back
echo "BEGIN DEPLOYMENT"
docker compose -f production.yml build
docker compose -f production.yml down --remove-orphans
echo "REMOVE EXTRA CONTAINERS"
docker rm -v -f $(docker ps -qa)
docker compose -f production.yml up -d
echo "FINISH DEPLOYMENT"