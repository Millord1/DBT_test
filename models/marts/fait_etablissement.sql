
SELECT insee_code::VARCHAR(5), 'lycee'::VARCHAR(100) AS type, COUNT(*) AS nb FROM {{ source('theau_megab_2687', 'lycee') }} WHERE insee_code IS NOT NULL GROUP BY insee_code
UNION ALL
    SELECT insee_code::VARCHAR(5), 'college'::VARCHAR(100) AS type, COUNT(*) AS nb FROM {{ source('theau_megab_2687', 'college') }} WHERE insee_code IS NOT NULL GROUP BY insee_code
UNION ALL
    SELECT insee_code::VARCHAR(5), 'pharmacie'::VARCHAR(100) AS type, COUNT(*) AS nb FROM {{ source('theau_megab_2687', 'pharmacie') }} WHERE insee_code IS NOT NULL GROUP BY insee_code
UNION ALL
    SELECT insee_code::VARCHAR(5), 'ehpad'::VARCHAR(100) AS type, COUNT(*) AS nb FROM {{ source('theau_megab_2687', 'ehpad') }} WHERE insee_code IS NOT NULL GROUP BY insee_code
UNION ALL
    SELECT insee_code::VARCHAR(5), 'bibliotheque'::VARCHAR(100) AS type, COUNT(*) AS nb FROM {{ source('theau_megab_2687', 'bibliotheque') }} WHERE insee_code IS NOT NULL GROUP BY insee_code
UNION ALL
    SELECT insee_code::VARCHAR(5), 'club_boxe_thai'::VARCHAR(100) AS type, COUNT(*) AS nb FROM {{ source('theau_megab_2687', 'clubs_boxe_thai') }} WHERE insee_code IS NOT NULL GROUP BY insee_code
