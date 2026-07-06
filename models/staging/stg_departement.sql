WITH source_data AS (
    SELECT name, code_departement, code_region FROM {{ source('public', 'departement') }}
),

cleaned AS (
    SELECT 
        {{ remove_accents_and_upper('name') }}::VARCHAR(150) AS name,
        {{ cast_varchar_truncated('code_departement') }} as code_departement,
        {{ cast_varchar_truncated('code_region') }} as code_region
    FROM source_data
)

SELECT * FROM cleaned