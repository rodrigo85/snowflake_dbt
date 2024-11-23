{% macro create_stage_for_table(schema, table_name, s3_path) %}
    {% set stage_name = schema ~ '.' ~ table_name %}
    {% set query %}
        CREATE OR REPLACE STAGE {{ stage_name }}
        STORAGE_INTEGRATION = my_s3_integration
        URL = '{{ s3_path }}'
        FILE_FORMAT = (TYPE = 'JSON');
    {% endset %}
    
    {% do run_query(query) %}
{% endmacro %}
