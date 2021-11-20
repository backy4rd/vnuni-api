CREATE DATABASE vnuni;
go
USE vnuni;
go

CREATE TABLE mien
(
    id_mien int IDENTITY(1,1) PRIMARY KEY,
    ten_mien nvarchar(255) not null
)
go

CREATE TABLE tinh
(
    id_tinh int IDENTITY(1,1) PRIMARY KEY,
    ten_tinh nvarchar(255) not null,
    id_mien int not null,
    FOREIGN KEY (id_mien) REFERENCES mien(id_mien)
)
go
CREATE TABLE nhom
(
    id_nhom int IDENTITY(1,1) PRIMARY KEY,
    ten_nhom nvarchar(255) not null
)
go

CREATE TABLE truong
(
    id_truong int IDENTITY(1,1) PRIMARY KEY,
    tentruong nvarchar(255) not null,
    toado geometry not null,
    mo_ta nvarchar(2000),
    id_tinh int not null,
    id_nhom int,
    FOREIGN KEY (id_tinh) REFERENCES tinh(id_tinh),
    FOREIGN KEY (id_nhom) REFERENCES nhom(id_nhom)
)

CREATE TABLE khac
(
    id int IDENTITY(1,1) PRIMARY KEY,
    mota nvarchar(2000),
    toado geometry,
)

CREATE TABLE quyen
(
    id_quyen int IDENTITY(1,1) PRIMARY KEY,
    ten_quyen nvarchar(64) not null
)

CREATE TABLE nguoidung
(
    username varchar(64) PRIMARY KEY,
    password nvarchar(128) not null,
    ho nvarchar(64),
    ten nvarchar(64) not null,

    id_quyen int not null,
    FOREIGN key (id_quyen) REFERENCES quyen(id_quyen)
)

CREATE TABLE danhgia
(
    id_danh_gia int IDENTITY(1,1) PRIMARY KEY,
    sao int not null CHECK(sao BETWEEN 0 AND 5),
    danh_gia nvarchar(2000),
    created_at datetime not null default CURRENT_TIMESTAMP,

    username varchar(64) not null,
    id_truong int not null,
    FOREIGN key (id_truong) REFERENCES truong(id_truong),
    FOREIGN key (username) REFERENCES nguoidung(username)
)

CREATE TABLE hinhanh
(
    id_hinh int IDENTITY(1,1) PRIMARY KEY,
    url varchar(256) not null,

    id_danh_gia int not null,
    FOREIGN key (id_danh_gia) REFERENCES danhgia(id_danh_gia),
)

SET IDENTITY_INSERT quyen ON
INSERT INTO quyen(id_quyen, ten_quyen) VALUES (1, N'user');
INSERT INTO quyen(id_quyen, ten_quyen) VALUES (2, N'admin');
SET IDENTITY_INSERT quyen OFF

INSERT INTO nguoidung values ('admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', null, 'admin', 2)

SET IDENTITY_INSERT mien ON
INSERT INTO mien(id_mien,ten_mien) VALUES (1, N'Miền Bắc');
INSERT INTO mien(id_mien,ten_mien) VALUES (2, N'Miền Trung');
INSERT INTO mien(id_mien,ten_mien) VALUES (3, N'Miền Nam');
SET IDENTITY_INSERT mien OFF

SET IDENTITY_INSERT tinh ON
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (1, N'An Giang', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (2, N'Bà Rịa - Vũng Tàu', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (3, N'Bạc Liêu', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (4, N'Bắc Giang', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (5, N'Bắc Kạn', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (6, N'Bắc Ninh', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (7, N'Bến Tre', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (8, N'Bình Dương', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (9, N'Bình Định', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (10, N'Bình Phước', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (11, N'Bình Thuận', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (12, N'Cà Mau', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (13, N'Cao Bằng', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (14, N'Cần Thơ', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (15, N'Đà Nẵng', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (16, N'Đắk Lắk', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (17, N'Đắk Nông', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (18, N'Điện Biên', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (19, N'Đồng Nai', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (20, N'Đồng Tháp', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (21, N'Gia Lai', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (22, N'Hà Giang', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (23, N'Hà Nam', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (24, N'Hà Nội', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (25, N'Hà Tĩnh', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (26, N'Hải Dương', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (27, N'Hải Phòng', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (28, N'Hậu Giang', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (29, N'Hòa Bình', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (30, N'Hồ Chí Minh', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (31, N'Hưng Yên', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (32, N'Khánh Hòa', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (33, N'Kiên Giang', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (34, N'Kon Tum', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (35, N'Lai Châu', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (36, N'Lạng Sơn', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (37, N'Lào Cai', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (38, N'Lâm Đồng', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (39, N'Long An', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (40, N'Nam Định', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (41, N'Nghệ An', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (42, N'Ninh Bình', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (43, N'Ninh Thuận', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (44, N'Phú Thọ', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (45, N'Phú Yên', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (46, N'Quảng Bình', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (47, N'Quảng Nam', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (48, N'Quảng Ngãi', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (49, N'Quảng Ninh', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (50, N'Quảng Trị', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (51, N'Sóc Trăng', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (52, N'Sơn La', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (53, N'Tây Ninh', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (54, N'Thái Bình', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (55, N'Thái Nguyên', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (56, N'Thanh Hóa', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (57, N'Thừa Thiên Huế', 2);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (58, N'Tiền Giang', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (59, N'Trà Vinh', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (60, N'Tuyên Quang', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (61, N'Vĩnh Long', 3);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (62, N'Vĩnh Phúc', 1);
INSERT INTO tinh(id_tinh,ten_tinh,id_mien) VALUES (63, N'Yên Bái', 1);
SET IDENTITY_INSERT tinh OFF

SET IDENTITY_INSERT nhom ON
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (1, N'Đại học Quốc gia Hà Nội');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (2, N'Đại học Thái Nguyên');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (3, N'Đại học Huế');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (4, N'Đại học Đà Nẵng');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (5, N'Đại học Quốc gia Thành phố Hồ Chí Minh');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (6, N'Đại học cấp vùng');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (7, N'Đại học Cần Thơ');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (8, N'Học viện Tư Pháp');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (9, N'Đại học chuyên ngành và đa ngành');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (10, N'Đại học Công nghệ Giao thông Vận tải');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (11, N'Đại học Công nghiệp Thành phố Hồ Chí Minh');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (12, N'Đại học Giao thông Vận tải');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (13, N'Đại học Kiến trúc Thành phố Hồ Chí Minh');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (14, N'Đại học Lâm nghiệp Việt Nam');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (15, N'Đại học Lao động - Xã hội');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (16, N'Đại học Mỏ - Địa chất');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (17, N'Đại học Ngoại thương');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (18, N'Đại học Nội vụ Hà Nội');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (19, N'Đại học Nông Lâm Thành phố Hồ Chí Minh');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (20, N'Đại học Sư phạm Hà Nội');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (21, N'Đại học Tài chính - Kế toán');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (22, N'Đại học Tài nguyên và Môi trường Hà Nội');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (23, N'Đại học Thủy lợi');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (24, N'Đại học Tôn Đức Thắng');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (25, N'Đại học Xây dựng');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (26, N'Đại học Y Hà Nội');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (27, N'Đại học Bình Dương');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (28, N'Đại học cấp địa phương');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (29, N'Đại học tư thục');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (30, N'Quân sự');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (31, N'Công an');
INSERT INTO nhom(id_nhom,ten_nhom) VALUES (32, N'Trường dự bị đại học, dự bị đại học dân tộc');
SET IDENTITY_INSERT nhom OFF

SET IDENTITY_INSERT truong ON
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (1, 24, 1, N'Đại học Quốc gia Hà Nội', geometry::STGeomFromText ('POINT (21.037875443070963 105.78161757606023)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (2, 24, 1, N'Đại học Công nghệ', geometry::STGeomFromText ('POINT (21.038467585863373 105.78276154755538)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (3, 24, 1, N'Đại học Giáo dục', geometry::STGeomFromText ('POINT (21.038685912882684 105.78147414786785)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (4, 24, 1, N'Đại học Kinh tế', geometry::STGeomFromText ('POINT (21.037810070661678 105.77277535948687)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (5, 24, 1, N'Đại học Khoa học Tự nhiên', geometry::STGeomFromText ('POINT (20.996092535371037 105.80798793180581)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (6, 24, 1, N'Đại học Khoa học Xã hội và Nhân văn', geometry::STGeomFromText ('POINT (20.995216237259697 105.80777720202417)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (7, 24, 1, N'Đại học Ngoại ngữ', geometry::STGeomFromText ('POINT (21.039452658031056 105.7817926449811)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (8, 24, 1, N'Đại học Y Dược', geometry::STGeomFromText ('POINT (21.0407300365427 105.78152234817631)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (9, 24, 1, N'Đại học Việt - Nhật', geometry::STGeomFromText ('POINT (21.038262303968423 105.78294534663029)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (10, 55, 2, N'Đại học Thái Nguyên', geometry::STGeomFromText ('POINT (21.588507096845504 105.81142365822978)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (11, 55, 2, N'Đại học Công nghệ Thông tin và Truyền thông', geometry::STGeomFromText ('POINT (21.585218300564218 105.80643413158418)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (12, 55, 2, N'Đại học Khoa học', geometry::STGeomFromText ('POINT (21.588478778039256 105.81039368787806)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (13, 55, 2, N'Đại học Kinh tế và Quản trị Kinh doanh', geometry::STGeomFromText ('POINT (21.59037419303736 105.81290491827306)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (14, 55, 2, N'Đại học Kỹ thuật Công nghiệp', geometry::STGeomFromText ('POINT (21.549194885341265 105.84483104215658)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (15, 55, 2, N'Đại học Nông Lâm', geometry::STGeomFromText ('POINT (21.594234388015312 105.8086474155268)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (16, 55, 2, N'Đại học Sư phạm', geometry::STGeomFromText ('POINT (21.599107681127187 105.8229755893755)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (17, 55, 2, N'Đại học Y Dược', geometry::STGeomFromText ('POINT (21.588557375969177 105.82766975351703)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (18, 37, 2, N'Phân hiệu Đại học Thái Nguyên tại Lào Cai', geometry::STGeomFromText ('POINT (22.43758260284908 104.02308711837466)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (19, 57, 3, N'Đại học Huế', geometry::STGeomFromText ('POINT (16.459691152755177 107.57936681985282)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (20, 57, 3, N'Đại học Khoa học', geometry::STGeomFromText ('POINT (16.459316507679354 107.59270955123426)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (21, 57, 3, N'Đại học Kinh tế', geometry::STGeomFromText ('POINT (16.44371021724759 107.60406144600384)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (22, 57, 3, N'Đại học Luật', geometry::STGeomFromText ('POINT (16.440004443194663 107.60986291582061)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (23, 57, 3, N'Đại học Nghệ thuật', geometry::STGeomFromText ('POINT (16.47841507660125 107.574177272785)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (24, 57, 3, N'Đại học Ngoại ngữ', geometry::STGeomFromText ('POINT (16.443563259047025 107.59945154566499)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (25, 57, 3, N'Đại học Nông Lâm', geometry::STGeomFromText ('POINT (16.477680665502017 107.57286077290456)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (26, 57, 3, N'Đại học Sư phạm', geometry::STGeomFromText ('POINT (16.467690660638155 107.59199778700447)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (27, 57, 3, N'Đại học Y Dược', geometry::STGeomFromText ('POINT (16.459286272532037 107.58737621523977)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (28, 57, 3, N'Trường Du lịch', geometry::STGeomFromText ('POINT (16.47879291067314 107.60012023224557)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (29, 50, 3, N'Phân hiệu Đại học Huế tại Quảng Trị', geometry::STGeomFromText ('POINT (16.790119734942728 107.0981552308368)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (30, 15, 4, N'Đại học Đà Nẵng', geometry::STGeomFromText ('POINT (16.071213978323975 108.22023925987814)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (31, 15, 4, N'Đại học Bách khoa', geometry::STGeomFromText ('POINT (16.07397653771172 108.14992493052141)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (32, 15, 4, N'Đại học Sư phạm Kỹ thuật', geometry::STGeomFromText ('POINT (16.07756958020567 108.21348867556993)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (33, 15, 4, N'Đại học Công nghệ thông tin và Truyền thông Việt - Hàn', geometry::STGeomFromText ('POINT (15.975094768398915 108.25322174053602)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (34, 15, 4, N'Đại học Kinh tế', geometry::STGeomFromText ('POINT (16.047599693243075 108.239494859754)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (35, 15, 4, N'Đại học Ngoại ngữ', geometry::STGeomFromText ('POINT (16.034747361263214 108.21137341484881)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (36, 15, 4, N'Đại học Sư phạm', geometry::STGeomFromText ('POINT (16.061812338496832 108.15912400151363)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (37, 34, 4, N'Phân hiệu Đại học Đà Nẵng tại Kon Tum', geometry::STGeomFromText ('POINT (14.361100858266704 107.99959783053986)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (38, 30, 5, N'Đại học Quốc gia Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.868687302983684 106.79641914549074)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (39, 1, 5, N'Đại học An Giang', geometry::STGeomFromText ('POINT (10.371880537780426 105.43239721394976)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (40, 30, 5, N'Đại học Bách khoa', geometry::STGeomFromText ('POINT (10.773628107490119 106.66059437032949)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (41, 30, 5, N'Đại học Công nghệ Thông tin', geometry::STGeomFromText ('POINT (10.870277703484081 106.80309151446782)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (42, 30, 5, N'Đại học Khoa học Tự nhiên', geometry::STGeomFromText ('POINT (10.763102707467711 106.68205368337115)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (43, 30, 5, N'Đại học Khoa học Xã hội và Nhân văn', geometry::STGeomFromText ('POINT (10.785997695580543 106.70271932960746)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (44, 30, 5, N'Đại học Kinh tế – Luật', geometry::STGeomFromText ('POINT (10.871171575112244 106.77826052045876)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (45, 30, 5, N'Đại học Quốc tế', geometry::STGeomFromText ('POINT (10.87778696851511 106.8016517887956)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (46, 7, 5, N'Phân hiệu Đại học Quốc gia Thành phố Hồ Chí Minh tại Bến Tre', geometry::STGeomFromText ('POINT (10.270650072057846 106.3595436988414)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (47, 52, 6, N'Đại học Tây Bắc', geometry::STGeomFromText ('POINT (21.308980868207275 103.9415547782089)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (48, 41, 6, N'Đại học Vinh', geometry::STGeomFromText ('POINT (18.659236708157245 105.69577125996435)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (49, 32, 6, N'Đại học Nha Trang', geometry::STGeomFromText ('POINT (12.272265930237205 109.20252900216538)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (50, 16, 6, N'Đại học Tây Nguyên', geometry::STGeomFromText ('POINT (12.652523885271055 108.02406169627773)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (51, 14, 7, N'Đại học Cần Thơ', geometry::STGeomFromText ('POINT (10.030039333911489 105.77070113153334)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (52, 30, 8, N'Học viện Tư Pháp - Cơ sở tại Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.857775783583403 106.75670367231764)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (53, 24, 9, N'Đại học Công nghiệp Việt-Hung', geometry::STGeomFromText ('POINT (21.11094076554594 105.44483147403663)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (54, 24, 9, N'Đại học Bách khoa Hà Nội', geometry::STGeomFromText ('POINT (21.00758859944157 105.84317686781998)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (55, 24, 9, N'Đại học Công đoàn', geometry::STGeomFromText ('POINT (21.009878290684405 105.82568021505689)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (56, 24, 10, N'Đại học Công nghệ Giao thông Vận tải', geometry::STGeomFromText ('POINT (20.984902161956636 105.79883200127679)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (57, 24, 9, N'Đại học Công nghiệp Dệt may Hà Nội', geometry::STGeomFromText ('POINT (21.03768299184331 106.0116967442411)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (58, 24, 9, N'Đại học Công nghiệp Hà Nội', geometry::STGeomFromText ('POINT (21.053926972781575 105.7351449683185)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (59, 49, 9, N'Đại học Công nghiệp Quảng Ninh', geometry::STGeomFromText ('POINT (21.060674274801787 106.62358772123788)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (60, 30, 11, N'Đại học Công nghiệp Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.822507245549557 106.68739715684328)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (61, 30, 9, N'Đại học Công nghiệp Thực phẩm Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.80671501696842 106.62896399010368)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (62, 44, 9, N'Đại học Công nghiệp Việt Trì', geometry::STGeomFromText ('POINT (21.31611157829421 105.40042405548319)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (63, 2, 9, N'Đại học Dầu khí Việt Nam', geometry::STGeomFromText ('POINT (10.486967529502666 107.19356358751321)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (64, 38, 9, N'Đại học Đà Lạt', geometry::STGeomFromText ('POINT (11.955387606367738 108.44402449819495)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (65, 20, 9, N'Đại học Đồng Tháp', geometry::STGeomFromText ('POINT (10.420019651009536 105.64388507792899)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (66, 24, 9, N'Đại học Điện lực', geometry::STGeomFromText ('POINT (21.046628874306503 105.78488401638495)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (67, 40, 9, N'Đại học Điều dưỡng Nam Định', geometry::STGeomFromText ('POINT (20.437806529120696 106.18330982074127)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (68, 24, 9, N'Đại học Dược Hà Nội', geometry::STGeomFromText ('POINT (21.021671394266605 105.85814394409913)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (69, 30, 9, N'Đại học Giao thông vận tải Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.805124957784798 106.71702945683616)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (70, 24, 12, N'Đại học Giao thông Vận tải', geometry::STGeomFromText ('POINT (21.02851292279225 105.80341151507922)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (71, 24, 9, N'Đại học Hà Nội', geometry::STGeomFromText ('POINT (20.989070103540616 105.79552382775228)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (72, 27, 9, N'Đại học Hàng hải Việt Nam', geometry::STGeomFromText ('POINT (20.836948055347353 106.6944426133924)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (73, 24, 9, N'Đại học Khoa học và Công nghệ Hà Nội (Đại học Việt - Pháp)', geometry::STGeomFromText ('POINT (21.048251893217497 105.80123620217434)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (74, 33, 9, N'Đại học Kiên Giang', geometry::STGeomFromText ('POINT (9.916664822291215 105.14432754787408)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (75, 24, 9, N'Đại học Kiểm sát Hà Nội', geometry::STGeomFromText ('POINT (20.96877973011746 105.74673644173622)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (76, 24, 9, N'Đại học Kiến trúc Hà Nội', geometry::STGeomFromText ('POINT (20.980672582504273 105.78937723030718)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (77, 30, 13, N'Đại học Kiến trúc Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.782553433629351 106.6941493878638)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (78, 24, 9, N'Đại học Kinh tế - Kỹ thuật Công nghiệp', geometry::STGeomFromText ('POINT (20.996189871866786 105.86564207972084)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (79, 24, 9, N'Đại học Kinh tế Quốc dân', geometry::STGeomFromText ('POINT (21.001963550685357 105.84265804366429)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (80, 30, 9, N'Đại học Kinh tế Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.784583398151183 106.6962592580396)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (81, 15, 9, N'Đại học Kỹ thuật Y Dược Đà Nẵng', geometry::STGeomFromText ('POINT (16.067736011052023 108.21852114691357)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (82, 26, 9, N'Đại học Kỹ thuật Y tế Hải Dương', geometry::STGeomFromText ('POINT (20.939364337587424 106.30582576009704)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (83, 24, 14, N'Đại học Lâm nghiệp Việt Nam', geometry::STGeomFromText ('POINT (20.91124850499976 105.57668405829708)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (84, 24, 15, N'Đại học Lao động - Xã hội', geometry::STGeomFromText ('POINT (21.012572365534048 105.80224770442719)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (85, 24, 9, N'Đại học Luật Hà Nội', geometry::STGeomFromText ('POINT (21.02163592366469 105.80967490217158)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (86, 30, 9, N'Đại học Luật Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.76777622346898 106.70554145913057)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (87, 24, 16, N'Đại học Mỏ - Địa chất', geometry::STGeomFromText ('POINT (21.07215498883101 105.77390257358374)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (88, 24, 9, N'Đại học Mở Hà Nội', geometry::STGeomFromText ('POINT (21.00141164040314 105.84792711957293)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (89, 30, 9, N'Đại học Mở Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.776515317253077 106.69034807246776)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (90, 24, 9, N'Đại học Mỹ thuật Công nghiệp', geometry::STGeomFromText ('POINT (21.023823838285722 105.82369316116547)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (91, 30, 9, N'Đại học Mỹ thuật Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.802649720070074 106.69547284564948)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (92, 24, 9, N'Đại học Mỹ thuật Việt Nam', geometry::STGeomFromText ('POINT (21.02237162700714 105.84264682985122)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (93, 30, 9, N'Đại học Ngân hàng Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.770743340994155 106.70482020159059)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (94, 24, 17, N'Đại học Ngoại thương', geometry::STGeomFromText ('POINT (21.023306889151833 105.80539639847389)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (95, 24, 18, N'Đại học Nội vụ Hà Nội', geometry::STGeomFromText ('POINT (21.06776445357858 105.80476645875474)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (96, 4, 9, N'Đại học Nông - Lâm Bắc Giang', geometry::STGeomFromText ('POINT (21.284239518954614 106.0923977861645)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (97, 30, 19, N'Đại học Nông Lâm Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.871345529060275 106.7917765297742)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (98, 9, 9, N'Đại học Quy Nhơn', geometry::STGeomFromText ('POINT (13.75922020532489 109.21785730217843)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (99, 48, 9, N'Đại học Phạm Văn Đồng', geometry::STGeomFromText ('POINT (15.10716803589302 108.80536906620243)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (100, 30, 9, N'Đại học Sân khấu - Điện ảnh Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.765951325099142 106.68959244357485)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (101, 24, 9, N'Đại học Sân khấu - Điện ảnh Hà Nội', geometry::STGeomFromText ('POINT (21.040025132645393 105.77596273478555)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (102, 26, 9, N'Đại học Sao Đỏ', geometry::STGeomFromText ('POINT (21.111332830199302 106.39458381944553)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (103, 62, 20, N'Đại học Sư phạm Hà Nội 2', geometry::STGeomFromText ('POINT (21.28124651932844 105.72584878918242)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (104, 24, 20, N'Đại học Sư phạm Hà Nội', geometry::STGeomFromText ('POINT (21.037711622871548 105.78332499099025)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (105, 31, 9, N'Đại học Sư phạm Kỹ thuật Hưng Yên', geometry::STGeomFromText ('POINT (20.86838189189075 106.0053705304765)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (106, 40, 9, N'Đại học Sư phạm Kỹ thuật Nam Định', geometry::STGeomFromText ('POINT (20.44988492922032 106.18344922783672)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (107, 30, 9, N'Đại học Sư phạm Kỹ thuật Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.851047037226804 106.7719505636423)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (108, 61, 9, N'Đại học Sư phạm kỹ thuật Vĩnh Long', geometry::STGeomFromText ('POINT (10.25012430719488 105.96184198756501)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (109, 41, 9, N'Đại học Sư phạm Kỹ thuật Vinh', geometry::STGeomFromText ('POINT (18.675086503454665 105.70646851520988)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (110, 24, 9, N'Đại học Sư phạm Nghệ thuật Trung ương', geometry::STGeomFromText ('POINT (20.983332531667983 105.79472280410667)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (111, 30, 9, N'Đại học Sư phạm Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.761869827239785 106.68206028189574)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (112, 24, 9, N'Đại học Sư phạm Thể dục Thể thao Hà Nội', geometry::STGeomFromText ('POINT (20.943985037148995 105.70624247659268)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (113, 30, 9, N'Đại học Sư phạm Thể dục Thể thao Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.7531558366499 106.66363073063691)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (114, 48, 21, N'Đại học Tài chính - Kế toán', geometry::STGeomFromText ('POINT (15.091417931903486 108.82450877491429)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (115, 30, 9, N'Đại học Tài chính - Marketing', geometry::STGeomFromText ('POINT (10.81155893697985 106.6805921497032)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (116, 31, 9, N'Đại học Tài chính - Quản trị kinh doanh', geometry::STGeomFromText ('POINT (20.955496175894915 105.99728496055377)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (117, 24, 22, N'Đại học Tài nguyên và Môi trường Hà Nội', geometry::STGeomFromText ('POINT (21.046703459847702 105.76226727630224)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (118, 30, 9, N'Đại học Tài nguyên và Môi trường Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.796632224673854 106.66676451453756)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (119, 6, 9, N'Đại học Thể dục Thể thao Bắc Ninh', geometry::STGeomFromText ('POINT (21.124791466695253 105.95383908588752)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (120, 15, 9, N'Đại học Thể dục Thể thao Đà Nẵng', geometry::STGeomFromText ('POINT (16.071310873842343 108.18036008995819)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (121, 30, 9, N'Đại học Thể dục Thể thao Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.87139015579452 106.79628975938489)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (122, 24, 9, N'Đại học Thương mại', geometry::STGeomFromText ('POINT (21.036801009374553 105.77505568778888)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (123, 24, 23, N'Đại học Thủy lợi', geometry::STGeomFromText ('POINT (21.007868466152335 105.82483752999393)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (124, 58, 9, N'Đại học Tiền Giang', geometry::STGeomFromText ('POINT (10.365307438226813 106.35745438522223)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (125, 30, 24, N'Đại học Tôn Đức Thắng', geometry::STGeomFromText ('POINT (10.732837543033188 106.69982324539734)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (126, 24, 9, N'Đại học Văn hóa Hà Nội', geometry::STGeomFromText ('POINT (21.0236703944738 105.82258836071144)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (127, 30, 9, N'Đại học Văn hóa Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.805695318397198 106.73090920119516)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (128, 61, 25, N'Đại học Xây dựng Miền Tây', geometry::STGeomFromText ('POINT (10.236010831145961 105.96300570105235)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (129, 15, 25, N'Đại học Xây dựng miền Trung', geometry::STGeomFromText ('POINT (16.101168978568662 108.13646582921166)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (130, 24, 25, N'Đại học Xây dựng', geometry::STGeomFromText ('POINT (21.003483744537746 105.84330997327741)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (131, 30, 9, N'Đại học Y Dược Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.754557111488499 106.66339853223262)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (132, 24, 26, N'Đại học Y Hà Nội', geometry::STGeomFromText ('POINT (21.003351563662974 105.83074604586308)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (133, 27, 9, N'Đại học Y Hải Phòng', geometry::STGeomFromText ('POINT (20.842600656440762 106.69805767563629)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (134, 30, 9, N'Đại học Y khoa Phạm Ngọc Thạch', geometry::STGeomFromText ('POINT (10.773750578950814 106.6659697035011)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (135, 41, 9, N'Đại học Y khoa Vinh', geometry::STGeomFromText ('POINT (18.685301341573492 105.69922811789336)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (136, 24, 9, N'Đại học Y tế Công cộng', geometry::STGeomFromText ('POINT (21.082434438402164 105.7800498212775)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (137, 54, 9, N'Đại học Y Dược Thái Bình', geometry::STGeomFromText ('POINT (20.442792622591845 106.33925587530817)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (138, 14, 9, N'Đại học Y Dược Cần Thơ', geometry::STGeomFromText ('POINT (10.034396721579958 105.75528527199462)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (139, 8, 9, N'Đại học Việt - Đức', geometry::STGeomFromText ('POINT (11.055285489999394 106.66561385884393)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (140, 19, 14, N'Phân hiệu Đại học Lâm nghiệp Việt Nam tại Đồng Nai', geometry::STGeomFromText ('POINT (10.946256579310383 106.99689738023567)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (141, 7, 5, N'Phân hiệu Đại học Bách Khoa tại Bến Tre', geometry::STGeomFromText ('POINT (10.270134931680614 106.35935455135817)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (142, 12, 27, N'Phân hiệu Đại học Bình Dương tại Cà Mau', geometry::STGeomFromText ('POINT (9.195993767882118 105.13574257823475)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (143, 55, 10, N'Phân hiệu Đại học Công nghệ Giao thông Vận tải tại Thái Nguyên', geometry::STGeomFromText ('POINT (21.57549390454274 105.8227176334066)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (144, 62, 10, N'Phân hiệu Đại học Công nghệ Giao thông Vận tải tại Vĩnh Phúc', geometry::STGeomFromText ('POINT (21.2918502096769 105.58444458372347)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (145, 7, 5, N'Phân hiệu Đại học Đại học Quốc gia Thành phố Hồ Chí Minh tại Bến Tre', geometry::STGeomFromText ('POINT (10.27022939418642 106.35949215850202)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (146, 48, 11, N'Phân hiệu Đại học Công nghiệp Thành phố Hồ Chí Minh tại Quảng Ngãi', geometry::STGeomFromText ('POINT (15.108954438817426 108.81065158670343)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (147, 49, 16, N'Phân hiệu Đại học Mỏ - Địa chất tại Quảng Ninh', geometry::STGeomFromText ('POINT (21.040921945932627 107.22778847385653)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (148, 2, 16, N'Phân hiệu Đại học Mỏ - Địa chất tại Vũng Tàu', geometry::STGeomFromText ('POINT (10.503469826907999 107.17434644339487)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (149, 47, 18, N'Phân hiệu Đại học Nội vụ Hà Nội tại Quảng Nam', geometry::STGeomFromText ('POINT (15.945528076736622 108.25543029736455)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (150, 21, 19, N'Phân hiệu Đại học Nông Lâm Thành phố Hồ Chí Minh tại Gia Lai', geometry::STGeomFromText ('POINT (13.945353857136727 107.96455581136877)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (151, 43, 19, N'Phân hiệu Đại học Nông Lâm Thành phố Hồ Chí Minh tại Ninh Thuận', geometry::STGeomFromText ('POINT (11.600235614886449 109.03569317433576)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (152, 57, 21, N'Phân hiệu Đại học Tài chính - Kế toán tại Thừa Thiên Huế', geometry::STGeomFromText ('POINT (16.496097262965534 107.60278011806083)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (153, 56, 26, N'Phân hiệu Đại học Y Hà Nội tại Thanh Hóa', geometry::STGeomFromText ('POINT (19.776857403255924 105.77521369895008)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (154, 56, 22, N'Phân hiệu Đại học Tài nguyên và Môi trường Hà Nội tại Thanh Hóa', geometry::STGeomFromText ('POINT (20.08443880024823 105.85970850187243)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (155, 28, 7, N'Phân hiệu Đại học Cần Thơ tại Hậu Giang', geometry::STGeomFromText ('POINT (9.760944877252323 105.60459246254676)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (156, 30, 12, N'Đại học Giao thông Vận tải cơ sở 2', geometry::STGeomFromText ('POINT (10.845658303733172 106.79421408614594)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (157, 14, 13, N'Đại học Kiến trúc Thành phố Hồ Chí Minh cơ sở Cần Thơ', geometry::STGeomFromText ('POINT (9.98186739611731 105.75815278953058)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (158, 38, 13, N'Đại học Kiến trúc Thành phố Hồ Chí Minh tại Đà Lạt', geometry::STGeomFromText ('POINT (11.94467724049932 108.46619335273732)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (159, 30, 15, N'Đại học Lao động - Xã hội cơ sở 2, Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.866896250896742 106.6179464546832)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (160, 24, 15, N'Đại học Lao động - Xã hội, cơ sở Sơn Tây', geometry::STGeomFromText ('POINT (21.113266562818932 105.44027052234527)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (161, 30, 17, N'Đại học Ngoại thương cơ sở 2, Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.806871318305367 106.71303352166221)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (162, 49, 17, N'Đại học Ngoại thương, cơ sở Quảng Ninh', geometry::STGeomFromText ('POINT (21.020127577068127 106.8152853565926)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (163, 30, 23, N'Đại học Thủy lợi cơ sở 2, Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.792684921252373 106.7063293807629)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (164, 38, 24, N'Đại học Tôn Đức Thắng, cơ sở Bảo Lộc', geometry::STGeomFromText ('POINT (11.530373699620739 107.78391184748003)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (165, 12, 24, N'Đại học Tôn Đức Thắng, cơ sở Cà Mau', geometry::STGeomFromText ('POINT (9.202206979591821 105.15550783994625)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (166, 32, 24, N'Đại học Tôn Đức Thắng, cơ sở Nha Trang', geometry::STGeomFromText ('POINT (12.2708895839873 109.20354057095909)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (167, 3, 28, N'Đại học Bạc Liêu', geometry::STGeomFromText ('POINT (9.291580220061933 105.71267501097053)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (168, 19, 28, N'Đại học Đồng Nai', geometry::STGeomFromText ('POINT (10.959140629594767 106.86130584075255)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (169, 25, 28, N'Đại học Hà Tĩnh', geometry::STGeomFromText ('POINT (18.304486069239903 105.93789735820879)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (170, 49, 28, N'Đại học Hạ Long', geometry::STGeomFromText ('POINT (20.953580573551015 107.09796400260788)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (171, 26, 28, N'Đại học Hải Dương', geometry::STGeomFromText ('POINT (20.910797097521733 106.29273688736957)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (172, 27, 28, N'Đại học Hải Phòng', geometry::STGeomFromText ('POINT (20.807619331405096 106.6229823857456)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (173, 56, 28, N'Đại học Hồng Đức', geometry::STGeomFromText ('POINT (19.768906478873344 105.77830132477818)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (174, 42, 28, N'Đại học Hoa Lư', geometry::STGeomFromText ('POINT (20.255291455527686 105.95479428549885)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (175, 44, 28, N'Đại học Hùng Vương', geometry::STGeomFromText ('POINT (21.337026491289727 105.38153154929286)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (176, 32, 28, N'Đại học Khánh Hòa', geometry::STGeomFromText ('POINT (12.245441626803645 109.19548876733519)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (177, 41, 28, N'Đại học Kinh tế Nghệ An', geometry::STGeomFromText ('POINT (18.692474905864625 105.68152333752846)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (178, 14, 28, N'Đại học Kỹ thuật - Công nghệ Cần Thơ', geometry::STGeomFromText ('POINT (10.04711389758477 105.76795224153281)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (179, 45, 28, N'Đại học Phú Yên', geometry::STGeomFromText ('POINT (13.101783336201704 109.30988796792019)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (180, 46, 28, N'Đại học Quảng Bình', geometry::STGeomFromText ('POINT (17.481586575679973 106.60748512231416)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (181, 47, 28, N'Đại học Quảng Nam', geometry::STGeomFromText ('POINT (15.566935566249663 108.47707754568091)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (182, 30, 28, N'Đại học Sài Gòn', geometry::STGeomFromText ('POINT (10.75994873845042 106.68257280419256)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (183, 8, 28, N'Đại học Thủ Dầu Một', geometry::STGeomFromText ('POINT (10.980097478319902 106.67497392539313)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (184, 24, 28, N'Đại học Thủ đô Hà Nội', geometry::STGeomFromText ('POINT (21.035819565719184 105.80136626643841)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (185, 60, 28, N'Đại học Tân Trào', geometry::STGeomFromText ('POINT (21.835680933270332 105.1726712445143)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (186, 54, 28, N'Đại học Thái Bình', geometry::STGeomFromText ('POINT (20.472007089898945 106.31824279442188)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (187, 59, 28, N'Đại học Trà Vinh', geometry::STGeomFromText ('POINT (9.92345159208395 106.3463028764251)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (188, 56, 28, N'Đại học Văn hóa, Thể thao và Du lịch Thanh Hóa', geometry::STGeomFromText ('POINT (19.772622863479693 105.77692588320468)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (189, 31, 29, N'Đại học Anh Quốc Việt Nam (BUV)', geometry::STGeomFromText ('POINT (20.96609761846557 105.93167039602186)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (190, 2, 29, N'Đại học Bà Rịa - Vũng Tàu', geometry::STGeomFromText ('POINT (10.348528814082897 107.0822614637422)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (191, 8, 27, N'Đại học Bình Dương', geometry::STGeomFromText ('POINT (10.990104471983726 106.66396251969991)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (192, 16, 29, N'Đại học Buôn Ma Thuột', geometry::STGeomFromText ('POINT (12.713936388698945 108.07254963724154)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (193, 31, 29, N'Đại học Chu Văn An', geometry::STGeomFromText ('POINT (20.653592518791726 106.06650768079119)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (194, 24, 29, N'Đại học Công nghệ Đông Á', geometry::STGeomFromText ('POINT (21.039904215811724 105.74207017283456)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (195, 19, 29, N'Đại học Công nghệ Đồng Nai', geometry::STGeomFromText ('POINT (10.984492058344237 106.86907975988605)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (196, 30, 29, N'Đại học Công nghệ Sài Gòn', geometry::STGeomFromText ('POINT (10.737933939108732 106.67778918378785)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (197, 30, 29, N'Đại học Công nghệ Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.801659584787696 106.71444346090504)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (198, 24, 29, N'Đại học Công nghệ và Quản lý Hữu nghị', geometry::STGeomFromText ('POINT (20.982862551543317 105.86563218138734)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (199, 41, 29, N'Đại học Công nghệ Vạn Xuân', geometry::STGeomFromText ('POINT (18.788112255715333 105.71689945249224)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (200, 41, 29, N'Đại học Công nghiệp Vinh', geometry::STGeomFromText ('POINT (18.676156192670735 105.66777567676063)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (201, 61, 29, N'Đại học Cửu Long', geometry::STGeomFromText ('POINT (10.169493752141138 105.92751749837464)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (202, 24, 29, N'Đại học Đại Nam', geometry::STGeomFromText ('POINT (20.94753944988584 105.75871158539701)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (203, 27, 29, N'Đại học Quản lý và Công nghệ Hải Phòng', geometry::STGeomFromText ('POINT (20.838356393070235 106.68812119658074)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (204, 38, 29, N'Đại học Dân lập Yersin Đà Lạt', geometry::STGeomFromText ('POINT (11.96479075915539 108.4358228246162)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (205, 15, 29, N'Đại học Đông Á', geometry::STGeomFromText ('POINT (16.032101030293948 108.22099048150173)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (206, 24, 29, N'Đại học Đông Đô', geometry::STGeomFromText ('POINT (20.9990643748472 105.80707709394288)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (207, 15, 29, N'Đại học Duy Tân', geometry::STGeomFromText ('POINT (16.06002417740503 108.20974984900198)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (208, 30, 29, N'Đại học FPT', geometry::STGeomFromText ('POINT (10.841379126969153 106.80996217660936)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (209, 30, 29, N'Đại học Fulbright Việt Nam', geometry::STGeomFromText ('POINT (10.72670988955142 106.7203438522089)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (210, 30, 29, N'Đại học Gia Định', geometry::STGeomFromText ('POINT (10.799450832264094 106.67391626143339)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (211, 30, 29, N'Đại học Greenwich Việt Nam', geometry::STGeomFromText ('POINT (10.815293308884428 106.70697335307919)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (212, 24, 29, N'Đại học Hòa Bình', geometry::STGeomFromText ('POINT (21.031853399515416 105.76578754317997)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (213, 30, 29, N'Đại học Hoa Sen', geometry::STGeomFromText ('POINT (10.77013522148119 106.69246482897414)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (214, 30, 29, N'Đại học Hùng Vương Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.753199045565708 106.66035182691868)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (215, 15, 29, N'Đại học Kiến trúc Đà Nẵng', geometry::STGeomFromText ('POINT (16.032084390793553 108.22196300344055)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (216, 6, 29, N'Đại học Kinh Bắc', geometry::STGeomFromText ('POINT (21.193756243586943 106.07418446083659)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (217, 24, 29, N'Đại học Kinh doanh và Công nghệ Hà Nội', geometry::STGeomFromText ('POINT (20.999631722070404 105.87800379427554)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (218, 30, 29, N'Đại học Kinh tế - Tài chính Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.797358299844083 106.70346276533785)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (219, 39, 29, N'Đại học Kinh tế Công nghiệp Long An', geometry::STGeomFromText ('POINT (10.509765906167672 106.38142216269637)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (220, 8, 29, N'Đại học Kinh tế - Kỹ thuật Bình Dương', geometry::STGeomFromText ('POINT (10.99103498040467 106.66351387852956)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (221, 19, 29, N'Đại học Lạc Hồng', geometry::STGeomFromText ('POINT (10.962615880929494 106.78969330841805)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (222, 40, 29, N'Đại học Lương Thế Vinh', geometry::STGeomFromText ('POINT (20.44813802214076 106.17217694516212)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (223, 15, 29, N'Đại học Mỹ tại Việt Nam (AUV Đà Nẵng)', geometry::STGeomFromText ('POINT (15.973805971032304 108.25757604810856)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (224, 24, 29, N'Đại học Mỹ thuật Công nghiệp Á Châu', geometry::STGeomFromText ('POINT (21.023514578319293 105.82372895474683)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (225, 14, 29, N'Đại học Nam Cần Thơ', geometry::STGeomFromText ('POINT (10.006949651856495 105.72278924644174)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (226, 30, 29, N'Đại học Ngoại ngữ - Tin học Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.865282814644646 106.60066883490248)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (227, 30, 29, N'Đại học Nguyễn Tất Thành', geometry::STGeomFromText ('POINT (10.760901384998906 106.71020400738755)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (228, 24, 29, N'Đại học Nguyễn Trãi', geometry::STGeomFromText ('POINT (21.036309581393553 105.81592495429412)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (229, 47, 29, N'Đại học Phan Châu Trinh', geometry::STGeomFromText ('POINT (15.961629831518977 108.25942473360999)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (230, 11, 29, N'Đại học Phan Thiết', geometry::STGeomFromText ('POINT (10.94063743216139 108.16883982013994)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (231, 24, 29, N'Đại học Phenikaa', geometry::STGeomFromText ('POINT (20.961141155718963 105.74753128470641)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (232, 57, 29, N'Đại học Phú Xuân', geometry::STGeomFromText ('POINT (16.450334668345107 107.58581588982582)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (233, 24, 29, N'Đại học Phương Đông', geometry::STGeomFromText ('POINT (21.015864033878547 105.79388537046297)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (234, 9, 29, N'Đại học Quang Trung', geometry::STGeomFromText ('POINT (13.799046966127593 109.18578855997671)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (235, 24, 29, N'Đại học Quốc tế Bắc Hà', geometry::STGeomFromText ('POINT (21.037771013616826 105.789318358931)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (236, 30, 29, N'Đại học Quốc tế Hồng Bàng', geometry::STGeomFromText ('POINT (10.797005671391327 106.6595339457107)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (237, 8, 29, N'Đại học Quốc tế Miền Đông', geometry::STGeomFromText ('POINT (11.053064723501974 106.66650110297726)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (238, 30, 29, N'Đại học Quốc tế Sài Gòn', geometry::STGeomFromText ('POINT (10.80545794355148 106.73264861801763)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (239, 24, 29, N'Đại học RMIT Việt Nam', geometry::STGeomFromText ('POINT (21.02942826450682 105.81131179765364)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (240, 24, 29, N'Đại học Swinburne Việt Nam', geometry::STGeomFromText ('POINT (21.037246209140243 105.77325768162865)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (241, 24, 29, N'Đại học Tài chính - Ngân hàng Hà Nội', geometry::STGeomFromText ('POINT (21.075922569065067 105.78558124853156)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (242, 39, 29, N'Đại học Tân Tạo', geometry::STGeomFromText ('POINT (10.792198383957833 106.44196275612182)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (243, 14, 29, N'Đại học Tây Đô', geometry::STGeomFromText ('POINT (9.99903339209866 105.75981244901634)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (244, 32, 29, N'Đại học Thái Bình Dương', geometry::STGeomFromText ('POINT (12.285433572791204 109.18048422547649)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (245, 24, 29, N'Đại học Thăng Long', geometry::STGeomFromText ('POINT (20.97597585979391 105.81535349056311)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (246, 24, 29, N'Đại học Thành Đô', geometry::STGeomFromText ('POINT (21.064145012354516 105.72287579404679)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (247, 26, 29, N'Đại học Thành Đông', geometry::STGeomFromText ('POINT (20.923608802509914 106.2825847789152)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (248, 62, 29, N'Đại học Trưng Vương', geometry::STGeomFromText ('POINT (21.36288647620843 105.60501595728842)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (249, 30, 29, N'Đại học Văn Hiến', geometry::STGeomFromText ('POINT (10.768080779005073 106.67489861949515)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (250, 30, 29, N'Đại học Văn Lang', geometry::STGeomFromText ('POINT (10.762769488094053 106.6932578641686)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (251, 55, 29, N'Đại học Việt Bắc', geometry::STGeomFromText ('POINT (21.607725847605913 105.84122247274517)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (252, 24, 29, N'Đại học VinUni', geometry::STGeomFromText ('POINT (20.989119819191934 105.94508727068303)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (253, 28, 29, N'Đại học Võ Trường Toản', geometry::STGeomFromText ('POINT (9.958952735070941 105.7372827924293)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (254, 30, 29, N'Đại học Tây Sydney tại Việt Nam', geometry::STGeomFromText ('POINT (10.777670189787985 106.69186675481377)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (255, 31, 29, N'Đại học Y khoa Tokyo Việt Nam', geometry::STGeomFromText ('POINT (20.964096762311716 105.93334468356879)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (256, 24, 30, N'Học viện Biên phòng', geometry::STGeomFromText ('POINT (21.032305816787108 105.77747844867227)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (257, 24, 30, N'Học viện Chính trị Quân sự', geometry::STGeomFromText ('POINT (20.974192401405247 105.76917232368514)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (258, 32, 30, N'Học viện Hải quân', geometry::STGeomFromText ('POINT (12.216736382863584 109.20697244206744)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (259, 24, 30, N'Học viện Hậu cần', geometry::STGeomFromText ('POINT (21.065778533898683 105.87582157697979)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (260, 24, 30, N'Học viện Khoa học Quân sự', geometry::STGeomFromText ('POINT (21.069602791379815 105.71717213384993)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (261, 24, 30, N'Học viện Kỹ thuật Mật mã', geometry::STGeomFromText ('POINT (20.980711069374465 105.79616671320923)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (262, 24, 30, N'Học viện Kỹ thuật Quân sự', geometry::STGeomFromText ('POINT (21.04651182131294 105.78643976760179)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (263, 38, 30, N'Học viện Lục quân', geometry::STGeomFromText ('POINT (11.955719360064691 108.46623364912442)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (264, 24, 30, N'Học viện Phòng không - Không quân', geometry::STGeomFromText ('POINT (21.100049247855004 105.48475780207119)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (265, 24, 30, N'Học viện Quân y', geometry::STGeomFromText ('POINT (20.966518010406524 105.78844752225103)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (266, 24, 30, N'Học viện Quốc phòng Việt Nam', geometry::STGeomFromText ('POINT (21.0458874621216 105.80191054284252)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (267, 8, 30, N'Đại học Ngô Quyền', geometry::STGeomFromText ('POINT (10.983168099693195 106.64447064744058)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (268, 32, 30, N'Trường Sĩ quan Không quân', geometry::STGeomFromText ('POINT (12.234875863822921 109.18964057261795)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (269, 24, 30, N'Đại học Chính trị', geometry::STGeomFromText ('POINT (20.987211938595777 105.511889658354)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (270, 30, 30, N'Đại học Trần Đại Nghĩa', geometry::STGeomFromText ('POINT (10.836468771642085 106.67452790896014)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (271, 24, 30, N'Đại học Trần Quốc Tuấn', geometry::STGeomFromText ('POINT (21.05303447297868 105.51152234902774)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (272, 19, 30, N'Đại học Nguyễn Huệ', geometry::STGeomFromText ('POINT (10.87687715762878 106.95789382586453)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (273, 32, 30, N'Đại học Thông tin liên lạc', geometry::STGeomFromText ('POINT (12.283586914002626 109.19937590800423)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (274, 24, 30, N'Trường Sĩ quan Pháo binh', geometry::STGeomFromText ('POINT (21.113515650253184 105.48459604226956)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (275, 24, 30, N'Trường Sĩ quan Phòng hóa', geometry::STGeomFromText ('POINT (21.087250781686848 105.4995640179911)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (276, 62, 30, N'Trường Sĩ quan Tăng-Thiết giáp', geometry::STGeomFromText ('POINT (21.358499419360044 105.61320723871975)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (277, 24, 30, N'Trường Sĩ quan Đặc công', geometry::STGeomFromText ('POINT (20.8987494270192 105.58003811065986)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (278, 24, 30, N'Đại học Văn hóa - Nghệ thuật Quân đội', geometry::STGeomFromText ('POINT (21.017088959273753 105.80744347317165)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (279, 30, 31, N'Phân hiệu Học viện Kỹ thuật Mật mã tại Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.80078144173427 106.65728971852492)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (280, 24, 31, N'Học viện An ninh Nhân dân', geometry::STGeomFromText ('POINT (20.981558748560378 105.7919284357185)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (281, 24, 31, N'Học viện Cảnh sát Nhân dân', geometry::STGeomFromText ('POINT (21.066153969881086 105.76411015370569)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (282, 24, 31, N'Học viện Chính trị Công an Nhân dân', geometry::STGeomFromText ('POINT (21.250290415661464 105.86105220614412)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (283, 30, 31, N'Đại học An ninh Nhân dân', geometry::STGeomFromText ('POINT (10.873444740784782 106.80683414338142)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (284, 30, 31, N'Đại học Cảnh sát Nhân dân', geometry::STGeomFromText ('POINT (10.733755913520753 106.69749401239586)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (285, 24, 31, N'Đại học Phòng cháy Chữa cháy', geometry::STGeomFromText ('POINT (21.000981996369607 105.79487326964608)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (286, 6, 31, N'Đại học Kỹ thuật - Hậu cần Công an Nhân dân', geometry::STGeomFromText ('POINT (21.04101848157012 106.0947909641606)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (287, 30, 32, N'Trường Dự bị Đại Học Thành phố Hồ Chí Minh', geometry::STGeomFromText ('POINT (10.759586583343067 106.67051191450442)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (288, 44, 32, N'Trường Dự bị Đại học dân tộc Trung ương Việt Trì - Phú Thọ', geometry::STGeomFromText ('POINT (21.324094491600206 105.4026017337594)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (289, 56, 32, N'Trường Dự bị Đại học dân tộc Sầm Sơn', geometry::STGeomFromText ('POINT (19.742840732033628 105.90265293961623)', 0));
INSERT INTO truong(id_truong,id_tinh,id_nhom,tentruong,toado) VALUES (290, 32, 32, N'Trường Dự bị Đại học dân tộc Nha Trang', geometry::STGeomFromText ('POINT (12.235554671384204 109.19399096767242)', 0));
SET IDENTITY_INSERT truong OFF
GO

CREATE FUNCTION [dbo].[geomToGeoJSON] (@geom GEOMETRY)
RETURNS nvarchar(MAX)
AS
BEGIN
-- Declare the return variable here
    DECLARE @geoJSON nvarchar(MAX)


    DECLARE @Ngeom GEOMETRY
    DECLARE @ptCounter INT
    DECLARE @numPt INT
    DECLARE @ringCounter INT
    DECLARE @numRing INT
    DECLARE @gCounter INT
    DECLARE @numGeom INT
    DECLARE @handled BIT = 0
    DECLARE @extRing GEOMETRY
    DECLARE @intRing GEOMETRY

    -- fix bad geometries and enforce ring orientation
    SET @geom = @geom.STUnion(@geom.STPointN(1)).MakeValid()

    -- Point ----------------------------
    IF (@geom.STGeometryType() = 'Point')
    BEGIN
        SET @geoJSON = '{ "type": "Point", "coordinates": [' + LTRIM(RTRIM(STR(@geom.STX, 38, 8))) + ', ' + LTRIM(RTRIM(STR(@geom.STY, 38, 8))) + '] }'
        SET @handled = 1
    END


    -- MultiPoint ---------------------------------------------
    IF (
        @handled = 0
        AND @geom.STGeometryType() = 'MultiPoint'
        )
    BEGIN
        SET @gCounter = 1
        SET @numGeom = @geom.STNumGeometries()

        SET @geoJSON = '{ "type": "MultiPoint", "coordinates": ['

        WHILE @gCounter <= @numGeom
        BEGIN
            SET @geoJSON += '[' + LTRIM(RTRIM(STR(@geom.STGeometryN(@gCounter).STX, 38, 8))) + ', ' + LTRIM(RTRIM(STR(@geom.STGeometryN(@gCounter).STY, 38, 8))) + '], '
            SET @gCounter += 1
        END

        SET @geoJSON = LEFT(@geoJSON, LEN(@geoJSON) - 1) + '] }'
        SET @handled = 1
    END




    -- LineString ---------------------------------------------
    IF (
        @handled = 0
        AND @geom.STGeometryType() = 'LineString'
        )
    BEGIN
        SET @ptCounter = 1
        SET @numPt = @geom.STNumPoints()

        SET @geoJSON = '{ "type": "LineString", "coordinates": ['

        WHILE @ptCounter <= @numPt
        BEGIN
            SET @geoJSON += '[' + LTRIM(RTRIM(STR(@geom.STPointN(@ptCounter).STX, 38, 8))) + ', ' + LTRIM(RTRIM(STR(@geom.STPointN(@ptCounter).STY, 38, 8))) + '], '
            SET @ptCounter += 1
        END

        SET @geoJSON = LEFT(@geoJSON, LEN(@geoJSON) - 1) + ' ] }'
        SET @handled = 1
    END




    -- MultiLineString ---------------------------------------------
    IF (
        @handled = 0
        AND @geom.STGeometryType() = 'MultiLineString'
        )
    BEGIN
        SET @gCounter = 1
        SET @numGeom = @geom.STNumGeometries()

        SET @geoJSON = '{ "type": "MultiLineString", "coordinates": ['

        WHILE @gCounter <= @numGeom
        BEGIN
            SET @Ngeom = @geom.STGeometryN(@gCounter)
            SET @geoJSON += '['
            SELECT
                @ptCounter = 1
                ,@numPt = @Ngeom.STNumPoints()

            WHILE @ptCounter <= @numPt
            BEGIN
                SET @geoJSON += '[' + LTRIM(RTRIM(STR(@Ngeom.STPointN(@ptCounter).STX, 38, 8))) + ', ' + LTRIM(RTRIM(STR(@Ngeom.STPointN(@ptCounter).STY, 38, 8))) + '], '
                SET @ptCounter += 1
            END

            SET @geoJSON = LEFT(@geoJSON, LEN(@geoJSON) - 1) + '],'

            SET @gCounter += 1
        END

        SET @geoJSON = LEFT(@geoJSON, LEN(@geoJSON) - 1) + '] }'
        SET @handled = 1
    END




    -- Polygon ---------------------------------------------
    IF (
        @handled = 0
        AND @geom.STGeometryType() = 'Polygon'
        )
    BEGIN
        SET @extRing = @geom.STExteriorRing()

        SET @geoJSON = '{ "type": "Polygon", "coordinates": [['

        SELECT
            @ptCounter = 1
            ,@numPt = @extRing.STNumPoints()

        WHILE @ptCounter <= @numPt
        BEGIN
            SET @geoJSON += '[' + LTRIM(RTRIM(STR(@extRing.STPointN(@ptCounter).STX, 38, 8))) + ', ' + LTRIM(RTRIM(STR(@extRing.STPointN(@ptCounter).STY, 38, 8))) + '], '
            SET @ptCounter += 1
        END

        SET @geoJSON = LEFT(@geoJSON, LEN(@geoJSON) - 1) + ']'

        SET @ringCounter = 1
        SET @numRing = @geom.STNumInteriorRing()

        WHILE @ringCounter <= @numRing
        BEGIN
            SET @geoJSON += ',['

            SET @intRing = @geom.STInteriorRingN(@ringCounter)
            -- set the ring orientation so that they are consistent
            SET @intRing = @intRing.STUnion(@intRing.STPointN(1)).MakeValid()

            SELECT
                @ptCounter = @intRing.STNumPoints()

            WHILE @ptCounter > 0
            BEGIN
                SET @geoJSON += '[' + LTRIM(RTRIM(STR(@intRing.STPointN(@ptCounter).STX, 38, 8))) + ', ' + LTRIM(RTRIM(STR(@intRing.STPointN(@ptCounter).STY, 38, 8))) + '], '
                SET @ptCounter -= 1
            END

            SET @geoJSON = LEFT(@geoJSON, LEN(@geoJSON) - 1) + ']'

            SET @ringCounter += 1
        END

        SET @geoJSON = LEFT(@geoJSON, LEN(@geoJSON) - 1) + ']] }'
        SET @handled = 1
    END




    -- MultiPolygon ---------------------------------------------
    IF (
        @handled = 0
        AND @geom.STGeometryType() = 'MultiPolygon'
        )
    BEGIN
        SELECT
            @gCounter = 1
            ,@numGeom = @geom.STNumGeometries()

        SET @geoJSON = '{ "type": "MultiPolygon", "coordinates": ['

        WHILE @gCounter <= @numGeom
        BEGIN
            SET @Ngeom = @geom.STGeometryN(@gCounter)

            SET @extRing = @Ngeom.STExteriorRing()

            SET @geoJSON += '[['

            SELECT
                @ptCounter = 1
                ,@numPt = @extRing.STNumPoints()

            -- add the exterior ring points to the json
            WHILE @ptCounter <= @numPt
            BEGIN
                SET @geoJSON += '[' + LTRIM(RTRIM(STR(@extRing.STPointN(@ptCounter).STX, 38, 8))) + ', ' + LTRIM(RTRIM(STR(@extRing.STPointN(@ptCounter).STY, 38, 8))) + '], '
                SET @ptCounter += 1
            END

            SET @geoJSON = LEFT(@geoJSON, LEN(@geoJSON) - 1) + ']'

            SET @ringCounter = 1
            SET @numRing = @Ngeom.STNumInteriorRing()

            -- add any internal ring points to the json
            WHILE @ringCounter <= @numRing
            BEGIN
                SET @geoJSON += ',['

                SET @intRing = @Ngeom.STInteriorRingN(@ringCounter)
                -- make sure the ring orientation is the same every time
                SET @intRing = @intRing.STUnion(@intRing.STPointN(1)).MakeValid()

                SELECT
                    @ptCounter = @intRing.STNumPoints()

                WHILE @ptCounter > 0
                BEGIN
                    SET @geoJSON += '[' + LTRIM(RTRIM(STR(@intRing.STPointN(@ptCounter).STX, 38, 8))) + ', ' + LTRIM(RTRIM(STR(@intRing.STPointN(@ptCounter).STY, 38, 8))) + '], '
                    SET @ptCounter -= 1
                END

                SET @geoJSON = LEFT(@geoJSON, LEN(@geoJSON) - 1) + ']'

                SET @ringCounter += 1
            END



            SET @geoJSON += '],'
            SET @gCounter += 1
        END

        SET @geoJSON = LEFT(@geoJSON, LEN(@geoJSON) - 1) + '] }'
        SET @handled = 1
    END






    IF (@handled = 0)
    BEGIN
        SET @geoJSON = '{"type": "' + @geom.STGeometryType() + '", "coordinates": []}'
    END




    RETURN @geoJSON



END
GO