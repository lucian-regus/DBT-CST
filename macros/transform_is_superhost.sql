{% macro transform_is_superhost(value) %}
    
    CASE
        WHEN IS_SUPERHOST = 'f' THEN 'False'
        WHEN IS_SUPERHOST = 't' THEN 'True'
    END

{% endmacro %}