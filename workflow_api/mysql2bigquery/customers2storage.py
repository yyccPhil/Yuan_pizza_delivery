from googleapiclient import discovery
from oauth2client.client import GoogleCredentials

credentials = GoogleCredentials.get_application_default()
service = discovery.build('storage', 'v1', credentials=credentials)

filename = 'customers.csv'
bucket = 'artful-turbine-378406'

body = {'name': 'customers.csv'}
req = service.objects().insert(bucket=bucket, body=body, media_body=filename)
resp = req.execute()
