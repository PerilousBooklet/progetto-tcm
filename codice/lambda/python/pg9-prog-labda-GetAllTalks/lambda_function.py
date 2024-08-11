# https://2qqdm4il69.execute-api.us-east-1.amazonaws.com/default/pg9-prog-labda-GetAllTalks

# Esempio di output
# return {
# 		"statusCode": 200,
# 		"headers": {"Content-Type": "application/json"},
# 		"body": json.dumps(event)
# 	}

import json
import time
import pymongo
import pymongo.cursor
from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi

uri = "mongodb+srv://aws:aws@cluster0.khbnw71.mongodb.net/?appName=Cluster0"

def lambda_handler(event, context):

	client = MongoClient(uri, server_api=ServerApi('1'))

	db = client["unibg_tedx_2024"]
	collection = db["tedx_data"]

	data_projection = {"_id":False,"slug":False,"speakers":False,"url":False,"duration":False,"publishedAt":False,"tags":False,"related_videos":False,"views":False,"QA":False}
	cursor:pymongo.cursor.Cursor = collection.find({}, data_projection)

	final_json:dict = {"request_time": int(time.time())}
	counter:int = 0

	for tedx in cursor:
		# compressione dati
		# Questo risparmia 33 Bytes per entrata, ci sono 6362 (2024-08-11_17-49-00), quindi si risparmiano 209946 Bytes ovvero 210 KiloBytes (1000)
		tedx["img_url"] = tedx["img_url"].removeprefix("https://pe.tedcdn.com/images/ted/")

		final_json[counter] = tedx
		counter = counter + 1

	return {
		'statusCode': 200,
		'headers': {'Content-Type': 'text/plain'},
		'body': json.dumps(final_json),
	}
