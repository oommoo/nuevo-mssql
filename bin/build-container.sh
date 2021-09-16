#!/bin/bash

find . -name \*~ | xargs rm

docker build -t nuevo-mssql:latest .
