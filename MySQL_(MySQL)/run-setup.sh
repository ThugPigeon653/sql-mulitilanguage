#!/bin/bash
docker exec -it sql_server_container /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P password -d master -i Setup.sql
