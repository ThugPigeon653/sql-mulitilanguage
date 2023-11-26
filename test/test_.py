from subprocess import Popen, PIPE
import unittest
import os
import sys
import psycopg2

sys.path.insert(0, '.')

class testSQL(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        sql_server = 'localhost'
        sql_uid = 'postgres'
        sql_pwd = 'mysecretpassword'
        cls.connection = psycopg2.connect(f"host={sql_server} port=5432 dbname={sql_uid} user={sql_uid} password={sql_pwd}")
        cls.cursor = cls.connection.cursor()

    @classmethod
    def tearDownClass(cls):
        cls.cursor.close()
        cls.connection.close()

    def execute_sql_file(self, sql_file_path, cursor, connection):
        try:
            with open(sql_file_path, 'r') as sql_file:
                sql_script = sql_file.read()
                cursor.execute(sql_script)
                if not sql_script.strip().upper().startswith("SELECT"):
                    connection.commit()
            return True
        except Exception as e:
            print(f"Error executing SQL file {sql_file_path}: {str(e)}")
            return False

    def test_postgres(self):
        os.chdir("PLpgSQL_(postgres)")
        self.assertTrue(self.execute_sql_file('Drop.sql', self.cursor, self.connection))
        self.assertTrue(self.execute_sql_file('Create.sql', self.cursor, self.connection))
        self.assertTrue(self.execute_sql_file('CreateSequence.sql', self.cursor, self.connection))
        self.assertTrue(self.execute_sql_file('CreateTrigger.sql', self.cursor, self.connection))
        self.assertTrue(self.execute_sql_file('CreateProcedure.sql', self.cursor, self.connection))
        self.assertTrue(self.execute_sql_file('CreateFunction.sql', self.cursor, self.connection))
        self.assertTrue(self.execute_sql_file('Insert.sql', self.cursor, self.connection))
        self.assertTrue(self.execute_sql_file('Query.sql', self.cursor, self.connection))
        self.assertTrue(self.execute_sql_file('Drop.sql', self.cursor, self.connection))

        os.chdir("..")