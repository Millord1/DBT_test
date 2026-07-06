{% macro clean_insee_code(column_name, length=5) %}
    cast(
        lpad(left({{ column_name }}, {{ length }}), {{ length }}, '0'
        ) as varchar({{ length }})
    )
{% endmacro %}