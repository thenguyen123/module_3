create database if not exists custormers_management;
use custormers_management;

create table custormer(
  custormer_id varchar (33) primary key, 
  custormer_name varchar (44), 
  custormer_age int check (custormer_age > 0)
);

create table custormer_order(
  order_id varchar (43), 
  custormer_id varchar(44), 
  order_date datetime, 
  order_total_price bigint, 
  primary key (order_id, custormer_id), 
  foreign key (custormer_id) references custormer (custormer_id)
);

create table product (
  product_id varchar (43) primary key, 
  product_name varchar(43), 
  product_price int
);

create table order_detail(
  order_id varchar(43), 
  product_id varchar (43), 
  quatity_order int, 
  primary key (order_id, product_id), 
  foreign key (order_id) references custormer_order(order_id), 
  foreign key (product_id) references product(product_id)
);

