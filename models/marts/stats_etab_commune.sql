SELECT 
    f.type AS service_type, 
    COUNT(DISTINCT f.insee_code) AS nombre_communes,
    MAX(f.nb) AS max_par_commune,
    ROUND(PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY f.nb)::numeric, 2) AS mediane_par_commune,
    ROUND(PERCENTILE_CONT(0.10) WITHIN GROUP (ORDER BY f.nb)::numeric, 2) AS percentile_10_par_commune,
    ROUND(PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY f.nb)::numeric, 2) AS percentile_25_par_commune,
    ROUND(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY f.nb)::numeric, 2) AS percentile_75_par_commune,
    ROUND(PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY f.nb)::numeric, 2) AS percentile_90_par_commune
FROM {{ ref('fait_etablissement') }} AS f
WHERE f.nb > 0
GROUP BY f.type
ORDER BY mediane_par_commune DESC