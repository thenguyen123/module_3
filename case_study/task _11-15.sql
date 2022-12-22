use furuma_management;
-- 11.  Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select 
  dvck.* 
from 
  dich_vu_di_kem dvck 
  join hop_dong_chi_tiet hdct on dvck.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
  join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong 
  join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang 
  join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach 
where 
  (
    dia_chi like '%Vinh' 
    or dia_chi like '%Quảng Ngãi'
  ) 
  and lk.ten_loai_khach = 'Diamond';
  
-- 12.Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng),
-- so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm
-- 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select 
  hd.ma_hop_dong, 
  nv.ho_ten, 
  kh.ho_ten, 
  kh.so_dien_thoai, 
  dv.ten_dich_vu, 
  sum(
    ifnull(hdct.so_luong, 0)
  ) as so_luong_dich_vu_di_kem 
from 
  hop_dong hd 
  join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
  join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu 
  join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien 
  join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang 
where 
  hd.ma_hop_dong not in (
    select 
      h.ma_hop_dong 
    from 
      hop_dong h 
    where 
      month(h.ngay_lam_hop_dong)<= 6 
      and year(h.ngay_lam_hop_dong)= 2021
  ) 
  and hd.ma_hop_dong in (
    select 
      h.ma_hop_dong 
    from 
      hop_dong h 
    where 
      month(h.ngay_lam_hop_dong)>= 10 
      and year(h.ngay_lam_hop_dong)= 2020
  ) 
group by 
  hd.ma_hop_dong;
  
-- 13.  Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select 
  dvdk.ten_dich_vu_di_kem, 
  dvdk.ma_dich_vu_di_kem, 
  sum(hdct.so_luong) as so_luong_dat 
from 
  dich_vu_di_kem dvdk 
  join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
group by 
  dvdk.ma_dich_vu_di_kem 
having 
  so_luong_dat =(
    select 
      max(tong) 
    from 
      (
        select 
          sum(hdct.so_luong) as tong 
        from 
          dich_vu_di_kem dvdk 
          join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
        group by 
          dvdk.ma_dich_vu_di_kem
      ) 
  );
  
-- 14.  Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu,
-- ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select 
  hd.ma_hop_dong, 
  ldv.ten_loai_dich_vu, 
  dvdk.ten_dich_vu_di_kem, 
  count(dvdk.ma_dich_vu_di_kem) as so_lan_su_dung 
from 
  hop_dong hd 
  join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu 
  join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu 
  join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
  join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
group by 
  dvdk.ma_dich_vu_di_kem 
having 
  so_lan_su_dung = 1 
order by 
  ma_hop_dong;
-- 15.  Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten,
-- ten_trinh_do, ten_bo_phan, so_dien_thoai,
-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select 
  nv.ma_nhan_vien, 
  nv.ho_ten, 
  td.ten_trinh_do, 
  bp.ten_bo_phan, 
  nv.so_dien_thoai, 
  nv.dia_chi, 
  count(hd.ma_hop_dong) as tong 
from 
  nhan_vien nv 
  join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do 
  join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan 
  join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien 
group by 
  nv.ma_nhan_vien 
having 
  tong <= 3;
