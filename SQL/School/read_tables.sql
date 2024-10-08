use a_store_db;
select * from customers;
select * from order_item_notes;
select * from order_items;
select * from order_statuses;
select * from orders;
select * from products;
select * from shippers;

use employeesdb;
select e.first_name, e.last_name, e.gender, s.salary, t.title from employees as e
inner join salaries as s on e.emp_no = s.emp_no
inner join titles as t on e.emp_no = t.emp_no
where s.salary > 100000;

select e.first_name, e.last_name, count(*) as negociations from salaries as s
inner join employees as e on e.emp_no = s.emp_no
group by e.first_name, e.last_name;

use a_store_db;
select count(*) as customers from customers as c;
select count(*) as orders from orders as o;
