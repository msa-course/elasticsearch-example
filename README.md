# Elasticsearch – Примеры

Репозиторий содержит практические примеры по теме **«Elasticsearch как NoSQL-база данных»**. 

Демонстрация построена на примере маркетплейса с товарами.

## 📚 Содержание

- Создание индекса с маппингом
- Индексация документов (товаров)
- Полнотекстовый поиск (`match`)
- Фильтрация и булевы запросы (`bool`, `filter`)
- Агрегации:
  - Средняя цена (`avg`)
  - Разбиение по брендам (`terms`)
  - Агрегации по вложенным полям
- Поиск по вложенным характеристикам (`nested`)
- Управление релевантностью (`function_score`)

## 🛠 Пример кейса

Работаем с данными товаров на маркетплейсе:

```json
{
  "title": "Ноутбук Lenovo IdeaPad 3 15",
  "brand": "Lenovo",
  "category": "notebooks",
  "price": 45990,
  "in_stock": true,
  "rating": 4.6,
  "properties": [
    { "name": "ОЗУ", "value": "8 ГБ" },
    { "name": "SSD", "value": "256 ГБ" }
  ]
}
```

## 🚀 Запуск Elasticsearch 8.7.0 + Kibana

```bash
docker compose up -d
```

## 🧑‍💻 Запросы

| №  | Название файла                                              | Описание                                    |
|----|-------------------------------------------------------------|---------------------------------------------|
| 1  | [`1_create_index.http`](./examples/1_create_index.http)     | Создание индекса с маппингом                |
| 2  | [`2_index_document.http`](./examples/2_index_document.http) | Добавление товара                           |
| 2a | [`2a_index_with_id.http`](./examples/2a_index_with_id.http) | Добавление товара с указанием ID            |
| 2b | [`2b_index_bulk.http`](./examples/2b_index_bulk.http)       | Массовое добавление товаров (bulk API)      |
| 3  | [`3_search_match.http`](./examples/3_search_match.http)     | Поиск по названию товара                    |
| 4  | [`4_search_filter.http`](./examples/4_search_filter.http)   | Фильтрация по цене и наличию                |
| 5  | [`5_agg_avg_price.http`](./examples/5_agg_avg_price.http)   | Агрегация: средняя цена                     |
| 6  | [`6_agg_by_brand.http`](./examples/6_agg_by_brand.http)     | Агрегация: товары по брендам                |
| 7  | [`7_nested_search.http`](./examples/7_nested_search.http)   | Поиск по вложенным характеристикам (nested) |
| 8  | [`8_function_score.http`](./examples/8_function_score.http) | Повышение рейтинговых товаров               |

### Использование Kibana (DevTools)

В интерфейсе Kibana в разделе [DevTools](http://127.0.0.1:5601/app/dev_tools#/console) можно просто скопировать и вставить содержимое файлов, не указывая HTTP-заголовки. 

Пример для индексации документа:

```json
POST /products/_doc
{
  "title": "Ноутбук Lenovo IdeaPad 3 15",
  "brand": "Lenovo",
  "category": "notebooks",
  "price": 45990,
  "in_stock": true,
  "rating": 4.6,
  "specs": [
    { "name": "ОЗУ", "value": "8 ГБ" },
    { "name": "SSD", "value": "256 ГБ" }
  ]
}
```

## ⚙️ Скрипты автоматизации

В папке `scripts` находятся скрипты, упрощающие работу с Elasticsearch.

### Список скриптов


| Название скрипта                                | Описание                                                   |
|-------------------------------------------------|------------------------------------------------------------|
| [`reset_index.sh`](./scripts/reset_index.sh)    | Удаляет и заново создаёт индекс `products` с маппингом     |
| [`status_check.sh`](./scripts/status_check.sh)  | Показывает статус кластера и состояние индекса             |



## 🔗 Полезные ссылки

* [Elasticsearch Documentation](https://www.elastic.co/docs/get-started)
* [Kibana Console](https://www.elastic.co/kibana)
* [Elasticsearch Query DSL](https://www.elastic.co/docs/explore-analyze/query-filter/languages/querydsl)
* [Laravel Elastic Query](https://github.com/ensi-platform/laravel-elastic-query)
* [Laravel Elastic Query Specification](https://github.com/ensi-platform/laravel-elastic-query-specification)