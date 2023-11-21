import boto3
import os

def handler(event, context):
    s3 = boto3.client('s3')
    rds_data = boto3.client('rds-data')
    sql_file_name = event['SqlFileName']  

    try:
        response = s3.get_object(Bucket=event["S3Bucket"], Key=sql_file_name)
        sql_content = response['Body'].read().decode('utf-8')
        
        execute_statement_params = {
            'database': os.environ['DB_NAME'],
            'resourceArn': os.environ['DB_ARN'],
            'sql': sql_content
        }

        rds_data.execute_statement(**execute_statement_params)
        return {'Status': 'SUCCESS', 'Data': 'SQL statements executed successfully'}
    except Exception as e:
        print(e)
        return {'Status': 'FAILED', 'Data': 'Error executing SQL statements'}
