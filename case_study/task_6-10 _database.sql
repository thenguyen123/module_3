use furuma_management;
-- 6.  Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt 
-- từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select 
  d.ma_dich_vu, 
  d.ten_dich_vu, 
  d.dien_tich, 
  d.chi_phi_thue, 
  l.ten_loai_dich_vu 
from 
  dich_vu d 
  join loai_dich_vu l 
where 
  ma_dich_vu not in (
    select 
      ma_dich_vu 
    from 
      hop_dong h 
    where 
      quarter(h.ngay_lam_hop_dong)= 1 
      and year(h.ngay_lam_hop_dong)= 2021
  ) 
group by 
  d.ma_dich_vu;
-- .  Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất
-- cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select 
  d.ma_dich_vu, 
  d.ten_dich_vu, 
  d.dien_tich, 
  d.so_nguoi_toi_da, 
  d.chi_phi_thue, 
  l.ten_loai_dich_vu 
from 
  dich_vu d 
  join loai_dich_vu l 
where 
  ma_dich_vu in (
    select 
      ma_dich_vu 
    from 
      hop_dong h 
    where 
      year(h.ngay_lam_hop_dong)= 2020
  ) 
  and ma_dich_vu not in (
    select 
      ma_dich_vu 
    from 
      hop_dong h 
    where 
      year(h.ngay_lam_hop_dong)= 2021
  ) 
group by 
  d.ma_dich_vu;
--  8.  Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select 
  distinct k.ho_ten 
from 
  khach_hang k;
select 
  k.ho_ten 
from 
  khach_hang k 
union 
select 
  k.ho_ten 
from 
  khach_hang k;
select 
  distinct k.ho_ten 
from 
  khach_hang k 
group by 
  k.ho_ten;
-- 9 .  Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng
select 
  month(hop_dong.ngay_lam_hop_dong) as 'month', 
  count(hop_dong.ngay_lam_hop_dong) as 'sum' 
from 
  hop_dong 
where 
  year(hop_dong.ngay_lam_hop_dong)= 2021 
group by 
  month 
order by 
  month;
-- 10.  Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, 
-- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select 
  h.ma_hop_dong, 
  h.ngay_lam_hop_dong, 
  h.ngay_ket_thuc, 
  h.tien_dat_coc, 
  count(hd.so_luong) as so_luong_dich_vu_di_kem 
from 
  hop_dong_chi_tiet hd 
  right join hop_dong h on hd.ma_hop_dong = h.ma_hop_dong 
group by 
  ma_hop_dong;

