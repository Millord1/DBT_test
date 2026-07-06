WITH source_data AS (
    SELECT * FROM {{ source('public', 'region') }}
), 

cleaned AS (
    SELECT 
        {{ remove_accents_and_upper('name') }} AS name,
        cast(left(code_region, 3) as varchar(3)) as code_region
        FROM source_data
)

SELECT * FROM cleaned