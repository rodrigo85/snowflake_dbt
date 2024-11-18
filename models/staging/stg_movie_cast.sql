{{ config(materialized='view') }}

SELECT m.$1:"_id"['$oid']::string AS id,
       REPLACE(fl.value::string, '"', '') AS cast_member
FROM {{ source('main', 'movie_raw') }} m,
     LATERAL FLATTEN(input => m.$1:"cast") AS fl