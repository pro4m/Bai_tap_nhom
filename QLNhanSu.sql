USE [master]
GO
/****** Object:  Database [QuanLyNhanSu]    Script Date: 11/30/2015 14:47:53 ******/
CREATE DATABASE [QuanLyNhanSu] ON  PRIMARY 
( NAME = N'QuanLyNhanSu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QuanLyNhanSu.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyNhanSu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QuanLyNhanSu_log.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyNhanSu] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyNhanSu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET ARITHABORT OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_CLOSE ON
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QuanLyNhanSu] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QuanLyNhanSu] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET  DISABLE_BROKER
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [QuanLyNhanSu] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET  READ_WRITE
GO
ALTER DATABASE [QuanLyNhanSu] SET RECOVERY FULL
GO
ALTER DATABASE [QuanLyNhanSu] SET  MULTI_USER
GO
ALTER DATABASE [QuanLyNhanSu] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [QuanLyNhanSu] SET DB_CHAINING OFF
GO
USE [QuanLyNhanSu]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 11/30/2015 14:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[HoTen] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NULL,
	[QueQuan] [nvarchar](50) NULL,
	[HeSoLuong] [float] NULL,
	[DonVi] [nvarchar](50) NULL,
	[SoDT] [char](15) NULL,
	[SoCMND] [char](15) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NHANVIEN] ([HoTen], [NgaySinh], [QueQuan], [HeSoLuong], [DonVi], [SoDT], [SoCMND]) VALUES (N'Nguyễn Chí Công', CAST(0x941C0B00 AS Date), N'Bắc Quang-Hà Giang', 2, N'Hậu cần', N'21312          ', N'21321312       ')
INSERT [dbo].[NHANVIEN] ([HoTen], [NgaySinh], [QueQuan], [HeSoLuong], [DonVi], [SoDT], [SoCMND]) VALUES (N'Nguyễn Đức Cảnh', NULL, N'An Cường-Ý Yên-Nam Định', 1, N'Kế toán', N'9899838        ', N'223232         ')
INSERT [dbo].[NHANVIEN] ([HoTen], [NgaySinh], [QueQuan], [HeSoLuong], [DonVi], [SoDT], [SoCMND]) VALUES (N'Lê Tuấn Minh ', NULL, N'Nghĩa Tân-Cầu Giấy-Hà Nội', 2, N'Kĩ thuật', N'2342342        ', N'232342342      ')
INSERT [dbo].[NHANVIEN] ([HoTen], [NgaySinh], [QueQuan], [HeSoLuong], [DonVi], [SoDT], [SoCMND]) VALUES (N'Lưu Văn Lâm', CAST(0xC41A0B00 AS Date), N'An Hòa-An Dương-Hải Phòng', 1, N'QLHV', N'963449622      ', N'31769291       ')
INSERT [dbo].[NHANVIEN] ([HoTen], [NgaySinh], [QueQuan], [HeSoLuong], [DonVi], [SoDT], [SoCMND]) VALUES (N'Luong Van Luan', CAST(0x241C0B00 AS Date), N'Bac Giang', 1, N'QLHV', N'0194873492     ', N'3949775834     ')
INSERT [dbo].[NHANVIEN] ([HoTen], [NgaySinh], [QueQuan], [HeSoLuong], [DonVi], [SoDT], [SoCMND]) VALUES (N'Nguyen Anh Dung', CAST(0xC81C0B00 AS Date), N'Ha Noi', 2, N'QLHV', N'0123456789     ', N'8459684856     ')
/****** Object:  Table [dbo].[Login_user]    Script Date: 11/30/2015 14:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login_user](
	[username] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Login_user] ([username], [pass]) VALUES (N'cong ', N'123')
INSERT [dbo].[Login_user] ([username], [pass]) VALUES (N'pro4m', N'123')
/****** Object:  StoredProcedure [dbo].[Find_NV_Ten]    Script Date: 11/30/2015 14:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Find_NV_Ten](
@hoten nvarchar(50) 
) 
AS
BEGIN
	select * from NHANVIEN
	where HoTen=@hoten
END
GO
/****** Object:  StoredProcedure [dbo].[Edit_NV]    Script Date: 11/30/2015 14:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Edit_NV](
@_socmnd char(15),
@hoten nvarchar(50), 
@ngaysinh date,
@quequan nvarchar(50), 
@hesoluong float, 
@donvi nvarchar(50),
@sodt char(15)
) 
AS
BEGIN
	update NHANVIEN
	set HoTen=@hoten, NgaySinh=@ngaysinh,QueQuan=@quequan,HeSoLuong=@hesoluong,Donvi=@donvi,SoDT=@sodt
	where SoCMND=@_socmnd
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_NV]    Script Date: 11/30/2015 14:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_NV](
@socmnd char(15)
) 
AS
BEGIN
	begin
	delete from NHANVIEN where SoCMND=@socmnd
	end
END
GO
/****** Object:  UserDefinedFunction [dbo].[Check_User]    Script Date: 11/30/2015 14:49:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Check_User](@user nvarchar(50),@pass nvarchar(50))
returns int
as
begin
	declare @kt int 
	set @kt=1
	declare @kts nvarchar(50)
	set @kts=(select username from Login_user where username=@user and pass=@pass)
	if(@kts is not null) set @kt=1
	else set @kt=0
	return @kt
end
GO
/****** Object:  UserDefinedFunction [dbo].[Check_Pass]    Script Date: 11/30/2015 14:49:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Check_Pass](@user nvarchar(50),@pass nvarchar(50))
returns table
as
return(select * from login_user where username=@user and pass=@pass)
GO
/****** Object:  UserDefinedFunction [dbo].[Check_NV]    Script Date: 11/30/2015 14:49:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Check_NV](@socmnd char(10))
returns int
as
begin
	declare @kt int 
	set @kt=1
	declare @kts char(10)
	set @kts=(select SoCMND from NHANVIEN where SoCMND=@socmnd)
	if(@kts is not null) set @kt=1
	else set @kt=0
	return @kt
end
GO
/****** Object:  StoredProcedure [dbo].[Add_NV]    Script Date: 11/30/2015 14:49:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_NV](
@hoten nvarchar(50), 
@ngaysinh date,
@quequan nvarchar(50), 
@hesoluong float, 
@donvi nvarchar(50),
@sodt char(15),
@socmnd char(15) 
) 
AS
BEGIN
	if([dbo].[Check_NV](@socmnd)=0)
	begin
	insert into NHANVIEN(HoTen,NgaySinh,QueQuan,HeSoLuong,DonVi,SoDT,SoCMND)
	values(@hoten,@ngaysinh,@quequan,@hesoluong,@donvi,@sodt,@socmnd)
	end
END
GO
