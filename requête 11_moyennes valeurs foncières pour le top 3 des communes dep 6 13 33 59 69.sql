select *
from (
	select rank() over ( partition by dep_num order by moyenne_commune desc) as rang,
	id_commune, 
    com as "commune",
	dep_num as "departement",
    moyenne_commune
   
	from (
		select round(avg(t.valeur_fonciere),2) as moyenne_commune,
        c.id_commune, 
		c.com, 
        rg.dep_num
		from transactions as t 
		inner join biens as b on b.id_bien = t.id_bien
		inner join communes as c on c.id_commune = b.id_commune
		inner join referentiel_geographique as rg on rg.id_refgeo = c.id_refgeo
	where rg.dep_num in ("06", "13", "33", "59", "69")
    group by c.com
    order by c.id_commune ) 
    as sub_2 )
as sub 
where rang <=3 ;