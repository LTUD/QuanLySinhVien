USE [master]
GO
/****** Object:  Database [QuanLySinhVien]    Script Date: 11/29/2018 10:44:04 ******/
CREATE DATABASE [QuanLySinhVien] ON  PRIMARY 
( NAME = N'QuanLySinhVien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\QuanLySinhVien.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLySinhVien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\QuanLySinhVien_log.LDF' , SIZE = 512KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[MonHoc]    Script Date: 11/29/2018 10:44:04 ******/
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
/****** Object:  Table [dbo].[Khoa]    Script Date: 11/29/2018 10:44:04 ******/
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
/****** Object:  Table [dbo].[KetQua]    Script Date: 11/29/2018 10:44:04 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_xoaMonHoc]    Script Date: 11/29/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaMonHoc](@maMonHoc nchar(10), @tenMonHoc nvarchar(30), @soTiet int)
as 
delete MonHoc where MaMH = @maMonHoc
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaKhoa]    Script Date: 11/29/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaKhoa](@maKhoa nchar(10), @tenKhoa nvarchar(30))
as
delete Khoa where MaKhoa = MaKhoa
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaKetQua]    Script Date: 11/29/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaKetQua](
@maSV nchar(10), @maMH nchar(10), @tenKhoa nvarchar(30), @lanThi int, @diem float)
as
delete KetQua where MaSV = @maSV and MaMH = @maMH
GO
/****** Object:  StoredProcedure [dbo].[sp_themMonHoc]    Script Date: 11/29/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themMonHoc](@maMonHoc nchar(10), @tenMonHoc nvarchar(30), @soTiet int)
as 
insert into MonHoc(MaMH,TenMH,SoTiet) values (@maMonHoc, @tenMonHoc, @soTiet)
GO
/****** Object:  StoredProcedure [dbo].[sp_themKhoa]    Script Date: 11/29/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themKhoa](@maKhoa nchar(10), @tenKhoa nvarchar(30))
as
insert into Khoa(MaKhoa, TenKhoa) values(@maKhoa, @tenKhoa)
GO
/****** Object:  StoredProcedure [dbo].[sp_themKetQua]    Script Date: 11/29/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themKetQua](
@maSV nchar(10), @maMH nchar(10), @lanThi int, @diem float)
as
insert into KetQua(MaSV, MaMH, LanThi, Diem) values(@maSV, @maMH, @lanThi, @diem)
GO
/****** Object:  StoredProcedure [dbo].[sp_suaMonHoc]    Script Date: 11/29/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_suaMonHoc](@maMonHoc nchar(10), @tenMonHoc nvarchar(30), @soTiet int)
as 
update MonHoc set TenMH = @tenMonHoc, SoTiet = @soTiet
where MaMH = @maMonHoc
GO
/****** Object:  StoredProcedure [dbo].[sp_suaKhoa]    Script Date: 11/29/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_suaKhoa](@maKhoa nchar(10), @tenKhoa nvarchar(30))
as
update Khoa set TenKhoa = @tenKhoa
where MaKhoa = @maKhoa
GO
/****** Object:  StoredProcedure [dbo].[sp_suaKetQua]    Script Date: 11/29/2018 10:44:04 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_layDSKetQua]    Script Date: 11/29/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_layDSKetQua](@maSV nchar(10), @maMH nchar(10), @lanThi int, @diem float)
as
select * from KetQua
GO

/****** Object:  Table [dbo].[SinhVien]    Script Date: 11/29/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSV] [nchar](10) NOT NULL,
	[HoSV] [nvarchar](20) NOT NULL,
	[TenSV] [nvarchar](30) NOT NULL,
	[GioiTinh] [nchar](10) NULL,
	[NgaySinh] [smalldatetime] NULL,
	[NoiSinh] [nvarchar](30) NULL,
	[DiaChi] [nvarchar](30) NULL,
	[MaKhoa] [nchar](20) NOT NULL,
	[Lop] [nchar](20) NULL,
	[KhoaHoc] [nvarchar](20) NULL,
	
PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

INSERT [dbo].[SinhVien] ([MaSV],[HoSV],[TenSV],[GioiTinh],[NgaySinh],[NoiSinh],[DiaChi],[MaKhoa],[Lop],[KhoaHoc]) VALUES (N'SV001', N'Phạm', N'Thanh Phong', N'Nam', CAST(N'1994-05-13 00:00:00' AS SmallDateTime),N'Bình Định', N'Bình Thạnh', N'CNTT', N'CD14TT3', N'K2014')
INSERT [dbo].[SinhVien] ([MaSV],[HoSV],[TenSV],[GioiTinh],[NgaySinh],[NoiSinh],[DiaChi],[MaKhoa],[Lop],[KhoaHoc]) VALUES (N'SV002', N'Lưu', N'Minh Tuấn', N'Nam', CAST(N'1995-08-03 00:00:00' AS SmallDateTime),N'Ninh Thuận', N'Thủ Đức', N'OT', N'CD15OT1', N'K2015')
INSERT [dbo].[SinhVien] ([MaSV],[HoSV],[TenSV],[GioiTinh],[NgaySinh],[NoiSinh],[DiaChi],[MaKhoa],[Lop],[KhoaHoc]) VALUES (N'SV003', N'Trần', N'Thu Hương', N'Nữ', CAST(N'1999-10-20 00:00:00' AS SmallDateTime),N'Khánh Hòa', N'Gò Vấp', N'QTKD', N'CD17QT2', N'K2017')
INSERT [dbo].[SinhVien] ([MaSV],[HoSV],[TenSV],[GioiTinh],[NgaySinh],[NoiSinh],[DiaChi],[MaKhoa],[Lop],[KhoaHoc]) VALUES (N'SV004', N'Võ', N'Kim Chi', N'Nữ', CAST(N'1998-12-25 00:00:00' AS SmallDateTime),N'Bình Thuận', N'Quận 9', N'KT', N'CD16KT5', N'K2016')
INSERT [dbo].[SinhVien] ([MaSV],[HoSV],[TenSV],[GioiTinh],[NgaySinh],[NoiSinh],[DiaChi],[MaKhoa],[Lop],[KhoaHoc]) VALUES (N'SV005', N'Nguyễn', N'Minh Đạt', N'Nam', CAST(N'1991-04-10 00:00:00' AS SmallDateTime),N'Phú Yên', N'Tân Bình', N'CK', N'CD11CK6', N'K2011')
INSERT [dbo].[SinhVien] ([MaSV],[HoSV],[TenSV],[GioiTinh],[NgaySinh],[NoiSinh],[DiaChi],[MaKhoa],[Lop],[KhoaHoc]) VALUES (N'SV006', N'Lê', N'Lan Nhi', N'Nữ', CAST(N'1997-03-21 00:00:00' AS SmallDateTime),N'Long An', N'Bình Tân', N'CNTT', N'CD15TT1', N'K2015')
INSERT [dbo].[SinhVien] ([MaSV],[HoSV],[TenSV],[GioiTinh],[NgaySinh],[NoiSinh],[DiaChi],[MaKhoa],[Lop],[KhoaHoc]) VALUES (N'SV007', N'Nguyễn', N'Hữu Phú', N'Nam', CAST(N'2000-01-14 00:00:00' AS SmallDateTime),N'Thanh Hóa', N'Nhà Bè', N'TA', N'CD18TA1', N'K2018')
INSERT [dbo].[SinhVien] ([MaSV],[HoSV],[TenSV],[GioiTinh],[NgaySinh],[NoiSinh],[DiaChi],[MaKhoa],[Lop],[KhoaHoc]) VALUES (N'SV008', N'Đỗ', N'Kim Quyên', N'Nữ', CAST(N'1999-11-12 00:00:00' AS SmallDateTime),N'Cần Thơ', N'Củ Chi', N'CNTT', N'CD17TT6', N'K2017')
INSERT [dbo].[SinhVien] ([MaSV],[HoSV],[TenSV],[GioiTinh],[NgaySinh],[NoiSinh],[DiaChi],[MaKhoa],[Lop],[KhoaHoc]) VALUES (N'SV009', N'Trần', N'Huyền Trang', N'Nữ', CAST(N'1998-09-29 00:00:00' AS SmallDateTime),N'Đồng Nai', N'Hiệp Bình', N'TA', N'CD16TA3', N'K2016')
INSERT [dbo].[SinhVien] ([MaSV],[HoSV],[TenSV],[GioiTinh],[NgaySinh],[NoiSinh],[DiaChi],[MaKhoa],[Lop],[KhoaHoc]) VALUES (N'SV010', N'Trương', N'Quốc Cường', N'Nam', CAST(N'1995-07-04 00:00:00' AS SmallDateTime),N'Đồng Tháp', N'Tam Bình', N'TH', N'CD14TH2', N'K2014')



/****** Object:  StoredProcedure [dbo].[Xoa_SinhVien]    Script Date: 11/29/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[Xoa_SinhVien](@MaSV nchar(10))
AS
	delete from SinhVien where MaSV = @MaSV
GO
/****** Object:  StoredProcedure [dbo].[Them_SinhVien]    Script Date: 11/29/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Them_SinhVien]
       @MaSV nchar(10),
       @HoSV nvarchar(20),
       @TenSV nvarchar(30),
       @GioiTinh nchar(10),
       @NgaySinh smalldatetime,
       @NoiSinh nvarchar(30),
       @DiaChi nvarchar(30),
       @MaKhoa nvarchar(20),
       @Lop nvarchar (20),
       @KhoaHoc nvarchar (20)
                     
AS 
     INSERT INTO dbo.SinhVien
          ( 
            MaSV,HoSV,TenSV,GioiTinh,NgaySinh,NoiSinh,DiaChi,MaKhoa,Lop,KhoaHoc     
          ) 
     VALUES 
          ( 
            @MaSV,
			@HoSV,
			@TenSV,
			@GioiTinh,
			@NgaySinh,
			@NoiSinh,
			@DiaChi,
			@MaKhoa,
			@Lop,
			@KhoaHoc
			             
          )
GO
/****** Object:  StoredProcedure [dbo].[DS_SinhVien]    Script Date: 11/29/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DS_SinhVien] 
   AS  
   SELECT * FROM SinhVien
GO
/****** Object:  StoredProcedure [dbo].[CapNhat_SinhVien]    Script Date: 11/29/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC  [dbo].[CapNhat_SinhVien](@MaSV nchar(10), @HoSV nvarchar(20), @TenSV nvarchar(30),@GioiTinh  nchar(10),@NgaySinh smalldatetime, 
@NoiSinh  nvarchar(30), @DiaChi  nvarchar(30), @MaKhoa nvarchar(20), @Lop nvarchar(20), @KhoaHoc nvarchar(20))
as
	update SinhVien
	set HoSV = @HoSV, TenSV = @TenSV, GioiTinh = @GioiTinh, NgaySinh = @NgaySinh, NoiSinh = @NoiSinh, DiaChi = @DiaChi, MaKhoa = @MaKhoa, Lop = @Lop, KhoaHoc = @KhoaHoc
	where MaSV = @maSV
GO

/****** Object:  StoredProcedure [dbo].[TimKiem_SinhVien]    Script Date: 11/29/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[TimKiem_SinhVien]
	@MaSV nchar(10)
AS
SELECT * FROM SinhVien WHERE MaSV = @MaSV
GO

/****** Object:  ForeignKey [FK__SinhVien__MaKhoa__173876EA]    Script Date: 11/29/2018 10:44:04 ******/
ALTER TABLE [dbo].[SinhVien]  WITH NOCHECK ADD CONSTRAINT [FK_SV_MaSV]FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
