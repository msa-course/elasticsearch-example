#!/bin/bash

# Скрипт для удаления и пересоздания индекса с маппингом

INDEX_NAME="products"
MAPPING_FILE="../examples/1_create_index.json"

echo "Удаление индекса $INDEX_NAME..."
curl -X DELETE "127.0.0.1:9200/$INDEX_NAME"

echo "Создание индекса $INDEX_NAME..."
curl -X PUT "127.0.0.1:9200/$INDEX_NAME" -H 'Content-Type: application/json' -d @$MAPPING_FILE

echo "Готово!"