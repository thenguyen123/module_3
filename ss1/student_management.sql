create database student_management;

use student_management;

create table class (
id int,
name_class varchar(100));

insert into class(id,name_class) value 
(1,'C09'),
(2,'Q09');

select *  from class;

create table teacher (
id int,
name_teacher varchar(50),
age_teacher int,
country varchar (100));

insert into teacher(id,name_teacher,age_teacher,country) value 
(1,'Tien', 23,'VietNamese');

select * from teacher ;