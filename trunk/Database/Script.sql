USE [QuanLyDiem]
GO
/****** Object:  StoredProcedure [dbo].[XoaLop]    Script Date: 08/23/2011 17:58:46 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[XoaLop]
(
	@lop nvarchar(6),
	@namHoc int

)
 AS
begin 
	DELETE Lop WHERE (Lop=@lop and NamHoc=@namHoc)
end
GO
/****** Object:  StoredProcedure [dbo].[XoaTKBTheoLop]    Script Date: 08/23/2011 17:58:47 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[XoaTKBTheoLop]
(
	@lop nvarchar(6)
)
 AS
begin
DELETE TKB WHERE Lop =@lop
end
GO
/****** Object:  Table [dbo].[HocLuc]    Script Date: 08/23/2011 17:58:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocLuc](
	[LoaiHL] [nvarchar](10) NOT NULL,
	[DiemCanTren] [float] NULL,
	[DiemCanDuoi] [float] NULL,
	[DiemGioiHan] [float] NULL,
 CONSTRAINT [PK_HocLuc] PRIMARY KEY CLUSTERED 
(
	[LoaiHL] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThoiGianHoc]    Script Date: 08/23/2011 17:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThoiGianHoc](
	[HocKy] [int] NOT NULL,
	[NamHoc] [nvarchar](20) NOT NULL,
	[ThoiGianBD] [datetime] NULL,
	[ThoiGianKT] [datetime] NULL,
 CONSTRAINT [PK_ThoiGianHoc] PRIMARY KEY CLUSTERED 
(
	[HocKy] ASC,
	[NamHoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaoVien]    Script Date: 08/23/2011 17:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoVien](
	[MaGV] [nvarchar](50) NOT NULL,
	[HoGV] [nvarchar](50) NOT NULL,
	[TenGV] [nvarchar](50) NOT NULL,
	[SDT] [float] NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nchar](10) NULL,
	[NgaySinh] [datetime] NULL,
	[AnhDaiDien] [text] NULL,
	[MoTa] [ntext] NULL,
	[BoMon] [ntext] NULL,
 CONSTRAINT [PK_GiaoVien] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiemTK]    Script Date: 08/23/2011 17:58:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiemTK](
	[MaHS] [nvarchar](50) NOT NULL,
	[NamHoc] [nvarchar](20) NOT NULL,
	[HocKy] [int] NOT NULL,
	[Hoa] [nchar](10) NULL,
	[Ly] [nchar](10) NULL,
	[TB] [float] NULL,
	[HocLuc] [nchar](10) NULL,
	[HanhKiem] [nchar](10) NULL,
	[Toan] [nchar](10) NULL,
	[DanhHieu] [nchar](10) NULL,
	[Van] [nchar](10) NULL,
	[Sinh] [nchar](10) NULL,
	[Su] [nchar](10) NULL,
	[Dia] [nchar](10) NULL,
	[NgoaiNgu] [nchar](10) NULL,
	[TinHoc] [nchar](10) NULL,
	[CongNghe] [nchar](10) NULL,
	[GDCD] [nchar](10) NULL,
	[TheChat] [nchar](10) NULL,
	[QuocPhong] [nchar](10) NULL,
 CONSTRAINT [PK_DiemTK] PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HocSinh]    Script Date: 08/23/2011 17:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocSinh](
	[MaHS] [nvarchar](50) NOT NULL,
	[HoHS] [nvarchar](20) NULL,
	[TenHS] [nvarchar](10) NULL,
	[NgaySinh] [datetime] NULL,
	[Email] [nchar](10) NULL,
	[DiaChi] [nchar](10) NULL,
	[SDT] [nchar](10) NULL,
 CONSTRAINT [PK_HocSinh] PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[XoaTaiKhoan]    Script Date: 08/23/2011 17:58:46 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[XoaTaiKhoan]
	@username NVARCHAR(20)
AS BEGIN
	IF EXISTS (SELECT TK.username FROM TaiKhoan TK WHERE TK.username=@username)
	BEGIN
		DELETE FROM TaiKhoan WHERE TaiKhoan.username=@username;
	END
END
GO
/****** Object:  Table [dbo].[PhanBan]    Script Date: 08/23/2011 17:59:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanBan](
	[Ban] [nchar](1) NOT NULL,
	[MonHoc] [nchar](10) NULL,
	[HeSoDiem] [int] NULL,
 CONSTRAINT [PK_PhanBan] PRIMARY KEY CLUSTERED 
(
	[Ban] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[TaoTaiKhoan]    Script Date: 08/23/2011 17:58:44 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TaoTaiKhoan]
	@username NVARCHAR(20),
	@password NVARCHAR(20),
	@email NVARCHAR(50),
	@address NVARCHAR(500),
	@phone NVARCHAR(15),
	@hoten NVARCHAR(50),
	@quyen TINYINT,
	@ngayDK DATETIME
AS BEGIN
	DECLARE @KQ INT
	SET @KQ=0
	IF EXISTS(SELECT * FROM TaiKhoan WHERE username=@username)
		BEGIN
			SET @KQ=0
		END
	ELSE
		BEGIN
			INSERT INTO TaiKhoan(username, password, email, address, phone, HoTen, typeAccount, DateRegister) VALUES(@username, @password, @email, @address, @phone, @hoten, @quyen, @ngayDK)	
 	 		SET @KQ=1
		END
	RETURN @KQ
END
GO
/****** Object:  StoredProcedure [dbo].[ThayDoiMatKhau]    Script Date: 08/23/2011 17:58:45 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[ThayDoiMatKhau]
	@username NVARCHAR(20),
	@oldpass NVARCHAR(20),
	@newpass NVARCHAR(20)
AS BEGIN
	DECLARE @kq INT
	SET @kq=0
	IF EXISTS(SELECT * FROM TaiKhoan WHERE username=@username AND password=@oldpass)
		BEGIN
			UPDATE TaiKhoan
			SET password=@newpass
			WHERE username=@username
			SET @kq=1
		END
	ELSE
		SET @kq=0
	RETURN @kq
END
GO
/****** Object:  Table [dbo].[ToChuc]    Script Date: 08/23/2011 17:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToChuc](
	[MaTC] [int] NOT NULL,
	[TenToChuc] [nvarchar](200) NOT NULL,
	[MoTa] [ntext] NULL,
 CONSTRAINT [PK_ToChuc] PRIMARY KEY CLUSTERED 
(
	[MaTC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[LayDanhSachHocSinhTheoLopVaNamHoc]    Script Date: 08/23/2011 17:58:43 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LayDanhSachHocSinhTheoLopVaNamHoc]
 (
	@lop nvarchar(6),
	@namhoc int
)
 AS
begin

	select * from HocSinh WHERE (Lop=@lop and NamHoc=@namhoc) ORDER BY TenHS ASC
end
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 08/23/2011 17:58:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaCV] [int] NOT NULL,
	[TenCV] [ntext] NOT NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[LayDanhSachLopTheoNamHoc]    Script Date: 08/23/2011 17:58:43 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LayDanhSachLopTheoNamHoc]
 (
	@namhoc int
)
 AS
begin

	select * from Lop WHERE (NamHoc=@namhoc) ORDER BY Lop
end
GO
/****** Object:  StoredProcedure [dbo].[LayDanhSachLopTheoNamHoc1]    Script Date: 08/23/2011 17:58:43 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LayDanhSachLopTheoNamHoc1]
 (
	@namhoc int
)
 AS
begin

	select Lop from Lop WHERE (NamHoc=@namhoc) ORDER BY Lop
end
GO
/****** Object:  StoredProcedure [dbo].[LayDiem]    Script Date: 08/23/2011 17:58:44 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LayDiem]
 (@namhoc int,
@hocky int,
@monhoc nvarchar(20),
@lop nvarchar(6),
@hohs nvarchar(20),
@tenhs nvarchar(10),
@kq int output
)
 AS
begin

	select * from DiemHK WHERE (NamHoc=@namhoc and HocKy=@hocky and Lop=@lop and MonHoc=@monhoc and HoHS=@hohs and TenHS=@tenhs )
set @kq=1;
end
GO
/****** Object:  StoredProcedure [dbo].[LayLichThiTheoKhoiLop]    Script Date: 08/23/2011 17:58:44 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LayLichThiTheoKhoiLop]
(
	@khoiLop int
)
 AS
begin
SELECT * FROM LichThi WHERE KhoiLop =@khoiLop
end
GO
/****** Object:  StoredProcedure [dbo].[ThemHocSinh]    Script Date: 08/23/2011 17:58:45 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[ThemHocSinh] 
(
	@lop nvarchar(6),
	@namHoc int,
	@hoHS nvarchar(20),
	@tenHS nvarchar(10)


)
 AS

begin 
if( not exists (select * From HocSinh  WHERE  (Lop=@lop and NamHoc=@namHoc and HoHS=@hoHS and TenHS=@tenHS) ))
	begin
 	INSERT INTO HocSinh(HoHS,TenHS,Lop,NamHoc) VALUES(@hoHS,@tenHS,@lop,@namHoc);
	end
end
GO
/****** Object:  StoredProcedure [dbo].[ThemLichThi]    Script Date: 08/23/2011 17:58:45 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[ThemLichThi]
(
	@khoilop int,
	@monhoc nvarchar(15),
	@ngaythi nvarchar(15),
	@giothi nvarchar(15)
) AS
begin
INSERT INTO LichThi(KhoiLop,MonHoc,NgayThi,GioThi) VALUES(@khoilop,@monhoc,@ngaythi,@giothi)
end
GO
/****** Object:  StoredProcedure [dbo].[ThemLop]    Script Date: 08/23/2011 17:58:45 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[ThemLop]
(
	@lop nvarchar(6),
	@namHoc int

)
 AS

begin 
if( not exists (select * From Lop WHERE  (Lop=@lop and NamHoc=@namHoc)) and (@lop<>""))
	begin
 	INSERT INTO Lop(Lop,NamHoc) VALUES(@lop,@namHoc);
	end
end
GO
/****** Object:  StoredProcedure [dbo].[ThemThoiKhoaBieu]    Script Date: 08/23/2011 17:58:46 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[ThemThoiKhoaBieu]
(
	@lop nvarchar(6),
	@tiet int,
	@thu2 nvarchar(15),
	@thu3 nvarchar(15),
	@thu4 nvarchar(15),
	@thu5 nvarchar(15),
	@thu6 nvarchar(15),
	@thu7 nvarchar(15),
	@chunhat nvarchar(15)
)
 AS
begin
INSERT INTO TKB(Lop,Tiet,Thu2,Thu3,Thu4,Thu5,Thu6,Thu7,Chu_Nhat) VALUES(@lop,@tiet,@thu2,@thu3,@thu4,@thu5,@thu6,@thu7,@chunhat)
end
GO
/****** Object:  StoredProcedure [dbo].[XoaHocSinh]    Script Date: 08/23/2011 17:58:46 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[XoaHocSinh]
(
	@namHoc int,
	@lop nvarchar(6),
	@hoHS nvarchar(20),
	@tenHS nvarchar(10)
) 
AS
begin
	DELETE HocSinh where(HoHS=@hoHS and TenHS=@tenHS and lop=@lop and NamHoc=@namHoc)
end
GO
/****** Object:  StoredProcedure [dbo].[XoaLichThi]    Script Date: 08/23/2011 17:58:46 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[XoaLichThi] 
(
	@khoiLop int
)
 AS
begin
Delete LichThi Where KhoiLop=@khoiLop
end
GO
/****** Object:  Table [dbo].[LoaiTaiKhoan]    Script Date: 08/23/2011 17:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTaiKhoan](
	[LoaiTK] [int] NOT NULL,
	[TenLoai] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_LoaiTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[LoaiTK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 08/23/2011 17:59:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [int] NOT NULL,
	[TenQuyen] [nvarchar](200) NOT NULL,
	[MoTa] [ntext] NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiTinTuc]    Script Date: 08/23/2011 17:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTinTuc](
	[MaLoaiTin] [int] NOT NULL,
	[TenLoaiTin] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_LoaiTinTuc] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiNguyen]    Script Date: 08/23/2011 17:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiNguyen](
	[MaTaiNguyen] [int] NOT NULL,
	[TenTaiNguyen] [nvarchar](200) NOT NULL,
	[Link] [ntext] NULL,
	[MoTa] [ntext] NULL,
 CONSTRAINT [PK_TaiNguyen] PRIMARY KEY CLUSTERED 
(
	[MaTaiNguyen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 08/23/2011 17:58:44 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Login]
	@username NVARCHAR(20),
	@password NVARCHAR(20),
	@lastLogin DATETIME
AS BEGIN
	DECLARE @quyen INT
	SET @quyen=(SELECT typeAccount FROM TaiKhoan WHERE username=@username AND password=@password)
	IF (@quyen>0)	
	BEGIN
		UPDATE TaiKhoan
		SET LastLogin = @lastLogin
		WHERE username=@username
		RETURN @quyen
	END
	SET @quyen=0
	RETURN @quyen
END
GO
/****** Object:  StoredProcedure [dbo].[XuatDanhSach]    Script Date: 08/23/2011 17:58:47 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[XuatDanhSach]
	
AS BEGIN
	SELECT TK.username, TK.email, TK.address, TK.phone From TaiKhoan TK WHERE TK.typeAccount!=1;
END
GO
/****** Object:  Table [dbo].[PhanCongGV]    Script Date: 08/23/2011 17:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCongGV](
	[MaGV] [nvarchar](50) NOT NULL,
	[Lop] [nvarchar](50) NOT NULL,
	[NamHoc] [nvarchar](20) NOT NULL,
	[HocKy] [int] NOT NULL,
	[MonHoc] [nvarchar](50) NOT NULL,
	[TenGV] [nvarchar](50) NULL,
	[GVChuNhiem] [int] NULL,
 CONSTRAINT [PK_PhanCongGV] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC,
	[Lop] ASC,
	[NamHoc] ASC,
	[HocKy] ASC,
	[MonHoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ToChuc_GiaoVien]    Script Date: 08/23/2011 17:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToChuc_GiaoVien](
	[MaTC] [int] NOT NULL,
	[MaGV] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ToChuc_GiaoVien] PRIMARY KEY CLUSTERED 
(
	[MaTC] ASC,
	[MaGV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucVu_GiaoVien]    Script Date: 08/23/2011 17:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu_GiaoVien](
	[MaGV] [nvarchar](50) NOT NULL,
	[MaCV] [int] NOT NULL,
 CONSTRAINT [PK_ChucVu_GiaoVien_1] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiNguyen_TinTuc]    Script Date: 08/23/2011 17:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiNguyen_TinTuc](
	[MaTaiNguyen] [int] NOT NULL,
	[MaTin] [int] NOT NULL,
 CONSTRAINT [PK_TaiNguyen_TinTuc] PRIMARY KEY CLUSTERED 
(
	[MaTaiNguyen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiemMonHoc]    Script Date: 08/23/2011 17:58:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiemMonHoc](
	[MaHS] [nvarchar](50) NOT NULL,
	[MonHoc] [nvarchar](20) NOT NULL,
	[M1] [float] NULL,
	[M2] [float] NULL,
	[M3] [float] NULL,
	[D15_1] [float] NULL,
	[D15_2] [float] NULL,
	[D15_3] [float] NULL,
	[D1t_1] [float] NULL,
	[D1t_2] [float] NULL,
	[D1t_3] [float] NULL,
	[DiemThi] [float] NULL,
	[DiemTBM] [float] NULL,
	[NamHoc] [nvarchar](20) NOT NULL,
	[HocKy] [int] NOT NULL,
 CONSTRAINT [PK_DiemHK] PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC,
	[MonHoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LopHoc]    Script Date: 08/23/2011 17:59:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopHoc](
	[Lop] [nvarchar](6) NOT NULL,
	[MaHS] [nvarchar](50) NULL,
	[NamHoc] [nvarchar](20) NOT NULL,
	[Ban] [nchar](1) NULL,
 CONSTRAINT [PK_LopHoc] PRIMARY KEY CLUSTERED 
(
	[Lop] ASC,
	[NamHoc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 08/23/2011 17:59:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenTK] [nvarchar](50) NOT NULL,
	[MatKhau] [text] NOT NULL,
	[LoaiTK] [int] NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenTK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 08/23/2011 17:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[LoaiTK] [int] NOT NULL,
	[MaQuyen] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 08/23/2011 17:59:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTin] [int] NOT NULL,
	[MaLoaiTin] [int] NOT NULL,
	[NoiDung] [ntext] NULL,
	[NgayDang] [datetime] NOT NULL,
	[NguoiDang] [nvarchar](50) NOT NULL,
	[HinhAnhDaiDien] [text] NOT NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[MaTin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_ChucVu_GiaoVien_ChucVu]    Script Date: 08/23/2011 17:58:48 ******/
ALTER TABLE [dbo].[ChucVu_GiaoVien]  WITH CHECK ADD  CONSTRAINT [FK_ChucVu_GiaoVien_ChucVu] FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[ChucVu_GiaoVien] CHECK CONSTRAINT [FK_ChucVu_GiaoVien_ChucVu]
GO
/****** Object:  ForeignKey [FK_ChucVu_GiaoVien_GiaoVien]    Script Date: 08/23/2011 17:58:48 ******/
ALTER TABLE [dbo].[ChucVu_GiaoVien]  WITH CHECK ADD  CONSTRAINT [FK_ChucVu_GiaoVien_GiaoVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiaoVien] ([MaGV])
GO
ALTER TABLE [dbo].[ChucVu_GiaoVien] CHECK CONSTRAINT [FK_ChucVu_GiaoVien_GiaoVien]
GO
/****** Object:  ForeignKey [FK_DiemHK_DiemTK]    Script Date: 08/23/2011 17:58:51 ******/
ALTER TABLE [dbo].[DiemMonHoc]  WITH CHECK ADD  CONSTRAINT [FK_DiemHK_DiemTK] FOREIGN KEY([MaHS])
REFERENCES [dbo].[DiemTK] ([MaHS])
GO
ALTER TABLE [dbo].[DiemMonHoc] CHECK CONSTRAINT [FK_DiemHK_DiemTK]
GO
/****** Object:  ForeignKey [FK_DiemHK_HocSinh]    Script Date: 08/23/2011 17:58:51 ******/
ALTER TABLE [dbo].[DiemMonHoc]  WITH CHECK ADD  CONSTRAINT [FK_DiemHK_HocSinh] FOREIGN KEY([MaHS])
REFERENCES [dbo].[HocSinh] ([MaHS])
GO
ALTER TABLE [dbo].[DiemMonHoc] CHECK CONSTRAINT [FK_DiemHK_HocSinh]
GO
/****** Object:  ForeignKey [FK_LopHoc_HocSinh]    Script Date: 08/23/2011 17:59:02 ******/
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopHoc_HocSinh] FOREIGN KEY([MaHS])
REFERENCES [dbo].[HocSinh] ([MaHS])
GO
ALTER TABLE [dbo].[LopHoc] CHECK CONSTRAINT [FK_LopHoc_HocSinh]
GO
/****** Object:  ForeignKey [FK_LopHoc_PhanBan]    Script Date: 08/23/2011 17:59:02 ******/
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopHoc_PhanBan] FOREIGN KEY([Ban])
REFERENCES [dbo].[PhanBan] ([Ban])
GO
ALTER TABLE [dbo].[LopHoc] CHECK CONSTRAINT [FK_LopHoc_PhanBan]
GO
/****** Object:  ForeignKey [FK_PhanCongGV_GiaoVien]    Script Date: 08/23/2011 17:59:04 ******/
ALTER TABLE [dbo].[PhanCongGV]  WITH CHECK ADD  CONSTRAINT [FK_PhanCongGV_GiaoVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiaoVien] ([MaGV])
GO
ALTER TABLE [dbo].[PhanCongGV] CHECK CONSTRAINT [FK_PhanCongGV_GiaoVien]
GO
/****** Object:  ForeignKey [FK_PhanCongGV_ThoiGianHoc]    Script Date: 08/23/2011 17:59:05 ******/
ALTER TABLE [dbo].[PhanCongGV]  WITH CHECK ADD  CONSTRAINT [FK_PhanCongGV_ThoiGianHoc] FOREIGN KEY([HocKy], [NamHoc])
REFERENCES [dbo].[ThoiGianHoc] ([HocKy], [NamHoc])
GO
ALTER TABLE [dbo].[PhanCongGV] CHECK CONSTRAINT [FK_PhanCongGV_ThoiGianHoc]
GO
/****** Object:  ForeignKey [FK_PhanQuyen_LoaiTaiKhoan]    Script Date: 08/23/2011 17:59:05 ******/
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_LoaiTaiKhoan] FOREIGN KEY([LoaiTK])
REFERENCES [dbo].[LoaiTaiKhoan] ([LoaiTK])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_LoaiTaiKhoan]
GO
/****** Object:  ForeignKey [FK_PhanQuyen_Quyen]    Script Date: 08/23/2011 17:59:05 ******/
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_Quyen]
GO
/****** Object:  ForeignKey [FK_TaiKhoan_LoaiTaiKhoan]    Script Date: 08/23/2011 17:59:07 ******/
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_LoaiTaiKhoan] FOREIGN KEY([LoaiTK])
REFERENCES [dbo].[LoaiTaiKhoan] ([LoaiTK])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_LoaiTaiKhoan]
GO
/****** Object:  ForeignKey [FK_TaiNguyen_TinTuc_TaiNguyen]    Script Date: 08/23/2011 17:59:08 ******/
ALTER TABLE [dbo].[TaiNguyen_TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TaiNguyen_TinTuc_TaiNguyen] FOREIGN KEY([MaTaiNguyen])
REFERENCES [dbo].[TaiNguyen] ([MaTaiNguyen])
GO
ALTER TABLE [dbo].[TaiNguyen_TinTuc] CHECK CONSTRAINT [FK_TaiNguyen_TinTuc_TaiNguyen]
GO
/****** Object:  ForeignKey [FK_TaiNguyen_TinTuc_TinTuc]    Script Date: 08/23/2011 17:59:09 ******/
ALTER TABLE [dbo].[TaiNguyen_TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TaiNguyen_TinTuc_TinTuc] FOREIGN KEY([MaTin])
REFERENCES [dbo].[TinTuc] ([MaTin])
GO
ALTER TABLE [dbo].[TaiNguyen_TinTuc] CHECK CONSTRAINT [FK_TaiNguyen_TinTuc_TinTuc]
GO
/****** Object:  ForeignKey [FK_TinTuc_LoaiTinTuc]    Script Date: 08/23/2011 17:59:11 ******/
ALTER TABLE [dbo].[TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TinTuc_LoaiTinTuc] FOREIGN KEY([MaLoaiTin])
REFERENCES [dbo].[LoaiTinTuc] ([MaLoaiTin])
GO
ALTER TABLE [dbo].[TinTuc] CHECK CONSTRAINT [FK_TinTuc_LoaiTinTuc]
GO
/****** Object:  ForeignKey [FK_ToChuc_GiaoVien_GiaoVien]    Script Date: 08/23/2011 17:59:12 ******/
ALTER TABLE [dbo].[ToChuc_GiaoVien]  WITH CHECK ADD  CONSTRAINT [FK_ToChuc_GiaoVien_GiaoVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiaoVien] ([MaGV])
GO
ALTER TABLE [dbo].[ToChuc_GiaoVien] CHECK CONSTRAINT [FK_ToChuc_GiaoVien_GiaoVien]
GO
/****** Object:  ForeignKey [FK_ToChuc_GiaoVien_ToChuc1]    Script Date: 08/23/2011 17:59:12 ******/
ALTER TABLE [dbo].[ToChuc_GiaoVien]  WITH CHECK ADD  CONSTRAINT [FK_ToChuc_GiaoVien_ToChuc1] FOREIGN KEY([MaTC])
REFERENCES [dbo].[ToChuc] ([MaTC])
GO
ALTER TABLE [dbo].[ToChuc_GiaoVien] CHECK CONSTRAINT [FK_ToChuc_GiaoVien_ToChuc1]
GO
