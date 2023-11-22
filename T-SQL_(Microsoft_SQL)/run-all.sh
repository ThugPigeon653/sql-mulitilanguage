#!/bin/bash
docker exec -it sql_server_container /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P password -d master -i Create.sql
docker exec -it sql_server_container /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P password -d master -i Setup.sql
docker exec -it sql_server_container /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P password -d master -i Insert.sql
docker exec -it sql_server_container /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P password -d master -i Query.sql
docker exec -it sql_server_container /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P password -d master -i Drop.sql