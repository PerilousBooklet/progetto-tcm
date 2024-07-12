# https://1sw04niaw3.execute-api.us-east-1.amazonaws.com/default/Add_QA_By_Slug

# Esempio di output
# return {
# 		"statusCode": 200,
# 		"headers": {"Content-Type": "application/json"},
# 		"body": json.dumps(event)
# 	}

import json
import pymongo
from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi
import pprint


uri = "mongodb+srv://aws:aws@cluster0.khbnw71.mongodb.net/?appName=Cluster0"

def lambda_handler(event, context):
	# Event contiene il corpo della richiesta, si trova in ["body"]
	
	body = event["body"]
	decoded_body = body

	client = MongoClient(uri, server_api=ServerApi('1'))

	db = client["unibg_tedx_2024"]
	collection = db["tedx_data"]
	posts = db.posts


	return {
		"statusCode": 200,
		"headers": {"Content-Type": "application/json"},
		"body": event["body"]
	}