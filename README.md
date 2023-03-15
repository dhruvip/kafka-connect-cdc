# kafka-connect-demo
Steps:
1) Import Postman collection from here `./postman-collection`
2) Within kafka-connect-demo repo, `docker-compose up -d`
3) Check if the kafka connect workers are up and running by hitting the `get connectors` request in the postman collection. Success response will be 200 and `[]` -empty array
4) Post that run `make create_connectors`
5) Repeat Step 3 - this time you should see 3 entries ; 1 mysql-cdc and 2 es-sink connectors. 
Now the connectors are created
6) Check if any of the connectors have errors in them - with `Connector Status` request in the postman collection;
check for all 3 connectors. If no errors - we are good to go
7) Run `make insert_dummy_data`
8) Run `make verify_es_data` - you should be able to see the dummy mysql data in Elastic search
   
Viola the CDC pipeline is ready !

Links:
- The mysql cdc is done with debezium connector; You can read more [here](https://debezium.io/documentation/reference/2.1/architecture.html)