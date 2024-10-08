use shoppingdb;
select * from customer;
select * from ordre;
select * from ordrelines;
select * from product;

create view KundeOrdrer as
select c.first_name as fornavn, c.last_name as efternavn, o.ordredato as 'ordre dato', p.pname as produkt, sum(p.price*ol.quantity) as prissum, ol.ordreid
	from customer as c
inner join ordre as o
	on c.id=o.customerid
inner join ordrelines as ol
	on ol.ordreid=o.id
inner join product as p
	on p.id=ol.productid
where o.ordredato is null
group by ol.id 
order by o.customerid;

select c.id as 'CID', c.first_name, c.last_name, sum(ol.quantity * p.price) as `købssum`
	from customer as c
left join ordre as o
	on c.id=o.customerid
inner join ordrelines as ol
	on ol.ordreid=o.id
inner join product as p
	on p.id=ol.productid
where c.first_name in ('Kennith', 'Magdalen')
group by c.id
having `købssum` > 200 
order by `købssum` desc;

create view Produkter as
select pname, price, launchdate
from product
order by id;

create view KunderUdenOrdrer as
select c.first_name, c.last_name from customer as c
left join ordre as o
	on c.id=o.customerid
where o.ordredato is null;

create view KundeKoeb as
select c.first_name as fornavn, c.last_name as efternavn, sum(p.price*ol.quantity) as prissum, sum(ol.quantity) as 'Mængde Indkøbt'
	from customer as c
inner join ordre as o
	on c.id=o.customerid
inner join ordrelines as ol
	on ol.ordreid=o.id
inner join product as p
	on p.id=ol.productid
group by c.id 
order by o.customerid;

select * from produkter;
select * from kundeKoeb;
select * from kunderudenordrer;