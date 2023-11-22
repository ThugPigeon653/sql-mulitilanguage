from subprocess import Popen, PIPE
import unittest
import os
import sys
sys.path.insert(0, '.') 

class testSQL(unittest.TestCase):
    def test_tsql(self):
        print("-----------------------")
        print(os.listdir(os.curdir))
        os.chdir("T-SQL_(Microsoft_SQL)")
        
        print(os.listdir(os.curdir))
        p = Popen('docker exec -it sql_server_container /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P password -d master Create.sql', stdout=PIPE, stderr=PIPE, shell=True)
        stdout, stderr = p.communicate()
        self.assertEqual(stderr, b'')
        p = Popen('docker exec -it sql_server_container /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P password -d master Setup.sql', stdout=PIPE, stderr=PIPE, shell=True)
        stdout, stderr = p.communicate()
        self.assertEqual(stderr, b'')
        p = Popen('docker exec -it sql_server_container /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P password -d master Insert.sql', stdout=PIPE, stderr=PIPE, shell=True)
        stdout, stderr = p.communicate()
        self.assertEqual(stderr, b'')
        p = Popen('docker exec -it sql_server_container /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P password -d master Query.sql', stdout=PIPE, stderr=PIPE, shell=True)
        stdout, stderr = p.communicate()
        self.assertEqual(stderr, b'')
        p = Popen('docker exec -it sql_server_container /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P password -d master Drop.sql', stdout=PIPE, stderr=PIPE, shell=True)
        stdout, stderr = p.communicate()
        self.assertEqual(stderr, b'')

        os.chdir("..")

    def test_oracle(self):
        os.chdir('PLSQL_(Oracle)')
        print("done")
        self.assertEqual(True, True)
        os.chdir('..')