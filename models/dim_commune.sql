SELECT 
    c.insee_code,
    c.name AS commune,
    d.name AS departement,
    r.name AS region,
    c.population
FROM {{ source('theau_megab_2687', 'commune') }} c
JOIN {{ source('theau_megab_2687', 'departement') }} d ON d.code_departement = c.code_departement
JOIN {{ source('theau_megab_2687', 'region') }} r ON r.code_region = d.code_region