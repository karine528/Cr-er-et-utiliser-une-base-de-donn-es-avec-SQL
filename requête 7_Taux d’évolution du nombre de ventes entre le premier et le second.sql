select t1 as "trimestre 1",
	t2 as "trimestre 2",
round(((t2 - t1) / t1)*100,2) as "taux d'evolution des ventes"
from (
select count(*) as t1
from transactions
where date between "2020-01-01" and "2020-03-31") t1
join (
select count(*) as t2
from transactions
where date between "2020-04-01" and "2020-06-30") t2