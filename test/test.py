from subprocess import Popen, PIPE
import unittest
import os

class testSQL(unittest.TestCase):
    def test_tsql(self):
        os.chdir("T-SQL_(Microsoft_SQL)")
        p = Popen("run-all.bat", stdout=PIPE, stderr=PIPE, shell=True)
        stdout, stderr = p.communicate()
        self.assertEqual(stderr, b'')
        os.chdir("..")

    def test_oracle(self):
        os.chdir('PLSQL_(Oracle)')
        print("done")
        self.assertEqual(True, True)
        os.chdir('..')