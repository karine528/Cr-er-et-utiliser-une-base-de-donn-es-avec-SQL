select t.id_bien, b.surface_carrez, rg.reg_nom, max(t.valeur_fonciere)  
from transactions as t 
	inner join biens as b on b.id_bien = t.id_bien
    inner join communes as c on c.id_commune = b.id_commune
    inner join referentiel_geographique as rg on rg.id_refgeo = c.id_refgeo
where b.type_local = "appartement"
group by t.id_bien
order by max(t.valeur_fonciere) desc limit 10 ;