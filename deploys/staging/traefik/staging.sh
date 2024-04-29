#!/bin/bash
cd ../../../yml/staging/traefik
echo "BEGIN DEPLOYMENT"
docker compose -f staging.yml build
docker compose -f staging.yml down --remove-orphans
docker compose -f staging.yml up -d
echo "FINISH DEPLOYMENT"