select
	count(*) as 'ventes appartements du 1er semestre 2020'
from transactions as t
	 join biens as b on t.id_bien = b.id_bien
where
	date between "2020-01-01" and "2020-06-30"
    and b.type_local = "appartement";