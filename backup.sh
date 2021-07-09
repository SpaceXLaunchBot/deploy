#!/usr/bin/env bash

# https://stackoverflow.com/a/29913462/6396652
# Interactive psql: docker exec -it spacexlaunchbot-postgres psql -U slb --dbname=spacexlaunchbot

docker exec -t spacexlaunchbot-postgres pg_dump -U slb --dbname=spacexlaunchbot > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
