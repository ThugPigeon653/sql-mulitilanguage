sqlcmd -S %COMPUTERNAME%\MSSQLSERVER01 -P password -i Create.sql
sqlcmd -S %COMPUTERNAME%\MSSQLSERVER01 -P password -i Setup.sql
sqlcmd -S %COMPUTERNAME%\MSSQLSERVER01 -P password -i Insert.sql
sqlcmd -S %COMPUTERNAME%\MSSQLSERVER01 -P password -i Query.sql
sqlcmd -S %COMPUTERNAME%\MSSQLSERVER01 -P password -i Drop.sql