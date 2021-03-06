USE [master]
GO
/****** Object:  Database [QLSV]    Script Date: 12/11/2018 10:54:39 ******/
CREATE DATABASE [QLSV] ON  PRIMARY 
( NAME = N'QLSV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\QLSV.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLSV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\QLSV_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLSV] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLSV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLSV] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QLSV] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QLSV] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QLSV] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QLSV] SET ARITHABORT OFF
GO
ALTER DATABASE [QLSV] SET AUTO_CLOSE ON
GO
ALTER DATABASE [QLSV] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QLSV] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QLSV] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QLSV] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QLSV] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QLSV] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QLSV] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QLSV] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QLSV] SET  ENABLE_BROKER
GO
ALTER DATABASE [QLSV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [QLSV] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [QLSV] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [QLSV] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [QLSV] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [QLSV] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [QLSV] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [QLSV] SET  READ_WRITE
GO
ALTER DATABASE [QLSV] SET RECOVERY SIMPLE
GO
ALTER DATABASE [QLSV] SET  MULTI_USER
GO
ALTER DATABASE [QLSV] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [QLSV] SET DB_CHAINING OFF
GO
USE [QLSV]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 12/11/2018 10:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[TaiKhoan] [char](30) NULL,
	[MatKhau] [char](30) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 12/11/2018 10:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMH] [char](6) NOT NULL,
	[TenMH] [nvarchar](30) NULL,
	[SoTiet] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 12/11/2018 10:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKhoa] [char](6) NOT NULL,
	[TenKhoa] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KetQua]    Script Date: 12/11/2018 10:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KetQua](
	[MaSV] [char](6) NOT NULL,
	[MaMH] [char](6) NOT NULL,
	[DiemThi] [int] NULL,
 CONSTRAINT [pk_chinh] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_layDSMonHoc]    Script Date: 12/11/2018 10:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_layDSMonHoc](@maMH char(6),@tenMH nvarchar(30),@soTiet int)
as
select * from MonHoc
GO
/****** Object:  StoredProcedure [dbo].[sp_layDSKhoa]    Script Date: 12/11/2018 10:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_layDSKhoa](@maKhoa char(6),@tenKhoa nvarchar(30))
as
select * from Khoa
GO
/****** Object:  StoredProcedure [dbo].[sp_layDSKetQua]    Script Date: 12/11/2018 10:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_layDSKetQua](@maSV char(6),@maMH char(6),@diemThi int)
as
select * from KetQua
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 12/11/2018 10:54:48 ******/
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

/****** Object:  StoredProcedure [dbo].[sp_suaMonHoc]    Script Date: 12/11/2018 10:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_suaMonHoc](@maMH char(6),@tenMH nvarchar(30),@soTiet int)
as
update MonHoc set MaMH = @maMH,TenMH = @tenMH, SoTiet = @soTiet
where MaMH = @maMH
GO
/****** Object:  StoredProcedure [dbo].[sp_suaKhoa]    Script Date: 12/11/2018 10:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_suaKhoa](@maKhoa char(6),@tenKhoa nvarchar(30))
as
update Khoa set MaKhoa = @maKhoa,TenKhoa = @tenKhoa
where MaKhoa = @maKhoa
GO
/****** Object:  StoredProcedure [dbo].[sp_suaKetQua]    Script Date: 12/11/2018 10:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_suaKetQua](@maSV char(6),@maMH char(6),@diemThi int)
as
update KetQua set MaSV =@maSV, MaMH = @maMH, DiemThi = @diemThi
where MaSV = @maSV and MaMH = @maMH
GO
/****** Object:  StoredProcedure [dbo].[sp_layUser]    Script Date: 12/11/2018 10:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_layUser](@taiKhoan char(30),@matKhau char(30))
as
select * from NguoiDung where TaiKhoan = @taiKhoan and MatKhau = @matKhau
GO
/****** Object:  StoredProcedure [dbo].[sp_themMonHoc]    Script Date: 12/11/2018 10:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themMonHoc](@maMH char(6),@tenMH nvarchar(30),@soTiet int)
as
insert into MonHoc(MaMH,TenMH,SoTiet) values(@maMH,@tenMH,@soTiet)
GO
/****** Object:  StoredProcedure [dbo].[sp_themKhoa]    Script Date: 12/11/2018 10:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themKhoa](@maKhoa char(6),@tenKhoa nvarchar(30))
as
insert into Khoa(MaKhoa,TenKhoa) values(@maKhoa,@tenKhoa)
GO
/****** Object:  StoredProcedure [dbo].[sp_themKetQua]    Script Date: 12/11/2018 10:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themKetQua](@maSV char(6),@maMH char(6),@diemThi int)
as
insert into KetQua(MaSV,MaMH,DiemThi) values(@maSV,@maMH,@diemThi)
GO
/****** Object:  StoredProcedure [dbo].[sp_suaUser]    Script Date: 12/11/2018 10:54:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_suaUser](@taiKhoan char(30),@matKhau char(30))
as
update NguoiDung set TaiKhoan = @taiKhoan,MatKhau = @matKhau
where TaiKhoan = @taiKhoan
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaMonHoc]    Script Date: 12/11/2018 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaMonHoc](@maMH char(6),@tenMH nvarchar(30),@soTiet int)
as
delete from MonHoc where MaMH = @maMH
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaKhoa]    Script Date: 12/11/2018 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaKhoa](@maKhoa char(6),@tenKhoa nvarchar(30))
as
delete from Khoa where MaKhoa = @maKhoa
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaKetQua]    Script Date: 12/11/2018 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaKetQua](@maSV char(6),@maMH char(6),@diemThi int)
as
delete from KetQua where MaSV = @maSV and MaMH = @maMH
GO
/****** Object:  StoredProcedure [dbo].[sp_themUser]    Script Date: 12/11/2018 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_themUser](@taiKhoan char(30),@matKhau char(30))
as
insert into NguoiDung(TaiKhoan,MatKhau) values(@taiKhoan,@matKhau)
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaUser]    Script Date: 12/11/2018 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_xoaUser](@taiKhoan char(30),@matKhau char(30))
as
delete from NguoiDung where TaiKhoan = @taiKhoan
GO
/****** Object:  StoredProcedure [dbo].[sp_xoaSinhVien]    Script Date: 12/11/2018 10:54:49 ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[Xoa_SinhVien](@MaSV nchar(10))
AS
	delete from SinhVien where MaSV = @MaSV
GO
/****** Object:  StoredProcedure [dbo].[sp_themSinhVien]    Script Date: 12/11/2018 10:54:49 ******/
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

/****** Object:  StoredProcedure [dbo].[DS_SinhVien]    Script Date: 11/29/2018 10:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DS_SinhVien] 
   AS  
   SELECT * FROM SinhVien
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

