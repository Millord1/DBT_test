-- SELECT 
--     c.insee_code::VARCHAR(5),
--     c.name::VARCHAR(150) AS commune,
--     d.name::VARCHAR(150) AS departement,
--     r.name::VARCHAR(150) AS region,
--     c.population::INTEGER
-- FROM {{ source('theau_megab_2687', 'commune') }} c
-- JOIN {{ source('theau_megab_2687', 'departement') }} d ON d.code_departement = c.code_departement
-- JOIN {{ source('theau_megab_2687', 'region') }} r ON r.code_region = d.code_region

with staging_commune as (
    select * from {{ ref('stg_commune') }}
),

staging_departement as (
    select * from {{ ref('stg_departement') }}
),

staging_region as (
    select * from {{ ref('stg_region') }}
),

finale AS (
    SELECT 
        c.insee_code,
        c.name AS commune,
        d.name AS departement,
        r.name AS region,
        c.population
    FROM staging_commune AS c
    JOIN staging_departement AS d ON d.code_departement = c.code_departement
    JOIN staging_region AS r ON r.code_region = d.code_region
)

SELECT * FROM finale