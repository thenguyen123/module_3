create database if not exists material_management;
use material_management;
create table nha_cung_cap (
  ma_nha_cung_cap varchar(41) primary key, 
  ten_nha_cung_cap varchar(40), 
  dia_chi varchar (40)
);
create table so_dien_thoai (
  ma_nha_cung_cap varchar(40) primary key, 
  so_dien_thoai varchar(10), 
  foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table don_dat_hang(
  so_don_hang int auto_increment primary key, 
  ngay_dat_hang date, 
  ma_nha_cung_cap varchar(42), 
  foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap) on delete 
  set  null
);

create table phieu_nhap (
  so_phieu_nhap int primary key, ngay_nhap datetime
);

create table vat_tu(
  ma_vat_tu varchar(21) primary key, 
  ten_vat_tu varchar(43) primary key
);

create table chi_tiet_phieu_nhap(
  don_gia_nhap varchar(40), 
  so_luong_nhap varchar(40), 
  ma_vat_tu varchar(32), 
  so_phieu_nhap int, 
  primary key(ma_vat_tu, so_phieu_nhap), 
  foreign key (ma_vat_tu) references vat_tu(ma_vat_tu), 
  foreign key (so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);

create table chi_tiet_don_dat_hang (
  so_don_hang int, 
  ma_vat_tu varchar(43), 
  primary key (so_don_hang, ma_vat_tu), 
  foreign key (so_don_hang) references don_dat_hang(so_don_hang), 
  foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table phieu_xuat (
  so_phieu_xuat int primary key, ngay_san_xuat datetime
);

create table chi_tiet_phieu_xuat (
  don_gia_xuat varchar(43), 
  so_luong_xuat int, 
  so_phieu_xuat int, 
  ma_vat_tu varchar(43), 
  primary key(so_phieu_xuat, ma_vat_tu), 
  foreign key (so_phieu_xuat) references phieu_xuat(so_phieu_xuat), 
  foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);
