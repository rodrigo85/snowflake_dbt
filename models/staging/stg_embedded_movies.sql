{{ config(materialized='view') }}

WITH raw_data AS (
    select 
        UUID_STRING() AS row_id,
        $1:"title"::string AS title,       
        $1:"type"::string AS type,
        $1:"plot_embedding"::string AS plot_embedding
    from {{ source('main', 'flat_embedded_movie_raw') }}
)
SELECT s.id, s.title, r.type, r.plot_embedding 
FROM raw_data r,
     {{ ref('stg_movies') }} s
WHERE r.title = s.title
and r.title is not null
AND r.plot_embedding is not null
AND NOT EXISTS (SELECT 1 
                FROM raw_data d 
                WHERE r.title = d.title 
                AND r.row_id != d.row_id)