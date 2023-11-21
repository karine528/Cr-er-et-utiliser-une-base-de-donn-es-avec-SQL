select round(avg(t.valeur_fonciere/surface_carrez),2) as "prix_m²", 
rg.dep_nom as "departement", 
rg.dep_num as "numero_dep"
from transactions as t 
inner join biens as b on b.id_bien = t.id_bien
	INNER JOIN communes AS c ON b.id_commune = c.id_commune
	INNER JOIN referentiel_geographique AS rg ON c.id_refgeo = rg.id_refgeo 
group by rg.dep_nom
order by prix_m² desc 
limit 10 ;