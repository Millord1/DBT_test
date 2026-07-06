SELECT c.commune::VARCHAR(150), c.population::INTEGER,
    COALESCE(SUM(CASE WHEN f.type = 'pharmacie' THEN f.nb END), 0) AS total_pharmacies,
    ROUND(c.population::numeric / NULLIF(SUM(CASE WHEN f.type = 'pharmacie' THEN f.nb END), 0), 2) AS hab_per_pharmacie
FROM {{ ref('dim_commune') }} AS c
LEFT JOIN {{ ref('fait_etablissement') }} AS f ON c.insee_code = f.insee_code
WHERE c.population > 0
GROUP BY c.insee_code, c.commune, c.population
HAVING COALESCE(SUM(CASE WHEN f.type = 'pharmacie' THEN f.nb END), 0) > 0
ORDER BY hab_per_pharmacie DESC