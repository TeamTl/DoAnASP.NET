USE [master]
GO
/****** Object:  Database [KARMA]    Script Date: 12/10/2019 11:34:14 AM ******/
CREATE DATABASE [KARMA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KARMA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\KARMA.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KARMA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\KARMA_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KARMA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KARMA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KARMA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KARMA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KARMA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KARMA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KARMA] SET ARITHABORT OFF 
GO
ALTER DATABASE [KARMA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KARMA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KARMA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KARMA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KARMA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KARMA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KARMA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KARMA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KARMA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KARMA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KARMA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KARMA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KARMA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KARMA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KARMA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KARMA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KARMA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KARMA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KARMA] SET  MULTI_USER 
GO
ALTER DATABASE [KARMA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KARMA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KARMA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KARMA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [KARMA] SET DELAYED_DURABILITY = DISABLED 
GO
USE [KARMA]
GO
/****** Object:  Table [dbo].[CT_XE]    Script Date: 12/10/2019 11:34:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CT_XE](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idxe] [int] NULL,
	[khoiluong] [varchar](20) NULL,
	[dai_rong_cao] [varchar](20) NULL,
	[dungtichxang] [varchar](20) NULL,
	[kichcolopxe] [varchar](20) NULL,
	[loaidongco] [varchar](20) NULL,
	[d_hanhtrinhpitong] [varchar](20) NULL,
	[tysonen] [varchar](20) NULL,
	[congsuat] [varchar](20) NULL,
	[momencucdai] [varchar](20) NULL,
	[dungtichnhot] [varchar](20) NULL,
	[loaitruyendong] [varchar](20) NULL,
 CONSTRAINT [PK_CT_XE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTHOADON]    Script Date: 12/10/2019 11:34:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHOADON](
	[iddonhang] [int] NOT NULL,
	[idsanpham] [int] NOT NULL,
	[soluong] [int] NULL,
	[dongia] [int] NULL,
 CONSTRAINT [PK_CTHOADON] PRIMARY KEY CLUSTERED 
(
	[iddonhang] ASC,
	[idsanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HANGXE]    Script Date: 12/10/2019 11:34:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANGXE](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tenhanhxe] [nvarchar](50) NULL,
	[diachi] [nvarchar](50) NULL,
	[trangthai] [bit] NULL CONSTRAINT [DF_HANGXE_trangthai]  DEFAULT ((1)),
	[ghichu] [ntext] NULL,
 CONSTRAINT [PK_HANGXE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 12/10/2019 11:34:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ngaymua] [date] NULL,
	[diachigiaohang] [nvarchar](50) NULL,
	[ghichu] [ntext] NULL,
	[tongtien] [int] NULL,
	[idnhanvien] [int] NULL,
	[idkhachhang] [int] NULL,
 CONSTRAINT [PK_HOADON] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 12/10/2019 11:34:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[gioitinh] [bit] NULL,
	[sdt] [char](11) NULL,
	[diachi] [nvarchar](50) NULL,
	[email] [varchar](50) NULL CONSTRAINT [DF_Table_5_trangthai]  DEFAULT ((1)),
	[trangthai] [bit] NULL CONSTRAINT [DF_KHACHHANG_trangthai]  DEFAULT ((1)),
	[ghichu] [ntext] NULL,
	[tentaikhoan] [varchar](20) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOAIXE]    Script Date: 12/10/2019 11:34:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIXE](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tenloai] [nvarchar](30) NULL,
	[trangthai] [bit] NULL CONSTRAINT [DF_LOAIXE_trangthai]  DEFAULT ((1)),
	[ghichu] [nvarchar](max) NULL,
 CONSTRAINT [PK_LOAIXE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 12/10/2019 11:34:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hotennv] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[gioitinh] [bit] NULL,
	[diachi] [nvarchar](max) NULL,
	[sdt] [int] NULL,
	[email] [varchar](50) NULL,
	[ngayvaolam] [date] NULL,
	[luong] [int] NULL,
	[trangthai] [bit] NULL,
	[ghichu] [nvarchar](50) NULL,
	[tentaikhoan] [varchar](20) NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 12/10/2019 11:34:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[tendangnhap] [varchar](20) NOT NULL,
	[matkhau] [varchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[la_admin] [bit] NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[tendangnhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TINDANG]    Script Date: 12/10/2019 11:34:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TINDANG](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nguoidang] [int] NULL,
	[hangxe] [int] NULL,
	[doixe] [int] NULL,
	[namsx] [int] NULL,
	[xuatxu] [nvarchar](50) NULL,
	[tinhtrang] [nvarchar](50) NULL,
	[giatien] [int] NULL,
	[sokm] [int] NULL,
	[dongxe] [nvarchar](50) NULL,
 CONSTRAINT [PK_TINDANG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[XE]    Script Date: 12/10/2019 11:34:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XE](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tensanpham] [nvarchar](50) NULL,
	[anhminhhoa] [nvarchar](max) NULL,
	[giatien] [int] NULL,
	[soluongtonkho] [int] NULL,
	[trangthai] [bit] NULL CONSTRAINT [DF_XE_trangthai]  DEFAULT ((1)),
	[ghichu] [ntext] NULL,
	[loaisanpham] [int] NULL,
	[hangxe] [int] NULL,
	[namsx] [int] NULL,
 CONSTRAINT [PK_XE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[HANGXE] ON 

INSERT [dbo].[HANGXE] ([id], [tenhanhxe], [diachi], [trangthai], [ghichu]) VALUES (1, N'Honda', NULL, 1, NULL)
INSERT [dbo].[HANGXE] ([id], [tenhanhxe], [diachi], [trangthai], [ghichu]) VALUES (2, N'Toyota', NULL, 1, NULL)
INSERT [dbo].[HANGXE] ([id], [tenhanhxe], [diachi], [trangthai], [ghichu]) VALUES (3, N'BMW', NULL, 1, NULL)
INSERT [dbo].[HANGXE] ([id], [tenhanhxe], [diachi], [trangthai], [ghichu]) VALUES (4, N'Audi', NULL, 1, NULL)
INSERT [dbo].[HANGXE] ([id], [tenhanhxe], [diachi], [trangthai], [ghichu]) VALUES (5, N'Ford', NULL, 1, NULL)
INSERT [dbo].[HANGXE] ([id], [tenhanhxe], [diachi], [trangthai], [ghichu]) VALUES (6, N'Ferrari', NULL, 1, NULL)
INSERT [dbo].[HANGXE] ([id], [tenhanhxe], [diachi], [trangthai], [ghichu]) VALUES (7, N'Lamborgini', NULL, 1, NULL)
INSERT [dbo].[HANGXE] ([id], [tenhanhxe], [diachi], [trangthai], [ghichu]) VALUES (8, N'Volvo', NULL, 1, NULL)
INSERT [dbo].[HANGXE] ([id], [tenhanhxe], [diachi], [trangthai], [ghichu]) VALUES (9, N'Bugati', NULL, 1, NULL)
INSERT [dbo].[HANGXE] ([id], [tenhanhxe], [diachi], [trangthai], [ghichu]) VALUES (10, N'Dodge', NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[HANGXE] OFF
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([id], [hoten], [ngaysinh], [gioitinh], [sdt], [diachi], [email], [trangthai], [ghichu], [tentaikhoan]) VALUES (1, N'Trần Đình Huy', CAST(N'1999-04-21' AS Date), 1, N'0389320842 ', N'Bình Định', N'yuki@gmail.com', 1, NULL, N'YUKIHUY')
INSERT [dbo].[KHACHHANG] ([id], [hoten], [ngaysinh], [gioitinh], [sdt], [diachi], [email], [trangthai], [ghichu], [tentaikhoan]) VALUES (2, N'Hoàng Giang', CAST(N'1999-03-08' AS Date), 1, N'0384801342 ', N'Tây Ninh', N'giangnho@gmail.com', 1, NULL, N'GiangNho')
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[LOAIXE] ON 

INSERT [dbo].[LOAIXE] ([id], [tenloai], [trangthai], [ghichu]) VALUES (1, N'Avenger', 1, NULL)
INSERT [dbo].[LOAIXE] ([id], [tenloai], [trangthai], [ghichu]) VALUES (2, N'Calibur', 1, NULL)
INSERT [dbo].[LOAIXE] ([id], [tenloai], [trangthai], [ghichu]) VALUES (3, N'Caravan', 1, NULL)
INSERT [dbo].[LOAIXE] ([id], [tenloai], [trangthai], [ghichu]) VALUES (4, N'Dakota', 1, NULL)
INSERT [dbo].[LOAIXE] ([id], [tenloai], [trangthai], [ghichu]) VALUES (5, N'Durango', 1, NULL)
INSERT [dbo].[LOAIXE] ([id], [tenloai], [trangthai], [ghichu]) VALUES (6, N'Grand caravan', 1, NULL)
INSERT [dbo].[LOAIXE] ([id], [tenloai], [trangthai], [ghichu]) VALUES (7, N'Intrepid', 1, NULL)
INSERT [dbo].[LOAIXE] ([id], [tenloai], [trangthai], [ghichu]) VALUES (8, N'Journey', 1, NULL)
INSERT [dbo].[LOAIXE] ([id], [tenloai], [trangthai], [ghichu]) VALUES (9, N'Magnum', 1, NULL)
INSERT [dbo].[LOAIXE] ([id], [tenloai], [trangthai], [ghichu]) VALUES (10, N'Dodge', 1, NULL)
SET IDENTITY_INSERT [dbo].[LOAIXE] OFF
INSERT [dbo].[TAIKHOAN] ([tendangnhap], [matkhau], [email], [la_admin]) VALUES (N'414', N'123', N'1341fadfa', 0)
INSERT [dbo].[TAIKHOAN] ([tendangnhap], [matkhau], [email], [la_admin]) VALUES (N'admin', N'123', N'yukihuy@gmial', 1)
INSERT [dbo].[TAIKHOAN] ([tendangnhap], [matkhau], [email], [la_admin]) VALUES (N'akdfjj', N'qqeeeee', N'qqq', 0)
INSERT [dbo].[TAIKHOAN] ([tendangnhap], [matkhau], [email], [la_admin]) VALUES (N'akdfjj12', N'2141999', N'yukihuy99yuki@gmail.com', 0)
INSERT [dbo].[TAIKHOAN] ([tendangnhap], [matkhau], [email], [la_admin]) VALUES (N'dff', N'aff', N'43', NULL)
INSERT [dbo].[TAIKHOAN] ([tendangnhap], [matkhau], [email], [la_admin]) VALUES (N'eoieio', NULL, NULL, NULL)
INSERT [dbo].[TAIKHOAN] ([tendangnhap], [matkhau], [email], [la_admin]) VALUES (N'eoieio3', N'133', N'445', 0)
INSERT [dbo].[TAIKHOAN] ([tendangnhap], [matkhau], [email], [la_admin]) VALUES (N'f', N'4', N'3', 0)
INSERT [dbo].[TAIKHOAN] ([tendangnhap], [matkhau], [email], [la_admin]) VALUES (N'fq', N'r', N'r', 0)
INSERT [dbo].[TAIKHOAN] ([tendangnhap], [matkhau], [email], [la_admin]) VALUES (N'GiangNho', N'123', N'yukihuy99yuki@gmail.com', 0)
INSERT [dbo].[TAIKHOAN] ([tendangnhap], [matkhau], [email], [la_admin]) VALUES (N'yukihuy', N'2141999', N'yukihuy99@', 0)
INSERT [dbo].[TAIKHOAN] ([tendangnhap], [matkhau], [email], [la_admin]) VALUES (N'YUKIHUY13413413', N'1', N'yukihuy99yuki@gmail.com', 0)
INSERT [dbo].[TAIKHOAN] ([tendangnhap], [matkhau], [email], [la_admin]) VALUES (N'YUKIHUY341', N'4', N'yukihuy99yuki@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[TINDANG] ON 

INSERT [dbo].[TINDANG] ([id], [id_nguoidang], [hangxe], [doixe], [namsx], [xuatxu], [tinhtrang], [giatien], [sokm], [dongxe]) VALUES (1, 1, 1, 1, 2009, N'Nhập khẩu', N'New', 4500000, 78, N'SUV')
INSERT [dbo].[TINDANG] ([id], [id_nguoidang], [hangxe], [doixe], [namsx], [xuatxu], [tinhtrang], [giatien], [sokm], [dongxe]) VALUES (3, 1, 2, 3, 2007, N'Lắp ráp trong nước', N'Used', 4500000, 78, N'SUV')
INSERT [dbo].[TINDANG] ([id], [id_nguoidang], [hangxe], [doixe], [namsx], [xuatxu], [tinhtrang], [giatien], [sokm], [dongxe]) VALUES (6, 1, 1, 1, 2009, N'Nhập khẩu', N'Used', 4500000, 34, N'SUV')
INSERT [dbo].[TINDANG] ([id], [id_nguoidang], [hangxe], [doixe], [namsx], [xuatxu], [tinhtrang], [giatien], [sokm], [dongxe]) VALUES (9, 2, 1, 3, 2008, N'Nhập khẩu', N'Used', 4500000, 78, N'Sedan')
INSERT [dbo].[TINDANG] ([id], [id_nguoidang], [hangxe], [doixe], [namsx], [xuatxu], [tinhtrang], [giatien], [sokm], [dongxe]) VALUES (10, 1, 1, 1, 2009, N'Nhập khẩu', N'Used', -123, -129, N'SUV')
SET IDENTITY_INSERT [dbo].[TINDANG] OFF
SET IDENTITY_INSERT [dbo].[XE] ON 

INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (1, N'Avenger', N'list-car-accord.png', 71111000, 4, 1, N'Hộp số tự động', 1, 2, 2019)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (2, N'City', N'list-car-city.jpg', 71111000, 4, 1, N'Hộp số tay', 2, 2, 2019)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (3, N'Monkey', N'monkey.png', 71111000, 6, 1, N'Hộp số tự động', 10, 1, 2017)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (4, N'Caravan', N'future-125cc.png', 32000000, 151, 1, N'Hộp số tay', 8, 1, 2016)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (5, N'Future-125cc', N'future-125cc.png', 45000000, 144, 1, N'Hộp số tay', 9, 6, 2018)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (6, N'Avenger', N'CB650R.png', 71111000, 4, 1, N'Hộp số tự động', 5, 1, 2010)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (7, N'Cub', N'cub.png', 62110000, 4, 1, N'Hộp số tay', 5, 2, 2019)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (8, N'PCX', N'pcx.png', 711110000, 4, 1, N'Hộp tự động', 1, 2, 2017)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (9, N'Civic', N'list-car-civic.jpg', 711110000, 4, 1, N'Hộp số tự động', 3, 3, 2018)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (10, N'Avenger', N'list-car-hr-v.jpg', 47000000, 4, 1, N'Hộp số tự động', 1, 4, 2009)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (11, N'Avenger', N'list-car-accord.png', 1400000000, 4, 1, N'Hộp số tự động', 1, 2, 2019)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (12, N'City', N'list-car-city.jpg', 1400000000, 4, 1, N'Hộp số tay', 2, 2, 2019)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (13, N'Monkey', N'monkey.png', 1400000000, 6, 1, N'Hộp số tự động', 10, 1, 2017)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (14, N'Caravan', N'future-125cc.png', 1400000000, 151, 1, N'Hộp số tay', 8, 1, 2016)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (16, N'Avenger', N'CB650R.png', 100000000, 4, 1, N'Hộp số tự động', 5, 1, 2010)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (17, N'Cub', N'cub.png', 400000000, 4, 1, N'Hộp số tay', 5, 2, 2019)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (18, N'PCX', N'pcx.png', 800000000, 4, 1, N'Hộp tự động', 1, 2, 2017)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (19, N'Civic', N'list-car-civic.jpg', 900000000, 4, 1, N'Hộp số tự động', 3, 3, 2018)
INSERT [dbo].[XE] ([id], [tensanpham], [anhminhhoa], [giatien], [soluongtonkho], [trangthai], [ghichu], [loaisanpham], [hangxe], [namsx]) VALUES (20, N'Avenger', N'list-car-hr-v.jpg', 600000000, 4, 1, N'Hộp số tự động', 1, 4, 2009)
SET IDENTITY_INSERT [dbo].[XE] OFF
ALTER TABLE [dbo].[NHANVIEN] ADD  CONSTRAINT [DF_NHANVIEN_trangthai]  DEFAULT ((1)) FOR [trangthai]
GO
ALTER TABLE [dbo].[CT_XE]  WITH CHECK ADD  CONSTRAINT [FK_CT_XE_XE] FOREIGN KEY([idxe])
REFERENCES [dbo].[XE] ([id])
GO
ALTER TABLE [dbo].[CT_XE] CHECK CONSTRAINT [FK_CT_XE_XE]
GO
ALTER TABLE [dbo].[CTHOADON]  WITH CHECK ADD  CONSTRAINT [FK_CTHOADON_HOADON] FOREIGN KEY([iddonhang])
REFERENCES [dbo].[HOADON] ([id])
GO
ALTER TABLE [dbo].[CTHOADON] CHECK CONSTRAINT [FK_CTHOADON_HOADON]
GO
ALTER TABLE [dbo].[CTHOADON]  WITH CHECK ADD  CONSTRAINT [FK_CTHOADON_XE] FOREIGN KEY([idsanpham])
REFERENCES [dbo].[XE] ([id])
GO
ALTER TABLE [dbo].[CTHOADON] CHECK CONSTRAINT [FK_CTHOADON_XE]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_KHACHHANG] FOREIGN KEY([idkhachhang])
REFERENCES [dbo].[KHACHHANG] ([id])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_KHACHHANG]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_NHANVIEN] FOREIGN KEY([idnhanvien])
REFERENCES [dbo].[NHANVIEN] ([id])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_NHANVIEN]
GO
ALTER TABLE [dbo].[KHACHHANG]  WITH CHECK ADD  CONSTRAINT [FK_KHACHHANG_TAIKHOAN] FOREIGN KEY([tentaikhoan])
REFERENCES [dbo].[TAIKHOAN] ([tendangnhap])
GO
ALTER TABLE [dbo].[KHACHHANG] CHECK CONSTRAINT [FK_KHACHHANG_TAIKHOAN]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NHANVIEN_TAIKHOAN] FOREIGN KEY([tentaikhoan])
REFERENCES [dbo].[TAIKHOAN] ([tendangnhap])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NHANVIEN_TAIKHOAN]
GO
ALTER TABLE [dbo].[TINDANG]  WITH CHECK ADD  CONSTRAINT [FK_TINDANG_HANGXE] FOREIGN KEY([hangxe])
REFERENCES [dbo].[HANGXE] ([id])
GO
ALTER TABLE [dbo].[TINDANG] CHECK CONSTRAINT [FK_TINDANG_HANGXE]
GO
ALTER TABLE [dbo].[TINDANG]  WITH CHECK ADD  CONSTRAINT [FK_TINDANG_KHACHHANG] FOREIGN KEY([id_nguoidang])
REFERENCES [dbo].[KHACHHANG] ([id])
GO
ALTER TABLE [dbo].[TINDANG] CHECK CONSTRAINT [FK_TINDANG_KHACHHANG]
GO
ALTER TABLE [dbo].[TINDANG]  WITH CHECK ADD  CONSTRAINT [FK_TINDANG_LOAIXE] FOREIGN KEY([doixe])
REFERENCES [dbo].[LOAIXE] ([id])
GO
ALTER TABLE [dbo].[TINDANG] CHECK CONSTRAINT [FK_TINDANG_LOAIXE]
GO
ALTER TABLE [dbo].[XE]  WITH CHECK ADD  CONSTRAINT [FK_XE_HANGXE] FOREIGN KEY([hangxe])
REFERENCES [dbo].[HANGXE] ([id])
GO
ALTER TABLE [dbo].[XE] CHECK CONSTRAINT [FK_XE_HANGXE]
GO
ALTER TABLE [dbo].[XE]  WITH CHECK ADD  CONSTRAINT [FK_XE_LOAIXE] FOREIGN KEY([loaisanpham])
REFERENCES [dbo].[LOAIXE] ([id])
GO
ALTER TABLE [dbo].[XE] CHECK CONSTRAINT [FK_XE_LOAIXE]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NHANVIEN', @level2type=N'COLUMN',@level2name=N'trangthai'
GO
USE [master]
GO
ALTER DATABASE [KARMA] SET  READ_WRITE 
GO
