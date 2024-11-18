{{ config(materialized='table') }}

SELECT 
    emb_data.value AS flattened_value
FROM 
    {{ source('main', 'embedded_movie_raw') }},                
    LATERAL FLATTEN(input => $1) AS emb_data
