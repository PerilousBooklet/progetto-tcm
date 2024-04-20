# Descrizione files
###### tedx_dataset.csv
| idx (PK)                      | main_speaker | title | details | posted | url (?PK) | num_views | duration |
| ----------------------------- | ------------ | ----- | ------- | ------ | --------- | --------- | -------- |
| Indica in modo univoco il ted |              |       |         |        |           |           |          |
###### watch_next_dataset.csv
| idx (FK) | url (?FK) | watch_next_idx (FK) |
| -------- | --------- | ------------------- |
###### tags_dataset.csv
| idx (FK) | tag (PK) |
| -------- | -------- |
# Descrizione
Nome: ???
Funzioni:
- Account (AWS Cognito)
	- Like (?0-5?)
	- Commenti
	- Tracking dei TED guardati
		- Anche a che punto si è arrivati
	- Iscrizioni ad argomenti
		- Invio di notifiche (AWS SNS)
	- Suggerimenti in base alle preferenze (AWS Personalize)
- Alla fine del video dai il prossimo video da guardare
- Download (?AWS CloudFront?)

## Uso di servizi specifici
AWS Cognito: gestione degli account, con supporto di collegamento tra servizi (Google, Apple, Facebook, etc)
AWS SNS: Servizio di gestione di notifiche push
API Gateway: Servizio di gestione API
AWS Lambda: Le funzioni per il funzionamento della piattaforma
AWS Personalize: Servizio di suggerimenti in base alle preferenze dell'utente
Amazon S3: Storage dei dati
Amazon Aurora/DynamoDB: Database per tenere i contenuti (Da scegliere il tipo di DB)
React/Flutter: Framework App mobile
Github/Lab: Storage del codice e versionamento
Draw.io: Creazione diagramma grafico