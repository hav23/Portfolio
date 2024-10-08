-- Create DB
create database demoproductdb;
-- Access DB
use demoproductdb;
-- Create product table
create table product (
	i_id INT not null auto_increment, 
	dec_price decimal(9,2) not null, 
	vc_product_name varchar(100), 
	vc_description varchar(500) null, 
	dt_launch_date datetime not null default current_timestamp, 
	primary key(i_id));
-- Alter table
alter table product 
add column category_id int not null;
-- Create category table
create table category (
	i_id int not null auto_increment,
    vc_name varchar(100) not null,
    vc_description varchar(500) default null,
    primary key(i_id)
);
-- link tables
ALTER TABLE product
ADD CONSTRAINT FK_ProductCategory
FOREIGN KEY (category_id) REFERENCES category(i_id);

