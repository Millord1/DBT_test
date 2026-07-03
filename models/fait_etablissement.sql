
SELECT insee_code, 'lycee' AS type, COUNT(*) AS nb FROM {{ source('theau_megab_2687', 'lycee') }} WHERE insee_code IS NOT NULL GROUP BY insee_code
UNION ALL
    SELECT insee_code, 'college' AS type, COUNT(*) AS nb FROM {{ source('theau_megab_2687', 'college') }} WHERE insee_code IS NOT NULL GROUP BY insee_code
UNION ALL
    SELECT insee_code, 'pharmacie' AS type, COUNT(*) AS nb FROM {{ source('theau_megab_2687', 'pharmacie') }} WHERE insee_code IS NOT NULL GROUP BY insee_code
UNION ALL
    SELECT insee_code, 'ehpad' AS type, COUNT(*) AS nb FROM {{ source('theau_megab_2687', 'ehpad') }} WHERE insee_code IS NOT NULL GROUP BY insee_code
UNION ALL
    SELECT insee_code, 'bibliotheque' AS type, COUNT(*) AS nb FROM {{ source('theau_megab_2687', 'bibliotheque') }} WHERE insee_code IS NOT NULL GROUP BY insee_code
UNION ALL
    SELECT insee_code, 'club_boxe_thai' AS type, COUNT(*) AS nb FROM {{ source('theau_megab_2687', 'clubs_boxe_thai') }} WHERE insee_code IS NOT NULL GROUP BY insee_code
