# https://zbjyl85kp6.execute-api.us-east-1.amazonaws.com/default/pg9-prog-lambda-AddQABySlug

# Esempio di output
# return {
# 		"statusCode": 200,
# 		"headers": {"Content-Type": "application/json"},
# 		"body": json.dumps(event)
# 	}

# Formato richiesta nel body di esempio
# {
# 	"slug": "slug_data",
# 	"question": "unique_question",
# 	"answer": <"0"/"1">,
# }
# dove 0 = false, 1 = true

import json
from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi

uri = "mongodb+srv://aws:aws@cluster0.khbnw71.mongodb.net/?appName=Cluster0"

def lambda_handler(event, context):

	event_body = json.loads(event["body"])

	if event_body["answer"] != "0" and event_body["answer"] != "1":
		print("Errore inserimento dati")
		return {
			"statusCode": 500,
			"headers": {"Content-Type": "text/plain"},
			"body": "Errore, il campo answer non è 0 o 1"
		}
	
	print("event_body", type(event_body), event_body)

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
		tedx_by_slug:dict = collection.find_one({"slug": event_body["slug"]})

		tedx_by_slug["QA"].append([event_body["question"], [event_body["answer"]]])

		update_result = collection.update_one({"slug": event_body["slug"]}, {"QA": tedx_by_slug["QA"]}, upsert=False)
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
		'body': "Success",
	}
