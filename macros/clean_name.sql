{% macro remove_accents_and_upper(column_name) %}
    upper(
        regexp_replace(
            translate({{ column_name }}, 'éèêëàâäîïôöûüçÉÈÊËÀÂÄÎÏÔÖÛÜÇ', 'eeeeaaaiioouucEEEEAAAIIOOUUC'),
            '[-'']', ' ', 'g'
        )
    )
{% endmacro %}