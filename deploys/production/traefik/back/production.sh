#!/bin/bash
cd ../../../../yml/production/traefik/back
echo "BEGIN DEPLOYMENT"
docker compose -f production.yml build
docker compose -f production.yml down --remove-orphans
docker compose -f production.yml up -d
echo "FINISH DEPLOYMENT"