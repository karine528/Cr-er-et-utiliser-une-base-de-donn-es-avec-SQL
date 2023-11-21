select round(avg(t.valeur_fonciere/surface_carrez),2) as "prix_m²_appartement",
	rg.reg_nom as "régions",
	b.nb_piece as "nombre_de_pieces"
from transactions as t 
	inner join biens as b on b.id_bien = t.id_bien
    inner join communes as c on c.id_commune = b.id_commune
    inner join referentiel_geographique as rg on rg.id_refgeo = c.id_refgeo
where b.type_local = "appartement" and b.nb_piece >4
group by rg.reg_nom 
order by prix_m²_appartement desc;