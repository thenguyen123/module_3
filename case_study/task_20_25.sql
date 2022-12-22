use furuma_management;

-- 21.  Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Da Nẵng” và
-- đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “2021”.
create view v_nhan_vien as (
  select 
    nv.ho_ten, 
    nv.dia_chi, 
    hd.ngay_lam_hop_dong 
  from 
    hop_dong hd 
    join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien 
  where 
    nv.dia_chi like '%Đà Nẵng' 
    and year(ngay_lam_hop_dong)= 2021
);

-- 22.  Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
set 
  sql_safe_updates = 0;
update 
  v_nhan_vien nv 
set 
  nv.dia_chi = 'Liên Chiểu';
set 
  sql_safe_updates = 1;
  
-- 23.  Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter // create procedure sp_xoa_khach_hang(in id int) begin 
delete from 
  khach_hang 
where 
  ma_khach_hang = id;
end // delimiter;
select 
  * 
from 
  hop_dong;
call sp_xoa_khach_hang (1);

-- 24.  Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter // create procedure sp_them_moi_hop_dong (
  new_ma_hop_dong int, new_ngay_lam_hop_dong date, 
  new_ngay_ket_thuc date, new_tien_dat_coc double, 
  new_ma_nhan_vien int, new_ma_khach_hang int, 
  new_ma_dich_vu int
) begin if new_ma_hop_dong in (
  select 
    ma_hop_dong 
  from 
    hop_dong
) then signal sqlstate "45000" 
set 
  message_text = 'ma hop dong bị trùng lăp';
else insert into hop_dong (
  ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, 
  tien_dat_coc, ma_nhan_vien, ma_khach_hang, 
  ma_dich_vu
) value (
  new_ma_hop_dong, new_ngay_lam_hop_dong, 
  new_ngay_ket_thuc, new_tien_dat_coc, 
  new_ma_nhan_vien, new_ma_khach_hang, 
  new_ma_dich_vu
);
end if;
end // delimiter;
call sp_them_moi_hop_dong(
  13, '2021/12/12', '2021/12/12', 10000, 
  3, 5, 4
);

-- 25.  Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển
-- thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
--  Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
create table lich_su_hop_dong (
  id int auto_increment primary key, old_ma_hop_dong int, 
  new_so_luong int, update_day date
);
delimiter // 
create trigger tr_xoa_hop_dong 
 after 
delete on hop_dong for each row begin insert into lich_su_hop_dong (
    old_ma_hop_dong, new_so_luong, update_day
  ) value (
    old.ma_hop_dong, 
    (
      select 
        count(ma_hop_dong) 
      from 
        hop_dong hd
    ), 
    now()
  );
end //
 delimiter ;
drop 
  trigger tr_xoa_hop_dong;
drop 
  table lich_su_hop_dong;
select 
  * 
from 
  hop_dong;
delete from 
  hop_dong 
where 
  ma_hop_dong = 13;
select 
  * 
from 
  lich_su_hop_dong;
