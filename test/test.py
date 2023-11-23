from subprocess import Popen, PIPE
import unittest
import os
import sys
import pyodbc
import socket

sys.path.insert(0, '.')

class testSQL(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        host = 'localhost'
        port = 1433  
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        result = sock.connect_ex((host, port))
        print("*******")
        print(result)
        sock.close()
        cls.connection = pyodbc.connect(
            f'Trusted_Connection=Yes;'
            f'Driver={{ODBC Driver 17 for SQL Server}};'
            f'Server={os.getenv("SQL_SERVER")};'
            f'UID={os.getenv("SQL_UID")};'
            f'PWD={os.getenv("SQL_PWD")};'
            f'Database={os.getenv("SQL_DATABASE")};'
        )
        print("*******")
        cls.cursor = cls.connection.cursor()

    @classmethod
    def tearDownClass(cls):
        cls.cursor.close()
        cls.connection.close()

    def execute_sql_file(self, sql_file_path):
        try:
            with open(sql_file_path, 'r') as sql_file:
                sql_script = sql_file.read()
                self.cursor.execute(sql_script)
                if not sql_script.strip().upper().startswith("SELECT"):
                    self.connection.commit()
            return True
        except Exception as e:
            print(f"Error executing SQL file {sql_file_path}: {str(e)}")
            return False

    def test_tsql(self):
        os.chdir("T-SQL_(Microsoft_SQL)")
        self.execute_sql_file('Drop.sql')
        self.assertTrue(self.execute_sql_file('Schema.sql'))
        self.assertTrue(self.execute_sql_file('Create.sql'))
        self.assertTrue(self.execute_sql_file('CreateSequence.sql'))
        self.assertTrue(self.execute_sql_file('CreateTrigger.sql'))
        self.assertTrue(self.execute_sql_file('CreateProcedure.sql'))
        self.assertTrue(self.execute_sql_file('CreateFunction.sql'))
        self.assertTrue(self.execute_sql_file('Insert.sql'))
        self.assertTrue(self.execute_sql_file('Query.sql'))
        self.assertTrue(self.execute_sql_file('Drop.sql'))

        os.chdir("..")

    def test_oracle(self):
        os.chdir('PLSQL_(Oracle)')
        print("done")
        self.assertEqual(True, True)
        os.chdir('..')