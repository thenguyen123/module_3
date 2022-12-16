create database student_management;
use student_management;

create table class(
classid int not null auto_increment primary key,
class_name varchar (60) not null,
start_date datetime not null,
status bit
);

create table student (
sudent_id int not null auto_increment primary key,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit,
classid int not null,
foreign key (classid) references class(classid)
);

create table subject (
sub_id int not null auto_increment primary key,
sub_name varchar(30) not null,
credit tinyint not null default 1 check (credit >=1),
status bit default 1
);

create table mark (
mark_id int not null auto_increment primary key,
sub_id int not null,
sudent_id int not null,
mark float default 0 check (mark between 0 and 100),
exam_times tinyint default 1,
unique (sub_id,sudent_id),
foreign key (sub_id) references subject(sub_id),
foreign key (sudent_id )references student(sudent_id)
);

select * from mark;
insert into class values (1,"A1","2008-12-20" ,1);
insert into class values (2,"A2","2008-12-22" ,1);
insert into class values (3,"A3",current_date, 0);
insert into student (student_name,address,phone,status,classid)
value ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (student_name,address,status,classid) value
('Hoa', 'Hai phong', 1, 1);
insert into	student (student_name,address,phone,status,classid) value
('Manh', 'HCM', '0123123123', 0, 2);

select*from class;
select*from subject;
select*from student;
insert into subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       INSERT INTO mark( sub_id,sudent_id,mark,exam_times) VALUES 
       (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
      -- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
       select *from student where student_name like  'h%';
       
      -- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
       select * from class where start_date>='2008/12/1';
       
       -- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
       select *from subject where credit >=3 and credit <=5 ;
       
      -- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
      set sql_safe_updates=0;
      update student 
      set classid=2 where student_name='Hung';
      
     -- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
      select student.student_name,subject.sub_name,mark.mark from student join subject join
	  mark on student.sudent_id=mark.sudent_id and subject.sub_id=mark.sudent_id order by mark.mark desc, student.student_name asc ;