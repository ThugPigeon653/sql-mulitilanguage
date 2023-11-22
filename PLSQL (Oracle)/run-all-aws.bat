@echo off
echo "(1)Setting up object storage..."
aws s3 mb s3://testdatabasedistinctname
aws s3 cp Create.sql s3://testdatabasedistinctname/Create.sql
aws s3 cp Insert.sql s3://testdatabasedistinctname/Insert.sql
aws s3 cp Drop.sql s3://testdatabasedistinctname/Drop.sql
aws s3 cp Query.sql s3://testdatabasedistinctname/Query.sql
aws s3 cp Setup.sql s3://testdatabasedistinctname/Setup.sql
echo "(1)Complete"
echo "(2)Provisioning infrastructure..."
aws cloudformation create-stack --stack-name testdatabasedistinctname --template-body file://template.json --parameters ParameterKey=s3bucket,ParameterValue=testdatabasedistinctname ParameterKey=DBParameter,ParameterValue=testdb ParameterKey=UserParameter,ParameterValue=someusername ParameterKey=PasswordParameter,ParameterValue=password ParameterKey=PortParameter,ParameterValue=1521 ParameterKey=instanceParameter,ParameterValue=db.t3.small ParameterKey=engineParameter,ParameterValue=oracle-ee --capabilities CAPABILITY_IAM
echo "(2) Complete"
echo "Press any key to terminate all infrastructure"
pause
aws s3 rm s3://testdatabasedistinctname/Create.sql
aws s3 rm s3://testdatabasedistinctname/Insert.sql
aws s3 rm s3://testdatabasedistinctname/Drop.sql
aws s3 rm s3://testdatabasedistinctname/Query.sql
aws s3 rm s3://testdatabasedistinctname/Setup.sql
aws s3 rb s3://testdatabasedistinctname
aws cloudformation delete-stack --stack-name testdatabasedistinctname
echo "Press any key to exit terminal"
pause