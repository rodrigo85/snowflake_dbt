{% macro create_all_views() %}
    {% do log("Creating view for MOVIE_RAW...", info=True) %}
    {{ create_view_for_stage('DBT_PROJECT.MFLIX_RAW', 'MOVIE_RAW', 'MOVIE_RAW_S3') }}
    
    {% do log("Creating view for EMBEDDED_MOVIE_RAW...", info=True) %}
    {{ create_view_for_stage('DBT_PROJECT.MFLIX_RAW', 'EMBEDDED_MOVIE_RAW', 'EMBEDDED_MOVIE_RAW_S3') }}

    {% do log("Creating view for COMMENT_RAW...", info=True) %}
    {{ create_view_for_stage('DBT_PROJECT.MFLIX_RAW', 'COMMENT_RAW', 'COMMENT_RAW_S3') }}
    
    {% do log("Creating view for USER_RAW...", info=True) %}
    {{ create_view_for_stage('DBT_PROJECT.MFLIX_RAW', 'USER_RAW', 'USER_RAW_S3') }}

    {% do log("Creating view for THEATER_RAW...", info=True) %}
    {{ create_view_for_stage('DBT_PROJECT.MFLIX_RAW', 'THEATER_RAW', 'THEATER_RAW_S3') }}
{% endmacro %}
