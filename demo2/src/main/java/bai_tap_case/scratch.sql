create database case_bai_tap;
use case_bai_tap;
create table vi_tri
(
    id         int primary key auto_increment,
    ten_vi_tri varchar(50)
);
insert into vi_tri(ten_vi_tri)
values ('Lễ tân '),
       ('phục vụ'),
       ('chuyên viên'),
       ('giám sát'),
       ('quản lý'),
       ('giám đốc');
create table trinh_do
(
    id           int primary key auto_increment,
    ten_trinh_do varchar(50)
);
insert into trinh_do (ten_trinh_do)
values ('Trung cấp,'),
       ('Cao đẳng'),
       ('Đại học'),
       ('sau đại học');

create table bo_phan
(
    id          int primary key auto_increment,
    ten_bo_phan varchar(50)
);
insert into bo_phan (ten_bo_phan)
values (' Sale – Marketing'),
       ('Hành Chính'),
       ('Phục vụ'),
       ('Quản lý');
create table nhan_vien
(
    id            int primary key auto_increment,
    ten_nhan_vien varchar(50),
    ngay_sinh     date,
    so_cmnd       varchar(30),
    luong         double,
    so_dien_thoai varchar(30),
    email         varchar(50),
    dia_chi       varchar(50),
    id_vi_tri     int,
    id_bo_phan    int,
    id_trinh_do   int,
    foreign key (id_vi_tri) references vi_tri (id),
    foreign key (id_bo_phan) references bo_phan (id),
    foreign key (id_trinh_do) references trinh_do (id)
);

insert into nhan_vien(ten_nhan_vien, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, id_vi_tri, id_bo_phan,
                      id_trinh_do)
VALUES ('nguyễn minh quân', '2001-01-06', '123123', '123131123', '123456789', 'hieu1@gmail.com', 'quảng trị', 1, 3, 3),
       ('lê nữ quỳnh nhi', '1999-01-08', '124123', '123131124', '123456780', 'hieu2@gmail.com', 'quảng nam', 1, 2, 2),
       ('lê minh thi', '2004-02-03', '123511', '123131125', '123456781', 'hieu3@gmail.com', 'quảng bình', 2, 3, 3),
       ('nguyễn ngọc sơn', '2002-04-12', '1231231', '123131126', '123456782', 'hieu4@gmail.com', 'huế ', 3, 2, 3),
       ('nguyễn trần minh', '1992-11-12', '15131231', '123141123', '123456783', 'hieu5@gmail.com', 'quảng nam', 4, 3,
        3),
       ('hoàng nguyệt ánh', '1989-11-17', '12315131', '123131623', '123456784', 'hieu6@gmail.com', 'quảng trị', 2, 3,
        2),
       ('phan bá phong', '2001-12-27', '1235131', '1231312623', '123456785', 'hieu7@gmail.com', 'nam định', 1, 3, 1);
create table loai_khach
(
    id            int primary key auto_increment,
    ten_loai_khac varchar(50)
);
insert into loai_khach(ten_loai_khac)
values ('Diamond'),
       ('Platinium'),
       ('Gold'),
       ('Silver'),
       ('Member');
create table khach_hang
(
    id                int primary key auto_increment,
    ho_ten_khach_hang varchar(50),
    ngay_sinh         date,
    gioi_tinh         varchar(20),
    so_cmnd           varchar(30),
    so_dien_thoai     varchar(30),
    email             varchar(50),
    dia_chi           varchar(50),
    id_loai_khach     int,
    foreign key (id_loai_khach) references loai_khach (id)
);
insert into khach_hang (ho_ten_khach_hang, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, id_loai_khach)
VALUES ('Nam', '1990-01-01', 'Nam', '123456789', '0901234567', 'nam@example.com', '123 Đường ABC, TP.HCM', 1),
       ('An', '1992-02-02', 'Nam', '987654321', '0912345678', 'an@example.com', '456 Đường XYZ, TP.HCM', 2),
       ('Linh', '1995-03-03', 'Nữ', '112233445', '0923456789', 'linh@example.com', '789 Đường DEF, TP.HCM', 1),
       ('Mai', '1988-04-04', 'Nữ', '223344556', '0934567890', 'mai@example.com', '101 Đường GHI, TP.HCM', 3),
       ('Khoa', '1993-05-05', 'Nam', '334455667', '0945678901', 'khoa@example.com', '202 Đường JKL, TP.HCM', 5);
create table loai_dich_vu
(
    id               int primary key auto_increment,
    ten_loai_dich_vu varchar(50)
);
insert into loai_dich_vu (ten_loai_dich_vu)
values ('villa'),
       ('house'),
       ('phòng');
create table kieu_thue
(
    id            int primary key auto_increment,
    ten_kieu_thue varchar(50)
);
insert into kieu_thue (ten_kieu_thue)
values ('thuê theo  giờ'),
       ('thuê theo ngày'),
       ('thuê theo tháng'),
       ('thuê theo năm');
create table dich_vu
(
    id                   int primary key auto_increment,
    ten_dich_vu          varchar(50),
    dien_tich            int,
    chi_phi_thue         double,
    so_nguoi_toi_da      int,
    tieu_chuan_phong     varchar(50),
    mo_ta_tien_nghi_khac varchar(100),
    dien_tich_ho_boi     double,
    so_tang              int,
    id_kieu_thue         int,
    id_loai_dich_vu      int,
    foreign key (id_kieu_thue) references kieu_thue (id),
    foreign key (id_loai_dich_vu) references loai_dich_vu (id)
);
insert into dich_vu (ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac,
                     dien_tich_ho_boi, so_tang, id_kieu_thue, id_loai_dich_vu)
VALUES ('Villa Beachfront', 250, 500000, 8, '5 sao', 'Bể bơi riêng, Sân vườn rộng', 60, 2, 1, 1),
       ('House Garden View', 180, 350000, 6, '4 sao', 'Sân vườn, BBQ ngoài trời', NULL, 1, 2, 2),
       ('Deluxe Room', 40, 100000, 2, '3 sao', NULL, NULL, NULL, 3, 3),
       ('Family Suite', 100, 200000, 4, '4 sao', 'Khu vực tiếp khách, bếp nhỏ', NULL, 1, 1, 3),
       ('Luxury Villa', 300, 700000, 10, '5 sao', 'Phòng tập gym, Spa', 80, 3, 1, 1);

create table dich_vu_di_kem
(
    id                 int primary key auto_increment,
    ten_dich_vu_di_kem varchar(50),
    gia                double,
    don_vi             varchar(10),
    trang_thai         varchar(45)
);
insert into dich_vu_di_kem(ten_dich_vu_di_kem, gia, don_vi, trang_thai)
VALUES ('massege', 200, 'giờ', 'còn'),
       ('karaoke', 30, 'gờ', '24/24'),
       ('thức ăn', 40, 'phần', 'còn'),
       ('nước uống', 20, 'chai', 'còn'),
       ('thuê xe', 100, 'giờ', 'còn');
create table hop_dong
(
    id                int primary key auto_increment,
    ngay_lam_hop_dong datetime,
    ngay_ket_thuc     datetime,
    tien_dat_coc      double,
    id_nhan_vien      int,
    id_khach_hang     int,
    id_dich_vu        int,
    foreign key (id_nhan_vien) references nhan_vien (id),
    foreign key (id_khach_hang) references khach_hang (id),
    foreign key (id_dich_vu) references dich_vu (id)
);
INSERT INTO hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, id_nhan_vien, id_khach_hang, id_dich_vu)
VALUES ('2024-10-01 10:00:00', '2024-10-10 12:00:00', 500000, 1, 1, 1),
       ('2024-10-05 14:30:00', '2024-10-15 11:00:00', 300000, 2, 2, 2),
       ('2024-10-07 09:00:00', '2024-10-20 15:00:00', 700000, 1, 4, 1),
       ('2024-09-07 09:00:00', '2024-10-20 15:00:00', 800000, 1, 3, 1),
       ('2024-12-07 09:00:00', '2024-10-20 15:00:00', 900000, 1, 1, 1),
       ('2024-11-07 09:00:00', '2024-10-20 15:00:00', 250000, 1, 3, 2),
       ('2024-10-10 16:00:00', '2024-10-25 18:00:00', 200000, 3, 4, 3);


create table hop_dong_chi_tiet
(
    id_hop_dong_chi_tiet int primary key auto_increment,
    id_hop_dong          int,
    id_dich_vu_di_kem    int,
    so_luong             int,
    foreign key (id_hop_dong) references hop_dong (id),
    foreign key (id_dich_vu_di_kem) references dich_vu_di_kem (id)
);

INSERT INTO hop_dong_chi_tiet (id_hop_dong, id_dich_vu_di_kem, so_luong)
VALUES (1, 1, 2),
       (2, 2, 1),
       (2, 3, 3),
       (3, 1, 1),
       (4, 4, 5);



# câu1: Hiển thị thông tin của tất cả nhân viên thuộc bộ phận hành chính có là họ
# # “Nguyễn”

select nv.id as nhan_vien_id, nv.ten_nhan_vien as nhan_vien_ten_nhan_vien, nv.so_dien_thoai, bp.id as bo_phan_id
from nhan_vien nv
         left join bo_phan bp on nv.id_bo_phan = bp.id
where nv.ten_nhan_vien like 'nguyen %'
  and bp.ten_bo_phan = 'hành chính';

#  Hiển thị thông tin của tất cả khách hàng có năm sinh từ 1990 đến 1985 và
# thuộc loại khách hàng Diamond

select kh.id as khach_hang_id, kh.ho_ten_khach_hang, kh.ngay_sinh, kh.so_cmnd, kh.id_loai_khach
from khach_hang kh
         join loai_khach lk on kh.id_loai_khach = lk.id
where year(kh.ngay_sinh) between 1985 and 1990
  and lk.ten_loai_khac = 'Diamond';

select kh.id as khach_hang_id, kh.ho_ten_khach_hang, kh.ngay_sinh, kh.so_cmnd, kh.id_loai_khach
from khach_hang kh
         join loai_khach lk on lk.id = kh.id_loai_khach
where year(kh.ngay_sinh) between 1985 and 1990
  and lk.ten_loai_khac = 'menber';
# Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
# Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách
# hàng. Chỉ đếm những khách hàng nào có số lần đặt từ 2 lần trở lên.

select kh.ho_ten_khach_hang, count(hop_dong.id_khach_hang) as so_lan_dat
from khach_hang kh
         join hop_dong on kh.id = hop_dong.id_khach_hang
group by kh.ho_ten_khach_hang
having count(id_khach_hang) >= 2
order by so_lan_dat asc;
# Hiển thị ma_khach_hang, ho_ten, tong_tien mà khách hàng đã làm
# hợp đồng  (Với tổng tiền được tính từ  Chi Phí Thuê) cho tất cả các khách
# hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng
# cũng phải hiển thị ra)

select kh.id, kh.ho_ten_khach_hang, SUM(dv.tien_dat_coc), 0 as tong_tien
from khach_hang kh
         left join hop_dong dv on dv.id = kh.id
group by kh.id, kh.ho_ten_khach_hang;
# Hiển   thị  ma_dich_vu,   ten_dich_vu,   dien_tich,   chi_phi_thue,
# ten_loai_dich_vu của tất cả các loại dịch vụ không được đặt trong 2024

select dv.id as ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
         join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id
         left join hop_dong hd on dv.id = hd.id_dich_vu and year(hd.ngay_lam_hop_dong) = 2024
where hd.id is null;
# Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc
# giữa các bảng)
# delete from hop_dong
# where id not in(select id from hop_dong where year(ngay_lam_hop_dong) between 2023 and 2024);
delete
from hop_dong
where ngay_lam_hop_dong <= '2022-01-01 00:00:00';
delete
from khach_hang
where id not in (select distinct id from hop_dong);
# Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm
# 2024 lên gấp đôi
update dich_vu_di_kem
set gia = gia * 2
where id in (select d.id
             from dich_vu_di_kem d
                      join hop_dong_chi_tiet hdc on d.id = hdc.id_dich_vu_di_kem
                      join hop_dong hd on hdc.id_hop_dong = hd.id
             where year(hd.ngay_lam_hop_dong) = 2024
             group by d.id
             having count(hdc.id_hop_dong) > 10);
# Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
# thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten,
# email, so_dien_thoai, ngay_sinh, dia_chi.

select nv.id as ma_nhan_vien,
       nv.ten_nhan_vien as ho_ten,
       nv.email,nv.so_dien_thoai,
       nv.ngay_sinh,nv.dia_chi
from nhan_vien nv
union all
select kh.id as ma_khach_hang,kh.ho_ten_khach_hang as ho_ten,
kh.email,kh.so_dien_thoai,kh.ngay_sinh,kh.dia_chi
from khach_hang kh;
# cau 9 :Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả
# các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một
# hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”
create view v_nhan_vien as
select nhan_vien.id, nhan_vien.dia_chi,nhan_vien.ten_nhan_vien
from nhan_vien
         join hop_dong hd on nhan_vien.id = hd.id_nhan_vien
where nhan_vien.dia_chi = 'QUẢNG TRỊ'
  and hd.ngay_lam_hop_dong = '2024-10-01 10:00:00';
# Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của
# một khách hàng nào đó với ma_khach_hang được truyền vào như là 1
# tham số của sp_xoa_khach_hang.
create procedure sp_xoa_khach_hang(
    in ma_khach_hang int
)begin delete from khach_hang
where id = ma_khach_hang;
end ;
call sp_xoa_khach_hang(1);