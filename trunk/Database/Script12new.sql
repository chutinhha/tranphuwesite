/****** Object:  Table [dbo].[HocSinh]    Script Date: 08/24/2011 10:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HocSinh]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HocSinh](
	[MaHS] [nvarchar](50) NOT NULL,
	[HoHS] [nvarchar](20) NULL,
	[TenHS] [nvarchar](10) NULL,
	[NgaySinh] [datetime] NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [float] NULL,
 CONSTRAINT [PK_HocSinh] PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PhanBan]    Script Date: 08/24/2011 10:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhanBan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PhanBan](
	[Ban] [nvarchar](5) NOT NULL,
	[MonHoc] [nvarchar](5) NULL,
	[HeSoDiem] [int] NULL,
 CONSTRAINT [PK_PhanBan] PRIMARY KEY CLUSTERED 
(
	[Ban] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DiemTK]    Script Date: 08/24/2011 10:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DiemTK]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DiemTK](
	[MaHS] [nvarchar](50) NOT NULL,
	[NamHoc] [nvarchar](20) NOT NULL,
	[HocKy] [int] NOT NULL,
	[Hoa] [float] NULL,
	[Ly] [float] NULL,
	[TB] [float] NULL,
	[HocLuc] [nvarchar](10) NULL,
	[HanhKiem] [nvarchar](5) NULL,
	[Toan] [float] NULL,
	[DanhHieu] [float] NULL,
	[Van] [float] NULL,
	[Sinh] [float] NULL,
	[Su] [float] NULL,
	[Dia] [float] NULL,
	[NgoaiNgu] [float] NULL,
	[TinHoc] [float] NULL,
	[CongNghe] [float] NULL,
	[GDCD] [float] NULL,
	[TheChat] [float] NULL,
	[QuocPhong] [float] NULL,
 CONSTRAINT [PK_DiemTK] PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GiaoVien]    Script Date: 08/24/2011 10:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GiaoVien]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GiaoVien](
	[MaGV] [nvarchar](50) NOT NULL,
	[HoGV] [nvarchar](50) NOT NULL,
	[TenGV] [nvarchar](50) NOT NULL,
	[SDT] [float] NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[NgaySinh] [datetime] NULL,
	[AnhDaiDien] [text] NULL,
	[MoTa] [ntext] NULL,
	[BoMon] [ntext] NULL,
 CONSTRAINT [PK_GiaoVien] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 08/24/2011 10:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChucVu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChucVu](
	[MaCV] [int] IDENTITY(1,1) NOT NULL,
	[TenCV] [ntext] NOT NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LoaiTaiKhoan]    Script Date: 08/24/2011 10:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoaiTaiKhoan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoaiTaiKhoan](
	[LoaiTK] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_LoaiTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[LoaiTK] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LoaiTinTuc]    Script Date: 08/24/2011 10:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoaiTinTuc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoaiTinTuc](
	[MaLoaiTin] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiTin] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_LoaiTinTuc] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTin] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 08/24/2011 10:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Quyen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](200) NOT NULL,
	[MoTa] [ntext] NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TaiNguyen]    Script Date: 08/24/2011 10:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaiNguyen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TaiNguyen](
	[MaTaiNguyen] [int] IDENTITY(1,1) NOT NULL,
	[TenTaiNguyen] [nvarchar](200) NOT NULL,
	[Link] [ntext] NULL,
	[MoTa] [ntext] NULL,
 CONSTRAINT [PK_TaiNguyen] PRIMARY KEY CLUSTERED 
(
	[MaTaiNguyen] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ToChuc]    Script Date: 08/24/2011 10:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ToChuc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ToChuc](
	[MaTC] [int] IDENTITY(1,1) NOT NULL,
	[TenToChuc] [nvarchar](200) NOT NULL,
	[MoTa] [ntext] NULL,
 CONSTRAINT [PK_ToChuc] PRIMARY KEY CLUSTERED 
(
	[MaTC] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LopHoc]    Script Date: 08/24/2011 10:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LopHoc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LopHoc](
	[Lop] [nvarchar](6) NOT NULL,
	[MaHS] [nvarchar](50) NULL,
	[NamHoc] [nvarchar](20) NOT NULL,
	[Ban] [nvarchar](5) NULL,
 CONSTRAINT [PK_LopHoc] PRIMARY KEY CLUSTERED 
(
	[Lop] ASC,
	[NamHoc] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DiemMonHoc]    Script Date: 08/24/2011 10:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DiemMonHoc]') AND type in (N'U'))
BEGIN
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
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PhanCongGV]    Script Date: 08/24/2011 10:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhanCongGV]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PhanCongGV](
	[MaGV] [nvarchar](50) NOT NULL,
	[Lop] [nvarchar](50) NOT NULL,
	[NamHoc] [nvarchar](20) NOT NULL,
	[HocKy] [int] NOT NULL,
	[MonHoc] [nvarchar](50) NOT NULL,
	[TenGV] [nvarchar](50) NULL,
	[GVChuNhiem] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_PhanCongGV] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC,
	[Lop] ASC,
	[NamHoc] ASC,
	[HocKy] ASC,
	[MonHoc] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ChucVu_GiaoVien]    Script Date: 08/24/2011 10:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChucVu_GiaoVien]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChucVu_GiaoVien](
	[MaGV] [nvarchar](50) NOT NULL,
	[MaCV] [int] NOT NULL,
 CONSTRAINT [PK_ChucVu_GiaoVien_1] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ToChuc_GiaoVien]    Script Date: 08/24/2011 10:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ToChuc_GiaoVien]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ToChuc_GiaoVien](
	[MaTC] [int] IDENTITY(1,1) NOT NULL,
	[MaGV] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ToChuc_GiaoVien] PRIMARY KEY CLUSTERED 
(
	[MaTC] ASC,
	[MaGV] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 08/24/2011 10:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaiKhoan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TaiKhoan](
	[TenTK] [nvarchar](50) NOT NULL,
	[MatKhau] [text] NOT NULL,
	[LoaiTK] [int] NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenTK] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 08/24/2011 10:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhanQuyen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PhanQuyen](
	[LoaiTK] [int] NOT NULL,
	[MaQuyen] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 08/24/2011 10:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TinTuc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TinTuc](
	[MaTin] [int] IDENTITY(1,1) NOT NULL,
	[MaLoaiTin] [int] NOT NULL,
	[NoiDung] [ntext] NULL,
	[NgayDang] [datetime] NOT NULL,
	[NguoiDang] [nvarchar](50) NOT NULL,
	[HinhAnhDaiDien] [text] NOT NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[MaTin] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TaiNguyen_TinTuc]    Script Date: 08/24/2011 10:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaiNguyen_TinTuc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TaiNguyen_TinTuc](
	[MaTaiNguyen] [int] NOT NULL,
	[MaTin] [int] NOT NULL,
 CONSTRAINT [PK_TaiNguyen_TinTuc] PRIMARY KEY CLUSTERED 
(
	[MaTaiNguyen] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LopHoc_HocSinh]') AND parent_object_id = OBJECT_ID(N'[dbo].[LopHoc]'))
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopHoc_HocSinh] FOREIGN KEY([MaHS])
REFERENCES [dbo].[HocSinh] ([MaHS])
GO
ALTER TABLE [dbo].[LopHoc] CHECK CONSTRAINT [FK_LopHoc_HocSinh]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LopHoc_PhanBan]') AND parent_object_id = OBJECT_ID(N'[dbo].[LopHoc]'))
ALTER TABLE [dbo].[LopHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopHoc_PhanBan] FOREIGN KEY([Ban])
REFERENCES [dbo].[PhanBan] ([Ban])
GO
ALTER TABLE [dbo].[LopHoc] CHECK CONSTRAINT [FK_LopHoc_PhanBan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DiemHK_DiemTK]') AND parent_object_id = OBJECT_ID(N'[dbo].[DiemMonHoc]'))
ALTER TABLE [dbo].[DiemMonHoc]  WITH CHECK ADD  CONSTRAINT [FK_DiemHK_DiemTK] FOREIGN KEY([MaHS])
REFERENCES [dbo].[DiemTK] ([MaHS])
GO
ALTER TABLE [dbo].[DiemMonHoc] CHECK CONSTRAINT [FK_DiemHK_DiemTK]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DiemHK_HocSinh]') AND parent_object_id = OBJECT_ID(N'[dbo].[DiemMonHoc]'))
ALTER TABLE [dbo].[DiemMonHoc]  WITH CHECK ADD  CONSTRAINT [FK_DiemHK_HocSinh] FOREIGN KEY([MaHS])
REFERENCES [dbo].[HocSinh] ([MaHS])
GO
ALTER TABLE [dbo].[DiemMonHoc] CHECK CONSTRAINT [FK_DiemHK_HocSinh]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PhanCongGV_GiaoVien]') AND parent_object_id = OBJECT_ID(N'[dbo].[PhanCongGV]'))
ALTER TABLE [dbo].[PhanCongGV]  WITH CHECK ADD  CONSTRAINT [FK_PhanCongGV_GiaoVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiaoVien] ([MaGV])
GO
ALTER TABLE [dbo].[PhanCongGV] CHECK CONSTRAINT [FK_PhanCongGV_GiaoVien]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChucVu_GiaoVien_ChucVu]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChucVu_GiaoVien]'))
ALTER TABLE [dbo].[ChucVu_GiaoVien]  WITH CHECK ADD  CONSTRAINT [FK_ChucVu_GiaoVien_ChucVu] FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[ChucVu_GiaoVien] CHECK CONSTRAINT [FK_ChucVu_GiaoVien_ChucVu]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChucVu_GiaoVien_GiaoVien]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChucVu_GiaoVien]'))
ALTER TABLE [dbo].[ChucVu_GiaoVien]  WITH CHECK ADD  CONSTRAINT [FK_ChucVu_GiaoVien_GiaoVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiaoVien] ([MaGV])
GO
ALTER TABLE [dbo].[ChucVu_GiaoVien] CHECK CONSTRAINT [FK_ChucVu_GiaoVien_GiaoVien]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ToChuc_GiaoVien_GiaoVien]') AND parent_object_id = OBJECT_ID(N'[dbo].[ToChuc_GiaoVien]'))
ALTER TABLE [dbo].[ToChuc_GiaoVien]  WITH CHECK ADD  CONSTRAINT [FK_ToChuc_GiaoVien_GiaoVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiaoVien] ([MaGV])
GO
ALTER TABLE [dbo].[ToChuc_GiaoVien] CHECK CONSTRAINT [FK_ToChuc_GiaoVien_GiaoVien]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ToChuc_GiaoVien_ToChuc1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ToChuc_GiaoVien]'))
ALTER TABLE [dbo].[ToChuc_GiaoVien]  WITH CHECK ADD  CONSTRAINT [FK_ToChuc_GiaoVien_ToChuc1] FOREIGN KEY([MaTC])
REFERENCES [dbo].[ToChuc] ([MaTC])
GO
ALTER TABLE [dbo].[ToChuc_GiaoVien] CHECK CONSTRAINT [FK_ToChuc_GiaoVien_ToChuc1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaiKhoan_LoaiTaiKhoan]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaiKhoan]'))
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_LoaiTaiKhoan] FOREIGN KEY([LoaiTK])
REFERENCES [dbo].[LoaiTaiKhoan] ([LoaiTK])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_LoaiTaiKhoan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PhanQuyen_LoaiTaiKhoan]') AND parent_object_id = OBJECT_ID(N'[dbo].[PhanQuyen]'))
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_LoaiTaiKhoan] FOREIGN KEY([LoaiTK])
REFERENCES [dbo].[LoaiTaiKhoan] ([LoaiTK])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_LoaiTaiKhoan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PhanQuyen_Quyen]') AND parent_object_id = OBJECT_ID(N'[dbo].[PhanQuyen]'))
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_Quyen]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TinTuc_LoaiTinTuc]') AND parent_object_id = OBJECT_ID(N'[dbo].[TinTuc]'))
ALTER TABLE [dbo].[TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TinTuc_LoaiTinTuc] FOREIGN KEY([MaLoaiTin])
REFERENCES [dbo].[LoaiTinTuc] ([MaLoaiTin])
GO
ALTER TABLE [dbo].[TinTuc] CHECK CONSTRAINT [FK_TinTuc_LoaiTinTuc]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaiNguyen_TinTuc_TaiNguyen]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaiNguyen_TinTuc]'))
ALTER TABLE [dbo].[TaiNguyen_TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TaiNguyen_TinTuc_TaiNguyen] FOREIGN KEY([MaTaiNguyen])
REFERENCES [dbo].[TaiNguyen] ([MaTaiNguyen])
GO
ALTER TABLE [dbo].[TaiNguyen_TinTuc] CHECK CONSTRAINT [FK_TaiNguyen_TinTuc_TaiNguyen]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaiNguyen_TinTuc_TinTuc]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaiNguyen_TinTuc]'))
ALTER TABLE [dbo].[TaiNguyen_TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TaiNguyen_TinTuc_TinTuc] FOREIGN KEY([MaTin])
REFERENCES [dbo].[TinTuc] ([MaTin])
GO
ALTER TABLE [dbo].[TaiNguyen_TinTuc] CHECK CONSTRAINT [FK_TaiNguyen_TinTuc_TinTuc]
