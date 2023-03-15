curl --location --request POST 'http://localhost:8083/connectors' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "mysql-cdc-connector",
    "config": {
    
   "connector.class": "io.debezium.connector.mysql.MySqlConnector",
    "tasks.max": "1",  
    "database.hostname": "mysql",  
    "database.port": "3306",
    "database.user": "connectuser",
    "database.password": "connnect",
    "database.dbname" : "db",
    "database.server.id": "1",  
    "database.server.name": "dbserver1",
    "topic.prefix": "dbserver1",  
    "database.include.list": "db",  
    "schema.history.internal.kafka.bootstrap.servers": "broker:29092",  
    "schema.history.internal.kafka.topic": "schema-changes",
    "database.history.kafka.bootstrap.servers": "broker:29092",  
    "database.history.kafka.topic": "database-changes",
    "table.include.list": "db.movies,db.Persons,db.customers",        
    "decimal.handling.mode":"double", 
    "transforms": "unwrap", 
          "database.allowPublicKeyRetrieval":"true",
    "transforms.unwrap.type": "io.debezium.transforms.ExtractNewRecordState",
    
    "errors.tolerance": "all",
    "errors.deadletterqueue.topic.name":"dlq_file_sink_02",
    "errors.deadletterqueue.topic.replication.factor": 1,

    
    "value.converter":"org.apache.kafka.connect.json.JsonConverter",
    "value.converter.schemas.enable": false,
    "key.converter":"org.apache.kafka.connect.json.JsonConverter",
    "key.converter.schemas.enable": false 
    }
}'