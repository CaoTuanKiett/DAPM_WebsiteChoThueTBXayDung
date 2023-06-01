/*Database Cho Thuê Thiết bị xây dựng*/

/*Lệnh tạo Database*/
CREATE DATABASE Nhom16_ThietBiXayDung;
go
Use Nhom16_ThietBiXayDung
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
		FOREIGN KEY (diaChiKH) REFERENCES PhuongXa(idPhuongXa)
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
		FOREIGN KEY (diaChi) REFERENCES PhuongXa(idPhuongXa)
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

--Tạo bảng Thiết bị
CREATE TABLE ThietBi
(
	maThietBi varchar(20) primary key,
	tenThietBi nvarchar(100),
	donGiaThue money,
	soluongHienCon bigint,
	dacDiem nvarchar(1000),
	hinhAnh nvarchar(500),
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
	ghiChu nvarchar(1000),
	ngayTraHang date,
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
values('KH001',N'Nguyễn Văn A','PX020195','0765220915','NguyenVanA@gmail.com','123','QTC01'),
	  ('KH002',N'Nguyễn Văn B','PX020207','0765220115','NguyenVanB@gmail.com','123','QTC01'),
	  ('KH003',N'Nguyễn Văn C','PX020200','0765222915','NguyenVanC@gmail.com','123','QTC01'),
	  ('KH004',N'Nguyễn Văn D','PX020197','0765250915','NguyenVanD@gmail.com','123','QTC01'),
	  ('KH005',N'Nguyễn Văn E','PX020197','0765210915','NguyenVanE@gmail.com','123','QTC01'),
	  ('KH006',N'Nguyễn Văn F','PX020198','0715220915','NguyenVanF@gmail.com','123','QTC01')

--Bảng Nhân viên cho thuê
insert into NhanVienChoThue
values('NV001',N'Nguyễn Văn G','PX020195','0765980915','NguyenVanG@gmail.com','123','QTC02', 'F'),
	  ('NV002',N'Nguyễn Văn I','PX020195','0765990915','NguyenVanI@gmail.com','123','QTC02', 'M'),
	  ('NV003',N'Nguyễn Văn R','PX020195','0765910915','NguyenVanR@gmail.com','123','QTC02', 'F'),
	  ('NV004',N'Nguyễn Văn T','PX020195','0765950915','NguyenVanT@gmail.com','123','QTC02', 'M'),
	  ('NV005',N'Nguyễn Văn Y','PX020195','0765960915','NguyenVanY@gmail.com','123','QTC02', 'F'),
	  ('NV006',N'Nguyễn Văn P','PX020195','0765977915','NguyenVanP@gmail.com','123','QTC02', 'M'),
	  ('NV007',N'Nguyễn Văn H','PX020195','0765914915','NguyenVanH@gmail.com','123','QTC03', 'F')

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

---Bảng Thiết bị
insert into ThietBi(maThietBi, tenThietBi, donGiaThue, soluongHienCon, dacDiem, hinhAnh)
values	('TB001', N'Máy khoan', 40000, 250, N'Có tay Cầm', 'hinhanh1.jpg'),
		('TB002', N'Máy san', 40000, 250, N'Có tay Cầm', 'hinhanh1.jpg'),
		('TB003', N'Máy trộn', 40000, 250, N'Có tay Cầm', 'hinhanh1.jpg'),
		('TB004', N'Giàn giáo ', 40000, 250, N'Có tay Cầm', 'hinhanh1.jpg'),
		('TB005', N'Xe đẩy', 40000, 250, N'Có tay Cầm', 'hinhanh1.jpg')
set dateformat dmy

--Bảng Đơn thuê - Hợp đồng cho thuê
insert into DonThue_HopDongChoThue 
values	('DT001', '30/1/2022', 'TT001', '09283746253', N'HD001', '05/02/2022', '05/02/2022', 'BT', 'KH001' , 'NV002', null, null),
		('DT002', '06/1/2022', 'TT003', '09283746253', N'HD001', '07/01/2022', '07/01/2022', 'BT', 'KH002' , 'NV001', null, null),
		('DT003', '08/5/2022', 'TT005', '09283746253', N'HD001', '09/05/2022', '09/05/2022', 'BT', 'KH003' , 'NV005', null, null),
		('DT004', '15/6/2022', 'TT002', '09283746253', N'HD001','16/06/2022', '16/06/2022', 'ER', 'KH005' , 'NV002', null, null),
		('DT005', '30/7/2022', 'TT004', '09283746253', N'HD001', '01/08/2022', '01/08/2022', 'LL', 'KH003' , 'NV002', null, null)

-----Bảng Chi tiết phiếu nhập
insert into ChiTietPhieuNhap(maPN, maThietBi, soLuongNhap, giaNhap)
values	('PN0001', 'TB001', 20, 90000),
		('PN0002', 'TB005', 20, 90000),
		('PN0003', 'TB004', 20, 90000),
		('PN0004', 'TB003', 20, 90000),
		('PN0005', 'TB002', 20, 90000)

--Bảng Chi tiết đơn thuê
insert into ChiTietDonThue(maDonThue, maThietBi, soLuongDat, donGiaDat)
values	('DT001', 'TB001', 50, 70000),
		('DT002', 'TB005', 30, 90000),
		('DT003', 'TB003', 70, 80000),
		('DT004', 'TB002', 90, 70000),
		('DT005', 'TB005', 20, 20000)

----Hàm, thủ tục, Trigger

go
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

go
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
go
-- Gọi hàm
SELECT maDonThue, FORMAT(dbo.FN_tongTienDonThue(maDonThue), '##,# \ VNĐ', 'es-ES') as tongTien
FROM ChiTietDonThue



go


////////////////////////
CREATE TRIGGER UpdateThietBi
ON ChiTietPhieuNhap
AFTER INSERT
AS
BEGIN
    -- Cập nhật số lượng hiện còn trong bảng ThietBi
    UPDATE ThietBi
    SET soluongHienCon = soluongHienCon + inserted.soLuongNhap,
		 donGiaThue = inserted.giaNhap + (inserted.giaNhap * 0.3)
    FROM ThietBi
    INNER JOIN inserted ON ThietBi.maThietBi = inserted.maThietBi;
END;

--Test triger
SELECT * FROM ThietBi WHERE maThietBi = 'TB003';
go
INSERT INTO ChiTietPhieuNhap (maPN, maThietBi, soLuongNhap, giaNhap)
VALUES ('PN0002', 'TB003', 10, 100); -- Thay thế giá trị mã PN, mã thiết bị, số lượng nhập và giá nhập thực tế
go
SELECT * FROM ThietBi WHERE maThietBi = 'TB003'; -- Kiểm tra cột soLuongHienCon trong bảng ThietBi









///////////////////////////
SELECT *
FROM PhieuNhap PN
JOIN ChiTietPhieuNhap CTPN ON PN.maPN = CTPN.maPN
JOIN ThietBi TB ON CTPN.maThietBi = TB.maThietBi

SELECT *
FROM NhaCungCap
JOIN PhieuNhap ON NhaCungCap.maNCC = PhieuNhap.maNCC
JOIN ChiTietPhieuNhap ON PhieuNhap.maPN = ChiTietPhieuNhap.maPN
JOIN ThietBi ON ChiTietPhieuNhap.maThietBi = ThietBi.maThietBi

SELECT NhaCungCap.maNCC, NhaCungCap.tenNCC, NhaCungCap.diaChiNCC, NhaCungCap.SDT, NhaCungCap.Email, NhaCungCap.nhanVienLienHe,
       PhieuNhap.maPN, PhieuNhap.ngayNhapHang,
       ThietBi.maThietBi, ThietBi.tenThietBi, ThietBi.donGiaThue, ThietBi.soluongHienCon, ThietBi.dacDiem, ThietBi.hinhAnh,
       ChiTietPhieuNhap.soLuongNhap, ChiTietPhieuNhap.giaNhap
FROM NhaCungCap
JOIN PhieuNhap ON NhaCungCap.maNCC = PhieuNhap.maNCC
JOIN ChiTietPhieuNhap ON PhieuNhap.maPN = ChiTietPhieuNhap.maPN
JOIN ThietBi ON ChiTietPhieuNhap.maThietBi = ThietBi.maThietBi



SELECT ThietBi.maThietBi, ThietBi.tenThietBi, ThietBi.donGiaThue, ThietBi.soluongHienCon, ThietBi.dacDiem, ThietBi.hinhAnh,NhaCungCap.tenNCC
FROM NhaCungCap
JOIN PhieuNhap ON NhaCungCap.maNCC = PhieuNhap.maNCC
JOIN ChiTietPhieuNhap ON PhieuNhap.maPN = ChiTietPhieuNhap.maPN
JOIN ThietBi ON ChiTietPhieuNhap.maThietBi = ThietBi.maThietBi

select *
from PhieuNhap

select *
from ChiTietPhieuNhap





SELECT PhieuNhap.maPN, ChiTietPhieuNhap.maThietBi, ChiTietPhieuNhap.soLuongNhap, ChiTietPhieuNhap.giaNhap, PhieuNhap.ngayNhapHang, NhaCungCap.maNCC, NhaCungCap.tenNCC
FROM ChiTietPhieuNhap
JOIN PhieuNhap ON PhieuNhap.maPN = ChiTietPhieuNhap.maPN
JOIN NhaCungCap ON NhaCungCap.maNCC = PhieuNhap.maNCC





