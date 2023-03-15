.PHONY: create_connectors
create_connectors:
	$(info --- creating cdc source connectors )
	sh ./scripts/create_mysql_cdc_source.sh
	$(info --- creating elastic search sink connectors for customers and schema-changes topics)
	sh ./scripts/create_es_sink_connector.sh

.PHONY: insert_dummy_data
insert_dummy_data:
	$(info --- inserting mysql customer data)
	docker exec  -i kafka-connect-demo_mysql_1 mysql -uroot -proot < ./scripts/generate_mysql_data.sql

.PHONY: verify_es_data
verify_es_data:
	$(info --- Peaking at customers data)
	curl -s -X "GET" "http://localhost:9200/dbserver1.db.customers/_search?pretty=true"
	$(info --- Peaking at schema-changes data)
	curl -s -X "GET" "http://localhost:9200/schema-changes/_search?pretty=true"

