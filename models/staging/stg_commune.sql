WITH source_data AS (
    SELECT * FROM {{ source('public', 'commune') }}
),

cleaned AS (
    SELECT
        {{ clean_insee_code('insee_code') }} AS insee_code,
        {{ remove_accents_and_upper('name') }} AS name,
        population,
        cast(left(code_departement, 3) as varchar(3)) as code_departement
    FROM source_data
)

SELECT * FROM cleaned