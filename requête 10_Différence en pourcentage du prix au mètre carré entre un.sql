with appartement_2 as (
select round(avg(t.valeur_fonciere/surface_carrez),2) as "P2"
from transactions as t 
	inner join biens as b on b.id_bien = t.id_bien
where b.nb_piece = 2 and b.type_local = "appartement"),
appartement_3 as (
select round(avg(t.valeur_fonciere/surface_carrez),2) as "P3"
from transactions as t 
	inner join biens as b on b.id_bien = t.id_bien
where b.nb_piece = 3 and b.type_local = "appartement")
select P2 as "appartement_2_pieces" , 
	P3 as "appartement_3_pieces", 
	round(((P3/P2)-1)*100,2) as "difference_prix _%"
from appartement_2, appartement_3 ;