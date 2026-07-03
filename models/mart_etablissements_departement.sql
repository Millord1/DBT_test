SELECT d.departement, f.type, sum(f.nb) AS n
FROM {{ ref('fait_etablissement') }} f
JOIN {{ ref('dim_commune') }} d ON d.insee_code = f.insee_code
GROUP BY d.departement, f.type