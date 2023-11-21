select round(avg(t.valeur_fonciere/surface_carrez),2) as "prix_moyen_m²_maison_île_de_france"
from transactions as t 
	inner join biens as b on b.id_bien = t.id_bien
    inner join communes as c on c.id_commune = b.id_commune
    inner join referentiel_geographique as rg on rg.id_refgeo = c.id_refgeo
where b.type_local = "maison" and rg.regrgp_nom = "Ile-de-France" ;