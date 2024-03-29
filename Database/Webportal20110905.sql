SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[LastPasswordChange] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
	[DateCreate] [datetime] NULL,
	[User_ToString] [nvarchar](100) NULL,
	[Type] [nvarchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Users', N'COLUMN',N'UserName'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên đăng nhập vào hệ thống' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'UserName'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Users', N'COLUMN',N'Password'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Password'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Users', N'COLUMN',N'LastPasswordChange'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sửa mật khẩu gần nhất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'LastPasswordChange'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Users', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Permission](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Descritption] [nvarchar](100) NULL,
	[Permission_ToString] [nvarchar](100) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Groups](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[Group_Name] [nvarchar](50) NOT NULL,
	[Group_Description] [ntext] NULL,
	[Group_ToString] [nvarchar](50) NULL,
	[Group_DateCreate] [datetime] NULL,
	[User_Create] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Groups', N'COLUMN',N'GroupID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã nhóm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Groups', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Groups', N'COLUMN',N'Group_Name'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên nhóm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Groups', @level2type=N'COLUMN',@level2name=N'Group_Name'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Groups', N'COLUMN',N'Group_Description'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả cho nhóm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Groups', @level2type=N'COLUMN',@level2name=N'Group_Description'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Groups', N'COLUMN',N'Group_ToString'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cột hiển thị text' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Groups', @level2type=N'COLUMN',@level2name=N'Group_ToString'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Groups', N'COLUMN',N'Group_DateCreate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày tạo nhóm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Groups', @level2type=N'COLUMN',@level2name=N'Group_DateCreate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Groups', N'COLUMN',N'User_Create'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Người dùng tạo nhóm này' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Groups', @level2type=N'COLUMN',@level2name=N'User_Create'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GiaoVien]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GiaoVien](
	[IDGiaoVien] [int] IDENTITY(1,1) NOT NULL,
	[HoGV] [nvarchar](500) NULL,
	[TenGV] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[DienThoai] [nvarchar](15) NULL,
	[BoMon] [nvarchar](200) NULL,
	[NgaySinh] [datetime] NULL,
	[AnhDaiDien] [nvarchar](500) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_GiaoVien] PRIMARY KEY CLUSTERED 
(
	[IDGiaoVien] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChucVu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChucVu](
	[IDCV] [int] IDENTITY(1,1) NOT NULL,
	[TenCV] [nvarchar](200) NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[IDCV] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Application]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Application](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[Application_Name] [nvarchar](500) NOT NULL,
	[Application_Description] [ntext] NULL,
	[Application_FilePath] [nvarchar](200) NULL,
	[Application_Image] [nvarchar](200) NULL,
	[Application_DateCreate] [datetime] NULL,
	[Application_ToString] [nvarchar](500) NULL,
	[Parent_Id] [int] NULL,
	[Order] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Application', N'COLUMN',N'ApplicationID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chức năng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'ApplicationID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Application', N'COLUMN',N'Application_Name'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên chức năng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Application_Name'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Application', N'COLUMN',N'Application_Description'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả chức năng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Application_Description'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Application', N'COLUMN',N'Application_FilePath'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đường dẫn tới file chức năng tương ứng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Application_FilePath'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Application', N'COLUMN',N'Application_Image'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh đại diện' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Application_Image'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Application', N'COLUMN',N'Application_DateCreate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày tạo ứng dụng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Application_DateCreate'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Application', N'COLUMN',N'Application_ToString'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên của cột hiển thị kiểu text' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Application_ToString'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Application', N'COLUMN',N'Parent_Id'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã ứng dụng root' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Parent_Id'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Application', N'COLUMN',N'Active'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Trạng thái hiển thị của ứng dụng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application', @level2type=N'COLUMN',@level2name=N'Active'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Application', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chức năng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Application'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoaiTin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LoaiTin](
	[IDLoaiTin] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](200) NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_LoaiTin] PRIMARY KEY CLUSTERED 
(
	[IDLoaiTin] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ToChuc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ToChuc](
	[IDToChuc] [int] IDENTITY(1,1) NOT NULL,
	[TenTC] [nvarchar](200) NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_ToChuc] PRIMARY KEY CLUSTERED 
(
	[IDToChuc] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaiNguyen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TaiNguyen](
	[IDTaiNguyen] [int] IDENTITY(1,1) NOT NULL,
	[TenTaiNguyen] [nvarchar](200) NULL,
	[Path] [nvarchar](200) NULL,
	[MoTa] [nvarchar](500) NULL,
 CONSTRAINT [PK_TaiNguyen] PRIMARY KEY CLUSTERED 
(
	[IDTaiNguyen] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Setting]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Setting](
	[SettingID] [int] IDENTITY(1,1) NOT NULL,
	[Setting_Name] [nvarchar](100) NULL,
	[Setting_Description] [ntext] NULL,
	[Setting_DateCreate] [datetime] NULL,
	[Value] [nvarchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[SettingID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Profile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Profile](
	[ProfileID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](50) NULL,
	[Department] [nvarchar](500) NULL,
	[Position] [nvarchar](500) NULL,
	[Image] [nvarchar](100) NULL,
	[Address] [nvarchar](500) NULL,
	[Phone] [nvarchar](15) NULL,
	[Birdthday] [datetime] NULL,
	[LastUpdateProfile] [datetime] NULL,
	[Country] [nvarchar](50) NULL,
	[Genre] [nvarchar](5) NULL,
	[Ethnic] [nvarchar](50) NULL,
	[Religion] [nvarchar](50) NULL,
	[Active] [bit] NULL,
	[CodeStaff] [int] NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Profile', N'COLUMN',N'Department'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phòng ban' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Profile', @level2type=N'COLUMN',@level2name=N'Department'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Profile', N'COLUMN',N'Position'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chức vụ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Profile', @level2type=N'COLUMN',@level2name=N'Position'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Profile', N'COLUMN',N'Genre'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giới tính' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Profile', @level2type=N'COLUMN',@level2name=N'Genre'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Profile', N'COLUMN',N'Ethnic'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dân tộc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Profile', @level2type=N'COLUMN',@level2name=N'Ethnic'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Profile', N'COLUMN',N'Religion'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tôn giáo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Profile', @level2type=N'COLUMN',@level2name=N'Religion'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InGroup](
	[InGroupID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[DateCreate] [datetime] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_UserInGroup] PRIMARY KEY CLUSTERED 
(
	[InGroupID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Log](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Trace] [nvarchar](200) NOT NULL,
	[IP] [nvarchar](50) NOT NULL,
	[Action] [nvarchar](200) NULL,
	[Time_Login] [datetime] NULL,
	[Time_Logout] [datetime] NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FilePermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FilePermission](
	[FilePermissionID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[FolderPath] [nvarchar](200) NULL,
 CONSTRAINT [PK_FilePermission] PRIMARY KEY CLUSTERED 
(
	[FilePermissionID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InRoles](
	[InRolesID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[DateCreate] [datetime] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_InRoles_1] PRIMARY KEY CLUSTERED 
(
	[InRolesID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'InRoles', N'COLUMN',N'InRolesID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã phân quyền' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InRoles', @level2type=N'COLUMN',@level2name=N'InRolesID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'InRoles', N'COLUMN',N'ApplicationID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ứng dụng được cấp quyền cho nhóm User' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InRoles', @level2type=N'COLUMN',@level2name=N'ApplicationID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'InRoles', N'COLUMN',N'GroupID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nhóm User được cấp quyền' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InRoles', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'InRoles', N'COLUMN',N'DateCreate'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày tạo phân quyền' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InRoles', @level2type=N'COLUMN',@level2name=N'DateCreate'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ToChuc_GiaoVien]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ToChuc_GiaoVien](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDGiaoVien] [int] NULL,
	[IDToChuc] [int] NULL,
 CONSTRAINT [PK_ToChuc_GiaoVien] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChucVu_GiaoVien]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChucVu_GiaoVien](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDChucVu] [int] NULL,
	[IDGiaoVien] [int] NULL,
 CONSTRAINT [PK_ChucVu_GiaoVien] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TinTuc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TinTuc](
	[IDTinTuc] [int] IDENTITY(1,1) NOT NULL,
	[IDLoaiTin] [int] NOT NULL,
	[TenTinTuc] [ntext] NULL,
	[MoTaTinTuc] [ntext] NULL,
	[NoiDung] [ntext] NULL,
	[NgayDang] [datetime] NULL,
	[NguoiDang] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](500) NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[IDTinTuc] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaiNguyen_TinTuc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TaiNguyen_TinTuc](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDTaiNguyen] [int] NULL,
	[IDTinTuc] [int] NULL,
 CONSTRAINT [PK_TaiNguyen_TinTuc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Profile_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Profile]'))
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserInGroup_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[InGroup]'))
ALTER TABLE [dbo].[InGroup]  WITH CHECK ADD  CONSTRAINT [FK_UserInGroup_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
ALTER TABLE [dbo].[InGroup] CHECK CONSTRAINT [FK_UserInGroup_Group]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserInGroup_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[InGroup]'))
ALTER TABLE [dbo].[InGroup]  WITH CHECK ADD  CONSTRAINT [FK_UserInGroup_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[InGroup] CHECK CONSTRAINT [FK_UserInGroup_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Log_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Log]'))
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FilePermission_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[FilePermission]'))
ALTER TABLE [dbo].[FilePermission]  WITH CHECK ADD  CONSTRAINT [FK_FilePermission_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
ALTER TABLE [dbo].[FilePermission] CHECK CONSTRAINT [FK_FilePermission_Group]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FilePermission_Permission]') AND parent_object_id = OBJECT_ID(N'[dbo].[FilePermission]'))
ALTER TABLE [dbo].[FilePermission]  WITH CHECK ADD  CONSTRAINT [FK_FilePermission_Permission] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permission] ([PermissionID])
GO
ALTER TABLE [dbo].[FilePermission] CHECK CONSTRAINT [FK_FilePermission_Permission]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InRoles_Application]') AND parent_object_id = OBJECT_ID(N'[dbo].[InRoles]'))
ALTER TABLE [dbo].[InRoles]  WITH CHECK ADD  CONSTRAINT [FK_InRoles_Application] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Application] ([ApplicationID])
GO
ALTER TABLE [dbo].[InRoles] CHECK CONSTRAINT [FK_InRoles_Application]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InRoles_Group]') AND parent_object_id = OBJECT_ID(N'[dbo].[InRoles]'))
ALTER TABLE [dbo].[InRoles]  WITH CHECK ADD  CONSTRAINT [FK_InRoles_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
ALTER TABLE [dbo].[InRoles] CHECK CONSTRAINT [FK_InRoles_Group]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ToChuc_GiaoVien_GiaoVien]') AND parent_object_id = OBJECT_ID(N'[dbo].[ToChuc_GiaoVien]'))
ALTER TABLE [dbo].[ToChuc_GiaoVien]  WITH CHECK ADD  CONSTRAINT [FK_ToChuc_GiaoVien_GiaoVien] FOREIGN KEY([IDGiaoVien])
REFERENCES [dbo].[GiaoVien] ([IDGiaoVien])
GO
ALTER TABLE [dbo].[ToChuc_GiaoVien] CHECK CONSTRAINT [FK_ToChuc_GiaoVien_GiaoVien]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ToChuc_GiaoVien_ToChuc]') AND parent_object_id = OBJECT_ID(N'[dbo].[ToChuc_GiaoVien]'))
ALTER TABLE [dbo].[ToChuc_GiaoVien]  WITH CHECK ADD  CONSTRAINT [FK_ToChuc_GiaoVien_ToChuc] FOREIGN KEY([IDToChuc])
REFERENCES [dbo].[ToChuc] ([IDToChuc])
GO
ALTER TABLE [dbo].[ToChuc_GiaoVien] CHECK CONSTRAINT [FK_ToChuc_GiaoVien_ToChuc]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChucVu_GiaoVien_ChucVu]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChucVu_GiaoVien]'))
ALTER TABLE [dbo].[ChucVu_GiaoVien]  WITH CHECK ADD  CONSTRAINT [FK_ChucVu_GiaoVien_ChucVu] FOREIGN KEY([IDChucVu])
REFERENCES [dbo].[ChucVu] ([IDCV])
GO
ALTER TABLE [dbo].[ChucVu_GiaoVien] CHECK CONSTRAINT [FK_ChucVu_GiaoVien_ChucVu]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ChucVu_GiaoVien_GiaoVien]') AND parent_object_id = OBJECT_ID(N'[dbo].[ChucVu_GiaoVien]'))
ALTER TABLE [dbo].[ChucVu_GiaoVien]  WITH CHECK ADD  CONSTRAINT [FK_ChucVu_GiaoVien_GiaoVien] FOREIGN KEY([IDGiaoVien])
REFERENCES [dbo].[GiaoVien] ([IDGiaoVien])
GO
ALTER TABLE [dbo].[ChucVu_GiaoVien] CHECK CONSTRAINT [FK_ChucVu_GiaoVien_GiaoVien]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TinTuc_LoaiTin]') AND parent_object_id = OBJECT_ID(N'[dbo].[TinTuc]'))
ALTER TABLE [dbo].[TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TinTuc_LoaiTin] FOREIGN KEY([IDLoaiTin])
REFERENCES [dbo].[LoaiTin] ([IDLoaiTin])
GO
ALTER TABLE [dbo].[TinTuc] CHECK CONSTRAINT [FK_TinTuc_LoaiTin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaiNguyen_TinTuc_TaiNguyen]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaiNguyen_TinTuc]'))
ALTER TABLE [dbo].[TaiNguyen_TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TaiNguyen_TinTuc_TaiNguyen] FOREIGN KEY([IDTaiNguyen])
REFERENCES [dbo].[TaiNguyen] ([IDTaiNguyen])
GO
ALTER TABLE [dbo].[TaiNguyen_TinTuc] CHECK CONSTRAINT [FK_TaiNguyen_TinTuc_TaiNguyen]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaiNguyen_TinTuc_TinTuc]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaiNguyen_TinTuc]'))
ALTER TABLE [dbo].[TaiNguyen_TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TaiNguyen_TinTuc_TinTuc] FOREIGN KEY([IDTinTuc])
REFERENCES [dbo].[TinTuc] ([IDTinTuc])
GO
ALTER TABLE [dbo].[TaiNguyen_TinTuc] CHECK CONSTRAINT [FK_TaiNguyen_TinTuc_TinTuc]
