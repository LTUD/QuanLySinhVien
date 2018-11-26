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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Sinh Vien */
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SinhVien](
	[MaSV] [varchar](10) NOT NULL,
	[HoSV] [nvarchar](10) NOT NULL,
	[TenSV] [nvarchar](10) NOT NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[NgaySinh] [date] NULL,
	[NoiSinh] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[MaKhoa] [nchar] (10) NULL,
	[Lop] [nchar] (10) NULL,
	[KhoaHoc] [nvarchar] (10) NULL,
	
PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [MaKhoa], [Lop], [KhoaHoc]) VALUES (N'01', N'Nguyễn', N'Văn Bình', N'Nam', N'18/6/1998', N'Khánh Hòa', N'Thủ Đức', N'CNTT', N'CD16TT3', N'K16')
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [MaKhoa], [Lop], [KhoaHoc]) VALUES (N'02', N'Trần', N'Kim Chi', N'Nữ', N'20/10/1997', N'Ninh Thuận', N'Gò Vấp', N'KT', N'CD15KT1', N'K15')
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [MaKhoa], [Lop], [KhoaHoc]) VALUES (N'03', N'Lê', N'Văn Thành', N'Nam', N'11/5/1996', N'Phú Yên', N'Tân Bình', N'TA', N'CD14TA6', N'K14')
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [GioiTinh], [NgaySinh], [NoiSinh], [DiaChi], [MaKhoa], [Lop], [KhoaHoc]) VALUES (N'04', N'Bùi', N'Thanh Trà', N'Nữ', N'8/3/1998', N'Bình Định', N'Bình Tân', N'ĐH', N'CD16ĐH2', N'K16')


/*Viet StoredProcedure them Sinh Vien */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Them_SinhVien]
       @MaSV varchar(10),
       @HoSV nvarchar(10),
       @TenSV nvarchar(10),
       @GioiTinh nvarchar(3),
       @NgaySinh date,
       @NoiSinh nvarchar(50),
       @DiaChi nvarchar(50),
       @MaKhoa nchar(10),
       @Lop nchar (10),
       @KhoaHoc nvarchar (10)                
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

/*Xoa Sinh Vien */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[Xoa_SinhVien](@MaSV varchar(10))
AS
	delete from SinhVien where MaSV = @MaSV
GO
/*Cap Nhat Sinh Vien */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC  [dbo].[CapNhat_SinhVien](@MaSV varchar(10), @HoSV nvarchar(10), @TenSV nvarchar(10),@GioiTinh  nvarchar(3),@NgaySinh date, 
@NoiSinh  nvarchar(50), @DiaChi  nvarchar(50), @MaKhoa nchar(10), @Lop nchar(10), @KhoaHoc nvarchar(10))
as
	update SinhVien
	set HoSV = @HoSV, TenSV = @TenSV, GioiTinh = @GioiTinh, NgaySinh = @NgaySinh, NoiSinh = @NoiSinh, DiaChi = @DiaChi, MaKhoa = @MaKhoa, Lop = @Lop, KhoaHoc = @KhoaHoc
	where MaSV = @maSV
go
/*Viet StoredProcedure Sinh Vien */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[DS_SinhVien] 
   AS  
   SELECT * FROM SinhVien  
GO

/*Thuc thi Sinh Vien */
exec [dbo].Them_SinhVien N'05', N'Nguyễn', N'Thanh Phong', N'Nam', N'19/2/1998', N'Huế', N'Quận 1', N'CNTT', N'CD16TT3', N'K16'
exec [dbo].CapNhat_SinhVien N'05', N'Nguyễn', N'Thanh Phú', N'Nam', N'18/6/1998', N'Bình Thuận', N'Quận 1', N'CNTT', N'CD16TT3', N'K16'
SELECT * FROM SinhVien
exec [dbo].Xoa_SinhVien '05'
exec [dbo].[DS_SinhVien]

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
/****** Object:  ForeignKey [FK__SinhVien__MaKhoa__48CFD27E]    Script Date: 11/15/2018 11:10:33 ******/
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD FOREIGN KEY([MaKhoa])
REFERENCES [dbo].[Khoa] ([MaKhoa])
GO
