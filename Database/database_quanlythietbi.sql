/*Database Cho Thuê Thiết bị xây dựng*/

/*Lệnh tạo Database*/
CREATE DATABASE Nhom16_ThietBiXayDung1;
go
Use Nhom16_ThietBiXayDung1
go

/*Lệnh tạo các table*/

--Tạo bảng Tỉnh thành
CREATE TABLE TinhThanh
(
	idTinhThanh varchar(20) primary key,
	tenTinhThanh nvarchar(500),
);
go
--Tạo bảng Quận huyện
CREATE TABLE QuanHuyen
(
	idQuanHuyen varchar(20) primary key,
	tenQuanHuyen nvarchar(500),
	tinhThanhNo varchar(20),
	CONSTRAINT FK_tinhThanhNo_QuanHuyen
		FOREIGN KEY (tinhThanhNo) REFERENCES TinhThanh(idTinhThanh)
);
go

--Tạo bảng Phường xã
CREATE TABLE PhuongXa
(
	idPhuongXa varchar(20) primary key,
	tenPhuongXa nvarchar(500),
	quanHuyenNo varchar(20),
	CONSTRAINT FK_quanHuyenNo_PhuongXa
		FOREIGN KEY (quanHuyenNo) REFERENCES QuanHuyen(idQuanHuyen)
);
go

--Tạo bảng Thôn Tổ
CREATE TABLE ThonTo
(
	idThonTo varchar(20) primary key,
	tenThonTo nvarchar(500),
	xaPhuongNo varchar(20),
	CONSTRAINT FK_xaPhuongNo_ThonTo
		FOREIGN KEY (xaPhuongNo) REFERENCES PhuongXa(idPhuongXa)
);
go

--Tạo bảng Quyền Truy Cập
CREATE TABLE QuyenTruyCap
(
	maQuyen varchar(20) primary key,
	tenQuyen nvarchar(500),
);
go

--Tạo bảng Khách Hàng
CREATE TABLE KhachHang
(
	maKH varchar(20) primary key,
	tenKH nvarchar(100),
	diaChiKH varchar(20),
	SDT varchar(11),
	Email varchar(50),
	matKhau varchar(50),
	maQuyenTruyCap  varchar(20),
	CONSTRAINT FK_maQuyenTruyCap_KhachHang
		FOREIGN KEY (maQuyenTruyCap) REFERENCES QuyenTruyCap(maQuyen),
	CONSTRAINT FK_diaChiKH_KhachHang
		FOREIGN KEY (diaChiKH) REFERENCES ThonTo(idThonTo)
);
go

--Tạo bảng Nhân Viên Bán Hàng
CREATE TABLE NhanVienChoThue
(
	maNV varchar(20) primary key,
	tenNV nvarchar(100),
	diaChi varchar(20),
	SDT varchar(11),
	Email varchar(50),
	matKhau varchar(50),
	maQuyenTruyCap  varchar(20),
	gioiTinh char(1),
	CONSTRAINT FK_maQuyenTruyCap_NhanVienChoThue
		FOREIGN KEY (maQuyenTruyCap) REFERENCES QuyenTruyCap(maQuyen),
	CONSTRAINT FK_diaChi_NhanVienChoThue
		FOREIGN KEY (diaChi) REFERENCES ThonTo(idThonTo)
);
go

--Tạo bảng Nhà Cung Cấp
CREATE TABLE NhaCungCap
(
	maNCC varchar(20) primary key,
	tenNCC nvarchar(100),
	diaChiNCC varchar(20),
	SDT varchar(11),
	Email varchar(50),
	nhanVienLienHe nvarchar(100),
	CONSTRAINT FK_diaChiNCC_NhaCungCap
		FOREIGN KEY (diaChiNCC) REFERENCES ThonTo(idThonTo)
);
go

--Tạo bảng Phiếu Nhập
CREATE TABLE PhieuNhap
(
	maPN varchar(20) primary key,
	ngayNhapHang datetime,
	maNCC varchar(20),
	CONSTRAINT FK_maNCC_PhieuNhap
		FOREIGN KEY (maNCC) REFERENCES NhaCungCap(maNCC)
);
go

--Tạo bảng Danh mục Thiết bị
CREATE TABLE DanhMucThietBi
(
	maDanhMuc varchar(20) primary key,
	tenDanhMuc nvarchar(100),
);
go
--Tạo bảng Thiết bị
CREATE TABLE ThietBi
(
	maThietBi varchar(20) primary key,
	tenThietBi nvarchar(100),
	donGiaThue money,
	soluongHienCon bigint,
	dacDiem nvarchar(1000),
	hinhAnh nvarchar(500), 
	maDanhMuc varchar(20),
	CONSTRAINT FK_maDanhMuc_ThietBi
		FOREIGN KEY (maDanhMuc) REFERENCES DanhMucThietBi(maDanhMuc)

);
go

--Tạo bảng Chi Tiết Phiếu Nhập
CREATE TABLE ChiTietPhieuNhap
(
	maPN varchar(20),
	maThietBi varchar(20),
	soLuongNhap int,
	giaNhap money
	constraint PK_ChiTietPhieuNhap_maPN_maSP primary key (maPN, maThietBi),
	CONSTRAINT FK_maPN_ChiTietPhieuNhap
		FOREIGN KEY (maPN) REFERENCES PhieuNhap(maPN),
	CONSTRAINT FK_maThietBi_ChiTietPhieuNhap
		FOREIGN KEY (maThietBi) REFERENCES ThietBi(maThietBi)
);
go

--Tạo bảng Đơn Thuê(Hợp Đồng cho thuê)
CREATE TABLE DonThue_HopDongChoThue
(
	maDonThue varchar(20) primary key,
	ngayTaoDon datetime,
	diachiGiaoHang varchar(20),
	SDTGiaoHang varchar(11),
	maHoaDonDienTu nvarchar(20),
	ngayThanhToan date,
	ngayGiaoHang date,
	trangthaiHoaDon nvarchar(100),
	maKH varchar(20),
	maNV varchar(20),
	ghiChu nvarchar(1000)
	CONSTRAINT FK_diachiGiaoHang_DonThue_HopDongChoThue
		FOREIGN KEY (diachiGiaoHang) REFERENCES ThonTo(idThonTo),
	CONSTRAINT FK_maKH_DonThue_HopDongChoThue
		FOREIGN KEY (maKH) REFERENCES KhachHang(maKH),
	CONSTRAINT FK_maNV_DonThue_HopDongChoThue
		FOREIGN KEY (maNV) REFERENCES NhanVienChoThue(maNV),	
);
go

--Tạo bảng Chi Tiết Đơn Thuê
CREATE TABLE ChiTietDonThue
(
	maDonThue varchar(20),
	maThietBi varchar(20),
	soLuongDat int,
	donGiaDat money,
	soLuongDaTra int,
	ngayTraHang datetime,
	ghiChu nvarchar(500),
	constraint PK_maDonThue_maThietBi_ChiTietDonThue primary key (maDonThue, maThietBi),
	CONSTRAINT FK_maDonThue_ChiTietDonThue
		FOREIGN KEY (maDonThue) REFERENCES DonThue_HopDongChoThue(maDonThue),
	CONSTRAINT FK_maThietBi_ChiTietDonThue
		FOREIGN KEY (maThietBi) REFERENCES ThietBi(maThietBi)
);
go


--Tạo các ràng buộc

--Bảng QuyenTruyCap
	ALTER TABLE QuyenTruyCap
		ADD CONSTRAINT check_tenQuyen_QuyenTruyCap
			CHECK (tenQuyen IN (N'Khách hàng', N'Nhân viên cho thuê', N'Admin'))
	go --Quyền truy cập của hệ thống chỉ có ba quyền: Khách hàng, Nhân viên cho thuê và Admin

	ALTER TABLE QuyenTruyCap
		ADD CONSTRAINT DF_tenQuyen_QuyenTruyCap DEFAULT N'Khách hàng' FOR tenQuyen WITH VALUES 
	go-- Mặc định là ‘Khách hàng’

--Bảng Khách hàng
	ALTER TABLE KhachHang
		ADD CONSTRAINT check_Email_KhachHang
			CHECK(Email LIKE '[A-Za-z]%@%gmail.com' OR (Email LIKE '[A-Za-z]%@%yahoo.com') OR (Email LIKE '[A-Za-z]%@%ute.udn.vn')) 
	go --Email có chứa @, bắt đầu là chữ cái viết thường hoặc viết hoa

	ALTER TABLE KhachHang
		ADD CONSTRAINT unique_Email_KhachHang UNIQUE(Email) 
	go --Email của mỗi khách hàng là duy nhất

	ALTER TABLE KhachHang
		ADD CONSTRAINT check_SDT_KhachHang
			CHECK(SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR (SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')) 
	go --dãy các chữ số gồm 10 hoặc 11 chữ số

	ALTER TABLE KhachHang
		ADD CONSTRAINT unique_SDT_KhachHang UNIQUE(SDT)
	go --SDT của mỗi khách hàng là duy nhất

--Bảng Nhân Viên Cho Thuê
	ALTER TABLE NhanVienChoThue
		ADD CONSTRAINT check_Email_NhanVienChoThue
			CHECK(Email LIKE '[A-Za-z]%@%gmail.com' OR (Email LIKE '[A-Za-z]%@%yahoo.com') OR (Email LIKE '[A-Za-z]%@%ute.udn.vn')) 
	go --Email có chứa @, bắt đầu là chữ cái viết thường hoặc viết hoa

	ALTER TABLE NhanVienChoThue
		ADD CONSTRAINT unique_Email_NhanVienChoThue UNIQUE(Email) 
	go --Email của mỗi nhân viên là duy nhất

	ALTER TABLE NhanVienChoThue
		ADD CONSTRAINT check_SDT_NhanVienChoThue
			CHECK(SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR (SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')) 
	go --dãy các chữ số gồm 10 hoặc 11 chữ số

	ALTER TABLE NhanVienChoThue
		ADD CONSTRAINT unique_SDT_NhanVienChoThue UNIQUE(SDT)
	go --SDT của mỗi nhân viên là duy nhất

	ALTER TABLE NhanVienChoThue
		ADD CONSTRAINT check_gioiTinh_NhanVienChoThue
			CHECK(gioiTinh IN ('F', 'M')) 
	go --Giới tính (‘F’ là nữ hoặc ‘M’ là nam)

	ALTER TABLE NhanVienChoThue
		ADD CONSTRAINT DF_gioiTinh_NhanVienChoThue DEFAULT 'M' FOR gioiTinh WITH VALUES 
	go --mặc định giới tính là ‘M’

--Bảng Nhà Cung Cấp
	ALTER TABLE NhaCungCap
		ADD CONSTRAINT check_Email_NhaCungCap
			CHECK(Email LIKE '[A-Za-z]%@%gmail.com' OR (Email LIKE '[A-Za-z]%@%yahoo.com') OR (Email LIKE '[A-Za-z]%@%ute.udn.vn')) 
	go --Email có chứa @, bắt đầu là chữ cái viết thường hoặc viết hoa

	ALTER TABLE NhaCungCap
		ADD CONSTRAINT unique_Email_NhaCungCap UNIQUE(Email) 
	go --Email của mỗi nhân viên là duy nhất

	ALTER TABLE NhaCungCap
		ADD CONSTRAINT check_SDT_NhaCungCap
			CHECK(SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR (SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')) 
	go --dãy các chữ số gồm 10 hoặc 11 chữ số

	ALTER TABLE NhaCungCap
		ADD CONSTRAINT unique_SDT_NhaCungCap UNIQUE(SDT)
	go --SDT của mỗi nhà cung cấp là duy nhất

--Bảng Đơn Thuê_Hợp đồng cho thuê
	ALTER TABLE DonThue_HopDongChoThue
		ADD CONSTRAINT check_ngayTaoDon_DonThue_HopDongChoThue
			CHECK(ngayTaoDon < GETDATE()) 
	go --Ngày tạo đơn hàng nhỏ hơn ngày hiện tại

	ALTER TABLE DonThue_HopDongChoThue
		ADD CONSTRAINT check_ngayThanhToan_DonThue_HopDongChoThue
			CHECK(ngayThanhToan >= ngayTaoDon) 
	go --nhỏ hơn ngày hiện tại và lớn hơn ngày tạo đơn hàng

	ALTER TABLE DonThue_HopDongChoThue
		ADD CONSTRAINT check_ngayGiaoHang_DonThue_HopDongChoThue
			CHECK(ngayGiaoHang >= ngayThanhToan) 
	go	--nhỏ hơn ngày hiện tại và lớn hơn ngày thanh toán

	ALTER TABLE DonThue_HopDongChoThue
		ADD CONSTRAINT check_trangThaiHoaDon_DonThue_HopDongChoThue
			CHECK (trangThaiHoaDon IN ('BT', 'ER', 'LL')) 
	go--'BT’ – nghĩa là bình thường, hoặc ‘ER’ – là thiếu thiết bị, hoặc ‘LL’ – Không liên lạc được với khách hàng

	ALTER TABLE DonThue_HopDongChoThue
		ADD CONSTRAINT DF_trangThaiHoaDon_DonThue_HopDongChoThue DEFAULT 'BF' FOR trangThaiHoaDon WITH VALUES
	go  --mặc định ‘Bình thường’


-- Insert

--Bảng Tỉnh thành
insert into TinhThanh
values('TT0296',N'An Giang'),
	  ('TT0254',N'Bà Rịa – Vũng Tàu'),
	  ('TT0291',N'Bạc Liêu'),
	  ('TT0204',N'Bắc Giang'),
	  ('TT0209',N'Bắc Kạn'),
	  ('TT0222',N'Bắc Ninh'),
	  ('TT0275',N'Bến Tre'),
	  ('TT0274',N'Bình Dương'),
	  ('TT024',N'Hà Nội'),
	  ('TT0236',N'Đà Nẵng')

--Bảng Quận huyện
insert into QuanHuyen
values('QH0492',N'Quận Hải Châu','TT0236'),
	  ('QH0491',N'Quận Thanh Khê','TT0236'),
	  ('QH0493',N'Quận Sơn Trà','TT0236'),
	  ('QH0494',N'Quận Ngũ Hành Sơn','TT0236'),
	  ('QH0490',N'Quận Liên Chiểu','TT0236'),
	  ('QH0487',N'Huyện Hòa Vang','TT0236'),
	  ('QH0495',N'Huyện Cẩm lệ','TT0236')

--Bảng Phường xã
insert into PhuongXa
values('PX020194',N'Phường Hòa Hiệp Bắc','QH0490'),
	  ('PX020195',N'Phường Hòa Hiệp Nam','QH0490'),
	  ('PX020197',N'Phường Hòa Khánh Bắc','QH0490'),
	  ('PX020198',N'Phường Hòa Khánh Nam','QH0490'),
	  ('PX020200',N'Phường Hòa Minh','QH0491'),
	  ('PX020203',N'Phường Tam Thuận','QH0491'),
	  ('PX020206',N'Phường Thanh Khê Tây','QH0491'),
	  ('PX020207',N'Phường Thanh Khê Đông','QH0491'),
	  ('PX020209',N'Phường Xuân Hà','QH0491')

--Bảng Thôn Tổ
insert into ThonTo
values('TT002',N'Nguyễn Tri Phương','PX020203'),
	  ('TT001',N'Hoàng Hoa Thắm','PX020203'),
	  ('TT003',N'Nguyễn Thái Thọ','PX020203'),
	  ('TT004',N'Đống Đa','PX020203'),
	  ('TT005',N'Xuân Cúc','PX020203')

--Bảng Quyền truy cập
insert into QuyenTruyCap
values('QTC01',N'Khách Hàng'),
	  ('QTC02',N'Nhân viên cho thuê'),
	  ('QTC03',N'Admin')

--Bảng Khách hàng
insert into KhachHang
values('KH001',N'Nguyễn Văn A','TT001','0765220915','NguyenVanA@gmail.com','123','QTC01'),
	  ('KH002',N'Nguyễn Văn B','TT005','0765220115','NguyenVanB@gmail.com','123','QTC01'),
	  ('KH003',N'Nguyễn Văn C','TT002','0765222915','NguyenVanC@gmail.com','123','QTC01'),
	  ('KH004',N'Nguyễn Văn D','TT004','0765250915','NguyenVanD@gmail.com','123','QTC01'),
	  ('KH005',N'Nguyễn Văn E','TT003','0765210915','NguyenVanE@gmail.com','123','QTC01'),
	  ('KH006',N'Nguyễn Văn F','TT002','0715220915','NguyenVanF@gmail.com','123','QTC01')

--Bảng Nhân viên cho thuê
insert into NhanVienChoThue
values('NV001',N'Nguyễn Văn G','TT001','0765980915','NguyenVanG@gmail.com','123','QTC02', 'F'),
	  ('NV002',N'Nguyễn Văn I','TT002','0765990915','NguyenVanI@gmail.com','123','QTC02', 'M'),
	  ('NV003',N'Nguyễn Văn R','TT002','0765910915','NguyenVanR@gmail.com','123','QTC02', 'F'),
	  ('NV004',N'Nguyễn Văn T','TT003','0765950915','NguyenVanT@gmail.com','123','QTC02', 'M'),
	  ('NV005',N'Nguyễn Văn Y','TT004','0765960915','NguyenVanY@gmail.com','123','QTC02', 'F'),
	  ('NV006',N'Nguyễn Văn P','TT005','0765977915','NguyenVanP@gmail.com','123','QTC02', 'M'),
	  ('NV007',N'Nguyễn Văn H','TT005','0765914915','NguyenVanH@gmail.com','123','QTC03', 'F')

--Bảng Nhà cung cấp
insert into NhaCungCap(maNCC,tenNCC, SDT, Email, nhanVienLienHe)
values ('NCC01',N'Xi Măng Sông Gianh','0123456528', 'XimangSG@gmail.com','Huynh Duc A'),
		('NCC02',N'Gang thép Hòa Phát', '0163156789', 'gangthepHP@gmail.com', 'Huynh Duc b'),
		('NCC03',N'Tôn Hoa Sen', '0124456789', 'tonhoasen@gmail.com', 'Huynh Duc c'),
		('NCC04',N'Vật liệu xây dựng trường an','0223456759', 'vatlieuTA@gmail.com', 'Huynh DucD'),
		('NCC05',N'Máy móc Hòa Tiến','0823156789','maymocHT@gmail.com', 'Huynh Duc H')

--Bảng Phiếu Nhập
insert into PhieuNhap(maPN, ngayNhapHang, maNCC)
values	('PN0001','11/7/2021','NCC01'),
		('PN0002','10/7/2021','NCC02'),
		('PN0003','9/7/2021','NCC03'),
		('PN0004','8/7/2021','NCC02'),
		('PN0005','8/7/2021','NCC01')

--Bảng Danh mục thiết bị
insert into DanhMucThietBi(maDanhMuc, tenDanhMuc)
values	('DMC001', N'Giàn giáo xây dựng'),
		('DMC002', N'Máy xây dựng - Máy cơ khí'),
		('DMC003', N'Phụ kiện cốp pha'),
		('DMC004', N'Phụ kiện giàn giáo')
---Bảng Thiết bị
insert into ThietBi
values	('TB001', N'Giàn giáo thang', 40000, 250, N'Giàn giáo thang hay Giàn giáo có kích thước hẹp thường được sử dụng trong môi trường hay điều kiện thi công trong không gian chật hẹp mà các loại giàn giáo kích thước thông thường, thông dụng không thể thao tác và lắp đặt được. Có kích thước bề ngang hẹp, chiều cao của 1 bộ chưa ghép đôi là 1m5 trở lại. Có khả năng chịu lực, chịu tải tốt, kết cấu vững chắc, dễ dàng thao tác. Sử dụng trong các úng dụng có không gian hạn chế, không gian chật hẹp mà các loại giàn giáo thông thường không thể triển khai', 'https://giangiaoviet.vn/wp-content/uploads/2021/09/Gian-giao-thang.jpg', 'DMC001'),
		('TB002', N'Giàn giáo siêu trọng', 40000, 250, N'Ống chính: Thép D110 – D200, chiều cao tùy ý, chiều rộng tùy chỉnh (phụ thuộc vào chiều dài thanh giằng). Độ dày: 3ly trở lên(có nhiều độ dày ống sắt cho khách hàng lựa chọn, tùy vào mục đích). Thanh Giằng: Ống thép D34. Chất liệu: Khung giàn giáo sơn dầu, khung giàn giáo sơn tĩnh điện, khung giàn giáo nhúng kẽm, khung mạ kẽm. Trọng lượng: Tùy  thuộc vào yêu cầu về độ dày của sắt làm giàn giáo', 'https://imgproducts.trangvangvietnam.com/395736969/14.png', 'DMC001'),
		('TB003', N'Giàn giáo trụ', 40000, 250, null, 'https://giangiaoviet.vn/wp-content/uploads/2020/09/gian-giao-tru-1.jpg', 'DMC001'),
		('TB004', N'Giàn giáo Ringlock ', 40000, 250, N'Thanh chống đứng dàn giáo có khả năng chịu được tải trọng lớn hơn giàn giáo thông thường do các vị trí liên kết trong hệ giàn giáo chống sàn ringlock khá chắc chắn, tính ổn định cao và không bị rung lắc, đây được xem là sản phẩm trong tương lai sẽ thay thế các loại giàn giáo truyền thống. Thanh chống đà với cấu tạo khá đơn giản và lắp dựng dễ dàng, số lượng cây chống dầm đà giữa các ô sàn giảm đáng kể, không gian thi công dầm khá thông thoáng.', 'https://giangiaoviet.vn/wp-content/uploads/2021/09/gian-giao-ringlock-04n.jpg', 'DMC001'),
		('TB005', N'Giàn giáo hoàn thiện', 40000, 250, N'Hệ giàn giáo khung được sản xuất bằng thép hình ống dài phi 42, khung giàn giáo cũng có nhiều kích thước khác nhau tùy theo nhu cầu sử dụng. Trọng lượng cơ bản của 1 bộ khung giàn giáo 1.7m là 12.5kg. Thép sản xuất giàn giáo là loại thép chất lượng, đảm bảo bộ khung giàn giáo luôn đảm bảo trọng lượng tiêu chuẩn.', 'https://muabangiangiao.com/wp-content/uploads/2017/12/gian-giao-1m7-1.jpg', 'DMC001'),
		('TB006', N'Máy trộn bê tông', 40000, 250, N'Có 2 loại: Máy trộn bê tông 250 lít và Máy trộn bê tông 350 lít', 'https://giangiaoviet.vn/wp-content/uploads/2017/06/May-tron-be-ton.jpg', 'DMC002'),
		('TB007', N'Máy cắt sắt', 40000, 250, null, 'https://giangiaoviet.vn/wp-content/uploads/2017/06/May-cat-Bosch.jpg', 'DMC002'),
		('TB008', N'Máy đục bê tông', 40000, 250, null, 'https://giangiaoviet.vn/wp-content/uploads/2017/06/may-duc-be-tong-1.jpg', 'DMC002'),
		('TB009', N'Máy tời điện - Máy tời mini', 40000, 250, N'Máy Tời điện mini thiết bị trong xây dựng là loại thiết bị máy móc không thể thiếu trong công tác thi công những công trình có số lượng tầng thấp với tính năng nâng hạ đưa vật liệu và thiết bị lên cao phục vụ quá trình thi công công trình mà không cần phải sử dụng sức người.', 'https://giangiaoviet.vn/wp-content/uploads/2017/06/may-toi-con-chay-1n.jpg', 'DMC002'),
		('TB010', N'Máy đầm cóc', 40000, 250, N'Máy đầm cóc là thiết bị chuyên dùng trong thi công nền móng và được áp dụng rộng rãi tại Việt Nam. Cũng như các nước trên thế giới, với tác dụng làm chặt vật liệu trong san lắp mặt bằng tạo độ cứng và ổn định sau thi công. Hiện đầm cóc không chỉ sử dụng trong xây dựng công nghiệp, cầu đường mà còn được áp dụng trong các công trình dân dụng nhà của các hộ gia đình.', 'https://giangiaoviet.vn/wp-content/uploads/2020/09/dam-cocn.jpg', 'DMC002'),
		('TB011', N'Tuýt sắt tròn', 40000, 250, N'Ống thép tròn mạ kẽm được sản xuất qua nhiều giai đoạn khác nha và khá tỉ mỉ như: xóa bỏ lớp rỉ, ủ mềm, cán nguội, cán định hình, mạ kẽm, tạo ra bề mặt sáng bóng, trơn, đạt tính thẩm mỹ cao. Độ uốn dẻo tuyệt vời giúp cho các mối hàn không bị nứt hoặc gãy khi uốn cong. Có khả năng chịu lực tốt, độ dày đồng đều.', 'https://giangiaoviet.vn/wp-content/uploads/2020/09/Tuyt-sat-tron-1.jpg', 'DMC003'),
		('TB012', N'Cốp pha sàn', 40000, 250, N'– Các tấm coppha sàn được liên kết với nhau bằng các bộ phận như:  Thanh la giằng, chốt con sâu, góc V,… để hình thành bộ khuôn giúp cho việc đổ bê tông thuận lợi. Các thanh la giằng có độ dày khoảng 2.5ly. – Quy cách: Chiều dài: 600mmm, 900mm, 1200mm, 1500mm, 1800mm….. Chiều rộng: 200mm, 250mm, 300mm, 350mm, 400mm, 450mm, 500mm, 550mm, 600mm Độ dày: 2mm. – Trong quá trình lắp dựng và tháo gỡ cốp pha, cần phải đảm bảo cốp pha có xương đỡ ở dưới chắc chắn, vì cốp pha hoạt động trong môi trường có lực tác dụng khá mạnh. – Ở phần giữa tấm cốp pha sàn, được lắp đặt các thanh la giằng chéo để tăng độ cứng và giảm tối đa độ cong, ngoài sự chắc chắc, bền bỉ thì khi nhìn vào sẽ thấy thẩm mỹ hơn. – Ở những góc cạnh cốp pha, được gắn thêm các gân trợ lực để quá trình tháo gỡ cốp pha, dù lực có tác động mạnh cũng không bị biến dạng.', 'https://giangiaoviet.vn/wp-content/uploads/2017/06/DanGiaoVinhLoi35.jpg', 'DMC003'),
		('TB013', N'Cốp pha trụ', 40000, 250, N'Cốp pha cột định hình được Hải Minh Quân sản xuất như một giải pháp thay thế hữu hiệu cốp pha panel. Giá thành của cốp pha định hình rẻ hơn từ 30%-50% so với cốp pha panel, vì vậy đáp ứng được yêu cầu tiết kiệm chi phí trong thi công công trình.', 'https://giangiaoviet.vn/wp-content/uploads/2021/08/cop-pha-dinh-hinh-1.jpg', 'DMC003'),
		('TB014', N'Thang giàn giáo', 40000, 250, N'Cầu thang leo giàn giáo của Hải Minh Quân sử dụng cho khung giàn giáo 1.7m, có móc khóa khá an toàn, với thiết kế 7 bậc thang chắc chắn, đạt tiêu chuẩn chất lượng, đảm bảo tuyệt đối an toàn khi thi công.', 'https://imgproducts.trangvangvietnam.com/395736969/15.png', 'DMC004'),
		('TB015', N'Cùm giàn giáo', 40000, 250, N'Cùm khóa giáo kết hợp với giàn giáo để tạo các liên kết các ống thép lại với nhau chắc chắn, sử dụng nhiểu ở các công trình xây dựng hay các hệ thống lan can trên sàn thao tác,…', 'https://giangiaoviet.vn/wp-content/uploads/2017/06/Cum-Gian-Giao.jpg', 'DMC004'),
		('TB016', N'Kích tăng giàn giáo', 40000, 250, N'Trong xây dựng hiện nay có hai loại kích tăng được sử dụng phổ biến là kích tăng bằng và kích tăng U. Cả 2 loại này đều được tạo thành từ vật liệu thép cứng cáp, đảm bảo sự chắc chắn của kích tăng trong việc phát huy vai trò của mình. Thông thường, kéo dài tuổi thọ của kích tăng cũng nhưng toàn bộ hệ thống giàn giáo, người ta sẽ tiến hành bao phủ lớp kim loại này bằng cách cho sơn dầu hoặc nhúng kẽm. Lớp bao phủ phải đảm bảo bao phủ 100% bề mặt thiết bị có có độ dày nhất định, hạn chế tối đa sự trầy xước, bong tróc khi vận chuyển và thi công. Kích tăng giàn giáo thường có màu vàng, cam, xanh lá, xanh dương,.. theo màu sắc chung của giàn giáo hoặc màu sáng bóng của lớp kẽm mạ bên ngoài, mang đến nét thẩm mỹ cho công trình cũng như thể hiện sự chuyên nghiệp của nhà thầu.', 'https://giangiaoviet.vn/wp-content/uploads/2017/06/Kich-tang-gian-giao.jpg', 'DMC004')

set dateformat dmy

--Bảng Đơn thuê - Hợp đồng cho thuê
insert into DonThue_HopDongChoThue 
values	('DT001', '30/1/2022', 'TT001', '09283746253', N'HD001', '05/02/2022', '05/02/2022', 'BT', 'KH001' , 'NV002',NULL),
		('DT002', '06/1/2022', 'TT003', '09283746253', N'HD001', '07/01/2022', '07/01/2022', 'BT', 'KH002' , 'NV001',NULL),
		('DT003', '08/5/2022', 'TT005', '09283746253', N'HD001', '09/05/2022', '09/05/2022', 'BT', 'KH003' , 'NV005',NULL),
		('DT004', '15/6/2022', 'TT002', '09283746253', N'HD001','16/06/2022', '16/06/2022', 'ER', 'KH005' , 'NV002',NULL),
		('DT005', '30/7/2022', 'TT004', '09283746253', N'HD001', '01/08/2022', '01/08/2022', 'LL', 'KH003' , 'NV002',NULL)

-----Bảng Chi tiết phiếu nhập
insert into ChiTietPhieuNhap(maPN, maThietBi, soLuongNhap, giaNhap)
values	('PN0001', 'TB001', 20, 90000),
		('PN0002', 'TB005', 20, 90000),
		('PN0003', 'TB004', 20, 90000),
		('PN0004', 'TB003', 20, 90000),
		('PN0005', 'TB002', 20, 90000)

--Bảng Chi tiết đơn thuê
insert into ChiTietDonThue
values	('DT001', 'TB001', 50, 70000, null, null, null),
		('DT002', 'TB005', 30, 90000, null, null, null),
		('DT003', 'TB003', 70, 80000, null, null, null),
		('DT004', 'TB002', 90, 70000, null, null, null),
		('DT005', 'TB005', 20, 20000, null, null, null)

--b. Thống kê các thiết bị được thuê nhiều (có tham số) (Thủ tục)
CREATE PROC PR_topThietBiDuocThueNhieu
	@top int
AS
BEGIN
	SELECT ThietBi.maThietBi, tenThietBi, SUM(soLuongDat) as tongSoluong
	FROM ChiTietDonThue 
		LEFT JOIN ThietBi
			ON ThietBi.maThietBi = ChiTietDonThue.maThietBi
	GROUP BY ThietBi.maThietBi, tenThietBi
	HAVING SUM(soLuongDat) IN (SELECT DISTINCT TOP (@top) SUM(soLuongDat)
							  FROM ChiTietDonThue
							  GROUP BY maThietBi
							  ORDER BY SUM(soLuongDat) DESC
							)
	ORDER BY tongSoluong DESC
END

--Gọi thủ tục
select *from ChiTietDonThue
EXEC PR_topThietBiDuocThueNhieu 2


	--b. Tổng tiền cho mỗi đơn thuê khi biết mã đơn hàng (Hàm)
CREATE FUNCTION FN_tongTienDonThue
(
	@maDT char(8)
)
RETURNS money
BEGIN
	RETURN(SELECT SUM(donGiaDat*soLuongDat)
		   FROM ChiTietDonThue
		   GROUP BY maDonThue
		   HAVING @maDT = maDonThue
	)
END

--Gọi hàm
SELECT maDonThue, FORMAT(dbo.FN_tongTienDonThue(maDonThue), '##,# \ VNĐ', 'es-ES') as tongTien
FROM ChiTietDonThue where maDonThue='DT001'

select *from DonThue_HopDongChoThue
select * from ChiTietDonThue

--Trigger tự động cập nhật số lượng khi insert, update, delete Chi tiết đơn thuê
CREATE OR ALTER TRIGGER TR_CTDH_Insert_Update_Delete_soLuongHienCon_ThietBi
ON ChiTietDonThue
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	IF not exists (SELECT *
					FROM inserted)
		BEGIN
			--Xóa dòng ở bảng Chi Tiết Đơn Hàng
			print N'Bạn đã xóa đơn hàng thành công'
			--Cập nhật lại số lượng hiện còn ở bảng Sản Phẩm
			UPDATE ThietBi
			SET soluongHienCon = soluongHienCon + deleted.soLuongDat
			FROM deleted
			WHERE ThietBi.maThietBi = deleted.maThietBi
		END
	ELSE 
		IF not exists (SELECT * 
						FROM deleted) 
			BEGIN
				--Chèn dòng ở bảng Chi Tiết Đơn Hàng
				print N'Bạn đã thêm đơn hàng thành công'
				--Cập nhật lại số lượng hiện còn ở bảng Sản Phẩm
				UPDATE ThietBi
				SET soluongHienCon = soluongHienCon - inserted.soLuongDat
				FROM inserted
				WHERE ThietBi.maThietBi = inserted.maThietBi
				IF exists(SELECT *
						  FROM ThietBi, inserted
						  WHERE ThietBi.maThietBi = inserted.maThietBi AND  soluongHienCon < 0)
						  rollback;		--Lưu ý: khi cập nhật số lượng hiện còn ở bảng SanPham, nếu sau khi trừ mà số lượng hiện còn bị âm
										--(số lượng mua vượt số lượng hiện có) thì thực hiện rollback để trả lại trạng thái trước khi trigger được thực hiện.
			END
		ELSE 
			BEGIN
				--Cập nhật dòng ở bảng Chi Tiết Đơn Hàng
				print N'Bạn đã cập nhật đơn hàng thành công'
				--Cập nhật lại số lượng hiện còn ở bảng Chi Tiết Đơn Hàng
				UPDATE ThietBi
				SET soluongHienCon = soluongHienCon + deleted.soLuongDat - inserted.soLuongDat
				FROM inserted, deleted
				WHERE ThietBi.maThietBi = inserted.maThietBi AND ThietBi.maThietBi = deleted.maThietBi
			END
END
GO

select * from ChiTietDonThue
select * from ThietBi
select *from DonThue_HopDongChoThue
	--INSERT vào ChiTietDonThue
	INSERT INTO ChiTietDonThue
	VALUES ('DT006', 'TB002', 50, null, null, null, null),
		   ('DT006', 'TB003', 30, null, null, null, null)

	--DELETE đơn hàng ChiTietDonThue
	DELETE ChiTietDonThue
	WHERE maDonThue = 'DT006' and maThietBi = 'TB002'

	--UPDATE đơn hàng ChiTietDonThue
	UPDATE ChiTietDonThue
	SET maThietBi = 'TB001'
	WHERE maDonThue = 'DT006' and maThietBi = 'TB002'

--Hàm tự động tăng id bảng DonThue_HopDongChoThue
CREATE FUNCTION FN_TuDongTangIDDonThue()
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @ID VARCHAR(20)
    
    IF (SELECT COUNT(maDonThue) FROM DonThue_HopDongChoThue) = 0
        SET @ID = 'DT001'
    ELSE
    BEGIN
        SELECT @ID = MAX(maDonThue) FROM DonThue_HopDongChoThue
        SET @ID = CONCAT('DT',RIGHT(STR(1000+ CAST(SUBSTRING(@ID, 3, 3) AS INT) + 1),3))
    END
    
    RETURN @ID
END

--Trigger tự động tăng ID ở bảng [DonThue_HopDongChoThue]
CREATE OR ALTER TRIGGER TR_DonThue_TuDongTangID
ON [DonThue_HopDongChoThue]
FOR INSERT
AS
BEGIN
	update DonThue_HopDongChoThue set maDonThue = dbo.FN_TuDongTangIDDonThue() where maDonThue = ''
END

select *from [DonThue_HopDongChoThue]
select * from ChiTietDonThue
insert into DonThue_HopDongChoThue
values ('', '29/01/2022', 'TT002', '08132101607', 'HD001',NULL,NULL, 'BT', 'KH001', 'NV001', NULL)



--2. Tự động cập nhật giá trị cột DonGia vào bảng ChiTietDonThue sau khi insert/ update/ delete vào bảng ChiTietDonHang; 

CREATE OR ALTER TRIGGER TR_CTDH_Insert_Update_Delete_donGia_ChiTietDonThue
ON ChiTietDonThue
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	IF not exists (SELECT *
				   FROM inserted)
		BEGIN
			--Xóa dòng ở bảng Chi Tiết Đơn Hàng
			print N'Bạn đã xóa đơn hàng thành công'
		END
	ELSE
		IF not exists (SELECT *
					   FROM deleted)
			BEGIN
				--Chèn dòng ở bảng Chi Tiết Đơn Hàng
				print N'Bạn đã chèn đơn hàng thành công'
				--Cập  nhật cột đơn giá vào bảng ChiTietDonHang
				UPDATE ChiTietDonThue
				SET donGiaDat = ThietBi.donGiaThue
				FROM ThietBi, inserted
				WHERE ThietBi.maThietBi = inserted.maThietBi AND ThietBi.maThietBi = ChiTietDonThue.maThietBi AND ChiTietDonThue.maDonThue = inserted.maDonThue
			END
		ELSE
			BEGIN
				--Cập nhật dòng ở bảng ChiTietDonHang
				print N'Bạn đã cập nhật đơn hàng thành công'
				--Cập nhật cột đơn giá vào bảng ChiTietDonHang
				UPDATE ChiTietDonThue
				SET donGiaDat = ThietBi.donGiaThue
				FROM ThietBi, inserted
				WHERE ThietBi.maThietBi = inserted.maThietBi AND ThietBi.maThietBi = ChiTietDonThue.maThietBi AND ChiTietDonThue.maDonThue = inserted.maDonThue
			END
END

select * from ChiTietDonThue
select * from ThietBi
	--INSERT vào ChiTietDonHang
	INSERT INTO ChiTietDonThue
	VALUES ('DT006', 'TB004', 21, null,null,null,null),
		   ('DT003', 'TB002', 21, null,null,null,null)

	--DELETE đơn hàng ChiTietDonHang
	DELETE ChiTietDonThue
	WHERE maDonThue = 'DT006' and maThietBi = 'TB001'

	--UPDATE đơn hàng ChiTietDonHang
	UPDATE ChiTietDonThue
	SET maThietBi = 'TB001'
	WHERE maDonThue = 'DT002' and maThietBi = 'TB005'
set dateformat dmy


--3. Tự động cập nhật số lượng DonGiaBan ở bảng SanPham mỗi khi insert vào bảng ChiTietPhieuNhap 
--(công thức Đơn giá nhập * 30% - 30% chính là tiền lời);

CREATE OR ALTER TRIGGER TR_CTPN_Insert_Update_Delete_donGiaBan_SanPham
ON ChiTietPhieuNhap
FOR INSERT
AS
BEGIN
	--Chèn dòng ở bảng Chi Tiết Phiếu Nhập
	print N'Bạn đã chèn phiếu nhập thành công'
	--Cập nhật số lượng DonGiaBan ở bảng SanPham
	UPDATE ThietBi
	SET donGiaThue = inserted.giaNhap + (inserted.giaNhap*0.3)
	FROM ChiTietPhieuNhap, inserted
	WHERE ChiTietPhieuNhap.maPN = inserted.maPN AND inserted.maThietBi = ThietBi.maThietBi AND ChiTietPhieuNhap.maThietBi = ThietBi.maThietBi
END

/*select * from ChiTietPhieuNhap
select * from ThietBi
select * from SanPham*/
	--Chèn đơn nhập vào bảng Chi tiết Phiếu Nhập
	INSERT INTO ChiTietPhieuNhap
	VALUES ('PN0001', 'TB002', 100, 2000)

--4. Tự động cập nhật số lượng hiện còn ở bảng SanPham mỗi khi insert/ update/ delete vào bảng ChiTietPhieuNhap
CREATE OR ALTER TRIGGER TR_CTPN_Insert_Update_Delete_soLuongHienCon_SanPham
ON ChiTietPhieuNhap
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	IF not exists (SELECT *
				  FROM deleted)
		BEGIN
			--Chèn đơn nhập vào bảng ChiTietPhieuNhap
			print N'Bạn đã nhập đơn hàng thành công'
			--Cập nhật số lượng hiện còn ở bảng Sản Phẩm
			UPDATE ThietBi
			SET soluongHienCon = soluongHienCon + inserted.soLuongNhap
			FROM inserted
			WHERE ThietBi.maThietBi = inserted.maThietBi
		END
	ELSE 
		IF not exists (SELECT *
					   FROM inserted)
			BEGIN
				--Xóa đơn nhập ở bảng ChiTietPhieuNhap
				print N'Bạn đã xóa đơn nhập thành công'
				--Cập nhật số lượng hiện còn ở bảng Sản Phẩm
				UPDATE ThietBi
				SET soluongHienCon = soluongHienCon + deleted.soLuongNhap
				FROM deleted
				WHERE ThietBi.maThietBi = deleted.maThietBi
			END
		ELSE 
			BEGIN
				--Cập nhật đơn nhập ở bảng ChiTietPhieuNhap
				print N'Bạn đã cập nhật đơn nhập thành công'
				--Cập nhật số lượng hiện còn ở bảng Sản Phẩm
				UPDATE ThietBi
				SET soluongHienCon = soluongHienCon + inserted.soLuongNhap - deleted.soLuongNhap
				FROM inserted, deleted
				WHERE ThietBi.maThietBi = inserted.maThietBi AND ThietBi.maThietBi = deleted.maThietBi
			END
END
/*select * from SanPham
select *from ChiTietPhieuNhap*/
	--Chèn đơn nhập vào ChiTietPhieuNhap
	INSERT INTO ChiTietPhieuNhap
	VALUES ('PN0002', 'TB002', 300, 9000),
		   ('PN0003', 'TB001', 500, 19000)

	--Xóa đơn nhập ở bảng ChiTietPhieuNhap
	DELETE ChiTietPhieuNhap
	WHERE maPN = 'PN0002' AND maThietBi = 'TB001'

	--Cập nhật đơn nhập ở bảng ChiTietPhieuNhap
	UPDATE ChiTietPhieuNhap
	SET soLuongNhap = 100
	WHERE maPN = 'PN0001' AND maThietBi = 'TB002'

--d. Hiển thị những đơn hàng của khách hàng ở Đà Nẵng hoặc Quảng Nam

SELECT DISTINCT maDonThue, ngayTaoDon, SDTGiaoHang, tenThonTo, tenPhuongXa, tenQuanHuyen, tenTinhThanh, ghiChu
FROM KhachHang, DonThue_HopDongChoThue, PhuongXa, QuanHuyen, TinhThanh, ThonTo
WHERE KhachHang.maKH=DonThue_HopDongChoThue.maKH 
	AND KhachHang.diaChiKH=ThonTo.idThonTo 
	AND PhuongXa.quanHuyenNo=QuanHuyen.idQuanHuyen
	AND QuanHuyen.tinhThanhNo=TinhThanh.idTinhThanh
	AND DonThue_HopDongChoThue.diachiGiaoHang = ThonTo.idThonTo
	--AND (tenTinhThanh IN(N'Đà Nẵng', N'Quảng Nam'))
go

select * from DonThue_HopDongChoThue
select * from ChiTietDonThue