USE [master]
GO
/****** Object:  Database [QuanLySinhVien]    Script Date: 11/15/2018 11:10:29 ******/
CREATE DATABASE [QuanLySinhVien] ON  PRIMARY 
( NAME = N'QuanLySinhVien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\QuanLySinhVien.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLySinhVien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\QuanLySinhVien_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLySinhVien] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLySinhVien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLySinhVien] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QuanLySinhVien] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QuanLySinhVien] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QuanLySinhVien] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QuanLySinhVien] SET ARITHABORT OFF
GO
ALTER DATABASE [QuanLySinhVien] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [QuanLySinhVien] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QuanLySinhVien] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [QuanLySinhVien] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QuanLySinhVien] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QuanLySinhVien] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QuanLySinhVien] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QuanLySinhVien] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QuanLySinhVien] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QuanLySinhVien] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QuanLySinhVien] SET  ENABLE_BROKER
GO
ALTER DATABASE [QuanLySinhVien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [QuanLySinhVien] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [QuanLySinhVien] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [QuanLySinhVien] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [QuanLySinhVien] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [QuanLySinhVien] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [QuanLySinhVien] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [QuanLySinhVien] SET  READ_WRITE
GO
ALTER DATABASE [QuanLySinhVien] SET RECOVERY FULL
GO
ALTER DATABASE [QuanLySinhVien] SET  MULTI_USER
GO
ALTER DATABASE [QuanLySinhVien] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [QuanLySinhVien] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLySinhVien', N'ON'
GO
USE [QuanLySinhVien]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 11/15/2018 11:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMH] [nchar](10) NOT NULL,
	[TenMH] [nvarchar](30) NULL,
	[SoTiet] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 11/15/2018 11:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKhoa] [nchar](10) NOT NULL,
	[TenKhoa] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KetQua]    Script Date: 11/15/2018 11:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KetQua](
	[MaSV] [nchar](10) NOT NULL,
	[MaMH] [nchar](10) NOT NULL,
	[LanThi] [int] NULL,
	[Diem] [float] NULL,
 CONSTRAINT [pk_ketqua] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_themMonHoc]    Script Date: 11/15/2018 11:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themMonHoc](@maMonHoc nchar(10), @tenMonHoc nvarchar(30), @soTiet int)
as 
insert into MonHoc(MaMH,TenMH,SoTiet) values (@maMonHoc, @tenMonHoc, @soTiet)
GO
/****** Object:  StoredProcedure [dbo].[sp_themKhoa]    Script Date: 11/15/2018 11:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themKhoa](@maKhoa nchar(10), @tenKhoa nvarchar(30))
as
insert into Khoa(MaKhoa, TenKhoa) values(@maKhoa, @tenKhoa)
GO
/****** Object:  StoredProcedure [dbo].[sp_themKetQua]    Script Date: 11/15/2018 11:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_themKetQua](
@maSV nchar(10), @maMH nchar(10), @lanThi int, @diem float)
as
insert into KetQua(MaSV, MaMH, LanThi, Diem) values(@maSV, @maMH, @lanThi, @diem)


GO
/****** Object:  StoredProcedure [dbo].[sp_suaMonHoc]    Script Date: 11/15/2018 11:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_suaMonHoc](@maMonHoc nchar(10), @tenMonHoc nvarchar(30), @soTiet int)
as 
update MonHoc set TenMH = @tenMonHoc, SoTiet = @soTiet
where MaMH = @maMonHoc
GO
/****** Object:  StoredProcedure [dbo].[sp_suaKhoa]    Script Date: 11/15/2018 11:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_suaKhoa](@maKhoa nchar(10), @tenKhoa nvarchar(30))
as
update Khoa set TenKhoa = @tenKhoa
where MaKhoa = @maKhoa
GO
/****** Object:  StoredProcedure [dbo].[sp_suaKetQua]    Script Date: 11/15/2018 11:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_suaKetQua](
@maSV nchar(10), @maMH nchar(10), @lanThi int, @diem float)
as 
update KetQua set LanThi = @lanThi, Diem = @diem
where MaSV = @maSV and MaMH = @maMH
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 11/15/2018 11:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSV] [nchar](10) NOT NULL,
	[HoSV] [nvarchar](30) NULL,
	[TenSV] [nvarchar](15) NULL,
	[GioiTinh] [nchar](3) NULL,
	[NgaySinh] [date] NULL,
	[NoiSinh] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Quan] [nvarchar](10) NULL,
	[MaKhoa] [nchar](10) NULL,
	[HocBong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaMonHoc]    Script Date: 11/15/2018 11:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaMonHoc](@maMonHoc nchar(10), @tenMonHoc nvarchar(30), @soTiet int)
as 
delete MonHoc where MaMH = @maMonHoc
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaKhoa]    Script Date: 11/15/2018 11:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaKhoa](@maKhoa nchar(10), @tenKhoa nvarchar(30))
as
delete Khoa where MaKhoa = MaKhoa
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaKetQua]    Script Date: 11/15/2018 11:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_xoaKetQua](
@maSV nchar(10), @maMH nchar(10), @tenKhoa nvarchar(30), @lanThi int, @diem float)
as
delete KetQua where MaSV = @maSV and MaMH = @maMH

GO
/****** Object:  StoredProcedure [dbo].[sp_themSinhVien]    Script Date: 11/15/2018 11:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_themSinhVien](@maSV nchar(10),@hoSV nvarchar(30), @tenSV nvarchar(15), @gioiTinh nchar(3), @ngaySinh date, @noiSinh nvarchar(50), @diaChi nvarchar(50), @quan nvarchar(10), @maKhoa nchar(10), @hocBong int)
as
insert into SinhVien(MaSV,HoSV,TenSV,GioiTinh,NgaySinh,NoiSinh,DiaChi,Quan,MaKhoa,HocBong) values(@maSV,@hoSV,@tenSV,@gioiTinh,@ngaySinh,@noiSinh,@diaChi,@quan,@maKhoa,@hocBong)
GO

/****** Object:  StoredProcedure [dbo].[sp_xoaSinhVien]    Script Date: 11/15/2018 11:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaSinhVien](@maSV nchar(10),@hoSV nvarchar(30), @tenSV nvarchar(15), @gioiTinh nchar(3), @ngaySinh date, @noiSinh nvarchar(50), @diaChi nvarchar(50), @quan nvarchar(10), @maKhoa nchar(10), @hocBong int)
as 
delete SinhVien where MaSV = @maSV
GO
/****** Object:  StoredProcedure [dbo].[sp_suaSinhVien]    Script Date: 11/15/2018 11:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_suaSinhVien](@maSV nchar(10),@hoSV nvarchar(30), @tenSV nvarchar(15), @gioiTinh nchar(3), @ngaySinh date, @noiSinh nvarchar(50), @diaChi nvarchar(50), @quan nvarchar(10), @maKhoa nchar(10), @hocBong int)
as
update SinhVien set TenSV = @tenSV
where MaSV = @maSV
GO
/****** Object:  ForeignKey [FK__SinhVien__MaKhoa__48CFD27E]    Script Date: 11/15/2018 11:10:33 ******/
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
