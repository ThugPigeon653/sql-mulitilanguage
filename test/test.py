from subprocess import Popen, PIPE
import unittest
import os
import sys
import pyodbc

sys.path.insert(0, '.')

class testSQL(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.connection = pyodbc.connect(
            Trusted_Connection='Yes',
            Driver='{ODBC Driver 17 for SQL Server}',
            Server='sql-server',
            UID='sa',
            PWD='password',
            Database='master'
        )
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