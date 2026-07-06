{% macro remove_accents_and_upper(column_name, length=150) %}
    cast(upper(
        regexp_replace(
            translate({{ column_name }}, 'éèêëàâäîïôöûüçÉÈÊËÀÂÄÎÏÔÖÛÜÇ', 'eeeeaaaiioouucEEEEAAAIIOOUUC'),
            '[-'']', 
            ' ', 
            'g'
        )
    ) as varchar({{ length }}))
{% endmacro %}

{% macro cast_varchar_truncated(column_name, length=3) %}
    cast(left({{ column_name }}, {{ length }}) as varchar({{ length }}))
{% endmacro %}

{% macro clean_insee_code(column_name, length=5) %}
    cast(
        lpad(left({{ column_name }}, {{ length }}), {{ length }}, '0') 
        as varchar({{ length }})
    )
{% endmacro %}