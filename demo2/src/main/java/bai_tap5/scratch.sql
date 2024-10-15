create database don_hang;
use don_hang;

create table phieu_xuat(
    id_phieu_xuat int primary key auto_increment,
    so_px varchar(50),
    ngay_xuat date
);
create table vat_tu(
    id_vat_tu int primary key auto_increment,
    ten_vat_tu varchar(100)
);
create table phieu_nhap(
    id_phieu_nhap int primary key auto_increment,
    ngay_nhap date
);
create table don_xuat(
    id_phieu_xuat int,
    id_vat_tu int,
    dg_xuat int,
    sl_xuat int,
    primary key (id_vat_tu,id_phieu_xuat),
    foreign key (id_phieu_xuat) references phieu_xuat(id_phieu_xuat),
    foreign key (id_vat_tu) references  vat_tu(id_vat_tu)
);
create table don_nhap(
    id_vat_tu int,
    id_phieu_nhap int,
    so_pn int,
    ngay_nhap date,
    primary key (id_vat_tu,id_phieu_nhap),
    foreign key (id_vat_tu) references vat_tu(id_vat_tu),
    foreign key (id_phieu_nhap) references phieu_nhap(id_phieu_nhap)
);
create table don_dh(
    id_don_hang int primary key  auto_increment,
    ngay_dh date,
    id_nha_cc int,
    foreign key (id_nha_cc) references nha_cc(id_nha_cc)
);
create table chi_tiet_dh(
    id_don_hang int,
    id_vat_tu int,
    primary key (id_vat_tu,id_don_hang),
    foreign key (id_vat_tu) references vat_tu(id_vat_tu),
    foreign key (id_don_hang) references don_dh(id_don_hang)
);
create table nha_cc(
    id_nha_cc int primary key auto_increment,
    ten_nha_cc varchar(50),
    dia_chi varchar(100),
    so_dien_thoai int
);

