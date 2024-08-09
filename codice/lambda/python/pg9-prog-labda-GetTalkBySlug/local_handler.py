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

		print(json.dumps(cursor))
	except Exception:
		return {
			"statusCode": 500,
			"headers": {"Content-Type": "text/plain"},
			"body": "Errore nell'esecuzione della query"
		}

	# se come risposta si ha null, buol dire che il json è invalido
	return {
		"statusCode": 200,
		"headers": {"Content-Type": "application/json"},
		"body": json.dumps(cursor)
	}

def main():
	context = ""
	event = {"slug": "pico_iyer_the_art_of_stillness"} 
	response = lambda_handler(event, context)
	#print(response)

if __name__ == "__main__":
	main()