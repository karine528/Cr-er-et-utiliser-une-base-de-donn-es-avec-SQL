select c.com as "communes" , count(id_transaction) as "nb_ventes"
from (transactions as t 
	inner join biens as b on b.id_bien = t.id_bien
    inner join communes as c on c.id_commune = b.id_commune) 
where date between "2020-01-01" and "2020-03-31"
 
group by communes
having nb_ventes >=50 
order by nb_ventes desc;