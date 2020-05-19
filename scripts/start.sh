#!/bin/bash

echo Starting database...
docker start flowthru-db > /dev/null 2>&1
sleep 5

trap "echo Stopping database...; docker stop flowthru-db > /dev/null 2>&1" INT

FLOWTHRU_DB_HOST=localhost FLOWTHRU_DB_PORT=5432 FLOWTHRU_DB_USER=user FLOWTHRU_DB_PASSWORD=password FLOWTHRU_DB_NAME=test go run cmd/user/main.go INT