{% macro create_view_for_stage(schema, view_name, stage_name) %}
    {% set query %}
        CREATE OR REPLACE VIEW {{ schema }}.{{ view_name }} AS
        SELECT * FROM @{{ schema }}.{{ stage_name }};
    {% endset %}
    
    {% do run_query(query) %}
{% endmacro %}
