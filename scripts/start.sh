#!/bin/bash
while getopts ":u :e :c" opt; do
    case $opt in
        u)
            echo Starting database...
            docker start flowthru-db > /dev/null 2>&1
            sleep 5

            trap "echo Stopping database...; docker stop flowthru-db > /dev/null 2>&1" INT

            FLOWTHRU_DB_HOST=localhost FLOWTHRU_DB_PORT=5432 FLOWTHRU_DB_USER=user_manager FLOWTHRU_DB_PASSWORD=password FLOWTHRU_DB_NAME=test go run cmd/user/main.go INT
            ;;
        e)
            echo To be implemented
            ;;
        c)
            echo To be implemented
            ;;
        \?)
            echo Invalid option -$OPTARG >&2
            exit 1
            ;;
    esac
done