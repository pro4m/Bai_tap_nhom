USE [master]
GO
/****** Object:  Database [QLThuVien]    Script Date: 12/2/2015 8:24:00 PM ******/
CREATE DATABASE [QLThuVien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLThuVien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLThuVien.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLThuVien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLThuVien_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLThuVien] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLThuVien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLThuVien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLThuVien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLThuVien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLThuVien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLThuVien] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLThuVien] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLThuVien] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLThuVien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLThuVien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLThuVien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLThuVien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLThuVien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLThuVien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLThuVien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLThuVien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLThuVien] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLThuVien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLThuVien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLThuVien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLThuVien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLThuVien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLThuVien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLThuVien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLThuVien] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLThuVien] SET  MULTI_USER 
GO
ALTER DATABASE [QLThuVien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLThuVien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLThuVien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLThuVien] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QLThuVien]
GO
/****** Object:  StoredProcedure [dbo].[Add_Book]    Script Date: 12/2/2015 8:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Add_Book](@ten nvarchar(50), @tacgia nvarchar(50), @sl int)
as
begin
		declare @masach nchar(50) 
		set @masach=dbo.[Add_ID](@ten)
		insert into SACH(MaSach,TenSach,TacGia,SoLuong)
		values (@masach,@ten,@tacgia,@sl)
end

GO
/****** Object:  StoredProcedure [dbo].[Add_Docgia]    Script Date: 12/2/2015 8:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Add_Docgia]( @ten nvarchar(50), @tgbd datetime, @tgkt datetime, @dv nvarchar(50))
as
begin
		declare @id nchar(10)
		 set @id = dbo.[Add_IDDG](@ten)
		insert into DocGia(MaDocGia,Ten,NgayBatDau,NgayHetHan,DonVi)
		values (@id,@ten,@tgbd,@tgkt,@dv)
end
---

GO
/****** Object:  UserDefinedFunction [dbo].[Add_ID]    Script Date: 12/2/2015 8:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Add_ID](@tl nvarchar(50))
returns nchar(50)
as
begin
	 declare @n int
	 declare @matl varchar(10)
	 set @matl=''
	 declare @tentl nvarchar(50)
	 set @tentl=@tl
	 set @n=LEN(@tl)
	 while(CHARINDEX(' ',@tentl)>0)
	 begin		
		set @matl=@matl+upper(convert(varchar(10),left(@tentl,1)))
		set @tentl=RIGHT(@tentl,@n-CHARINDEX(' ',@tentl))
		set @n=LEN(@tentl)
	 end	 
	 set @matl=@matl+upper(convert(varchar(10),left(@tentl,1)))
	 set @tentl=RIGHT(@tentl,@n-CHARINDEX(' ',@tentl))
	
	declare @sl int
	set @sl=(select COUNT(MaSach) from Sach)
	set @matl=@matl+CONVERT(char(27),@sl+1)
	return @matl
end

GO
/****** Object:  UserDefinedFunction [dbo].[Add_IDDG]    Script Date: 12/2/2015 8:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Add_IDDG](@tl nvarchar(50))
returns nchar(50)
as
begin
	 declare @n int
	 declare @matl varchar(10)
	 set @matl=''
	 declare @tentl nvarchar(50)
	 set @tentl=@tl
	 set @n=LEN(@tl)
	 while(CHARINDEX(' ',@tentl)>0)
	 begin		
		set @matl=@matl+upper(convert(varchar(10),left(@tentl,1)))
		set @tentl=RIGHT(@tentl,@n-CHARINDEX(' ',@tentl))
		set @n=LEN(@tentl)
	 end	 
	 set @matl=@matl+upper(convert(varchar(10),left(@tentl,1)))
	 set @tentl=RIGHT(@tentl,@n-CHARINDEX(' ',@tentl))
	
	declare @sl int
	set @sl=(select COUNT(MaSach) from Sach)
	set @matl=@matl+CONVERT(char(27),@sl+1)
	return @matl
end

GO
/****** Object:  Table [dbo].[DocGia]    Script Date: 12/2/2015 8:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocGia](
	[MaDocGia] [nchar](10) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[NgayBatDau] [datetime] NULL,
	[NgayHetHan] [datetime] NULL,
	[DonVi] [nvarchar](50) NULL,
 CONSTRAINT [PK_DocGia] PRIMARY KEY CLUSTERED 
(
	[MaDocGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/2/2015 8:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[username] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
	[Hoten] [nvarchar](50) NULL,
	[CMND] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sach]    Script Date: 12/2/2015 8:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [nchar](50) NOT NULL,
	[TenSach] [nvarchar](50) NULL,
	[TacGia] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[TrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongTinMuon]    Script Date: 12/2/2015 8:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinMuon](
	[MaSach] [nchar](50) NULL,
	[MaDocGia] [nchar](10) NULL,
	[Ngaymuon] [datetime] NULL,
	[Ngaytra] [datetime] NULL,
	[SoLuong] [int] NULL
) ON [PRIMARY]

GO
INSERT [dbo].[DocGia] ([MaDocGia], [Ten], [NgayBatDau], [NgayHetHan], [DonVi]) VALUES (N'HV01      ', N'Lê Công Tuấn Anh', CAST(0x0000A0C400000000 AS DateTime), CAST(0x0000A85900000000 AS DateTime), N'd3')
INSERT [dbo].[DocGia] ([MaDocGia], [Ten], [NgayBatDau], [NgayHetHan], [DonVi]) VALUES (N'HV02      ', N'Phí Xuân Đạo', CAST(0x0000A0C400000000 AS DateTime), CAST(0x0000A85900000000 AS DateTime), N'd4')
INSERT [dbo].[DocGia] ([MaDocGia], [Ten], [NgayBatDau], [NgayHetHan], [DonVi]) VALUES (N'HV03      ', N'Nguyễn Anh Dũng', CAST(0x0000A0C400000000 AS DateTime), CAST(0x0000A85900000000 AS DateTime), N'd3')
INSERT [dbo].[DocGia] ([MaDocGia], [Ten], [NgayBatDau], [NgayHetHan], [DonVi]) VALUES (N'HV04      ', N'Hoàng Đình Đạt', CAST(0x0000A0C400000000 AS DateTime), CAST(0x0000A85900000000 AS DateTime), N'd3')
INSERT [dbo].[DocGia] ([MaDocGia], [Ten], [NgayBatDau], [NgayHetHan], [DonVi]) VALUES (N'HV05      ', N'Nguyễn Mạnh Hải', CAST(0x00009F5A00000000 AS DateTime), CAST(0x0000A6EC00000000 AS DateTime), N'd3')
INSERT [dbo].[DocGia] ([MaDocGia], [Ten], [NgayBatDau], [NgayHetHan], [DonVi]) VALUES (N'HV06      ', N'Khương Huy Hoàng', CAST(0x00009F5A00000000 AS DateTime), CAST(0x0000A6EC00000000 AS DateTime), N'd2')
INSERT [dbo].[DocGia] ([MaDocGia], [Ten], [NgayBatDau], [NgayHetHan], [DonVi]) VALUES (N'HV07      ', N'Võ Khương Lĩnh', CAST(0x00009F5A00000000 AS DateTime), CAST(0x0000A6EC00000000 AS DateTime), N'd2')
INSERT [dbo].[DocGia] ([MaDocGia], [Ten], [NgayBatDau], [NgayHetHan], [DonVi]) VALUES (N'HV08      ', N'Lương Văn Luận', CAST(0x0000A24D00000000 AS DateTime), CAST(0x0000A9C600000000 AS DateTime), N'd1')
INSERT [dbo].[DocGia] ([MaDocGia], [Ten], [NgayBatDau], [NgayHetHan], [DonVi]) VALUES (N'HV09      ', N'nguyen chi cong', CAST(0x00009F5A00000000 AS DateTime), CAST(0x0000A6EC00000000 AS DateTime), N'd1')
INSERT [dbo].[DocGia] ([MaDocGia], [Ten], [NgayBatDau], [NgayHetHan], [DonVi]) VALUES (N'HV10      ', N'Đinh Ngọc San', CAST(0x0000A23A00000000 AS DateTime), CAST(0x0000A9C600000000 AS DateTime), N'd1')
INSERT [dbo].[NhanVien] ([username], [pass], [Hoten], [CMND]) VALUES (N'cong', N'123', N'Nguyễn Chí Công', N'125489574')
INSERT [dbo].[NhanVien] ([username], [pass], [Hoten], [CMND]) VALUES (N'minh', N'234', N'Lê Tuấn Minh', N'412586324')
INSERT [dbo].[NhanVien] ([username], [pass], [Hoten], [CMND]) VALUES (N'canh', N'345', N'Nguyễn Đức Cảnh', N'548965219')
INSERT [dbo].[NhanVien] ([username], [pass], [Hoten], [CMND]) VALUES (N'lam', N'456', N'Lưu Văn Lâm', N'142541365')
INSERT [dbo].[NhanVien] ([username], [pass], [Hoten], [CMND]) VALUES (N'dat', N'567', N'Hoàng Đình Đạt', N'142156324')
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [SoLuong], [TrangThai]) VALUES (N'DSTT                                              ', N'Đại Số Tuyến Tính', N'Dương Thế Tuấn', 30, NULL)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [SoLuong], [TrangThai]) VALUES (N'GT1                                               ', N'Giải Tích 1', N'Nguyễn Quốc Anh', 20, NULL)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [SoLuong], [TrangThai]) VALUES (N'GT2                                               ', N'Giải Tích 2', N'Ngô Văn Hữu', 20, NULL)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [SoLuong], [TrangThai]) VALUES (N'LG                                                ', N'Logic học', N'Trần Quang Hiếu', 25, NULL)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [SoLuong], [TrangThai]) VALUES (N'MMT                                               ', N'Mạng máy tính', N'Vũ Hữu Trọng', 30, NULL)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [SoLuong], [TrangThai]) VALUES (N'NNLTC                                             ', N'Ngôn Ngữ Lập Trình C', N'Nguyễn Trường Giang', 20, NULL)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [SoLuong], [TrangThai]) VALUES (N'TA                                                ', N'Tieng Anh', N'Nguyễn Đức Thế', 15, NULL)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [SoLuong], [TrangThai]) VALUES (N'TACC3                                             ', N'tieng anh cao cap', N'Nguyễn Việt Anh', 10, NULL)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [SoLuong], [TrangThai]) VALUES (N'TCC                                               ', N'Toán cao cấp', N'Hoàng Văn Tùng', 20, NULL)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [SoLuong], [TrangThai]) VALUES (N'TN                                                ', N'Tieng Nga', N'Tran Van An', 15, NULL)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [SoLuong], [TrangThai]) VALUES (N'TRR                                               ', N'Toán Rời Rạc', N'Hoàng Thế Anh', 25, NULL)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [SoLuong], [TrangThai]) VALUES (N'TTHCM                                             ', N'Tư Tưởng Hồ Chí Minh', N'Trần Văn Minh', 25, NULL)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [SoLuong], [TrangThai]) VALUES (N'VKT                                               ', N'Vẽ Kỹ Thuật', N'Dương Đức Giang', 20, NULL)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [SoLuong], [TrangThai]) VALUES (N'VL1                                               ', N'Vật Lý 1', N'Vũ Đình Minh', 40, NULL)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [SoLuong], [TrangThai]) VALUES (N'VL2                                               ', N'Vật Lý 2', N'Lê Văn Sơn', 40, NULL)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [TacGia], [SoLuong], [TrangThai]) VALUES (N'XSTK                                              ', N'Xác Suất Thống Kê', N'Phạm Đình Bảo', 20, NULL)
INSERT [dbo].[ThongTinMuon] ([MaSach], [MaDocGia], [Ngaymuon], [Ngaytra], [SoLuong]) VALUES (N'TA                                                ', N'HV01      ', CAST(0x0000A56100000000 AS DateTime), CAST(0x0000A5CA00000000 AS DateTime), 1)
INSERT [dbo].[ThongTinMuon] ([MaSach], [MaDocGia], [Ngaymuon], [Ngaytra], [SoLuong]) VALUES (N'TA                                                ', N'HV02      ', CAST(0x0000A56100000000 AS DateTime), CAST(0x0000A5CA00000000 AS DateTime), 1)
INSERT [dbo].[ThongTinMuon] ([MaSach], [MaDocGia], [Ngaymuon], [Ngaytra], [SoLuong]) VALUES (N'LG                                                ', N'HV03      ', CAST(0x0000A55900000000 AS DateTime), CAST(0x0000A5B500000000 AS DateTime), 2)
INSERT [dbo].[ThongTinMuon] ([MaSach], [MaDocGia], [Ngaymuon], [Ngaytra], [SoLuong]) VALUES (N'TCC                                               ', N'HV04      ', CAST(0x0000A55600000000 AS DateTime), CAST(0x0000A61600000000 AS DateTime), 3)
INSERT [dbo].[ThongTinMuon] ([MaSach], [MaDocGia], [Ngaymuon], [Ngaytra], [SoLuong]) VALUES (N'NNLTC                                             ', N'HV05      ', CAST(0x0000A55B00000000 AS DateTime), CAST(0x0000A5E900000000 AS DateTime), 5)
INSERT [dbo].[ThongTinMuon] ([MaSach], [MaDocGia], [Ngaymuon], [Ngaytra], [SoLuong]) VALUES (N'TRR                                               ', N'HV06      ', CAST(0x0000A54C00000000 AS DateTime), CAST(0x0000A5E900000000 AS DateTime), 3)
INSERT [dbo].[ThongTinMuon] ([MaSach], [MaDocGia], [Ngaymuon], [Ngaytra], [SoLuong]) VALUES (N'MMT                                               ', N'HV07      ', CAST(0x0000A55500000000 AS DateTime), CAST(0x0000A5A800000000 AS DateTime), 2)
INSERT [dbo].[ThongTinMuon] ([MaSach], [MaDocGia], [Ngaymuon], [Ngaytra], [SoLuong]) VALUES (N'TRR                                               ', N'HV08      ', CAST(0x0000A56000000000 AS DateTime), CAST(0x0000A5D200000000 AS DateTime), 5)
INSERT [dbo].[ThongTinMuon] ([MaSach], [MaDocGia], [Ngaymuon], [Ngaytra], [SoLuong]) VALUES (N'TTHCM                                             ', N'HV09      ', CAST(0x0000A55900000000 AS DateTime), CAST(0x0000A5AD00000000 AS DateTime), 1)
INSERT [dbo].[ThongTinMuon] ([MaSach], [MaDocGia], [Ngaymuon], [Ngaytra], [SoLuong]) VALUES (N'VL2                                               ', N'HV10      ', CAST(0x0000A55400000000 AS DateTime), CAST(0x0000A5CF00000000 AS DateTime), 4)
USE [master]
GO
ALTER DATABASE [QLThuVien] SET  READ_WRITE 
GO
