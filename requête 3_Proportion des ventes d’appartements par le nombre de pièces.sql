select  b.nb_piece as "nb pieces",
round(count(t.id_transaction)/
(select round(count(id_transaction),2)
from transactions join biens using (id_bien)
 where type_local = "appartement")*100,2) as "proportion ventes"
	
    from transactions as t
		inner join biens as b on b.id_bien = t.id_bien
	where b.type_local = "appartement"
    group by nb_piece 
    order by nb_piece asc ;