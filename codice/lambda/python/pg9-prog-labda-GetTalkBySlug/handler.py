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
import base64

uri = "mongodb+srv://aws:aws@cluster0.khbnw71.mongodb.net/?appName=Cluster0"

def lambda_handler(event, context):

	print(event)

	try:
		client = MongoClient(uri, server_api=ServerApi('1'))

		db = client["unibg_tedx_2024"]
		collection = db["tedx_data"]

		cursor = collection.find_one({"slug": "irina_kareva_math_can_help_uncover_cancer_s_secrets"})

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
