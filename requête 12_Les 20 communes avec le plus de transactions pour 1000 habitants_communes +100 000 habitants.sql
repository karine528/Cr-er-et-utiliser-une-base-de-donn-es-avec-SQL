SELECT code_postal, 
	com as "nom_commune", 
	round(avg(surface_carrez),0) as "Surface Carrez moyenne", 
	round(avg(valeur_fonciere),0) as "Valeur fonctière moyenne", 
	round((count(id_transaction))/PTOT*1000,2) as "Nb_achats_pour_mille_habitants"
from transactions as t 
	inner join biens as b on b.id_bien = t.id_bien
    inner join communes as c on c.id_commune = b.id_commune
	inner join populations as p on p.id_pop = c.id_pop
    inner join referentiel_geographique as rg on rg.id_refgeo = c.id_refgeo

WHERE surface_carrez != 0 AND dep_num IS NOT NULL AND p.PTOT > 10000
GROUP BY nom_commune
ORDER BY Nb_achats_pour_mille_habitants DESC
LIMIT 20 ;