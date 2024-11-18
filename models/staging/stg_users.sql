{{ config(materialized='view') }}

WITH raw_data AS (
    SELECT 
        $1:"_id"['$oid']::string AS id,        
        $1:"email"::string AS email,        
        $1:"name"::string AS name
    FROM 
        {{ source('main', 'user_raw') }}
)
SELECT *
FROM raw_data