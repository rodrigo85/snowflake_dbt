{{ config(materialized='view') }}

SELECT 
    $1:"_id"['$oid']::string AS id,
    TO_TIMESTAMP(GET_PATH($1:"date"['$date'], OBJECT_KEYS($1:"date"['$date'])[0])::bigint / 1000) AS comment_timestamp,
    $1:"email"::string AS email,
    $1:"movie_id"['$oid']::string AS movie_id,
    $1:"name"::string AS name,
    $1:"text"::string AS text
FROM 
    {{ source('main', 'comment_raw') }}
