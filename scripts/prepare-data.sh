#!/bin/bash

# configuration variables
TIME_WAIT="90s"
DATA_USER="SA"
DATA_WORD="Password1!"
DATA_BASE="heroes"
DATA_SCHEMA="dbo"
DATA_TABLE="HeroValue"
DATA_PREFIX="/opt/mssql-nuevo"
DATA_FILE="heroes.csv"
DATA_SAVE="$DATA_PREFIX/${DATA_FILE}"

# wait for the SQL Server to come up
sleep ${TIME_WAIT}

run-prepare() {
  #run the setup script to create the DB and the schema in the DB
  /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P ${DATA_WORD} -i prepare.sql
}

# import the save data from a csv file
run-load() {
    /opt/mssql-tools/bin/bcp \
	${DATA_BASE}.${DATA_SCHEMA}.${DATA_TABLE} \
	in "$DATA_PREFIX/${DATA_SAVE}" \
	-U ${DATA_USER} \
        -P ${DATA_WORD} \
	-d ${DATA_BASE} \
	-S localhost \
        -c -t','
}

main() {
    run-prepare
    run-load
}

main $*
