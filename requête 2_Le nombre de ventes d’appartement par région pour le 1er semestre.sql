SELECT 
COUNT(t.id_transaction) as "nb_ventes" , rg.reg_nom AS "regions"
    FROM transactions AS t
        INNER JOIN biens AS b ON b.id_bien = t.id_bien
        INNER JOIN communes AS c ON b.id_commune = c.id_commune
        INNER JOIN referentiel_geographique AS rg ON c.id_refgeo = rg.id_refgeo
    WHERE
        date BETWEEN "2020-01-01" AND "2020-06-30"
        AND b.type_local = "appartement"
    GROUP BY rg.reg_nom
    ORDER BY nb_ventes DESC ;