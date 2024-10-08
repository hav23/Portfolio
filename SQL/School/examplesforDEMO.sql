use demoproductdb;

alter table product
modify column category_id int null;

select 
	dec_price as p_price, 
	vc_product_name as p_name, 
    vc_description as p_desc, 
    dt_launch_date as p_launch, 
    category_id as cid 
from product;

insert into product(dec_price, vc_product_name, dt_launch_date) 
	values('56.2','hammer2','2025-11-30');
insert into product(dec_price, vc_product_name, dt_launch_date, vc_description, category_id) 
	values('229.95','saw2','2025-05-22', NULL, '2');
delete from category;

insert into category(i_id,vc_name,vc_description) 
	values('1','Bttr','Batteries');

update category
	set vc_description='Electronics of all kinds.'
    where i_id=4;

insert into product(dec_price, vc_product_name, dt_launch_date, vc_description, category_id) 
	values('516.84','Motorsaw','2025-05-22', NULL, '2');
insert into product(dec_price, vc_product_name, dt_launch_date, vc_description, category_id) 
	values('124.74','Music Player','2025-07-1', NULL, '4');
insert into product(dec_price, vc_product_name, dt_launch_date, vc_description, category_id) 
	values('1999.95','Carjack','2025-05-22', 'Bilstoed', '3');
insert into product(dec_price, vc_product_name, dt_launch_date, vc_description, category_id) 
	values('51.95','AA Batteries','2026-02-22', NULL, '1');
insert into product(dec_price, vc_product_name, dt_launch_date, vc_description, category_id) 
	values('9999.95','A whole tractor','2012-04-13', NULL, '5');
    
select * from product;
select * from category;

select 
	vc_product_name as 'Name', 
    dec_price as 'Price', 
    dt_launch_date as 'Launch' 
from product 
	where dec_price < 99000
    and dec_price > 150;

select * from product
	where vc_product_name like '%o%';
	