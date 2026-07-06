WITH source_data AS (
    SELECT * FROM {{ source('public', 'region') }}
), 

cleaned AS (
    SELECT 
        {{ remove_accents_and_upper('name') }} AS name,
        {{ cast_varchar_truncated('code_region') }} as code_region
        FROM source_data
)

SELECT * FROM cleaned