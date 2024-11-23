{% macro create_all_stages() %}

{% do log("Creating stage for movies...", info=True) %}
{{ create_stage_for_table('MFLIX_RAW', 'MOVIE_RAW_S3', 's3://mongo-db-project/raw/movie/') }}

{% do log("Creating stage for embedded movies...", info=True) %}
{{ create_stage_for_table('MFLIX_RAW', 'EMBEDDED_MOVIE_RAW_S3', 's3://mongo-db-project/raw/embedded_movie/') }}

{% do log("Creating stage for comments...", info=True) %}
{{ create_stage_for_table('MFLIX_RAW', 'COMMENT_RAW_S3', 's3://mongo-db-project/raw/comment/') }}

{% do log("Creating stage for users...", info=True) %}
{{ create_stage_for_table('MFLIX_RAW', 'USER_RAW_S3', 's3://mongo-db-project/raw/user/') }}

{% do log("Creating stage for theaters...", info=True) %}
{{ create_stage_for_table('MFLIX_RAW', 'THEATER_RAW_S3', 's3://mongo-db-project/raw/theater/') }}

{% endmacro %}
