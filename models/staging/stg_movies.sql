{{ config(materialized='view') }}

WITH raw_data AS (
   SELECT 
        $1:"_id"['$oid']::string AS id,
        $1:"title"::string AS title,
        $1:"type"::string AS type,
        REGEXP_REPLACE($1:"year"::string,'[^0-9]','')::int AS year,    
        GET_PATH($1:"awards"['nominations'], OBJECT_KEYS($1:"awards"['nominations'])[0])::int AS awards_nominations,    
        GET_PATH($1:"awards"['wins'], OBJECT_KEYS($1:"awards"['wins'])[0])::int AS awards_wins,
        $1:"awards"['text']::string AS awards_text,
        $1:"plot"::string AS plot,
        $1:"fullplot"::string AS fullplot,
        $1:"poster"::string AS poster,    
        TO_TIMESTAMP(GET_PATH($1:"released"['$date'], OBJECT_KEYS($1:"released"['$date'])[0])::bigint / 1000) AS released_timestamp,
        GET_PATH($1:"runtime", OBJECT_KEYS($1:"runtime")[0])::int AS runtime,    
        GET_PATH($1:"tomatoes"['critic']['numReviews'], OBJECT_KEYS($1:"tomatoes"['critic']['numReviews'])[0])::int AS critic_num_reviews,
        GET_PATH($1:"tomatoes"['critic']['rating'], OBJECT_KEYS($1:"tomatoes"['critic']['rating'])[0])::double AS critic_rating,
        GET_PATH($1:"tomatoes"['viewer']['numReviews'], OBJECT_KEYS($1:"tomatoes"['critic']['numReviews'])[0])::int AS viewer_num_reviews,
        GET_PATH($1:"tomatoes"['viewer']['rating'], OBJECT_KEYS($1:"tomatoes"['critic']['rating'])[0])::double AS viewer_rating,
        $1:"tomatoes"['website']::string AS website,
        ARRAY_TO_STRING($1:"cast"::array, ', ') AS cast_str,
        ARRAY_TO_STRING($1:"countries"::array, ', ') AS countries_str,
        ARRAY_TO_STRING($1:"directors"::array, ', ') AS directors_str,
        ARRAY_TO_STRING($1:"writers"::array, ', ') AS writers_str,
        ARRAY_TO_STRING($1:"languages"::array, ', ') AS languages_str    
    FROM {{ source('main', 'movie_raw') }}
)
SELECT *
FROM raw_data r
WHERE title is not null
AND NOT EXISTS (SELECT 1 
                FROM raw_data d 
                WHERE r.title = d.title 
                AND r.id != d.id)