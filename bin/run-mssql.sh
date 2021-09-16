#!/bin/bash -x

NAME="sql1"
HOST="farmres"
WORD="43fc:2f90"

run-container() {
    docker run \
	   --name "${NAME}" \
	   -h "${HOST}" \
	   -d mcr.microsoft.com/mssql/server:2019-latest  \
           -e "ACCEPT_EULA=Y"     \
	   -e "SA_PASSWORD=${WORD}"         \
           -p 1433:1433 \
	   nuevo-mssql:latest
}

main() {
  run-container
}

main $*

