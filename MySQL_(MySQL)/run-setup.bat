docker exec -it sql_server_container "C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\sqlcmd.exe" -S localhost -U sa -P password -d master -i Setup.sql