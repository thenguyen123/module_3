use furuma_management;

-- 16.  Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set 
  sql_safe_updates = 0;
delete from 
  nhan_vien 
where 
  ma_nhan_vien not in (
    select 
      hd.ma_nhan_vien 
    from 
      hop_dong hd 
    where 
      year(ngay_lam_hop_dong) in (2019, 2020, 2021) 
    group by 
      hd.ma_nhan_vien
  );
set 
  sql_safe_updates = 1;
  
-- 17.  Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với 
-- Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
update 
  khach_hang kh 
set 
  kh.ma_loai_khach = 1 
where 
  kh.ma_loai_khach in (
    select 
      ma_khach.ma_khach_hang 
    from 
      (
        select 
          tong.ten_loai_khach, 
          tong.ma_khach_hang, 
          (
            sum(tong.chi_phi_thue)+ tong.tong_tien
          ) as tong_tien 
        from 
          (
            select 
              khach_hang.ma_khach_hang, 
              loai_khach.ten_loai_khach, 
              hop_dong.ma_hop_dong, 
              dich_vu.ten_dich_vu, 
              khach_hang.ho_ten, 
              loai_khach.ma_loai_khach, 
              dich_vu.chi_phi_thue, 
              sum(
                ifnull(hop_dong_chi_tiet.so_luong, 0)* ifnull(dich_vu_di_kem.gia, 0)
              ) as tong_tien 
            from 
              khach_hang 
              join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach 
              join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang 
              join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu 
              join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong 
              join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
            group by 
              hop_dong.ma_hop_dong
          ) tong 
        group by 
          tong.ma_khach_hang 
        having 
          tong_tien >= 100000 
          and ten_loai_khach like 'Platinium'
      ) ma_khach
  );
  
-- 18.  Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
-- danh sách khách hàng sẽ bị xóa
select 
  * 
from 
  khach_hang 
where 
  ma_khach_hang in (
    select 
      hd.ma_khach_hang 
    from 
      hop_dong hd 
    where 
      year(ngay_lam_hop_dong) < 2021
  );
-- xóa những khách hàng có hợp đồng trước năm 2021
delete from 
  khach_hang 
where 
  ma_khach_hang in (
    select 
      hd.ma_khach_hang 
    from 
      hop_dong hd 
    where 
      year(ngay_lam_hop_dong) < 2021
  );
  
-- 19.  Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update 
  dich_vu_di_kem dvdk 
set 
  dvdk.gia = 2 * dvdk.gia 
where 
  ma_dich_vu_di_kem in (
    select 
      adc.ma_dich_vu_di_kem 
    from 
      (
        select 
          dvdk.ma_dich_vu_di_kem, 
          hdct.so_luong, 
          dvdk.ten_dich_vu_di_kem, 
          dvdk.gia 
        from 
          hop_dong hd 
          join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong 
          join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
        where 
          year(hd.ngay_lam_hop_dong)= 2020 
        group by 
          dvdk.ma_dich_vu_di_kem 
        having 
          so_luong >= 10
      ) adc
  );
select 
  * 
from 
  dich_vu_di_kem;
  
-- 20.  Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), 
-- ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select 
  ma_nhan_vien as id, 
  ho_ten, 
  email, 
  so_dien_thoai, 
  ngay_sinh, 
  dia_chi 
from 
  nhan_vien 
union all 
select 
  ma_khach_hang, 
  ho_ten, 
  email, 
  so_dien_thoai, 
  ngay_sinh, 
  dia_chi 
from 
  khach_hang;
