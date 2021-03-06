USE [master]
GO
/****** Object:  Database [QuanLyKhachSan]    Script Date: 12/02/2015 15:26:19 ******/
CREATE DATABASE [QuanLyKhachSan] ON  PRIMARY 
( NAME = N'QuanLyKhachSan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QuanLyKhachSan.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyKhachSan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QuanLyKhachSan_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyKhachSan] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyKhachSan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyKhachSan] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET ARITHABORT OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET AUTO_CLOSE ON
GO
ALTER DATABASE [QuanLyKhachSan] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QuanLyKhachSan] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QuanLyKhachSan] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QuanLyKhachSan] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET  DISABLE_BROKER
GO
ALTER DATABASE [QuanLyKhachSan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [QuanLyKhachSan] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [QuanLyKhachSan] SET  READ_WRITE
GO
ALTER DATABASE [QuanLyKhachSan] SET RECOVERY FULL
GO
ALTER DATABASE [QuanLyKhachSan] SET  MULTI_USER
GO
ALTER DATABASE [QuanLyKhachSan] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [QuanLyKhachSan] SET DB_CHAINING OFF
GO
USE [QuanLyKhachSan]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/02/2015 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [char](10) NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[SoCMND] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[QuocTich] [nvarchar](20) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'1         ', N'Nguyen Chi Cong', CAST(0x1D1C0B00 AS Date), NULL, N'2132324', NULL, NULL, N'Ha Giang', NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'2         ', N'Nguyen Duc Canh', CAST(0xA21B0B00 AS Date), N'Nam', N'2345545', N'44848573', NULL, N'Nam Dinh', NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'3         ', N'Luu Van Lam', CAST(0xFB160B00 AS Date), NULL, N'', NULL, NULL, N'Hai Phong', NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'4         ', N'Lê Tuấn Minh', CAST(0x76140B00 AS Date), NULL, N'', NULL, NULL, N'Ha Noi', NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'5         ', N'Nguyen Chi Cong', CAST(0xF0170B00 AS Date), NULL, N'345343535', NULL, NULL, N'Bac Giang', NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'6         ', N'Luong Van Luan', CAST(0x8B160B00 AS Date), NULL, N'687453452', NULL, NULL, N'Bac Giang', NULL)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [NgaySinh], [GioiTinh], [SoCMND], [SoDienThoai], [Email], [DiaChi], [QuocTich]) VALUES (N'7         ', N'Hoang Dinh Dat', CAST(0x79170B00 AS Date), NULL, N'6456464', NULL, NULL, N'Bac Kan', NULL)
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/02/2015 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaDichVu] [char](10) NOT NULL,
	[MaKhachHang] [char](10) NOT NULL,
	[NgayLap] [datetime] NOT NULL,
	[Tongtien] [nchar](50) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC,
	[MaKhachHang] ASC,
	[NgayLap] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 12/02/2015 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DichVu](
	[MaDichVu] [char](10) NOT NULL,
	[TenDichVu] [nvarchar](50) NULL,
	[MaNhanVienQuanLy] [char](10) NULL,
	[GiaDichVu] [int] NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DatPhong]    Script Date: 12/02/2015 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatPhong](
	[MaKhachHang] [char](10) NOT NULL,
	[MaPhong] [int] NOT NULL,
	[NgayDangKy] [datetime] NOT NULL,
	[NgayDen] [datetime] NULL,
	[NgayDi] [datetime] NULL,
	[ThanhToan] [nchar](10) NULL,
 CONSTRAINT [PK_DatPhong] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC,
	[MaPhong] ASC,
	[NgayDangKy] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DatPhong] ([MaKhachHang], [MaPhong], [NgayDangKy], [NgayDen], [NgayDi], [ThanhToan]) VALUES (N'1         ', 101, CAST(0x0000A54300000000 AS DateTime), CAST(0x0000A54700000000 AS DateTime), CAST(0x0000A56000000000 AS DateTime), N'1         ')
INSERT [dbo].[DatPhong] ([MaKhachHang], [MaPhong], [NgayDangKy], [NgayDen], [NgayDi], [ThanhToan]) VALUES (N'7         ', 101, CAST(0x0000A56200FC752B AS DateTime), CAST(0x0000A56000FC5418 AS DateTime), CAST(0x0000A56A00FC5418 AS DateTime), NULL)
/****** Object:  Table [dbo].[Phong]    Script Date: 12/02/2015 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[SoPhong] [int] NOT NULL,
	[TrangThai] [nvarchar](50) NULL,
	[Giuong] [int] NULL,
	[Chan] [int] NULL,
	[GaTrai] [int] NULL,
	[Goi] [int] NULL,
	[Quat] [int] NULL,
	[DenNgu] [int] NULL,
	[DenLon] [int] NULL,
	[Ban] [int] NULL,
	[Tu] [int] NULL,
	[GiaPhong] [int] NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[SoPhong] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Phong] ([SoPhong], [TrangThai], [Giuong], [Chan], [GaTrai], [Goi], [Quat], [DenNgu], [DenLon], [Ban], [Tu], [GiaPhong]) VALUES (101, N'Chua su dung', 1, 1, 1, 2, 1, 1, 1, 1, 2, 100000)
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/02/2015 15:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [char](10) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[SoCMND] [int] NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[SoDienThoai] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NhanVien] ([MaNhanVien], [HoTen], [username], [pass], [NgaySinh], [SoCMND], [GioiTinh], [SoDienThoai], [Email], [DiaChi]) VALUES (N'NV01      ', N'cong', N'ncc', N'123', CAST(0x941C0B00 AS Date), 123456789, N'Nam', 1239608, N'cong@gmail.com', N'Ha Giang')
/****** Object:  StoredProcedure [dbo].[ThemKH]    Script Date: 12/02/2015 15:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ThemKH](@ten nvarchar(50),@cmnd nvarchar(50),@ns datetime, @dc nvarchar(50))
as
begin
	declare @ma char(10)
	set @ma=((select COUNT(makhachhang) from KhachHang)+1)
	insert into KhachHang(MaKhachHang,TenKhachHang,SoCMND,NgaySinh,diachi)
	values(@ma,@ten,@cmnd,@ns,@dc)
end
GO
/****** Object:  StoredProcedure [dbo].[Them_DatHang]    Script Date: 12/02/2015 15:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Them_DatHang](@cmnd nvarchar(50),@maphong int,@ndk datetime, @nden datetime, @ndi datetime)
as
begin
	declare @ma char(10)
	set @ma=(select makhachhang from KhachHang where SoCMND=@cmnd)
	insert into DatPhong(MaKhachHang,MaPhong,NgayDangKy,NgayDen,NgayDi)
	values(@ma,@maphong,@ndk,@nden,@ndi)
	update Phong set TrangThai='Dang su dung' where SoPhong=@maphong
end
GO
/****** Object:  StoredProcedure [dbo].[TimPhong]    Script Date: 12/02/2015 15:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TimPhong](@tgdat datetime ,@tgtra datetime)
as
begin
	select a.* from Phong a, DatPhong b
	where b.NgayDen>@tgdat and b.NgayDi<@tgtra and b.MaPhong=a.SoPhong
end
GO
/****** Object:  StoredProcedure [dbo].[Load_KHTG]    Script Date: 12/02/2015 15:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Load_KHTG](@tgbd datetime,@tgkt datetime)
as
begin
	select a.TenKhachHang,a.NgaySinh,a.SoCMND,a.SoDienThoai,b.NgayDen,b.NgayDi,b.ThanhToan,b.MaPhong from KhachHang a, DatPhong b
	where a.MaKhachHang=b.MaKhachHang and b.NgayDen>@tgbd and b.NgayDi<@tgkt
end
GO
/****** Object:  StoredProcedure [dbo].[Load_KHTen]    Script Date: 12/02/2015 15:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Load_KHTen](@ten nvarchar(50))
as
begin
	select a.TenKhachHang,a.NgaySinh,a.SoCMND,a.SoDienThoai,b.NgayDen,b.NgayDi,b.ThanhToan,b.MaPhong from KhachHang a, DatPhong b
	where a.MaKhachHang=b.MaKhachHang and a.TenKhachHang=@ten
end
GO
/****** Object:  StoredProcedure [dbo].[Load_KHCMND]    Script Date: 12/02/2015 15:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---
create proc [dbo].[Load_KHCMND](@cmnd nvarchar(50))
as
begin
	select a.TenKhachHang,a.NgaySinh,a.SoCMND,a.SoDienThoai,b.NgayDen,b.NgayDi,b.ThanhToan,b.MaPhong from KhachHang a, DatPhong b
	where a.MaKhachHang=b.MaKhachHang and a.SoCMND=@cmnd
end
GO
/****** Object:  StoredProcedure [dbo].[Load_KhachHangDT]    Script Date: 12/02/2015 15:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Load_KhachHangDT](@tg datetime)
as
begin
	select a.TenKhachHang,a.NgaySinh,a.SoCMND,a.SoDienThoai,b.NgayDen,b.NgayDi,b.ThanhToan,b.MaPhong from KhachHang a, DatPhong b
	where a.MaKhachHang=b.MaKhachHang and b.NgayDi>@tg
end
GO
/****** Object:  StoredProcedure [dbo].[Load_KhachHangDaT]    Script Date: 12/02/2015 15:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Load_KhachHangDaT](@tg datetime)
as
begin
	select a.TenKhachHang,a.NgaySinh,a.SoCMND,a.SoDienThoai,b.NgayDen,b.NgayDi,b.ThanhToan,b.MaPhong from KhachHang a, DatPhong b
	where a.MaKhachHang=b.MaKhachHang and b.NgayDi<@tg
end
GO
/****** Object:  StoredProcedure [dbo].[Load_KhachHang]    Script Date: 12/02/2015 15:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Load_KhachHang]
as
begin
	select a.TenKhachHang,a.NgaySinh,a.SoCMND,a.SoDienThoai,b.NgayDen,b.NgayDi,b.ThanhToan,b.MaPhong from KhachHang a, DatPhong b
	where a.MaKhachHang=b.MaKhachHang
end
GO
