WITH source_data AS (
    SELECT insee_code, 'lycee' AS type, COUNT(*) AS nb 
        FROM {{ source('public', 'lycee') }} 
        WHERE insee_code IS NOT NULL 
        GROUP BY insee_code
    UNION ALL SELECT insee_code, 'college' AS type, COUNT(*) AS nb 
        FROM {{ source('public', 'college') }} 
        WHERE insee_code IS NOT NULL 
        GROUP BY insee_code
    UNION ALL SELECT insee_code, 'pharmacie' AS type, COUNT(*) AS nb 
        FROM {{ source('public', 'pharmacie') }} 
        WHERE insee_code IS NOT NULL 
        GROUP BY insee_code
    UNION ALL SELECT insee_code, 'ehpad' AS type, COUNT(*) AS nb 
        FROM {{ source('public', 'ehpad') }} 
        WHERE insee_code IS NOT NULL 
        GROUP BY insee_code
    UNION ALL SELECT insee_code, 'bibliotheque' AS type, COUNT(*) AS nb 
        FROM {{ source('public', 'bibliotheque') }} 
        WHERE insee_code IS NOT NULL 
        GROUP BY insee_code
    UNION ALL SELECT insee_code, 'club_boxe_thai' AS type, COUNT(*) AS nb 
        FROM {{ source('public', 'clubs_boxe_thai') }} 
        WHERE insee_code IS NOT NULL 
        GROUP BY insee_code
),

cleaned AS (
    SELECT 
        {{ clean_insee_code('insee_code') }} AS insee_code,
        cast(type AS VARCHAR(150)),
        cast(nb AS INTEGER)
    FROM source_data
)

SELECT * FROM cleaned