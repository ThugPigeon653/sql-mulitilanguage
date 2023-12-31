from subprocess import Popen, PIPE
import unittest
import os
import cx_Oracle

# BUG-001
# Currently facing issues with connection not being established to oracle db. Tests have been commented out 
# for now, because oracle db container takes a very long time to initialize. Needs to be debugged on an
# Ubuntu machine. 
# Ubuntu is used over centos, because of its high availability in gh actions.
#
# GH Actions may not be the best workflow solution for Oracle testing.

class TestOracleSQL(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        oracle_server = os.getenv("ORACLE_SERVER")
        oracle_service_name = os.getenv("ORACLE_SERVICE_NAME")
        oracle_user = os.getenv("ORACLE_USER")
        oracle_password = os.getenv("ORACLE_PASSWORD")
        print(f"Oracle Server: {oracle_server}")
        print(f"Oracle Service Name: {oracle_service_name}")
        print(f"Oracle User: {oracle_user}")
        cls.dsn = cx_Oracle.makedsn(oracle_server, 1521, oracle_service_name)
        print(f"DSN: {cls.dsn}")
        #cls.connection = cx_Oracle.connect(user=oracle_user, password=oracle_password, dsn=cls.dsn)
        #cls.cursor = cls.connection.cursor()

    @classmethod
    def tearDownClass(cls):
        #cls.cursor.close()
        #cls.connection.close()
        pass

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

    def test_oracle(self):
        os.chdir("PLSQL_(Oracle)")
        #oracle_connection = self.connection
        #oracle_cursor = self.cursor
        #self.assertTrue(self.execute_sql_file('Schema.sql', oracle_cursor, oracle_connection))
        #self.assertTrue(self.execute_sql_file('Create.sql', oracle_cursor, oracle_connection))
        #self.assertTrue(self.execute_sql_file('CreateSequence.sql', oracle_cursor, oracle_connection))
        #self.assertTrue(self.execute_sql_file('CreateTrigger.sql', oracle_cursor, oracle_connection))
        #self.assertTrue(self.execute_sql_file('CreateProcedure.sql', oracle_cursor, oracle_connection))
        #self.assertTrue(self.execute_sql_file('CreateFunction.sql', oracle_cursor, oracle_connection))
        #self.assertTrue(self.execute_sql_file('Insert.sql', oracle_cursor, oracle_connection))
        #self.assertTrue(self.execute_sql_file('Query.sql', oracle_cursor, oracle_connection))
        #self.assertTrue(self.execute_sql_file('Drop.sql', oracle_cursor, oracle_connection))
        #oracle_cursor.close()
        #oracle_connection.close()
        #os.chdir("..")