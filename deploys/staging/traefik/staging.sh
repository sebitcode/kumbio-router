#!/bin/bash
cd ../../../yml/staging/traefik
echo "BEGIN DEPLOYMENT"
docker compose -f staging.yml build
docker compose -f staging.yml down --remove-orphans
echo "REMOVE EXTRA CONTAINERS"
docker rm -v -f $(docker ps -qa)
docker compose -f staging.yml up -d
echo "FINISH DEPLOYMENT"