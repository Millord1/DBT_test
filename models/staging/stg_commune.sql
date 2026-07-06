{{ config(
    materialized='ephemeral'
) }}

WITH source_data AS (
    SELECT * FROM {{ source('public', 'commune') }}
),

cleaned AS (
    SELECT
        {{ clean_insee_code('insee_code') }} AS insee_code,
        {{ remove_accents_and_upper('name') }} AS name,
        population,
        {{ cast_varchar_truncated('code_departement') }} as code_departement
    FROM source_data
)

SELECT * FROM cleaned