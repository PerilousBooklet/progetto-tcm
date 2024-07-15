# https://1sw04niaw3.execute-api.us-east-1.amazonaws.com/default/Add_QA_By_Slug

# Esempio di output
# return {
# 		"statusCode": 200,
# 		"headers": {"Content-Type": "application/json"},
# 		"body": json.dumps(event)
# 	}

import json
from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi


uri = "mongodb+srv://aws:aws@cluster0.khbnw71.mongodb.net/?appName=Cluster0"

def lambda_handler(event, context):
	try:
		client = MongoClient(uri, server_api=ServerApi('1'))

		db = client["unibg_tedx_2024"]
		collection = db["tedx_data"]

		cursor = collection.find_one(event)

		print("Print del cursore:\n" + cursor)

		print("Print del cursore con json.dumps:\n" + json.dumps(cursor))
	except Exception:
		print("Errore")
		return {
			"statusCode": 500,
			"headers": {"Content-Type": "text/plain"},
			"body": "Errore nell'esecuzione della query"
		}

	# se come risposta si ha null, buol dire che il json è invalido
	print("Successo")
	return {
		'statusCode': 200,
		'headers': {'Content-Type': 'text/plain'},
		'body': json.dumps(cursor)
	}
