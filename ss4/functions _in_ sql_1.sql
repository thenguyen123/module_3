use student_management;


 -- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
 select *from subject where credit=(select  max(credit ) from subject);
 
--  Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.*,m.mark from student s  join mark m on s.student_id=m.student_id where mark=(select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.*,avg(m.mark) as average from student s join mark m on s.student_id=m.student_id  group by student_id;