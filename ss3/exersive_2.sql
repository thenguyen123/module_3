create database if not exists custormers_management;
use custormers_management;

create table custormer(
custormer_id int primary key,
custormer_name varchar (44),
custormer_age int check (custormer_age>0 )
);

create	table custormer_order(
order_id int,
custormer_id int,
order_date datetime,
order_total_price bigint,
primary key (order_id, custormer_id),
foreign key (custormer_id) references custormer (custormer_id)
);

create table product (
product_id int primary key,
product_name varchar(43),
product_price int 
);

create table order_detail(
order_id int,
product_id int,
quatity_order int,
primary key (order_id,product_id),
foreign key (order_id) references custormer_order(order_id),
foreign key (product_id) references product(product_id)
);
 select *from order_detail;
 select*from custormer_order;
 select *from product;
 select*from custormer;
insert into custormer ( custormer_id,custormer_name,custormer_age)
value (1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);
insert into custormer_order (order_id,custormer_id,order_date)
value (1,1,'2006/3/21'),
      (2,2,'2006/3/23'),
      (3,1,'2006/3/16');
      insert into product (product_id,product_name,product_price) 
      value (1,'May Giat',3),
      (2,'Tu lanh',5),
      (3,'Dieu Hoa',7),
      (4,'Quat',1),
      (5,'Bep Dien',2);
      insert into order_detail(order_id,product_id,quatity_order) 
      value (1,1,3),
      (1,3,7),
      (1,4,2),
      (2,1,1),
      (3,1,8),
      (2,5,4),
      (2,3,3);
     -- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
      select order_id,order_date,product_price from custormer_order join product on custormer_order.order_id=product.product_id;
      
      -- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
        select custormer.custormer_name,product.product_name
		from custormer
        join custormer_order on  custormer_order.custormer_id=custormer.custormer_id
        join order_detail on custormer_order.order_id=order_detail.order_id
        join product on product.product_id=order_detail.product_id ;
        select custormer.custormer_name,product.product_name from custormer  join custormer_order  join product join order_detail on custormer_order.custormer_id=custormer.custormer_id
        and custormer_order.order_id=order_detail.order_id and product.product_id=order_detail.product_id ;
        
	-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
       select custormer_name from custormer where custormer_id not in (select custormer_id from custormer_order);
       
     -- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt
     -- hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
     
         select custormer_order.order_id,custormer_order.order_date,(product.product_price*order_detail.quatity_order) as 'order_total'
		from custormer_order
		join order_detail on order_detail.order_id=custormer_order.order_id
		join product on  order_detail.order_id= product.product_id;