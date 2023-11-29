from subprocess import Popen, PIPE
import unittest
import os
import sys
import mysql.connector

sys.path.insert(0, '.')

class testSQL(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        sql_server = 'localhost'#os.getenv("SQL_SERVER")
        sql_database = 'mysql-testQL'#os.getenv("SQL_DATABASE")
        sql_uid = 'root'#os.getenv("SQL_UID")
        sql_pwd = 'my-secret-pw'#os.getenv("SQL_PWD")

        print("SQL_SERVER:", sql_server)
        print("SQL_DATABASE:", sql_database)
        print("SQL_UID:", sql_uid)
        print("SQL_PWD:", sql_pwd)
        cls.connection = mysql.connector.connect(
            host=sql_server,
            port=3306,
            user=sql_uid,
            password=sql_pwd
        )
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

    def test_tsql(self):
        os.chdir("MySQL_(MySQL)")
        self.assertTrue(self.execute_sql_file('Schema.sql', self.cursor, self.connection))
        self.assertTrue(self.execute_sql_file('CreateOrganism.sql', self.cursor, self.connection))
        self.assertTrue(self.execute_sql_file('CreatePlant.sql', self.cursor, self.connection))
        self.assertTrue(self.execute_sql_file('CreateAnimal.sql', self.cursor, self.connection))
        os.chdir("..")