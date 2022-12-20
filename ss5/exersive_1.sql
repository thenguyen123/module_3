create database products_management;
use products_management;

create table product (
  id int auto_increment primary key, 
  product_code varchar (30), 
  product_name varchar (42), 
  product_price int, 
  product_amount int, 
  product_description varchar (79), 
  product_status varchar(43)
);

select 
  * 
from 
  product;
insert into product (
  product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) 
values 
  (
    '01', 'cherry', 1222, 2, 'good', 'over'
  ), 
  (
    '02', 'orange', 122002, 7, 'yummy', 
    'still'
  ), 
  (
    '03', 'lemon', 1224442, 9, 'good', 'still'
  ), 
  (
    '04', 'waterlemon', 33323, 5, 'nice', 
    'over'
  ), 
  (
    '05', 'chickent', 444442, 2, 'fresh', 
    'still'
  ), 
  (
    '06', 'beat', 55552, 2, 'good', 'over'
  );
explain 
select 
  * 
from 
  product 
where 
  id = 3;
  
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index i_products on product(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index i_product_name_price on product(product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain 
select 
  * 
from 
  product 
where 
  id = 3;
  
-- So sánh câu truy vấn trước và sau khi tạo index: tốc độ tìm kiếm nhanh hơn sau khi sử dụng index
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view v_product as 
select 
  p.product_code, 
  p.product_name, 
  p.product_price, 
  p.product_status 
from 
  product p;
  
-- Tiến hành sửa đổi view

update 
  v_product 
set 
  product_status = 'still' 
where 
  product_code = '01';
-- Tiến hành xoá view

drop 
  view v_product;
  
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter $$ create procedure get_all_product () begin 
select 
  * 
from 
  product;
end $$ delimiter;

-- Tạo store procedure thêm một sản phẩm mới
delimiter $$ create procedure add_product () begin insert into product (
  product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) 
values 
  (
    '07', 'hotdog', 10000, 7, 'good', 'still'
  );
end $$ delimiter;

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter // create procedure update_product_1(
  in new_id int, 
  in new_product_code varchar(42), 
  in new_product_name varchar(42), 
  in new_product_price int, 
  in new_product_amount int, 
  in new_product_description varchar(42), 
  new_product_status varchar(42)
) begin 
update 
  product 
set 
  product_code = new_product_code, 
  product_name = new_product_name, 
  product_price = new_product_price, 
  product_amount = new_product_amount, 
  product_description = new_product_description, 
  product_status = new_product_status 
where 
  id = new_id;
end // delimiter;
call update_product_1(
  3, '33', 'duck', 3212344, 3, 'yummy', 
  'still'
);

-- Tạo store procedure xoá sản phẩm theo id
delimiter $$ create procedure delete_product(in new_id int) begin 
delete from 
  product 
where 
  id = new_id;
end $$ delimiter;
call delete_product(1);
