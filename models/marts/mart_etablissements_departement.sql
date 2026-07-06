SELECT d.departement::VARCHAR(100), f.type::VARCHAR(150), sum(f.nb)::INTEGER AS n
FROM {{ ref('fait_etablissement') }} f
JOIN {{ ref('dim_commune') }} d ON d.insee_code = f.insee_code
GROUP BY d.departement, f.type