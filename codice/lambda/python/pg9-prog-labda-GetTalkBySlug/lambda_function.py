# https://e6ka8k7lm5.execute-api.us-east-1.amazonaws.com/pg9-prog-labda-GetTalkBySlug

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

	event_body = json.loads(event["body"])

	try:
		client = MongoClient(uri, server_api=ServerApi('1'))
	except Exception:
		print("Errore connessione")
		return {
			"statusCode": 500,
			"headers": {"Content-Type": "text/plain"},
			"body": "Errore nella connessione al server MongoDB"
		}

	try:
		db = client["unibg_tedx_2024"]
		collection = db["tedx_data"]
	except Exception:
		print("Errore collezione")
		return {
			"statusCode": 500,
			"headers": {"Content-Type": "text/plain"},
			"body": "Errore nell'estrazione della collezione"
		}

	try:
		cursor = collection.find_one({"slug": event_body["slug"]})
	except Exception:
		print("Errore")
		return {
			"statusCode": 500,
			"headers": {"Content-Type": "text/plain"},
			"body": "Errore nell'esecuzione della query"
		}

	return {
		'statusCode': 200,
		'headers': {'Content-Type': 'text/plain'},
		'body': json.dumps(cursor),
	}
