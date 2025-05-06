#!/bin/bash

INDEX_NAME="products"

echo "\nПроверка статуса кластера..."
curl -X GET "127.0.0.1:9200/_cluster/health?pretty"

echo "\nПроверка статуса индекса $INDEX_NAME..."
curl -X GET "127.0.0.1:9200/$INDEX_NAME?pretty"
