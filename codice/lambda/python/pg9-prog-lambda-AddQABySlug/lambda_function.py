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
# 	"question": "<"0"/"1">unique_question",
# }
# dove 0 = false, 1 = true

import json
import string
from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi

uri = "mongodb+srv://aws:aws@cluster0.khbnw71.mongodb.net/?appName=Cluster0"

def lambda_handler(event, context):

	event_body = json.loads(event["body"])

	if event_body["question"][0] != "0" and event_body["question"][0] != "1":
		print("Errore inserimento dati")
		return {
			"statusCode": 500,
			"headers": {"Content-Type": "text/plain"},
			"body": "Errore, il campo answer non è 0 o 1"
		}
	
	print("event_body", type(event_body), event_body)

	client = MongoClient(uri, server_api=ServerApi('1'))

	db = client["unibg_tedx_2024"]
	collection = db["tedx_data"]

	data_projection = {"_id":False,"slug":False,"speakers":False,"title":False,"url":False,"duration":False,"publishedAt":False,"tags":False,"img_url":False,"related_videos":False,"views":False}

	tedx_query = {"slug": event_body["slug"]}

	tedx_by_slug:dict = collection.find_one(tedx_query, data_projection) # type: ignore

	if "QA" in tedx_by_slug:
		tedx_by_slug["QA"].append(event_body["question"])
	else:
		tedx_by_slug["QA"] = [event_body["question"]]
	
	query = {"slug": event_body["slug"]}
	setter = { "$set" : {"QA": tedx_by_slug["QA"]}}

	update_result = collection.update_one(query, setter, upsert=False)

	# se come risposta si ha null, buol dire che il json è invalido
	print("Successo")
	return {
		'statusCode': 200,
		'headers': {'Content-Type': 'text/plain'},
		'body': json.dumps({"result": "ok"}),
	}
