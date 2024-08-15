USE [master]
GO
/****** Object:  Database [db_OnlineBookStore]    Script Date: 8/16/2024 12:20:19 AM ******/
CREATE DATABASE [db_OnlineBookStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_OnlineBookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MINSHN\MSSQL\DATA\db_OnlineBookStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_OnlineBookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MINSHN\MSSQL\DATA\db_OnlineBookStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_OnlineBookStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_OnlineBookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_OnlineBookStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_OnlineBookStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_OnlineBookStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_OnlineBookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_OnlineBookStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET RECOVERY FULL 
GO
ALTER DATABASE [db_OnlineBookStore] SET  MULTI_USER 
GO
ALTER DATABASE [db_OnlineBookStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_OnlineBookStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_OnlineBookStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_OnlineBookStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_OnlineBookStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_OnlineBookStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_OnlineBookStore', N'ON'
GO
ALTER DATABASE [db_OnlineBookStore] SET QUERY_STORE = OFF
GO
USE [db_OnlineBookStore]
GO
/****** Object:  Table [dbo].[tblCTdonhang]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCTdonhang](
	[PK_iCTdonhangID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iSanphamID] [int] NOT NULL,
	[FK_iDonhangID] [int] NOT NULL,
	[iSoluong] [int] NULL,
	[fGiaban] [float] NULL,
	[fKhuyenmai] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iCTdonhangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCTgiohang]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCTgiohang](
	[PK_iCTGiohangID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iSanphamID] [int] NOT NULL,
	[FK_iGiohangID] [int] NOT NULL,
	[iSoluong] [int] NULL,
	[dThoigiancapnhat] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iCTGiohangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCTkhuyenmai]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCTkhuyenmai](
	[PK_iCTkhuyenmaiID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iKhuyenmaiID] [int] NOT NULL,
	[FK_iSanphamID] [int] NOT NULL,
	[fChietkhau] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iCTkhuyenmaiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCTphieukiemke]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCTphieukiemke](
	[PK_iCTkiemkeID] [int] NOT NULL,
	[FK_iPhieukiemke] [int] NOT NULL,
	[FK_iSanphamID] [int] NOT NULL,
	[fGiavon] [float] NOT NULL,
	[iTonkho] [int] NOT NULL,
	[iSoluongthucte] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iCTkiemkeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCTphieunhaphang]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCTphieunhaphang](
	[PK_iCTphieunhapID] [int] NOT NULL,
	[FK_iPhieunhaphangID] [int] NOT NULL,
	[FK_iSanphamID] [int] NOT NULL,
	[fGianhap] [float] NOT NULL,
	[iSoluong] [int] NOT NULL,
	[fChietkhau] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iCTphieunhapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCTsach]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCTsach](
	[PK_iCTsachID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iSanphamID] [int] NOT NULL,
	[sTacgia] [nvarchar](255) NULL,
	[sNhaxuatban] [nvarchar](255) NULL,
	[sNamxuatban] [nvarchar](255) NULL,
	[sNgonngu] [nvarchar](255) NULL,
	[sNguoidich] [nvarchar](255) NULL,
	[ISBN] [nvarchar](255) NULL,
	[iSotrang] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iCTsachID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCTtrangthaidonhang]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCTtrangthaidonhang](
	[PK_iTrangthaidonhangID] [int] NOT NULL,
	[sTentrangthai] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iTrangthaidonhangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCTvanphongpham]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCTvanphongpham](
	[PK_iCTvanphongphamID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iSanphamID] [int] NOT NULL,
	[sXuatxu] [nvarchar](255) NULL,
	[sThuonghieu] [nvarchar](255) NULL,
	[sMausac] [nvarchar](255) NULL,
	[sChatlieu] [nvarchar](255) NULL,
	[sKichthuoc] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iCTvanphongphamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDanhgia]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDanhgia](
	[PK_iDanhgiaID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iCTdonhangID] [int] NOT NULL,
	[fXephang] [float] NOT NULL,
	[sMota] [nvarchar](255) NULL,
	[dThoigiantao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iDanhgiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDanhmuc]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDanhmuc](
	[PK_iDanhmucID] [int] NOT NULL,
	[sTendanhmuc] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iDanhmucID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDiachiKH]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiachiKH](
	[PK_sDiachiKHID] [int] IDENTITY(1,1) NOT NULL,
	[FK_sKHID] [nvarchar](10) NOT NULL,
	[sHo] [nvarchar](255) NULL,
	[sTen] [nvarchar](255) NULL,
	[FK_iXaID] [int] NULL,
	[FK_iHuyenID] [int] NULL,
	[FK_iTinhID] [int] NULL,
	[sDiachicuthe] [nvarchar](255) NULL,
	[sSDT] [nvarchar](20) NOT NULL,
	[isTrangthai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_sDiachiKHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDonhang]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDonhang](
	[PK_iDonhangID] [int] IDENTITY(1,1) NOT NULL,
	[FK_sKHID] [nvarchar](10) NOT NULL,
	[FK_iTrangthai] [int] NOT NULL,
	[FK_sDiachiKHID] [int] NOT NULL,
	[dThoigianmua] [datetime] NULL,
	[dThoigiancapnhat] [datetime] NULL,
	[sMavanchuyen] [nvarchar](255) NULL,
	[fPhivanchuyen] [float] NULL,
	[sGhichu] [nvarchar](255) NULL,
	[iDungdiemthuong] [int] NULL,
	[fTongtien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iDonhangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGiohang]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGiohang](
	[PK_iGiohangID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iKHID] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iGiohangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHuyen]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHuyen](
	[PK_iHuyenID] [int] NOT NULL,
	[FK_iTinhID] [int] NOT NULL,
	[sTenhuyen] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iHuyenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblKetquathucte]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKetquathucte](
	[FK_iSanphamId] [int] NULL,
	[FK_iKhachhangId] [int] NULL,
	[fXephang] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblKhachhang]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKhachhang](
	[PK_sKHID] [nvarchar](10) NOT NULL,
	[FK_iTaikhoanID] [int] NOT NULL,
	[sHo] [nvarchar](255) NOT NULL,
	[sTen] [nvarchar](255) NOT NULL,
	[sSDT] [nvarchar](20) NULL,
	[iDiemthuong] [int] NULL,
	[dNgaysinh] [datetime] NULL,
	[isGioitinh] [bit] NULL,
	[sNghenghiep] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_sKHID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblKhuyenmai]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKhuyenmai](
	[PK_iKhuyenmaiID] [int] IDENTITY(1,1) NOT NULL,
	[sTenchuongtrinh] [nvarchar](255) NULL,
	[dThoigianbatdau] [datetime] NOT NULL,
	[dThoigianketthuc] [datetime] NULL,
	[isTrangthai] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iKhuyenmaiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNhacungcap]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhacungcap](
	[PK_iNCCID] [int] IDENTITY(1,1) NOT NULL,
	[sTenNCC] [nvarchar](255) NOT NULL,
	[sSDT] [nvarchar](20) NULL,
	[sEmail] [nvarchar](255) NULL,
	[sMasothue] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iNCCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNhanvien]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhanvien](
	[PK_sNhanvienID] [nvarchar](10) NOT NULL,
	[FK_iTaikhoanID] [int] NOT NULL,
	[sHo] [nvarchar](255) NOT NULL,
	[sTen] [nvarchar](255) NOT NULL,
	[sSDT] [nvarchar](20) NULL,
	[dNgaysinh] [date] NULL,
	[isGioitinh] [bit] NULL,
	[isTrangthai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_sNhanvienID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPhanquyen]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPhanquyen](
	[PK_iQuyenID] [int] NOT NULL,
	[sTenquyen] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iQuyenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPhieukiemke]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPhieukiemke](
	[PK_iPhieukiemkeID] [int] NOT NULL,
	[dThoigiantao] [datetime] NOT NULL,
	[sGhichu] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iPhieukiemkeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPhieunhaphang]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPhieunhaphang](
	[PK_iPhieunhaphangID] [int] NOT NULL,
	[FK_sNCCID] [int] NOT NULL,
	[fChietkhau] [float] NULL,
	[dThoigiantao] [datetime] NOT NULL,
	[sGhichu] [nvarchar](max) NULL,
	[fThueGTGT] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iPhieunhaphangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSanpham]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSanpham](
	[PK_iSanphamID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iTheloaiID] [int] NOT NULL,
	[sTensanpham] [nvarchar](255) NOT NULL,
	[sMavach] [nvarchar](255) NULL,
	[sHinhanh] [nvarchar](max) NULL,
	[sMota] [nvarchar](max) NULL,
	[iTonkho] [int] NOT NULL,
	[fTrongluong] [float] NULL,
	[fGiaban] [float] NOT NULL,
	[fGiavon] [float] NOT NULL,
	[isTrangthai] [bit] NULL,
	[dThoigiantao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iSanphamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTaikhoan]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaikhoan](
	[PK_iTaikhoanID] [int] NOT NULL,
	[FK_iQuyenID] [int] NOT NULL,
	[sEmail] [nvarchar](255) NOT NULL,
	[sMatkhau] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iTaikhoanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTheloai]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTheloai](
	[PK_iTheloaiID] [int] NOT NULL,
	[sTentheloai] [nvarchar](255) NOT NULL,
	[FK_iDanhmucID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iTheloaiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTinh]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTinh](
	[PK_iTinhID] [int] NOT NULL,
	[sTentinh] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iTinhID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblXa]    Script Date: 8/16/2024 12:20:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblXa](
	[PK_iXaID] [int] NOT NULL,
	[FK_iHuyenID] [int] NULL,
	[sTenxa] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iXaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCTdonhang] ON 

INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (1, 8, 9, 1, 169000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (2, 8, 10, 1, 169000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (3, 8, 11, 1, 169000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (4, 1, 12, 1, 68000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (5, 3, 13, 1, 200000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (6, 9, 14, 1, 35000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (7, 2, 15, 1, 200000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (8, 5, 16, 1, 129000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (9, 8, 17, 1, 169000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (10, 11, 18, 1, 168000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (11, 10, 19, 1, 139000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (12, 7, 20, 1, 79000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (13, 11, 21, 1, 168000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (14, 2, 22, 1, 200000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (15, 6, 23, 1, 125000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (16, 8, 24, 1, 169000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (17, 6, 25, 1, 125000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (18, 8, 26, 1, 169000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (19, 11, 27, 1, 168000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (20, 11, 28, 1, 168000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (21, 13, 29, 3, 180000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (22, 14, 30, 2, 43000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (23, 14, 31, 1, 43000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (24, 7, 32, 1, 79000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (25, 6, 33, 1, 125000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (26, 7, 34, 3, 79000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (27, 1, 34, 2, 68000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (28, 11, 35, 1, 168000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (29, 3, 36, 2, 200000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (30, 13, 37, 1, 180000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (31, 8, 38, 1, 169000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (32, 14, 39, 1, 43000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (33, 9, 39, 1, 35000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (34, 7, 40, 1, 79000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (35, 13, 41, 1, 180000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (36, 39, 42, 1, 16000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (37, 38, 43, 1, 90000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (38, 24, 44, 1, 24000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (39, 6, 45, 1, 125000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (40, 15, 46, 1, 99000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (41, 30, 47, 1, 65000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (42, 38, 48, 1, 90000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (43, 10, 49, 1, 139000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (44, 68, 50, 1, 20000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (45, 2, 51, 1, 200000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (46, 60, 52, 1, 39000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (47, 20, 53, 1, 110000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (48, 53, 54, 1, 79000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (49, 67, 55, 1, 649000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (50, 20, 56, 1, 110000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (51, 72, 57, 1, 20000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (52, 70, 57, 1, 20000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (53, 73, 57, 1, 20000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (54, 2, 58, 2, 200000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (55, 16, 59, 1, 229000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (56, 30, 59, 1, 65000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (57, 52, 59, 1, 65000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (58, 38, 60, 1, 90000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (59, 4, 61, 1, 129000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (60, 5, 61, 1, 129000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (61, 15, 62, 1, 99000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (62, 11, 63, 1, 168000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (63, 15, 64, 1, 99000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (64, 15, 65, 1, 99000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (65, 15, 66, 1, 99000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (66, 59, 66, 1, 18500, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (67, 8, 67, 1, 169000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (68, 17, 68, 1, 162000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (69, 16, 68, 1, 229000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (70, 67, 68, 1, 649000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (71, 43, 69, 1, 79000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (72, 57, 69, 1, 45000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (73, 72, 69, 1, 20000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (74, 30, 70, 1, 65000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (75, 29, 70, 1, 85000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (76, 53, 70, 1, 79000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (77, 52, 70, 1, 65000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (78, 13, 71, 1, 180000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (79, 38, 72, 1, 90000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (80, 38, 73, 1, 90000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (81, 26, 74, 1, 389000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (82, 52, 75, 1, 65000, 0)
INSERT [dbo].[tblCTdonhang] ([PK_iCTdonhangID], [FK_iSanphamID], [FK_iDonhangID], [iSoluong], [fGiaban], [fKhuyenmai]) VALUES (83, 7, 76, 1, 79000, 0)
SET IDENTITY_INSERT [dbo].[tblCTdonhang] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCTgiohang] ON 

INSERT [dbo].[tblCTgiohang] ([PK_iCTGiohangID], [FK_iSanphamID], [FK_iGiohangID], [iSoluong], [dThoigiancapnhat]) VALUES (25, 1, 6, 1, NULL)
INSERT [dbo].[tblCTgiohang] ([PK_iCTGiohangID], [FK_iSanphamID], [FK_iGiohangID], [iSoluong], [dThoigiancapnhat]) VALUES (26, 11, 6, 1, NULL)
INSERT [dbo].[tblCTgiohang] ([PK_iCTGiohangID], [FK_iSanphamID], [FK_iGiohangID], [iSoluong], [dThoigiancapnhat]) VALUES (76, 15, 13, 1, NULL)
INSERT [dbo].[tblCTgiohang] ([PK_iCTGiohangID], [FK_iSanphamID], [FK_iGiohangID], [iSoluong], [dThoigiancapnhat]) VALUES (116, 15, 22, 1, NULL)
INSERT [dbo].[tblCTgiohang] ([PK_iCTGiohangID], [FK_iSanphamID], [FK_iGiohangID], [iSoluong], [dThoigiancapnhat]) VALUES (126, 20, 16, 1, NULL)
INSERT [dbo].[tblCTgiohang] ([PK_iCTGiohangID], [FK_iSanphamID], [FK_iGiohangID], [iSoluong], [dThoigiancapnhat]) VALUES (129, 67, 1, 1, NULL)
INSERT [dbo].[tblCTgiohang] ([PK_iCTGiohangID], [FK_iSanphamID], [FK_iGiohangID], [iSoluong], [dThoigiancapnhat]) VALUES (130, 53, 1, 1, NULL)
INSERT [dbo].[tblCTgiohang] ([PK_iCTGiohangID], [FK_iSanphamID], [FK_iGiohangID], [iSoluong], [dThoigiancapnhat]) VALUES (131, 38, 14, 1, NULL)
INSERT [dbo].[tblCTgiohang] ([PK_iCTGiohangID], [FK_iSanphamID], [FK_iGiohangID], [iSoluong], [dThoigiancapnhat]) VALUES (133, 6, 7, 2, NULL)
SET IDENTITY_INSERT [dbo].[tblCTgiohang] OFF
GO
INSERT [dbo].[tblCTphieukiemke] ([PK_iCTkiemkeID], [FK_iPhieukiemke], [FK_iSanphamID], [fGiavon], [iTonkho], [iSoluongthucte]) VALUES (1, 1, 13, 0, 0, 155)
INSERT [dbo].[tblCTphieukiemke] ([PK_iCTkiemkeID], [FK_iPhieukiemke], [FK_iSanphamID], [fGiavon], [iTonkho], [iSoluongthucte]) VALUES (2, 2, 13, 86000, 122, 155)
INSERT [dbo].[tblCTphieukiemke] ([PK_iCTkiemkeID], [FK_iPhieukiemke], [FK_iSanphamID], [fGiavon], [iTonkho], [iSoluongthucte]) VALUES (3, 3, 13, 86000, 122, 155)
GO
INSERT [dbo].[tblCTphieunhaphang] ([PK_iCTphieunhapID], [FK_iPhieunhaphangID], [FK_iSanphamID], [fGianhap], [iSoluong], [fChietkhau]) VALUES (0, 0, 13, 250000, 12, 30)
INSERT [dbo].[tblCTphieunhaphang] ([PK_iCTphieunhapID], [FK_iPhieunhaphangID], [FK_iSanphamID], [fGianhap], [iSoluong], [fChietkhau]) VALUES (1, 1, 11, 72000, 12, 30)
INSERT [dbo].[tblCTphieunhaphang] ([PK_iCTphieunhapID], [FK_iPhieunhaphangID], [FK_iSanphamID], [fGianhap], [iSoluong], [fChietkhau]) VALUES (2, 8, 11, 72000, 12, 30)
INSERT [dbo].[tblCTphieunhaphang] ([PK_iCTphieunhapID], [FK_iPhieunhaphangID], [FK_iSanphamID], [fGianhap], [iSoluong], [fChietkhau]) VALUES (3, 9, 11, 72000, 12, 30)
INSERT [dbo].[tblCTphieunhaphang] ([PK_iCTphieunhapID], [FK_iPhieunhaphangID], [FK_iSanphamID], [fGianhap], [iSoluong], [fChietkhau]) VALUES (4, 9, 10, 40000, 10, 10)
INSERT [dbo].[tblCTphieunhaphang] ([PK_iCTphieunhapID], [FK_iPhieunhaphangID], [FK_iSanphamID], [fGianhap], [iSoluong], [fChietkhau]) VALUES (5, 10, 11, 72000, 12, 30)
INSERT [dbo].[tblCTphieunhaphang] ([PK_iCTphieunhapID], [FK_iPhieunhaphangID], [FK_iSanphamID], [fGianhap], [iSoluong], [fChietkhau]) VALUES (6, 10, 10, 40000, 10, 10)
INSERT [dbo].[tblCTphieunhaphang] ([PK_iCTphieunhapID], [FK_iPhieunhaphangID], [FK_iSanphamID], [fGianhap], [iSoluong], [fChietkhau]) VALUES (7, 11, 11, 72000, 12, 30)
INSERT [dbo].[tblCTphieunhaphang] ([PK_iCTphieunhapID], [FK_iPhieunhaphangID], [FK_iSanphamID], [fGianhap], [iSoluong], [fChietkhau]) VALUES (8, 11, 10, 40000, 10, 10)
INSERT [dbo].[tblCTphieunhaphang] ([PK_iCTphieunhapID], [FK_iPhieunhaphangID], [FK_iSanphamID], [fGianhap], [iSoluong], [fChietkhau]) VALUES (9, 13, 11, 72000, 12, 30)
INSERT [dbo].[tblCTphieunhaphang] ([PK_iCTphieunhapID], [FK_iPhieunhaphangID], [FK_iSanphamID], [fGianhap], [iSoluong], [fChietkhau]) VALUES (10, 13, 45, 40000, 10, 10)
GO
SET IDENTITY_INSERT [dbo].[tblCTsach] ON 

INSERT [dbo].[tblCTsach] ([PK_iCTsachID], [FK_iSanphamID], [sTacgia], [sNhaxuatban], [sNamxuatban], [sNgonngu], [sNguoidich], [ISBN], [iSotrang]) VALUES (1, 1, N'Neil Gaiman', N'Hội Nhà Văn', N'2023', N'Tiếng Việt', N'Linh Vũ', NULL, 218)
INSERT [dbo].[tblCTsach] ([PK_iCTsachID], [FK_iSanphamID], [sTacgia], [sNhaxuatban], [sNamxuatban], [sNgonngu], [sNguoidich], [ISBN], [iSotrang]) VALUES (2, 2, N'Neil Gaiman', N'	NXB Phụ Nữ Việt Nam', N'	2021', N'Tiếng Việt', N'	 Lê Minh Đức', NULL, 648)
INSERT [dbo].[tblCTsach] ([PK_iCTsachID], [FK_iSanphamID], [sTacgia], [sNhaxuatban], [sNamxuatban], [sNgonngu], [sNguoidich], [ISBN], [iSotrang]) VALUES (3, 3, N'	Haruki Murakami', N'	NXB Hội Nhà Văn', N'2020', N'Tiếng Việt', N'	Mộc Miên', NULL, 536)
INSERT [dbo].[tblCTsach] ([PK_iCTsachID], [FK_iSanphamID], [sTacgia], [sNhaxuatban], [sNamxuatban], [sNgonngu], [sNguoidich], [ISBN], [iSotrang]) VALUES (4, 4, N'Nguyễn Dương Quỳnh', N'	Phụ Nữ Việt Nam', N'	2022', N'Tiếng Việt', NULL, NULL, 368)
INSERT [dbo].[tblCTsach] ([PK_iCTsachID], [FK_iSanphamID], [sTacgia], [sNhaxuatban], [sNamxuatban], [sNgonngu], [sNguoidich], [ISBN], [iSotrang]) VALUES (5, 5, N'Nguyễn Dương Quỳnh', N'	Phụ Nữ Việt Nam', N'	2022', N'Tiếng Việt', NULL, NULL, 368)
INSERT [dbo].[tblCTsach] ([PK_iCTsachID], [FK_iSanphamID], [sTacgia], [sNhaxuatban], [sNamxuatban], [sNgonngu], [sNguoidich], [ISBN], [iSotrang]) VALUES (6, 6, N'	Nikolai A Ostrovsky', N'Văn Học', N'	2023', N'Tiếng Việt', N'	Vũ Văn Thành', NULL, 780)
INSERT [dbo].[tblCTsach] ([PK_iCTsachID], [FK_iSanphamID], [sTacgia], [sNhaxuatban], [sNamxuatban], [sNgonngu], [sNguoidich], [ISBN], [iSotrang]) VALUES (7, 7, N'	Nam Cao', N'	Văn Học', N'2024', N'Tiếng Việt', NULL, NULL, 180)
INSERT [dbo].[tblCTsach] ([PK_iCTsachID], [FK_iSanphamID], [sTacgia], [sNhaxuatban], [sNamxuatban], [sNgonngu], [sNguoidich], [ISBN], [iSotrang]) VALUES (8, 8, N'Thảo Trang', N'NXB Thanh Niên', N'2022', N'	Tiếng Việt', NULL, NULL, 544)
INSERT [dbo].[tblCTsach] ([PK_iCTsachID], [FK_iSanphamID], [sTacgia], [sNhaxuatban], [sNamxuatban], [sNgonngu], [sNguoidich], [ISBN], [iSotrang]) VALUES (9, 9, N'	Fujiko F Fujio', N'Kim Đồng', N'	2024', N'	Tiếng Việt', N'	Hitokiri', NULL, 144)
INSERT [dbo].[tblCTsach] ([PK_iCTsachID], [FK_iSanphamID], [sTacgia], [sNhaxuatban], [sNamxuatban], [sNgonngu], [sNguoidich], [ISBN], [iSotrang]) VALUES (10, 10, N'	Hyougetsu', N'	NXB Phụ Nữ Việt Nam', N'	2021', N'	Tiếng Việt', N'	Diễm Diễm', NULL, 432)
INSERT [dbo].[tblCTsach] ([PK_iCTsachID], [FK_iSanphamID], [sTacgia], [sNhaxuatban], [sNamxuatban], [sNgonngu], [sNguoidich], [ISBN], [iSotrang]) VALUES (11, 11, N'	Thích Pháp Hòa', N'	Dân Trí', N'2024', N'	Tiếng Việt', NULL, NULL, 328)
INSERT [dbo].[tblCTsach] ([PK_iCTsachID], [FK_iSanphamID], [sTacgia], [sNhaxuatban], [sNamxuatban], [sNgonngu], [sNguoidich], [ISBN], [iSotrang]) VALUES (16, 13, N'José Mauro de Vasconcelos', N'	NXB Hội Nhà Văn', NULL, N'Tiếng Việt', N'	Nguyễn Bích Lan, Tô Yến Ly', N'1315', 224)
INSERT [dbo].[tblCTsach] ([PK_iCTsachID], [FK_iSanphamID], [sTacgia], [sNhaxuatban], [sNamxuatban], [sNgonngu], [sNguoidich], [ISBN], [iSotrang]) VALUES (17, 14, N'	Atsushi Ohkubo', N'	Trẻ', NULL, N'	Tiếng Việt', N'	Anh Huỳnh', N'216', 192)
SET IDENTITY_INSERT [dbo].[tblCTsach] OFF
GO
INSERT [dbo].[tblCTtrangthaidonhang] ([PK_iTrangthaidonhangID], [sTentrangthai]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[tblCTtrangthaidonhang] ([PK_iTrangthaidonhangID], [sTentrangthai]) VALUES (2, N'Đơn hàng thành công')
INSERT [dbo].[tblCTtrangthaidonhang] ([PK_iTrangthaidonhangID], [sTentrangthai]) VALUES (3, N'')
INSERT [dbo].[tblCTtrangthaidonhang] ([PK_iTrangthaidonhangID], [sTentrangthai]) VALUES (4, N'')
GO
SET IDENTITY_INSERT [dbo].[tblDanhgia] ON 

INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (2, 4, 4, N'Hay nhưng hơi sợ', CAST(N'2024-07-26T01:36:20.833' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (3, 5, 5, N'Khá hay nội dung hơi lạ', CAST(N'2024-07-26T01:45:44.653' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (4, 1, 5, N'Rất hay', CAST(N'2024-07-26T01:52:57.077' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (5, 2, 5, N'Rất hay, đã mua quyển thứ 2', CAST(N'2024-07-26T01:53:13.953' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (6, 3, 5, N'Mua đến 3 quyển rồi', CAST(N'2024-07-26T01:53:27.347' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (7, 6, 3, N'Tạm ổn', CAST(N'2024-07-26T01:53:40.863' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (8, 7, 2, N'Không như mong đợi', CAST(N'2024-07-26T01:56:34.883' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (9, 8, 4, N'Khá hay, mong chờ tập 3', CAST(N'2024-07-26T01:57:37.537' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (10, 9, 5, N'Rất hay', CAST(N'2024-07-26T01:58:25.003' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (11, 10, 3, N'Không hợp gu', CAST(N'2024-07-26T01:59:54.203' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (12, 11, 5, N'Hay ngoài mong đợi', CAST(N'2024-07-26T02:00:51.297' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (13, 23, 4, N'Hay', CAST(N'2024-07-29T01:59:01.350' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (14, 25, 5, N'Rất hay', CAST(N'2024-07-29T05:34:29.960' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (15, 31, 5, N'Một tác phẩm kinh điển, rất hay. Đáng mua', CAST(N'2024-07-30T04:13:17.450' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (16, 34, 5, N'Sản phẩm khá hay', CAST(N'2024-08-04T21:28:49.777' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (17, 37, 1, N'Chất lượng tốt nhưng không phải sản phẩm tôi mong muốn', CAST(N'2024-08-07T00:28:26.340' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (18, 35, 5, N'Rất thích những cuốn sách như thế này', CAST(N'2024-08-07T00:28:53.200' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (19, 36, 5, N'Rất hay, đáng mua và đọc', CAST(N'2024-08-07T00:29:12.400' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (20, 38, 5, N'Đúng sách tôi cần', CAST(N'2024-08-07T00:38:57.053' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (21, 39, 4, N'Khá hay', CAST(N'2024-08-07T00:39:14.413' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (22, 16, 5, N'Hay', CAST(N'2024-08-07T00:44:16.523' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (23, 14, 5, N'Hay', CAST(N'2024-08-07T00:44:37.423' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (24, 20, 1, N'Không hợp lắm', CAST(N'2024-08-07T00:44:55.487' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (25, 15, 2, N'Chất lượng sách rất tốt, nhưng không phải thứ thôi cần', CAST(N'2024-08-07T00:45:31.770' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (26, 18, 5, N'hay', CAST(N'2024-08-07T00:46:42.317' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (27, 17, 2, N'Hơi tệ', CAST(N'2024-08-07T00:47:17.490' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (28, 40, 5, N'Con rất thích', CAST(N'2024-08-07T00:51:06.377' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (29, 41, 5, N'Rất hay, các mẹ nên đọc', CAST(N'2024-08-07T00:51:36.130' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (30, 42, 5, N'Hay', CAST(N'2024-08-07T00:55:07.873' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (31, 43, 4, N'Mong chờ tập sau', CAST(N'2024-08-07T00:55:23.083' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (32, 44, 3, N'có Negav', CAST(N'2024-08-07T00:56:26.000' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (33, 24, 5, N'Hay', CAST(N'2024-08-07T00:57:08.740' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (34, 45, 2, N'Không hợp', CAST(N'2024-08-07T00:57:56.560' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (35, 32, 1, N'Không ra làm sao', CAST(N'2024-08-07T00:58:46.317' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (36, 33, 2, N'Không thích', CAST(N'2024-08-07T00:59:05.647' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (37, 29, 3, N'Không hay', CAST(N'2024-08-07T00:59:25.967' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (38, 30, 5, N'Rất hay', CAST(N'2024-08-07T00:59:41.753' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (39, 46, 5, N'Tốt', CAST(N'2024-08-07T01:01:30.343' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (40, 47, 5, N'Được', CAST(N'2024-08-07T01:01:47.347' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (41, 48, 2, N'Không tốt', CAST(N'2024-08-07T01:02:36.650' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (42, 49, 4, N'Mua cho con, màu sắc có khác so với ảnh nhưng chất liệu và form dáng tốt', CAST(N'2024-08-07T01:04:33.507' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (43, 50, 4, N'Khá tốt', CAST(N'2024-08-07T01:06:40.293' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (44, 51, 5, NULL, CAST(N'2024-08-07T01:08:37.017' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (45, 52, 5, NULL, CAST(N'2024-08-07T01:08:44.737' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (46, 53, 5, NULL, CAST(N'2024-08-07T01:08:57.650' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (47, 54, 2, N'Không hay', CAST(N'2024-08-07T01:09:42.237' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (48, 55, 5, NULL, CAST(N'2024-08-07T01:12:28.177' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (49, 56, 5, NULL, CAST(N'2024-08-07T01:12:39.067' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (50, 57, 4, NULL, CAST(N'2024-08-07T01:12:46.167' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (51, 58, 5, NULL, CAST(N'2024-08-07T01:17:48.667' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (52, 59, 4, NULL, CAST(N'2024-08-07T01:17:56.703' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (53, 60, 4, NULL, CAST(N'2024-08-07T01:18:06.633' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (54, 61, 5, NULL, CAST(N'2024-08-07T02:44:28.877' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (55, 62, 5, NULL, CAST(N'2024-08-07T02:50:40.813' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (56, 63, 4, N'Tuyệt', CAST(N'2024-08-07T03:07:04.220' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (57, 22, 4, N'Tạm được', CAST(N'2024-08-07T03:07:49.377' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (58, 65, 5, NULL, CAST(N'2024-08-07T03:09:52.923' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (59, 66, 5, NULL, CAST(N'2024-08-07T03:10:06.427' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (60, 67, 5, NULL, CAST(N'2024-08-07T03:10:51.780' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (61, 68, 5, NULL, CAST(N'2024-08-07T03:16:31.560' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (62, 69, 5, NULL, CAST(N'2024-08-07T03:16:39.817' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (63, 70, 5, NULL, CAST(N'2024-08-07T03:16:45.743' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (64, 71, 5, NULL, CAST(N'2024-08-07T03:19:41.087' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (65, 72, 5, NULL, CAST(N'2024-08-07T03:19:47.783' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (66, 73, 4, N'4', CAST(N'2024-08-07T03:19:56.620' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (67, 74, 5, NULL, CAST(N'2024-08-07T03:22:55.677' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (68, 75, 5, NULL, CAST(N'2024-08-07T03:23:59.237' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (69, 76, 5, NULL, CAST(N'2024-08-07T03:24:12.110' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (70, 77, 4, NULL, CAST(N'2024-08-07T03:24:21.497' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (74, 81, 0, NULL, CAST(N'2024-08-07T05:22:52.493' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (75, 19, 2, NULL, CAST(N'2024-08-07T23:29:06.343' AS DateTime))
INSERT [dbo].[tblDanhgia] ([PK_iDanhgiaID], [FK_iCTdonhangID], [fXephang], [sMota], [dThoigiantao]) VALUES (76, 82, 4, NULL, CAST(N'2024-08-08T09:36:35.310' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblDanhgia] OFF
GO
INSERT [dbo].[tblDanhmuc] ([PK_iDanhmucID], [sTendanhmuc]) VALUES (1, N'Sách')
INSERT [dbo].[tblDanhmuc] ([PK_iDanhmucID], [sTendanhmuc]) VALUES (2, N'Văn phòng phẩm')
GO
SET IDENTITY_INSERT [dbo].[tblDiachiKH] ON 

INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (1, N'1', NULL, NULL, 10101, NULL, NULL, N'Nhà 52 hẻm 17 ngách 24 ngõ 295 Bạch Mai, Hai Bà Trưng, Hà Nội', N'0971575855', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (2, N'1', NULL, NULL, 10109, NULL, NULL, N'Nhà 52 hẻm 17 ngách 24 ngõ 295 Bạch Mai, Hai Bà Trưng, Hà Nội', N'0971575855', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (3, N'1', NULL, NULL, 10102, NULL, NULL, N'Nhà 52 hẻm 17 ngách 24 ngõ 295 Bạch Mai, Hai Bà Trưng, Hà Nội', N'0971575855', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (4, N'1', NULL, NULL, 10201, NULL, NULL, N'Nhà 52 hẻm 17 ngách 24 ngõ 295 Bạch Mai, Hai Bà Trưng, Hà Nội', N'0971575855', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (5, N'1', NULL, NULL, 10205, NULL, NULL, N'Nhà 52 hẻm 17 ngách 24 ngõ 295 Bạch Mai, Hai Bà Trưng, Hà Nội', N'0971575855', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (7, N'9', NULL, NULL, 10206, NULL, NULL, N'Nhà 52 hẻm 17 ngách 24 ngõ 295 Bạch Mai, Hai Bà Trưng, Hà Nội', N'0961326426', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (8, N'9', NULL, NULL, 10204, NULL, NULL, N'Nhà 52 hẻm 17 ngách 24 ngõ 295 Bạch Mai, Hai Bà Trưng, Hà Nội', N'0961326426', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (9, N'3', NULL, NULL, 20106, NULL, NULL, N'Nhà 13', N'0396423516', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (10, N'3', NULL, NULL, 20101, NULL, NULL, N'Nhà 13', N'0396423516', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (11, N'2', NULL, NULL, 30104, NULL, NULL, N'Nhà 33', N'0341642648', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (12, N'2', NULL, NULL, 30102, NULL, NULL, N'Nhà 33', N'0341642648', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (13, N'4', NULL, NULL, 10211, NULL, NULL, N'13 Quán Thánh', N'0964236257', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (14, N'4', N'Con mèo', N'ngu ngốc', 10103, NULL, NULL, N'11 Cửa Nam', N'0979123123', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (15, N'4', N'Con', N'Mèo', 10103, 101, 1, N'11 Cửa Nam', N'0979123123', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (16, N'5', N'Huyền', N'Huyền', 40105, NULL, NULL, N'11 Hòa Cường Bắc', N'0936363235', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (17, N'5', N'Huyền', N'Huyền', 40101, 401, 4, N'11 Bình Hiên', N'0936363235', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (18, N'1', N'Con mèo', N'ngu ngốc', 10201, 102, 1, N'11 Cửa Nam', N'0979123123', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (19, N'4', N'Con', N'Mèo', 10201, 102, 1, N'11 Cửa Nam', N'0979123123', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (20, N'1', N'Con', N'Mèo', 10101, 101, 1, N'11 Cửa Nam', N'0979123123', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (21, N'1', N'Con', N'Mèo', 10103, 101, 1, N'11 Cửa Nam', N'0979123123', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (22, N'11', N'Nguyễn', N'Thái', 30103, 301, 3, N'Nhà 12', N'0396684217', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (23, N'11', N'Nguyễn', N'Thái', 30101, 301, 3, N'Nhà 12', N'0396684217', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (24, N'1', N'Nguyễn', N'Hồng Ngọc', 10102, 101, 1, N'Nhà 52 hẻm 17 ngách 24 ngõ 295 Cửa Đông', N'0971575855', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (25, N'12', N'Nguyễn', N'Thái', 30102, 301, 3, N'Nhà 12', N'0396684217', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (26, N'12', N'Nguyễn', N'Thái', 30104, 301, 3, N'Nhà 12', N'0396684217', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (27, N'13', N'Phạm', N'Khánh Phương', 20102, 201, 2, N'Nhà 52 hẻm 17 ngách 24 ngõ 295 Bến Thành', N'0963323651', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (28, N'15', N'Nguyễn', N'Ngọc', 10101, 101, 1, N'Nhà 12', N'0943326325', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (29, N'17', N'Nguyễn', N'Quang Ạnh', 10207, 102, 1, N'Nhà 12 Nguyễn Trung Trực', N'0913633241', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (30, N'18', N'Phạm', N'Trường Giang', 40109, 401, 4, N'11 Bình Hiên ', N'0974513241', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (31, N'19', N'Lê', N'Thục Khánh An', 20104, 201, 2, N'14 Cầu Ông Lãnh', N'0941265214', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (32, N'20', N'Vũ', N'Hồng Hạnh', 20102, 201, 2, N'19 Chợ Bến Thành', N'0978545652', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (33, N'14', N'Bùi', N'Thảo Duyên', 10202, 102, 1, N'973 Hồ Hoàng', N'0963356241', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (34, N'14', N'Bùi', N'Thảo Duyên', 10209, 102, 1, N'973 Hồ Hoàng', N'0963356241', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (35, N'13', N'Phạm', N'Khánh Phương', 10112, 101, 1, N'423 Hàng Mã', N'0963323651', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (36, N'15', N'Lã', N'Phương Thảo', 30105, 301, 3, N'254 HÀng Kênh', N'0963236245', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (37, N'16', N'Nguyễn', N'Ngọc', 10118, 101, 1, N'Nhà 12 Hàng Tiền', N'0943326325', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (38, N'16', N'Nguyễn', N'Ngọc', 10118, 101, 1, N'Nhà 12 TRàng Tiền', N'0943326325', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (39, N'21', N'Lâm', N'Minh Kiệt', 40110, 401, 4, N'124 Gầm cầu', N'0978514212', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (40, N'22', N'Đặng', N'Trâm Anh', 30103, 301, 3, N'873 Đường Đài', N'0363232511', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (41, N'22', N'Đặng', N'Trâm Anh', 30101, 301, 3, N'873 Đường Đài', N'0363232511', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (42, N'9', N'Nguyễn', N' Tùng', 40107, 401, 4, N'11 Bình Hiên', N'0936363235', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (43, N'19', N'Đặng', N'Trâm Anh', 30102, 301, 3, N'873 Đường Đài', N'0363232511', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (44, N'3', N'Phạm', N'Khánh Phương', 10108, 101, 1, N'423 Hàng Mã', N'0963323651', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (45, N'1', N'Phạm', N'Khánh Phương', 10109, 101, 1, N'423 Hàng Mã', N'0963323651', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (46, N'8', N'Nguyễn ', N'Đạt', 10111, 101, 1, N'1234 Hàng Gai', N'0392346667', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (47, N'8', N'Nguyễn ', N'Đạt', 10101, 101, 1, N'1234 Hàng Gai', N'0392346667', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (48, N'23', N'Tăng', N'Thanh Hà', 20101, 201, 2, N'423 Đường Trần Điền', N'0978653214', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (49, N'24', N'Trần', N'Quang Đăng', 30104, 301, 3, N'72 Trường Chinh', N'0986421532', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (50, N'25', N'Nguyễn', N'Đức Tâm', 40108, 401, 4, N'887 Lê Thanh Nghị', N'0987885565', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (51, N'25', N'Nguyễn', N'Thái', 30102, 301, 3, N'Nhà 12', N'0396684217', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (52, N'1', N'Nguyễn', N'Thái', 30101, 301, 3, N'Nhà 12', N'0396684217', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (53, N'1', N'Nguyễn', N'Thái', 30102, 301, 3, N'Nhà 12', N'0396684217', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (54, N'19', N'Nguyễn', N'Đức Tâm', 40101, 401, 4, N'887 Lê Thanh Nghị', N'0987885565', 1)
INSERT [dbo].[tblDiachiKH] ([PK_sDiachiKHID], [FK_sKHID], [sHo], [sTen], [FK_iXaID], [FK_iHuyenID], [FK_iTinhID], [sDiachicuthe], [sSDT], [isTrangthai]) VALUES (55, N'11', N'Nguyễn', N'Đức Tâm', 40101, 401, 4, N'887 Lê Thanh Nghị', N'0987885565', 1)
SET IDENTITY_INSERT [dbo].[tblDiachiKH] OFF
GO
SET IDENTITY_INSERT [dbo].[tblDonhang] ON 

INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (9, N'1', 3, 1, CAST(N'2024-07-25T20:43:35.977' AS DateTime), NULL, NULL, NULL, NULL, NULL, 169000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (10, N'1', 3, 4, CAST(N'2024-07-25T20:46:57.903' AS DateTime), NULL, NULL, NULL, NULL, NULL, 169000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (11, N'1', 3, 2, CAST(N'2024-07-25T20:51:29.280' AS DateTime), NULL, NULL, NULL, NULL, NULL, 169000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (12, N'9', 3, 7, CAST(N'2024-07-26T00:25:51.737' AS DateTime), NULL, NULL, NULL, NULL, NULL, 68000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (13, N'9', 3, 8, CAST(N'2024-07-26T01:45:18.497' AS DateTime), NULL, NULL, NULL, NULL, NULL, 200000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (14, N'1', 3, 5, CAST(N'2024-07-26T01:52:16.407' AS DateTime), NULL, NULL, NULL, NULL, NULL, 35000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (15, N'3', 3, 9, CAST(N'2024-07-26T01:56:18.073' AS DateTime), NULL, NULL, NULL, NULL, NULL, 200000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (16, N'3', 3, 10, CAST(N'2024-07-26T01:57:23.280' AS DateTime), NULL, NULL, NULL, NULL, NULL, 129000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (17, N'3', 3, 10, CAST(N'2024-07-26T01:58:16.247' AS DateTime), NULL, NULL, NULL, NULL, NULL, 169000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (18, N'2', 3, 11, CAST(N'2024-07-26T01:59:43.967' AS DateTime), NULL, NULL, NULL, NULL, NULL, 168000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (19, N'2', 3, 12, CAST(N'2024-07-26T02:00:40.613' AS DateTime), NULL, NULL, NULL, NULL, NULL, 139000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (20, N'4', 3, 13, CAST(N'2024-07-27T01:51:03.827' AS DateTime), NULL, NULL, NULL, NULL, NULL, 79000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (21, N'4', 3, 14, CAST(N'2024-07-27T01:59:26.773' AS DateTime), NULL, NULL, NULL, NULL, NULL, 168000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (22, N'4', 3, 14, CAST(N'2024-07-27T02:04:13.177' AS DateTime), NULL, NULL, NULL, NULL, NULL, 200000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (23, N'4', 3, 14, CAST(N'2024-07-27T02:05:55.123' AS DateTime), NULL, NULL, NULL, NULL, NULL, 125000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (24, N'4', 3, 15, CAST(N'2024-07-27T02:11:05.073' AS DateTime), NULL, NULL, NULL, NULL, NULL, 169000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (25, N'5', 3, 16, CAST(N'2024-07-27T02:17:15.830' AS DateTime), NULL, NULL, NULL, NULL, NULL, 125000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (26, N'5', 3, 17, CAST(N'2024-07-27T02:22:50.677' AS DateTime), NULL, NULL, NULL, NULL, NULL, 169000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (27, N'1', 3, 18, CAST(N'2024-07-28T22:36:53.883' AS DateTime), NULL, NULL, NULL, NULL, NULL, 168000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (28, N'4', 3, 19, CAST(N'2024-07-28T22:47:48.923' AS DateTime), NULL, NULL, NULL, NULL, NULL, 168000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (29, N'1', 3, 20, CAST(N'2024-07-29T01:40:37.770' AS DateTime), NULL, NULL, NULL, NULL, NULL, 540000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (30, N'1', 3, 21, CAST(N'2024-07-29T01:43:39.560' AS DateTime), NULL, NULL, NULL, NULL, NULL, 86000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (31, N'1', 3, 21, CAST(N'2024-07-29T01:48:27.567' AS DateTime), NULL, NULL, NULL, NULL, NULL, 43000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (32, N'11', 3, 22, CAST(N'2024-07-29T04:10:43.017' AS DateTime), NULL, NULL, NULL, NULL, NULL, 79000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (33, N'11', 3, 23, CAST(N'2024-07-29T04:15:14.497' AS DateTime), NULL, NULL, NULL, NULL, NULL, 125000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (34, N'1', 3, 24, CAST(N'2024-07-29T21:38:42.150' AS DateTime), NULL, NULL, NULL, NULL, NULL, 373000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (35, N'1', 3, 1, CAST(N'2024-07-29T22:42:56.777' AS DateTime), NULL, NULL, NULL, NULL, NULL, 168000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (36, N'12', 3, 25, CAST(N'2024-07-30T02:40:33.750' AS DateTime), NULL, NULL, NULL, NULL, NULL, 400000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (37, N'12', 3, 26, CAST(N'2024-07-30T02:43:13.707' AS DateTime), NULL, NULL, NULL, NULL, NULL, 180000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (38, N'13', 3, 27, CAST(N'2024-07-30T04:11:41.177' AS DateTime), NULL, NULL, NULL, NULL, NULL, 169000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (39, N'12', 3, 25, CAST(N'2024-08-04T18:20:38.243' AS DateTime), NULL, NULL, NULL, NULL, NULL, 78000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (40, N'15', 3, 28, CAST(N'2024-08-04T21:26:38.010' AS DateTime), NULL, NULL, NULL, NULL, NULL, 79000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (41, N'17', 3, 29, CAST(N'2024-08-07T00:23:11.013' AS DateTime), NULL, NULL, NULL, NULL, NULL, 180000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (42, N'17', 3, 29, CAST(N'2024-08-07T00:24:05.660' AS DateTime), NULL, NULL, NULL, NULL, NULL, 16000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (43, N'17', 3, 29, CAST(N'2024-08-07T00:26:34.317' AS DateTime), NULL, NULL, NULL, NULL, NULL, 90000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (44, N'18', 3, 30, CAST(N'2024-08-07T00:37:30.640' AS DateTime), NULL, NULL, NULL, NULL, NULL, 24000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (45, N'18', 3, 30, CAST(N'2024-08-07T00:38:16.027' AS DateTime), NULL, NULL, NULL, NULL, NULL, 125000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (46, N'19', 3, 31, CAST(N'2024-08-07T00:49:32.467' AS DateTime), NULL, NULL, NULL, NULL, NULL, 99000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (47, N'19', 3, 31, CAST(N'2024-08-07T00:50:23.140' AS DateTime), NULL, NULL, NULL, NULL, NULL, 65000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (48, N'20', 3, 32, CAST(N'2024-08-07T00:53:35.100' AS DateTime), NULL, NULL, NULL, NULL, NULL, 90000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (49, N'20', 3, 32, CAST(N'2024-08-07T00:54:22.917' AS DateTime), NULL, NULL, NULL, NULL, NULL, 139000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (50, N'20', 3, 32, CAST(N'2024-08-07T00:56:03.903' AS DateTime), NULL, NULL, NULL, NULL, NULL, 20000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (51, N'11', 3, 23, CAST(N'2024-08-07T00:57:28.770' AS DateTime), NULL, NULL, NULL, NULL, NULL, 200000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (52, N'14', 3, 33, CAST(N'2024-08-07T01:00:41.997' AS DateTime), NULL, NULL, NULL, NULL, NULL, 39000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (53, N'14', 3, 34, CAST(N'2024-08-07T01:01:06.193' AS DateTime), NULL, NULL, NULL, NULL, NULL, 110000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (54, N'14', 3, 34, CAST(N'2024-08-07T01:02:07.120' AS DateTime), NULL, NULL, NULL, NULL, NULL, 79000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (55, N'13', 3, 35, CAST(N'2024-08-07T01:03:54.500' AS DateTime), NULL, NULL, NULL, NULL, NULL, 649000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (56, N'15', 3, 36, CAST(N'2024-08-07T01:06:14.723' AS DateTime), NULL, NULL, NULL, NULL, NULL, 110000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (57, N'16', 3, 37, CAST(N'2024-08-07T01:08:13.280' AS DateTime), NULL, NULL, NULL, NULL, NULL, 60000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (58, N'16', 3, 38, CAST(N'2024-08-07T01:09:22.920' AS DateTime), NULL, NULL, NULL, NULL, NULL, 400000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (59, N'21', 3, 39, CAST(N'2024-08-07T01:12:12.167' AS DateTime), NULL, NULL, NULL, NULL, NULL, 359000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (60, N'22', 3, 40, CAST(N'2024-08-07T01:16:04.927' AS DateTime), NULL, NULL, NULL, NULL, NULL, 90000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (61, N'22', 3, 41, CAST(N'2024-08-07T01:17:23.840' AS DateTime), NULL, NULL, NULL, NULL, NULL, 258000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (62, N'9', 3, 42, CAST(N'2024-08-07T02:44:08.043' AS DateTime), NULL, NULL, NULL, NULL, NULL, 99000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (63, N'19', 3, 43, CAST(N'2024-08-07T02:50:17.753' AS DateTime), NULL, NULL, NULL, NULL, NULL, 168000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (64, N'3', 3, 44, CAST(N'2024-08-07T03:06:37.287' AS DateTime), NULL, NULL, NULL, NULL, NULL, 99000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (65, N'1', 3, 45, CAST(N'2024-08-07T03:07:28.420' AS DateTime), NULL, NULL, NULL, NULL, NULL, 99000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (66, N'8', 3, 46, CAST(N'2024-08-07T03:09:39.003' AS DateTime), NULL, NULL, NULL, NULL, NULL, 117500)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (67, N'8', 3, 47, CAST(N'2024-08-07T03:10:34.817' AS DateTime), NULL, NULL, NULL, NULL, NULL, 169000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (68, N'23', 3, 48, CAST(N'2024-08-07T03:16:12.753' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1040000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (69, N'24', 3, 49, CAST(N'2024-08-07T03:19:22.600' AS DateTime), NULL, NULL, NULL, NULL, NULL, 144000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (70, N'25', 3, 50, CAST(N'2024-08-07T03:22:30.117' AS DateTime), NULL, NULL, NULL, NULL, NULL, 294000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (71, N'25', 3, 51, CAST(N'2024-08-07T04:40:04.570' AS DateTime), NULL, NULL, NULL, NULL, NULL, 180000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (72, N'1', 3, 52, CAST(N'2024-08-07T05:11:07.883' AS DateTime), NULL, NULL, NULL, NULL, NULL, 90000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (73, N'1', 3, 53, CAST(N'2024-08-07T05:15:41.867' AS DateTime), NULL, NULL, NULL, NULL, NULL, 90000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (74, N'1', 3, 52, CAST(N'2024-08-07T05:22:32.673' AS DateTime), NULL, NULL, NULL, NULL, NULL, 389000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (75, N'19', 3, 54, CAST(N'2024-08-08T09:35:50.280' AS DateTime), NULL, NULL, NULL, NULL, NULL, 65000)
INSERT [dbo].[tblDonhang] ([PK_iDonhangID], [FK_sKHID], [FK_iTrangthai], [FK_sDiachiKHID], [dThoigianmua], [dThoigiancapnhat], [sMavanchuyen], [fPhivanchuyen], [sGhichu], [iDungdiemthuong], [fTongtien]) VALUES (76, N'11', 1, 55, CAST(N'2024-08-08T09:45:25.647' AS DateTime), NULL, NULL, NULL, NULL, NULL, 79000)
SET IDENTITY_INSERT [dbo].[tblDonhang] OFF
GO
SET IDENTITY_INSERT [dbo].[tblGiohang] ON 

INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (1, N'1')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (2, N'9')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (3, N'3')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (4, N'2')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (5, N'4')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (6, N'5')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (7, N'11')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (8, N'12')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (9, N'13')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (10, N'15')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (11, N'16')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (12, N'17')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (13, N'18')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (14, N'19')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (15, N'20')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (16, N'14')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (17, N'21')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (18, N'22')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (19, N'8')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (20, N'23')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (21, N'24')
INSERT [dbo].[tblGiohang] ([PK_iGiohangID], [FK_iKHID]) VALUES (22, N'25')
SET IDENTITY_INSERT [dbo].[tblGiohang] OFF
GO
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (101, 1, N'Ba Đình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (102, 1, N'Hoàn Kiếm')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (103, 1, N'Tây Hồ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (104, 1, N'Long Biên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (105, 1, N'Cầu Giấy')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (106, 1, N'Đống Đa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (107, 1, N'Hai Bà Trưng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (108, 1, N'Hoàng Mai')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (109, 1, N'Thanh Xuân')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (110, 1, N'Hà Đông')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (111, 1, N'Sóc Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (112, 1, N'Đông Anh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (113, 1, N'Gia Lâm')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (201, 2, N'Quận 1')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (202, 2, N'Quận 2')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (203, 2, N'Quận 3')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (204, 2, N'Quận 4')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (205, 2, N'Quận 5')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (206, 2, N'Quận 6')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (207, 2, N'Quận 7')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (208, 2, N'Quận 8')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (209, 2, N'Quận 9')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (210, 2, N'Quận 10')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (211, 2, N'Quận 11')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (212, 2, N'Quận 12')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (213, 2, N'Bình Tân')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (214, 2, N'Tân Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (215, 2, N'Tân Phú')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (216, 2, N'Phú Nhuận')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (217, 2, N'Thủ Đức')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (218, 2, N'Bình Thạnh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (219, 2, N'Gò Vấp')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (220, 2, N'Bình Chánh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (301, 3, N'Lê Chân')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (302, 3, N'Hồng Bàng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (303, 3, N'Ngô Quyền')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (304, 3, N'Kiến An')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (305, 3, N'Hải An')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (306, 3, N'Dương Kinh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (307, 3, N'An Dương')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (308, 3, N'An Lão')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (309, 3, N'Bạch Long Vĩ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (310, 3, N'Cát Hải')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (311, 3, N'Kiến Thụy')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (312, 3, N'Thiên Lãng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (313, 3, N'Vĩnh Bảo')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (314, 3, N'Tiên Lãng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (401, 4, N'Hải Châu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (402, 4, N'Thanh Khê')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (403, 4, N'Sơn Trà')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (404, 4, N'Ngũ Hành Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (405, 4, N'Liên Chiểu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (406, 4, N'Hòa Vang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (407, 4, N'Cẩm Lệ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (501, 5, N'Hà Giang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (502, 5, N'Đồng Văn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (503, 5, N'Mèo Vạc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (504, 5, N'Yên Minh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (505, 5, N'Quản Bạ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (506, 5, N'Vị Xuyên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (507, 5, N'Bắc Mê')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (508, 5, N'Bắc Quang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (509, 5, N'Hoàng Su Phì')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (510, 5, N'Xín Mần')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (511, 5, N'Quang Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (601, 6, N'Thành phố Cao Bằng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (602, 6, N'Bảo Lạc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (603, 6, N'Bảo Lâm')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (604, 6, N'Hà Quảng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (605, 6, N'Trùng Khánh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (606, 6, N'Hạ Lang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (607, 6, N'Quảng Uyên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (608, 6, N'Phục Hoà')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (609, 6, N'Hoà An')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (610, 6, N'Nguyên Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (611, 6, N'Thạch An')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (701, 7, N'Thành phố Lai Châu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (702, 7, N'Tam Đường')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (703, 7, N'Mường Tè')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (704, 7, N'Sìn Hồ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (705, 7, N'Phong Thổ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (706, 7, N'Than Uyên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (707, 7, N'Tân Uyên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (708, 7, N'Nậm Nhùn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (801, 8, N'Thành phố Lào Cai')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (802, 8, N'Bát Xát')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (803, 8, N'Mường Khương')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (804, 8, N'Si Ma Cai')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (805, 8, N'Bắc Hà')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (806, 8, N'Bảo Thắng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (807, 8, N'Bảo Yên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (808, 8, N'Sa Pa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (809, 8, N'Văn Bàn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (901, 9, N'Thành phố Tuyên Quang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (902, 9, N'Lâm Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (903, 9, N'Na Hang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (904, 9, N'Chiêm Hóa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (905, 9, N'Hàm Yên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (906, 9, N'Yên Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (907, 9, N'Sơn Dương')
GO
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1001, 10, N'Thành phố Lạng Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1002, 10, N'Bình Gia')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1003, 10, N'Bắc Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1004, 10, N'Cao Lộc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1005, 10, N'Văn Lãng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1006, 10, N'Chi Lăng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1007, 10, N'Lộc Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1008, 10, N'Đình Lập')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1009, 10, N'Tràng Định')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1010, 10, N'Hữu Lũng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1011, 10, N'Văn Quan')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1101, 11, N'Thành Phố Bắc Kạn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1102, 11, N'Ba Bể')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1103, 11, N'Bạch Thông')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1104, 11, N'Chợ Đồn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1105, 11, N'Chợ Mới')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1106, 11, N'Na Rì')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1107, 11, N'Ngân Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1108, 11, N'Pác Nặm')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1201, 12, N'Thành phố Thái Nguyên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1202, 12, N'Thành phố Sông Công')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1203, 12, N'Định Hóa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1204, 12, N'Phú Lương')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1205, 12, N'Võ Nhai')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1206, 12, N'Đồng Hỷ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1207, 12, N'Phú Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1208, 12, N'Phổ Yên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1301, 13, N'Thành phố Yên Bái')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1302, 13, N'Thị xã Nghĩa Lộ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1303, 13, N'Lục Yên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1304, 13, N'Văn Yên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1305, 13, N'Mù Căng Chải')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1306, 13, N'Trạm Tấu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1307, 13, N'Trấn Yên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1308, 13, N'Văn Chấn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1309, 13, N'Yên Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1401, 14, N'Thành phố Sơn La')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1402, 14, N'Quỳnh Nhai')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1403, 14, N'Mường La')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1404, 14, N'Thuan Chau')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1405, 14, N'Phù Yên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1406, 14, N'Bắc Yên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1407, 14, N'Mai Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1408, 14, N'Sông Mã')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1409, 14, N'Yên Châu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1410, 14, N'Mộc Châu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1411, 14, N'Sốp Cộp')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1501, 15, N'Thành phố Việt Trì')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1502, 15, N'Thị xã Phú Thọ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1503, 15, N'Đoan Hùng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1504, 15, N'Hạ Hoà')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1505, 15, N'Thanh Ba')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1506, 15, N'Phù Ninh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1507, 15, N'Yên Lập')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1508, 15, N'Cẩm Khê')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1509, 15, N'Tam Nông')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1510, 15, N'Lâm Thao')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1511, 15, N'Thanh Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1512, 15, N'Thanh Thuỷ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1601, 16, N'Thành phố Vĩnh Yên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1602, 16, N'Thành phố Phúc Yên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1603, 16, N'Bình Xuyên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1604, 16, N'Tam Đảo')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1605, 16, N'Tam Dương')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1606, 16, N'Lập Thạch')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1607, 16, N'Vĩnh Tường')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1608, 16, N'Yên Lạc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1701, 17, N'Thành phố Hạ Long')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1702, 17, N'Thành phố Móng Cái')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1703, 17, N'Cam Phả')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1704, 17, N'Uông Bí')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1705, 17, N'Bình Liêu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1706, 17, N'Tiên Yên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1707, 17, N'Đầm Hà')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1708, 17, N'Hải Hà')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1709, 17, N'Ba Chẽ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1710, 17, N'Vân Đồn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1711, 17, N'Cô Tô')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1801, 18, N'Thành phố Bắc Giang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1802, 18, N'Yên Thế')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1803, 18, N'Tân Yên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1804, 18, N'Lạng Giang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1805, 18, N'Hiệp Hoà')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1806, 18, N'Lục Nam')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1807, 18, N'Lục Ngạn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1808, 18, N'Sơn Động')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1809, 18, N'Yên Dũng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1810, 18, N'Việt Yên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1901, 19, N'Thành phố Bắc Ninh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1902, 19, N'Thị xã Từ Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1903, 19, N'Gia Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1904, 19, N'Lương Tài')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1905, 19, N'Quế Võ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1906, 19, N'Tiên Du')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1907, 19, N'Thuận Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (1908, 19, N'Yên Phong')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2001, 20, N'Thành phố Hải Dương')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2002, 20, N'Thị xã Chí Linh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2003, 20, N'Bình Giang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2004, 20, N'Cẩm Giàng')
GO
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2005, 20, N'Gia Lộc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2006, 20, N'Kim Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2007, 20, N'Kinh Môn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2008, 20, N'Ninh Giang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2009, 20, N'Nam Sách')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2010, 20, N'Thanh Hà')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2011, 20, N'Thanh Miện')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2012, 20, N'Tứ Kỳ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2101, 21, N'Thành phố Hưng Yên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2102, 21, N'Thị xã Mỹ Hào')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2103, 21, N'Ân Thi')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2104, 21, N'Khoái Châu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2105, 21, N'Kim Động')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2106, 21, N'Phù Cừ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2107, 21, N'Tiên Lữ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2108, 21, N'Văn Giang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2109, 21, N'Văn Lâm')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2110, 21, N'Yên Mỹ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2201, 22, N'Thành phố Hòa Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2202, 22, N'Đà Bắc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2203, 22, N'Kim Bôi')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2204, 22, N'Lạc Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2205, 22, N'Lạc Thủy')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2206, 22, N'Lương Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2207, 22, N'Mai Châu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2208, 22, N'Tân Lạc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2209, 22, N'Yên Thủy')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2210, 22, N'Cao Phong')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2301, 23, N'Thành phố Phủ Lý')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2302, 23, N'Bình Lục')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2303, 23, N'Duy Tiên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2304, 23, N'Kim Bảng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2305, 23, N'Lý Nhân')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2306, 23, N'Thanh Liêm')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2401, 24, N'Thành phố Nam Định')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2402, 24, N'Giao Thủy')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2403, 24, N'Hải Hậu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2404, 24, N'Mỹ Lộc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2405, 24, N'Nghĩa Hưng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2406, 24, N'Trun Nhi')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2407, 24, N'Vụ Bản')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2408, 24, N'Xuân Trường')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2409, 24, N'Ý Yên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2501, 25, N'Thành phố Thái Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2502, 25, N'Đông Hưng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2503, 25, N'Hưng Hà')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2504, 25, N'Kiến Xương')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2505, 25, N'Quỳnh Phụ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2506, 25, N'Thai Thuy')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2507, 25, N'Tiền Hải')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2508, 25, N'Vũ Thư')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2601, 26, N'Thành phố Ninh Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2602, 26, N'Thị xã Tam Điệp')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2603, 26, N'Gia Viễn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2604, 26, N'Hoa Lư')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2605, 26, N'Kim Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2606, 26, N'Nho Quan')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2607, 26, N'Yên Khánh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2608, 26, N'Yên Mô')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2701, 27, N'Thành phố Thanh Hóa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2702, 27, N'Thị xã Bỉm Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2703, 27, N'Thị xã Sầm Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2704, 27, N'Bá Thước')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2705, 27, N'Cẩm Thủy')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2706, 27, N'Đông Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2707, 27, N'Hà Trung')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2708, 27, N'Hậu Lộc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2709, 27, N'Hoằng Hóa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2710, 27, N'Lang Chánh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2711, 27, N'Mường Lát')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2712, 27, N'Nga Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2713, 27, N'Ngọc Lặc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2714, 27, N'Như Thanh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2715, 27, N'Như Xuân')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2716, 27, N'Nông Cống')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2717, 27, N'Quan Hóa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2718, 27, N'Quan Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2719, 27, N'Quảng Xương')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2720, 27, N'Thạch Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2721, 27, N'Thiệu Hóa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2722, 27, N'Tĩnh Gia')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2723, 27, N'Triệu Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2724, 27, N'Thường Xuân')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2725, 27, N'Vĩnh Lộc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2726, 27, N'Yên Định')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2801, 28, N'Thành phố Vinh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2802, 28, N'Thị xã Cửa Lò')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2803, 28, N'Thị xã Thái Hòa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2804, 28, N'Thị xã Hoàng Mai')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2805, 28, N'Anh Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2806, 28, N'Con Cuông')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2807, 28, N'Diễn Châu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2808, 28, N'Dô Lương')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2809, 28, N'Hưng Nguyên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2810, 28, N'Kỳ Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2811, 28, N'Nghĩa Đàn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2812, 28, N'Nghi Lộc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2813, 28, N'Nam Đàn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2814, 28, N'Quế Phong')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2815, 28, N'Quỳ Châu')
GO
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2816, 28, N'Quỳ Hợp')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2817, 28, N'Quỳnh Lưu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2818, 28, N'Tân Kỳ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2819, 28, N'Thanh Chương')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2820, 28, N'Tương Dương')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2821, 28, N'Yên Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2901, 29, N'Thành phố Hà Tĩnh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2902, 29, N'Thị xã Hồng Lĩnh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2903, 29, N'Thị xã Kỳ Anh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2904, 29, N'Cẩm Xuyên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2905, 29, N'Can Lộc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2906, 29, N'Dức Thọ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2907, 29, N'Hương Khê')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2908, 29, N'Hương Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2909, 29, N'Kỳ Anh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2910, 29, N'Lộc Hà')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2911, 29, N'Nghi Xuân')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2912, 29, N'Thạch Hà')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (2913, 29, N'Vũ Quang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3001, 30, N'Thành phố Đồng Hới')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3002, 30, N'Thị xã Ba Đồn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3003, 30, N'Bố Trạch')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3004, 30, N'Lệ Thủy')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3005, 30, N'Minh Hóa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3006, 30, N'Quảng Ninh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3007, 30, N'Quảng Trạch')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3008, 30, N'Tuyên Hóa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3101, 31, N'Thành phố Đông Hà')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3102, 31, N'Thị xã Quảng Trị')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3103, 31, N'Cồn Cỏ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3104, 31, N'Cam Lộ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3105, 31, N'Đa Krông')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3106, 31, N'Gio Linh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3107, 31, N'Hải Lăng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3108, 31, N'Hướng Hóa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3109, 31, N'Triệu Phong')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3110, 31, N'Vĩnh Linh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3201, 32, N'Thành phố Huế')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3202, 32, N'Thị xã Hương Thủy')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3203, 32, N'Thị xã Hương Trà')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3204, 32, N'A Lưới')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3205, 32, N'Nam Đông')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3206, 32, N'Phong Điền')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3207, 32, N'Phú Lộc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3208, 32, N'Phú Vang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3209, 32, N'Quảng Điền')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3301, 33, N'Thành phố Tam Kỳ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3302, 33, N'Thành phố Hội An')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3303, 33, N'Thị xã Điện Bàn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3304, 33, N'Bắc Trà My')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3305, 33, N'Dông Giang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3306, 33, N'Dai Lộc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3307, 33, N'Đông Giang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3308, 33, N'Nâm Giang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3309, 33, N'Hiệp Đức')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3310, 33, N'Nông Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3311, 33, N'Phước Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3312, 33, N'Phú Ninh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3313, 33, N'Nam Trà My')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3314, 33, N'Tây Giang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3315, 33, N'Tiên Phước')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3316, 33, N'Thăng Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3317, 33, N'Duy Xuyên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3318, 33, N'Quế Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3319, 33, N'Núi Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3320, 33, N'Đại Lộc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3401, 34, N'Thành phố Quảng Ngãi')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3402, 34, N'Thị xã Đức Phổ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3403, 34, N'Ba Tơ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3404, 34, N'Bình Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3405, 34, N'Minh Long')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3406, 34, N'Mộ Đức')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3407, 34, N'Nghĩa Hành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3408, 34, N'Sơn Hà')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3409, 34, N'Sơn Tây')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3410, 34, N'Sơn Tịnh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3411, 34, N'Tư Nghĩa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3412, 34, N'Trà Bồng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3413, 34, N'Lý Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3501, 35, N'Thành phố Quy Nhơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3502, 35, N'Thị xã An Nhơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3503, 35, N'Thị xã Hoài Nhơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3504, 35, N'An Lão')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3505, 35, N'Hoài Ân')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3506, 35, N'Phù Cát')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3507, 35, N'Phù Mỹ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3508, 35, N'Tây Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3509, 35, N'Tuy Phước')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3510, 35, N'Vân Canh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3511, 35, N'Vĩnh Thạnh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3601, 36, N'Thành phố Tuy Hòa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3602, 36, N'Thị xã Sông Cầu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3603, 36, N'Dông Xuân')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3604, 36, N'Dông Hòa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3605, 36, N'Phú Hòa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3606, 36, N'Sơn Hòa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3607, 36, N'Sông Hinh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3608, 36, N'Tây Hòa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3701, 37, N'Thành phố Nha Trang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3702, 37, N'Thị xã Ninh Hòa')
GO
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3703, 37, N'Thị xã Cam Ranh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3704, 37, N'Diên Khánh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3705, 37, N'Khánh Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3706, 37, N'Khánh Vĩnh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3707, 37, N'Trường Sa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3708, 37, N'Vạn Ninh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3709, 37, N'Cam Lâm')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3801, 38, N'Thành phố Phan Rang - Tháp Chàm')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3802, 38, N'Bác Ái')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3803, 38, N'Ninh Hải')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3804, 38, N'Ninh Phước')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3805, 38, N'Ninh Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3806, 38, N'Thuận Bắc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3807, 38, N'Thuận Nam')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3901, 39, N'Thành phố Phan Thiết')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3902, 39, N'Thị xã La Gi')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3903, 39, N'Tuy Phong')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3904, 39, N'Bắc Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3905, 39, N'Hàm Thuận Bắc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3906, 39, N'Hàm Thuận Nam')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3907, 39, N'Hàm Tân')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3908, 39, N'Tánh Linh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3909, 39, N'Đức Linh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (3910, 39, N'Phú Quý')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4001, 40, N'Thành phố Kon Tum')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4002, 40, N'Đắk Glei')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4003, 40, N'Ngọc Hồi')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4004, 40, N'Dắk Tô')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4005, 40, N'Kon Plông')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4006, 40, N'Kon Rẫy')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4007, 40, N'Sa Thầy')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4008, 40, N'Tu Mơ Rông')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4009, 40, N'Ia H\Drai')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4101, 41, N'Thành phố Pleiku')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4102, 41, N'Thị xã An Khê')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4103, 41, N'Thị xã Ayun Pa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4104, 41, N'Chư Păh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4105, 41, N'Chư Prông')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4106, 41, N'Chư Sê')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4107, 41, N'Đắk Đoa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4108, 41, N'Đắk Pơ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4109, 41, N'Ia Grai')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4110, 41, N'Ia Pa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4111, 41, N'Kbang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4112, 41, N'Kông Chro')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4113, 41, N'Krông Pa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4114, 41, N'Mang Yang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4115, 41, N'Phú Thiện')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4116, 41, N'Đức Cơ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4201, 42, N'Thành phố Buôn Ma Thuột')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4202, 42, N'Thị xã Buôn Hồ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4203, 42, N'Buôn Đôn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4204, 42, N'Cư Kuin')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4205, 42, N'Cư M\gar')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4206, 42, N'Ea H\leo')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4207, 42, N'Ea Kar')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4208, 42, N'Ea Súp')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4209, 42, N'Krông Ana')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4210, 42, N'Krông Bông')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4211, 42, N'Krông Buk')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4212, 42, N'Krông Năng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4213, 42, N'Krông Pắc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4214, 42, N'Lăk')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4215, 42, N'M\Đrăk')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4301, 43, N'Thị xã Gia Nghĩa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4302, 43, N'Cư Jút')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4303, 43, N'Dắk Glong')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4304, 43, N'Dắk Mil')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4305, 43, N'Dắk R\Lấp')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4306, 43, N'Krông Nô')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4307, 43, N'Tuy Đức')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4401, 44, N'Thành phố Đà Lạt')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4402, 44, N'Thành phố Bảo Lộc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4403, 44, N'Bảo Lâm')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4404, 44, N'Cát Tiên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4405, 44, N'Dam Rông')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4406, 44, N'Đạ Huoai')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4407, 44, N'Đạ Tẻh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4408, 44, N'Đam Rông')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4409, 44, N'Di Linh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4410, 44, N'Đơn Dương')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4411, 44, N'Dức Trọng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4412, 44, N'Lạc Dương')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4413, 44, N'Lâm Hà')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4501, 45, N'Thị xã Đồng Xoài')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4502, 45, N'Thị xã Bình Long')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4503, 45, N'Thị xã Phước Long')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4504, 45, N'Bù Đăng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4505, 45, N'Bù Đốp')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4506, 45, N'Bù Gia Mập')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4507, 45, N'Chơn Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4508, 45, N'Đồng Phú')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4509, 45, N'Hớn Quản')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4510, 45, N'Lộc Ninh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4511, 45, N'Phú Riềng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4601, 46, N'Thành phố Tây Ninh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4602, 46, N'Thị xã Hòa Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4603, 46, N'Thị xã Trảng Bàng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4604, 46, N'Bến Cầu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4605, 46, N'Châu Thành')
GO
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4606, 46, N'Dương Minh Châu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4607, 46, N'Gò Dầu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4608, 46, N'Tân Biên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4609, 46, N'Tân Châu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4701, 47, N'Thành phố Thủ Dầu Một')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4702, 47, N'Thành phố Dĩ An')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4703, 47, N'Thành phố Thuận An')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4704, 47, N'Thị xã Bến Cát')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4705, 47, N'Thị xã Tân Uyên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4706, 47, N'Bắc Tân Uyên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4707, 47, N'Bàu Bàng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4708, 47, N'Dầu Tiếng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4709, 47, N'Phú Giáo')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4801, 48, N'Thành phố Biên Hòa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4802, 48, N'Thành phố Long Khánh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4803, 48, N'Cẩm Mỹ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4804, 48, N'Định Quán')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4805, 48, N'Long Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4806, 48, N'Nhơn Trạch')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4807, 48, N'Tân Phú')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4808, 48, N'Thống Nhất')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4809, 48, N'Trảng Bom')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4810, 48, N'Vĩnh Cửu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4811, 48, N'Xuân Lộc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4901, 49, N'Thành phố Vũng Tàu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4902, 49, N'Thành phố Bà Rịa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4903, 49, N'Thị xã Phú Mỹ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4904, 49, N'Châu Đức')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4905, 49, N'Côn Đảo')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4906, 49, N'Đất Đỏ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4907, 49, N'Long Điền')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (4908, 49, N'Xuyên Mộc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5001, 50, N'Thành phố Tân An')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5002, 50, N'Thị xã Kiến Tường')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5003, 50, N'Bến Lức')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5004, 50, N'Cần Đước')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5005, 50, N'Cần Giuộc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5006, 50, N'Châu Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5007, 50, N'Đức Hòa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5008, 50, N'Đức Huệ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5009, 50, N'Mộc Hóa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5010, 50, N'Tân Hưng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5011, 50, N'Tân Thạnh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5012, 50, N'Tân Trụ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5013, 50, N'Thạnh Hóa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5014, 50, N'Thủ Thừa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5015, 50, N'Vĩnh Hưng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5101, 51, N'Thành phố Mỹ Tho')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5102, 51, N'Thị xã Cai Lậy')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5103, 51, N'Thị xã Gò Công')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5104, 51, N'Cái Bè')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5105, 51, N'Cai Lậy')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5106, 51, N'Châu Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5107, 51, N'Chợ Gạo')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5108, 51, N'Gò Công Đông')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5109, 51, N'Gò Công Tây')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5110, 51, N'Tân Phú Đông')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5111, 51, N'Tân Phước')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5201, 52, N'Thành phố Bến Tre')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5202, 52, N'Thị xã Ba Tri')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5203, 52, N'Bình Đại')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5204, 52, N'Châu Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5205, 52, N'Chợ Lách')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5206, 52, N'Giồng Trôm')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5207, 52, N'Mỏ Cày Bắc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5208, 52, N'Mỏ Cày Nam')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5209, 52, N'Thạnh Phú')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5301, 53, N'Thành phố Trà Vinh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5302, 53, N'Thị xã Duyên Hải')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5303, 53, N'Càng Long')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5304, 53, N'Cầu Kè')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5305, 53, N'Cầu Ngang')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5306, 53, N'Châu Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5307, 53, N'Tiểu Cần')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5308, 53, N'Trang Định')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5309, 53, N'Duyên Hải')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5401, 54, N'Thành phố Vĩnh Long')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5402, 54, N'Thị xã Bình Minh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5403, 54, N'Bình Tân')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5404, 54, N'Long Hồ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5405, 54, N'Mang Thít')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5406, 54, N'Tam Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5407, 54, N'Trá Ôn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5408, 54, N'Vũng Liêm')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5501, 55, N'Thành phố Cao Lãnh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5502, 55, N'Thành phố Sa Đéc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5503, 55, N'Thị xã Hồng Ngự')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5504, 55, N'Châu Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5505, 55, N'Châu Thành A')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5506, 55, N'Lai Vung')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5507, 55, N'Lấp Vò')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5508, 55, N'Tam Nông')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5509, 55, N'Tân Hồng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5510, 55, N'Thanh Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5511, 55, N'Tháp Mười')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5601, 56, N'Thành phố Long Xuyên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5602, 56, N'Thành phố Châu Đốc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5603, 56, N'Thị xã Tân Châu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5604, 56, N'An Phú')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5605, 56, N'Châu Phú')
GO
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5606, 56, N'Châu Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5607, 56, N'Chợ Mới')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5608, 56, N'Phú Tân')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5609, 56, N'Thất Sơn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5610, 56, N'Tịnh Biên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5611, 56, N'Tri Tôn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5701, 57, N'Thành phố Rạch Giá')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5702, 57, N'Thành phố Hà Tiên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5703, 57, N'Thị xã Kiên Lương')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5704, 57, N'An Biên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5705, 57, N'An Minh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5706, 57, N'Châu Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5707, 57, N'Giang Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5708, 57, N'Giồng Riềng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5709, 57, N'Gò Quao')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5710, 57, N'Hòn Đất')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5711, 57, N'Kiên Hải')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5712, 57, N'Kiên Lương')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5713, 57, N'Phú Quốc')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5714, 57, N'Tân Hiệp')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5715, 57, N'U Minh Thượng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5716, 57, N'Vĩnh Thuận')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5801, 58, N'Thành phố Cần Thơ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5802, 58, N'Quận Ninh Kiều')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5803, 58, N'Quận Bình Thủy')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5804, 58, N'Quận Cái Răng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5805, 58, N'Quận Ô Môn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5806, 58, N'Quận Thốt Nốt')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5807, 58, N'Huyện Cờ Đỏ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5808, 58, N'Huyện Phong Điền')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5809, 58, N'Huyện Thới Lai')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5810, 58, N'Huyện Vĩnh Thạnh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5901, 59, N'Thành phố Vị Thanh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5902, 59, N'Thị xã Ngã Bảy')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5903, 59, N'Thị xã Long Mỹ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5904, 59, N'Huyện Châu Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5905, 59, N'Huyện Châu Thành A')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5906, 59, N'Huyện Long Mỹ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5907, 59, N'Huyện Phụng Hiệp')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (5908, 59, N'Huyện Vị Thủy')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6001, 60, N'Thành phố Sóc Trăng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6002, 60, N'Thị xã Vĩnh Châu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6003, 60, N'Thị xã Ngã Năm')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6004, 60, N'Huyện Châu Thành')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6005, 60, N'Huyện Cù Lao Dung')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6006, 60, N'Huyện Kế Sách')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6007, 60, N'Huyện Long Phú')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6008, 60, N'Huyện Mỹ Tú')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6009, 60, N'Huyện Mỹ Xuyên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6010, 60, N'Huyện Thạnh Trị')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6011, 60, N'Huyện Trần Đề')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6101, 61, N'Thành phố Bạc Liêu')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6102, 61, N'Thị xã Giá Rai')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6103, 61, N'Huyện Đông Hải')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6104, 61, N'Huyện Hòa Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6105, 61, N'Huyện Hồng Dân')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6106, 61, N'Huyện Phước Long')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6107, 61, N'Huyện Vĩnh Lợi')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6201, 62, N'Thành phố Cà Mau')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6202, 62, N'Huyện Cái Nước')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6203, 62, N'Huyện Đầm Dơi')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6204, 62, N'Huyện Năm Căn')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6205, 62, N'Huyện Ngọc Hiển')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6206, 62, N'Huyện Phú Tân')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6207, 62, N'Huyện Thới Bình')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6208, 62, N'Huyện Trần Văn Thời')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6209, 62, N'Huyện U Minh')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6301, 63, N'Thành phố Điện Biên Phủ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6302, 63, N'Thị xã Mường Lay')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6303, 63, N'Huyện Điện Biên')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6304, 63, N'Huyện Điện Biên Đông')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6305, 63, N'Huyện Mường Ảng')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6306, 63, N'Huyện Mường Chà')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6307, 63, N'Huyện Mường Nhé')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6308, 63, N'Huyện Nậm Pồ')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6309, 63, N'Huyện Tủa Chùa')
INSERT [dbo].[tblHuyen] ([PK_iHuyenID], [FK_iTinhID], [sTenhuyen]) VALUES (6310, 63, N'Huyện Tuần Giáo')
GO
INSERT [dbo].[tblKetquathucte] ([FK_iSanphamId], [FK_iKhachhangId], [fXephang]) VALUES (15, 19, 5)
INSERT [dbo].[tblKetquathucte] ([FK_iSanphamId], [FK_iKhachhangId], [fXephang]) VALUES (30, 19, 5)
INSERT [dbo].[tblKetquathucte] ([FK_iSanphamId], [FK_iKhachhangId], [fXephang]) VALUES (30, 21, 5)
INSERT [dbo].[tblKetquathucte] ([FK_iSanphamId], [FK_iKhachhangId], [fXephang]) VALUES (52, 21, 4)
INSERT [dbo].[tblKetquathucte] ([FK_iSanphamId], [FK_iKhachhangId], [fXephang]) VALUES (16, 21, 5)
INSERT [dbo].[tblKetquathucte] ([FK_iSanphamId], [FK_iKhachhangId], [fXephang]) VALUES (16, 19, 5)
INSERT [dbo].[tblKetquathucte] ([FK_iSanphamId], [FK_iKhachhangId], [fXephang]) VALUES (11, 19, 5)
INSERT [dbo].[tblKetquathucte] ([FK_iSanphamId], [FK_iKhachhangId], [fXephang]) VALUES (15, 9, 5)
INSERT [dbo].[tblKetquathucte] ([FK_iSanphamId], [FK_iKhachhangId], [fXephang]) VALUES (1, 9, 4)
INSERT [dbo].[tblKetquathucte] ([FK_iSanphamId], [FK_iKhachhangId], [fXephang]) VALUES (3, 9, 5)
INSERT [dbo].[tblKetquathucte] ([FK_iSanphamId], [FK_iKhachhangId], [fXephang]) VALUES (7, 19, 4)
INSERT [dbo].[tblKetquathucte] ([FK_iSanphamId], [FK_iKhachhangId], [fXephang]) VALUES (52, 19, 4)
INSERT [dbo].[tblKetquathucte] ([FK_iSanphamId], [FK_iKhachhangId], [fXephang]) VALUES (1, 19, 3)
INSERT [dbo].[tblKetquathucte] ([FK_iSanphamId], [FK_iKhachhangId], [fXephang]) VALUES (3, 19, 3)
INSERT [dbo].[tblKetquathucte] ([FK_iSanphamId], [FK_iKhachhangId], [fXephang]) VALUES (8, 19, 4)
INSERT [dbo].[tblKetquathucte] ([FK_iSanphamId], [FK_iKhachhangId], [fXephang]) VALUES (29, 19, 5)
GO
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'1', 2, N'Nguyễn Hồng', N'Ngọc', N'0971575855', 0, CAST(N'2001-07-20T00:00:00.000' AS DateTime), 0, N'Sinh viên')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'10', 10, N'Nguyễn', N'Mai Hoa', N'0961005234', NULL, CAST(N'2006-07-02T00:00:00.000' AS DateTime), 0, N'Sinh viên')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'11', 11, N'Nguyễn', N'Thái', N'0396684217', NULL, CAST(N'1965-11-06T00:00:00.000' AS DateTime), 1, N'Tự do')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'12', 12, N'Nguyễn', N'Nguyệt', N'0962323365', NULL, CAST(N'1974-01-08T00:00:00.000' AS DateTime), 0, N'Kinh doanh')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'13', 13, N'Phạm', N'Khánh Phương', N'0963323651', NULL, CAST(N'1993-10-21T00:00:00.000' AS DateTime), 0, N'Dược sĩ')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'14', 14, N'Bùi', N'Thảo Duyên', N'0963356241', NULL, CAST(N'2001-07-13T00:00:00.000' AS DateTime), 0, N'Nhân viên ngân hàng')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'15', 15, N'Lã', N'Phương Thảo', N'0963236245', NULL, CAST(N'2001-10-28T00:00:00.000' AS DateTime), 0, N'Tuyển dụng (HR)')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'16', 16, N'Nguyễn', N'Ngọc', N'0945125125', NULL, CAST(N'2001-07-20T00:00:00.000' AS DateTime), 0, N'Sinh viên')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'17', 17, N'Nguyễn ', N'Quang Mạnh', N'0963363212', 100, CAST(N'1999-07-01T00:00:00.000' AS DateTime), 1, N'Bác sĩ')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'18', 18, N'Phạm', N'Trường Giang', N'0364512351', 100, CAST(N'1996-10-04T00:00:00.000' AS DateTime), 1, N'Kinh doanh')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'19', 19, N'Lê', N'Thục Khánh An', N'0941265214', 100, CAST(N'1990-03-08T00:00:00.000' AS DateTime), 0, N'Nhân viên kinh doanh')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'2', 4, N'Trần Thị Hồng', N'Nhung', N'0341642648', 200, CAST(N'2001-08-05T00:00:00.000' AS DateTime), 0, N'Tự do')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'20', 20, N'Vũ', N'Hồng Hạnh', N'0978545652', 100, CAST(N'2006-05-01T00:00:00.000' AS DateTime), 0, N'Sinh viên')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'21', 21, N'Lâm', N'Minh Kiệt', N'0978514212', 100, CAST(N'1883-07-30T00:00:00.000' AS DateTime), 1, N'Tự do')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'22', 22, N'Đặng', N'Trâm Anh', N'0363232511', 100, CAST(N'2007-09-12T00:00:00.000' AS DateTime), 0, N'Học sinh')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'23', 23, N'Tăng', N'Thanh Hà', N'0978653214', NULL, CAST(N'1986-10-24T00:00:00.000' AS DateTime), 0, N'Kinh doanh tự do')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'24', 24, N'Trần', N'Quang Đăng', N'0986421532', NULL, CAST(N'1989-05-06T00:00:00.000' AS DateTime), 1, N'Vũ công')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'25', 25, N'Nguyễn', N'Đức Tâm', N'0987885565', NULL, CAST(N'1884-07-28T00:00:00.000' AS DateTime), 0, N'Giáo viên')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'26', 26, N'Vũ ', N'Trọng Đạt', N'0975415234', 100, CAST(N'2008-06-04T00:00:00.000' AS DateTime), 1, N'Học sinh')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'3', 3, N'Trần Thị Thanh', N'Hương', N'0396423516', 300, CAST(N'2001-05-19T00:00:00.000' AS DateTime), 0, N'Điều dưỡng')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'4', 5, N'Chu Minh', N'Đạo', N'0964236257', 100, CAST(N'2000-08-23T00:00:00.000' AS DateTime), 1, N'Lập trình viên')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'5', 6, N'Trần Thị Thu', N'Huyền', N'0946325336', 200, CAST(N'2000-08-22T00:00:00.000' AS DateTime), 0, N'Kế toán')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'6', 7, N'Nguyễn Thanh', N'Nga', N'0344236780', 300, CAST(N'1971-05-21T00:00:00.000' AS DateTime), 0, N'Tự do')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'8', 8, N'Nguyễn', N'Đạt', N'0392346667', NULL, CAST(N'2001-12-29T00:00:00.000' AS DateTime), 1, N'Kỹ sư điện')
INSERT [dbo].[tblKhachhang] ([PK_sKHID], [FK_iTaikhoanID], [sHo], [sTen], [sSDT], [iDiemthuong], [dNgaysinh], [isGioitinh], [sNghenghiep]) VALUES (N'9', 9, N'Nguyễn', N'Tùng', N'0961326426', NULL, CAST(N'1994-11-08T00:00:00.000' AS DateTime), 1, N'May mặc')
GO
SET IDENTITY_INSERT [dbo].[tblNhacungcap] ON 

INSERT [dbo].[tblNhacungcap] ([PK_iNCCID], [sTenNCC], [sSDT], [sEmail], [sMasothue]) VALUES (1, N'	FIRST NEWS', N'0961232143', N'firstnews@gmail.com', N'11243')
INSERT [dbo].[tblNhacungcap] ([PK_iNCCID], [sTenNCC], [sSDT], [sEmail], [sMasothue]) VALUES (2, N'	Nhã Nam', N'0963532631', N'nhanamadmin@gmail.com', N'54376')
INSERT [dbo].[tblNhacungcap] ([PK_iNCCID], [sTenNCC], [sSDT], [sEmail], [sMasothue]) VALUES (3, N'CÔNG TY TNHH PHÁT HÀNH S BOOKS', N'094563211', N'sbookvn@gmail.com', N'137154')
INSERT [dbo].[tblNhacungcap] ([PK_iNCCID], [sTenNCC], [sSDT], [sEmail], [sMasothue]) VALUES (4, N'CÔNG TY TNHH PHÁT HÀNH S BOOKS', N'0946325364', N'sbookvn@gmail.com', N'137154')
SET IDENTITY_INSERT [dbo].[tblNhacungcap] OFF
GO
INSERT [dbo].[tblPhanquyen] ([PK_iQuyenID], [sTenquyen]) VALUES (1, N'admin')
INSERT [dbo].[tblPhanquyen] ([PK_iQuyenID], [sTenquyen]) VALUES (2, N'Nhân viên')
INSERT [dbo].[tblPhanquyen] ([PK_iQuyenID], [sTenquyen]) VALUES (3, N'Khách hàng')
GO
INSERT [dbo].[tblPhieukiemke] ([PK_iPhieukiemkeID], [dThoigiantao], [sGhichu]) VALUES (1, CAST(N'2024-08-04T16:57:26.603' AS DateTime), N'Kiểm kê lần 1')
INSERT [dbo].[tblPhieukiemke] ([PK_iPhieukiemkeID], [dThoigiantao], [sGhichu]) VALUES (2, CAST(N'2024-08-04T17:34:01.653' AS DateTime), N'Kiểm kê lần 2')
INSERT [dbo].[tblPhieukiemke] ([PK_iPhieukiemkeID], [dThoigiantao], [sGhichu]) VALUES (3, CAST(N'2024-08-04T21:30:52.323' AS DateTime), N'Kiểm kê ngày 8/4')
GO
INSERT [dbo].[tblPhieunhaphang] ([PK_iPhieunhaphangID], [FK_sNCCID], [fChietkhau], [dThoigiantao], [sGhichu], [fThueGTGT]) VALUES (0, 2, 250000, CAST(N'2024-08-03T16:23:36.777' AS DateTime), N'Không có ghi chú', NULL)
INSERT [dbo].[tblPhieunhaphang] ([PK_iPhieunhaphangID], [FK_sNCCID], [fChietkhau], [dThoigiantao], [sGhichu], [fThueGTGT]) VALUES (1, 1, 250000, CAST(N'2024-08-03T16:28:34.323' AS DateTime), N'Không ghi chú', NULL)
INSERT [dbo].[tblPhieunhaphang] ([PK_iPhieunhaphangID], [FK_sNCCID], [fChietkhau], [dThoigiantao], [sGhichu], [fThueGTGT]) VALUES (5, 2, 260000, CAST(N'2024-08-03T17:13:11.917' AS DateTime), N'Lần thứ 2', NULL)
INSERT [dbo].[tblPhieunhaphang] ([PK_iPhieunhaphangID], [FK_sNCCID], [fChietkhau], [dThoigiantao], [sGhichu], [fThueGTGT]) VALUES (6, 2, 260000, CAST(N'2024-08-03T17:14:59.767' AS DateTime), N'lần 3', NULL)
INSERT [dbo].[tblPhieunhaphang] ([PK_iPhieunhaphangID], [FK_sNCCID], [fChietkhau], [dThoigiantao], [sGhichu], [fThueGTGT]) VALUES (7, 2, 260000, CAST(N'2024-08-03T17:18:08.770' AS DateTime), N'Lần 4', NULL)
INSERT [dbo].[tblPhieunhaphang] ([PK_iPhieunhaphangID], [FK_sNCCID], [fChietkhau], [dThoigiantao], [sGhichu], [fThueGTGT]) VALUES (8, 2, 260000, CAST(N'2024-08-03T17:20:44.847' AS DateTime), N'Thử', NULL)
INSERT [dbo].[tblPhieunhaphang] ([PK_iPhieunhaphangID], [FK_sNCCID], [fChietkhau], [dThoigiantao], [sGhichu], [fThueGTGT]) VALUES (9, 2, 260000, CAST(N'2024-08-03T18:05:27.443' AS DateTime), N'Lần 4', NULL)
INSERT [dbo].[tblPhieunhaphang] ([PK_iPhieunhaphangID], [FK_sNCCID], [fChietkhau], [dThoigiantao], [sGhichu], [fThueGTGT]) VALUES (10, 2, 260000, CAST(N'2024-08-03T18:14:57.480' AS DateTime), N'Không ghi chú', NULL)
INSERT [dbo].[tblPhieunhaphang] ([PK_iPhieunhaphangID], [FK_sNCCID], [fChietkhau], [dThoigiantao], [sGhichu], [fThueGTGT]) VALUES (11, 2, 200000, CAST(N'2024-08-04T21:29:52.977' AS DateTime), N'Nhập hàng ngày 8/4', NULL)
INSERT [dbo].[tblPhieunhaphang] ([PK_iPhieunhaphangID], [FK_sNCCID], [fChietkhau], [dThoigiantao], [sGhichu], [fThueGTGT]) VALUES (12, 2, 30000, CAST(N'2024-08-08T09:41:56.387' AS DateTime), NULL, NULL)
INSERT [dbo].[tblPhieunhaphang] ([PK_iPhieunhaphangID], [FK_sNCCID], [fChietkhau], [dThoigiantao], [sGhichu], [fThueGTGT]) VALUES (13, 2, 300000, CAST(N'2024-08-08T16:15:26.870' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tblSanpham] ON 

INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (1, 6, N'Coraline (Tái Bản 2023)', NULL, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935235239579.jpg', N'Khi Coraline bước qua cánh cửa, nó nhìn thấy một ngôi nhà giống hệt nhà mình. Chỉ có điều, mọi thứ dường như tốt đẹp và hấp dẫn hơn.

Nơi ấy có mẹ khác của nó, và cả cha khác nữa. Họ muốn nó ở lại làm con gái bé bỏng của họ. Họ muốn thay đổi nó và giữ nó bên mình mãi mãi.

Nhưng từ phía sau cánh cửa, Coraline mới biết điều nó thật sự cần. Nó khao khát trở lại cuộc sống đích thực của mình. Bằng tất cả trí khôn và lòng dũng cảm, Coraline đã thực hiện một hành trình phi thường, ly kỳ và vô cùng bất ngờ.', 348, 350, 68000, 35000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (2, 5, N'Những Vị Thần Nước Mỹ', NULL, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_244718_1_5475.jpg', N'“Độc đáo, cuốn hút, và sáng tạo bất tận.” - George R. R. Martin, tác giả của Trò chơi vương quyền -

“Những vị thần nước Mỹ đã thành công trong việc tái sáng tạo, cũng như khẳng định tầm quan trọng lâu dài của văn chương kỳ ảo trong thời đại ngày nay.” - Michael Chabon -

Shadow sắp sửa mãn hạn tù. Anh khấp khởi nghĩ về thời khắc phóng thích sắp đến, về một cuộc sống giản dị êm đềm bên cạnh người vợ mà anh yêu tha thiết. Nhưng ngày ra tù, anh biết tin vợ mình vừa qua đời trong một tai nạn giao thông, và trên máy bay anh gặp một ông già tự xưng là Wednesday đòi thuê anh làm vệ sĩ. Theo một lối dần dà nhưng chắc chắn, mềm mại nhưng khôn cưỡng, Shadow bị cuốn vào một trận chiến kinh thiên động địa của các vị thần giữa lòng nước Mỹ hiện đại.

Hiếm nhà văn nào có thể tạo ra được một thế giới hư cấu vừa chân thực lại vừa kỳ ảo, vừa phức tạp lại vừa cuốn hút được như Neil Gaiman. Một cách khéo léo và tinh vi, Neil Gaiman lồng vào bên dưới bề mặt thực tại vô cùng gần gụi và bình thường với chúng ta, một thế giới thăm thẳm và biến ảo khôn lường của các thánh thần.', 142, 900, 200000, 110000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (3, 5, N'Giết Chỉ Huy Đội Kỵ Sĩ - Tập 1: Ý Tưởng Xuất Hiện', NULL, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_219764.jpg', N'“Có thể một ngày nào đó tôi sẽ vẽ được chân dung của thứ không có. Như một họa sĩ đã vẽ được bức tranh Giết chỉ huy đội kỵ sĩ. Nhưng để làm được vậy, tôi cần có thời gian. Tôi phải làm bạn với thời gian.”

Rời khỏi người vợ đã đơn phương đòi ly hôn, “tôi” - chàng họa sĩ vẽ chân dung ba mươi sáu tuổi lang thang khắp nẻo đường rồi dừng chân tại một biệt thự nằm giữa khu rừng âm u trên đỉnh ngọn núi trông về phía biển, và sống tiếp tại đó trong nỗi cô đơn thăm thẳm. Không lâu sau, con cú đại bàng trên gác mái và tiếng chuông kỳ quái lúc đêm khuya đã khơi mào một chuỗi hiện tượng bí ẩn, dẫn dụ “tôi” bước vào chuyến phiêu lưu tâm linh huyền hoặc. Người đàn ông tóc bạc trắng xuất hiện từ bên kia thung lũng xanh biếc, ngôi miếu với căn hầm đá trong rừng, đĩa hát cũ, “Chỉ huy đội kỵ sĩ”… những chi tiết nửa thực nửa hư chậm rãi hiện hình trong bức tranh siêu thực u hoài, lạnh gáy của Murakami.', 143, 560, 200000, 110000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (4, 5, N'Thiên Cầu Ma Thuật - Tập 3: Ký Ức Vĩnh Cửu', NULL, N'https://cdn0.fahasa.com/media/catalog/product/t/c/tcmt003.jpg', N'Cuộc trạm chán với vị vua Surya ở thành cổ Campuchia đã khiến Chính ngộ ra quá khứ tăm tối, tàn độc của người ba cậu bé luôn thương nhớ. Một mùa hè nữa trôi qua và Viện nghiên cứu ở Kyoto, Nhật Bản gửi thư mời tham gia trại hè tới Chính, Tú, Quỳnh Anh. Tại đây, Chính gặp Nari, em trai cùng cha khác mẹ của Hàn Thành và dần tìm hiểu ra bí mật khủng khiếp trong gia tộc Maeda, quá khứ của người thầy nó tưởng đã biết rất rõ và sự thật về việc ba nó mất tích ở Nhật ba năm trước.

Ba đứa trẻ bị cuốn vào vòng rắc rối giữa các gia tộc pháp sư, khai phóng những ma lực kỳ dị và vén màn sự cố tàn khốc tưởng chừng đã được chôn vùi mãi mãi.', 345, 400, 129000, 83000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (5, 5, N'Thiên Cầu Ma Thuật Tập 2- Bí Mật Thành Cổ', NULL, N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_244718_1_4549.jpg', N'Sau biến cố ma thuật xảy ra với Tú và gia đình, vùng quê của ba đứa trẻ dần quay lại bình yên. Cùng lúc đó, Hàn Thanh chuẩn bị cho ba học trò tham dự kì thi pháp sư sơ cấp do Viện nghiên cứu tổ chức. Tại đây, một thanh tra từ phân viện Tứ Xuyên – Quân Bảo xuất hiện, cùng thư ký Tô Gia tiếp cận đoàn của Chính, lôi kéo cả đoàn vào chuyến thăm quan khu di tích thành cổ ở Campuchia.

Những giấc mơ kỳ lạ về tòa thành cổ và ký ức tắm tối của một người đàn ông lạ mặt xuất hiện nơi Chính, cũng là lúc Chính dần mất kiểm soát sức mạnh bên trong mình. Trong khi đó, viên thư ký Tô Gia luôn theo dõi và khơi gợi cho Chính những khúc mắc về quá khứ của ba cậu bé. Chính, Tú. Quỳnh Anh bị cuốn vào hành trình lí giải sự kỳ dị của tòa thành cổ, vị vua bất tử ngự trị nơi đây, sức mạnh tối thượng của pháp sư và con người thật của ba Chính.

Nhà xuất bản Phụ nữ Việt Nam trân trọng giới thiệu tới bạn đọc tập 2 của series Thiên cầu ma thuật.', 256, 400, 129000, 83000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (6, 4, N'Thép Đã Tôi Thế Đấy (Tái Bản 2023)', NULL, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935236432832.jpg', N'Thép đã tôi thế đấy ! Được đăng lần dầu trên tạp chi Molodaya Gvardiya vào năm 1932 và được xuất bản thành sách vào năm 1936 . Không phải một tiểu thuyết bình thường , Thép đã tôi thế đấy ! Chính là cuộc đời của tác giả Nikolai A.Ostrovsky . Bằng sự ca trường của người chiến sĩ cách mạng , dù cơ thể bị tàn phá , đâu đớn , Nikolai A.Ostrovsky vẫn sống trọn vẹn , cống hiến cho xã hội cuốn tiểu thuyết bất hủ Thép đã tôi thế đấy ! và thành công trong xây dựng hình tượng nhân vật chính - người chiến sĩ hồng quân Pavel Korchagin . Nhiệt tình cách mạng nồng cháy của Pavel đã khiến nhiều độc giả yêu quý anh và phương châm sống của anh cũng đã trở thành phương châm sống của nhiều thanh niên thế hệ Pavel tại khối các nước xã hội chủ nghĩa trong đó có Việt Nam.', 122, 800, 125000, 61000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (7, 4, N'Danh Tác Việt Nam - Đời Thừa', NULL, N'https://cdn0.fahasa.com/media/catalog/product/9/7/9786043947496.jpg', N'Nhà văn Nam Cao (1915-1951) là một nhà văn lớn của nền văn xuôi hiện đại Việt Nam. Với quan điểm nghệ thuật vị nhân sinh luôn là ngọn đèn soi sáng trong những sáng tác văn chương của ông, những tác phẩm của Nam Cao đều tập trung vào đối tượng người nông dân nghèo, tầng lớp trí thức nghèo và tái hiện chân thực xã hội lúc bấy giờ; đồng thời đi sâu vào nội tâm nhân vật, từ đó làm nổi bật lên hai giá trị song hành là hiện thực và nhân đạo sâu sắc.

Đời thừa là tập truyện ngắn gồm 13 truyện ngắn Đời thừa, Chuyện tình, Đòn chồng, Giăng sáng, Ở hiền, Trẻ con không biết đói, Một đám cưới, Bài học quét nhà, Đui mù, Đôi móng giò, Đón khách, Từ ngày mẹ chết, Thôi, đi về.

“Một tác phẩm thật giá trị, phải vượt lên bên trên tất cả các bờ cõi và giới hạn, phải là một tác phẩm chung cho cả loài người. Nó phải chứa đựng được một cái gì lớn lao, mạnh mẽ, vừa đau đớn, lại vừa phấn khởi. Nó ca tụng lòng thương, tình bác ái, sự công bình... Nó làm cho người gần người hơn. Như thế mới thật là một tác phẩm hay, các anh có hiểu không? Tôi chưa thất vọng đâu! Rồi các anh xem... Cả một đời tôi, tôi sẽ chỉ viết một quyển thôi, nhưng quyển ấy sẽ ăn giải Nobel và dịch ra đủ mọi thứ tiếng trên hoàn cầu!”', 128, 200, 79000, 34000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (8, 5, N'Tết Ở Làng Địa Ngục', NULL, N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935212358279.jpg', N'ăm đó, tại một ngôi làng xa xôi trên một ngọn núi hoang vu, người ta đón Tết trong sự kinh hãi tột độ, hoài nghi đau đáu và giận dữ khôn cùng trước sự ập tới của những bi kich tàn khốc.

Ngôi làng ấy vốn dĩ không có tên, nhưng những người nơi đây mặc định chốn này là địa ngục. Dân trong làng không ai dám tự ý băng rừng thoát khỏi làng, càng không biết thế giới bên ngoài rộng lớn như thế nào, bởi lẽ họ sợ người khác sẽ biết rằng bản thân mình vốn là hậu duệ của băng cướp khét tiếng ở truông nhà Hồ dưới thời chúa Nguyễn ở Đàng Trong.

Vào một đêm cuối năm rét buốt, ông Thập – người duy nhất có thể ra khỏi làng – được báo mộng bởi một âm hồn mặc quan phục màu đỏ rực. Làng Địa Ngục sắp gặp họa lớn!

Thành danh bằng những tác phẩm văn học kinh dị đậm chất Việt Nam được phát hành qua mạng, lần này tác giả Thảo Trang tiếp tục mang đến một câu chuyện hấp dẫn, mở ra một thế giới huyền bí với những sinh vật, thế lực siêu linh mà người đọc không bao giờ hết hứng thú, để lại những dư âm không phai khi gấp sách lại.', 239, 650, 169000, 92000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (9, 2, N'Doraemon - Movie Story Màu - Nobita Và Bản Giao Hưởng Địa Cầu', NULL, N'https://cdn0.fahasa.com/media/catalog/product/d/o/doraemon-movie-story-mau_nobita-va-ban-giao-huong-dia-cau_bia.jpg', N'Chuẩn bị cho buổi hòa nhạc ở trường, Nobita đang tập thổi sáo Recorder - nhạc cụ mà cậu chơi dở nhất. Thích thú trước nốt "No" lạc quẻ của Nobita, Micca - một cô bé bí ẩn đã mời Doraemon, Nobita cùng nhóm bạn đến "Farre" - Cung điện âm nhạc tọa lạc trên một hành tinh nơi âm nhạc sẽ hóa thành năng lượng. Nhằm cứu cung điện này, Micca và Chapeck đang tìm kiếm 5 "Virtouso" - bậc thầy âm nhạc huyền thoại sẽ cùng mình biểu diễn! Với bảo bối thần kì "Chứng chỉ chuyên viên âm nhạc", Doraemon và các bạn đã chọn nhạc bằng sợi dây thần định mệnh, cùng Micca hòa tấu, từng bước khôi phục cung điện "Farre". Tuy nhiên, một vật thể sống đáng sợ rất ghét âm nhạc sẽ xóa sổ âm nhạc khỏi thế giới đang đến gần, Trái Đất đang lâm nguy...! Liệu nhóm người bạn có thể cứu được "tương lai âm nhạc" và địa cầu này?', 153, 140, 35000, 16000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (10, 3, N'Chuyển Sinh Làm Người Sói, Tôi Trở Thành Cánh Tay Phải Của Ma Vương - Tập 3', NULL, N'https://cdn0.fahasa.com/media/catalog/product/6/0/6000chuyen-sinh-lam-nguoi-soi---tap-3.jpg', N'Tiếp nối tập trước, sau khi trải qua nỗi đau cố Ma vương hi sinh dưới lưỡi kiếm của Anh hùng loài người, quân đội Ma vương một lần nữa vực lại tinh thần để chuẩn bị cho những cuộc chiến sắp tới với quân đội đồng minh Miraudia.

Kế thừa ý chí của cố Ma vương Frieden Richer, Đại hiền nhân Gomoviroa đã lên ngôi, trở thành Ma vương đời thứ hai và bắt đầu xây dựng lại quân đội Ma vương một lần nữa. Với tư cách là “sĩ quan phụ tá của Ma vương”, Vaito tiếp tục đi tìm đồng minh tiếp theo cho quân đội Ma vương. Mục tiêu mà Vaito nhắm đến chính là thành phố cảng Beruza.

Tuy nhiên, sau khi thử nói chuyện với Garsh - Tổng trấn của Beruza, nhóm Vaito phát hiện ra rằng dường như nơi đây đang gặp rắc rối vì một vấn đề không rõ nguyên nhân trên biển.

Rốt cuộc chuyện gì đã xảy ra? Vaito và quân đội Ma vương làm thế nào để giải quyết được chúng?

Bên cạnh đó, không chỉ Bezura đang gặp rắc rối, mà thành phố Zaria, nơi được mệnh danh là thành phố mê cung cũng đang gặp phải vấn đề nghiêm trọng không kém. Lường trước được những hậu họa về sau nếu các thành phố phía Nam kết đồng minh với quân đội Ma vương, Viện nguyên lão đã “tiên hạ thủ vi cường” định tóm gọn thành phố Zaria, giết chết tổng trấn nơi đây và đổ vấy tội lỗi cho quân đội Ma vương. Vaito sẽ làm thế nào để thuyết phục được con gái của cố Tổng trấn nơi đây và giải quyết được đội quân của Viên nguyên lão?

Hãy cùng dõi theo cuộc hành trình hấp dẫn đến nghẹt thở ấy trong “Chuyển sinh làm người Sói, tôi trở thành cánh tay phải của Ma vương” của nhà văn Hyogetsu. Với cốt truyện độc đáo cùng phần minh họa xuất sắc của họa sĩ lừng danh Nishi(E)da, series light novel “Chuyển sinh làm người Sói, tôi trở thành cánh tay phải của Ma vương” sẽ đưa bạn vào những trang sách kỳ diệu, tựa như cánh cửa mở đến một thế giới phép thuật rực rỡ nhưng cũng đầy bí ẩn.', 232, 450, 139000, 40000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (11, 1, N'Chia Sẻ Từ Trái Tim (Thích Pháp Hòa)', NULL, N'https://cdn0.fahasa.com/media/catalog/product/c/h/chiasetutraitim-bia.jpg', N'Chia sẻ từ trái tim là một tuyển tập từ hàng trăm bài pháp thoại của Sa Môn Thích Pháp Hòa, được sắp xếp theo các chủ đề nhằm hệ thống lại những khái niệm, tư tưởng căn bản của đạo Phật qua lời giảng gần gũi của thầy, để mỗi người chúng ta có thể đưa vào áp dụng trong chính cuộc sống hằng ngày của mình.

Trong quyển sách này, quý vị sẽ được tiếp cận Nhân Quả theo một cách giản dị qua những câu chuyện đời thường của thầy Thích Pháp Hòa. Trong khi ngôn ngữ của giáo lý thường là rào cản thì những câu chuyện vui, những ví dụ gần gũi lại có khả năng mang chúng ta đến gần hơn với sự thật của đời sống. Những lời chia sẻ và câu chuyện của thầy Pháp Hòa về các mối quan hệ và cách ứng xử trong xã hội như cha mẹ - con cái, vợ - chồng, thầy - trò, bạn bè, v.v… cũng được ban biên tập tuyển chọn và giới thiệu đến quý bạn đọc. Thông qua đó, chúng ta thấy được “Phật pháp tại thế gian, bất ly thế gian giác” – Phật pháp không ở đâu xa ngoài đời sống thế gian.', 235, 340, 168000, 72000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (13, 3, N'Cây Cam Ngọt Của Tôi', N'8935235228351', N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_217480.jpg', N'“Vị chua chát của cái nghèo hòa trộn với vị ngọt ngào khi khám phá ra những điều khiến cuộc đời này đáng sống... một tác phẩm kinh điển của Brazil.” - Booklist

“Một cách nhìn cuộc sống gần như hoàn chỉnh từ con mắt trẻ thơ… có sức mạnh sưởi ấm và làm tan nát cõi lòng, dù người đọc ở lứa tuổi nào.” - The National

Hãy làm quen với Zezé, cậu bé tinh nghịch siêu hạng đồng thời cũng đáng yêu bậc nhất, với ước mơ lớn lên trở thành nhà thơ cổ thắt nơ bướm. Chẳng phải ai cũng công nhận khoản “đáng yêu” kia đâu nhé. Bởi vì, ở cái xóm ngoại ô nghèo ấy, nỗi khắc khổ bủa vây đã che mờ mắt người ta trước trái tim thiện lương cùng trí tưởng tượng tuyệt vời của cậu bé con năm tuổi.

Có hề gì đâu bao nhiêu là hắt hủi, đánh mắng, vì Zezé đã có một người bạn đặc biệt để trút nỗi lòng: cây cam ngọt nơi vườn sau. Và cả một người bạn nữa, bằng xương bằng thịt, một ngày kia xuất hiện, cho cậu bé nhạy cảm khôn sớm biết thế nào là trìu mến, thế nào là nỗi đau, và mãi mãi thay đổi cuộc đời cậu.

Mở đầu bằng những thanh âm trong sáng và kết thúc lắng lại trong những nốt trầm hoài niệm, Cây cam ngọt của tôi khiến ta nhận ra vẻ đẹp thực sự của cuộc sống đến từ những điều giản dị như bông hoa trắng của cái cây sau nhà, và rằng cuộc đời thật khốn khổ nếu thiếu đi lòng yêu thương và niềm trắc ẩn. Cuốn sách kinh điển này bởi thế không ngừng khiến trái tim người đọc khắp thế giới thổn thức, kể từ khi ra mắt lần đầu năm 1968 tại Brazil.', 120, 280, 180000, 86000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (14, 2, N'Fire Force - Tập 32 - Tặng Kèm Bookmark Giấy Hình Nhân Vật', N'	8934974203513', N'https://cdn0.fahasa.com/media/catalog/product/n/x/nxbtre_full_09572024_095755_1.jpg', N'Fire Force - Tập 32

Truyện lấy bối cảnh thế giới khi con người đối mặt với hiện tượng “nhân thể bộc hỏa”, tức con người tự bốc cháy. Câu chuyện nói về những con người có năng lực và quyết tâm kết hợp với nhau lập thành các Biệt đội cứu hỏa để bảo vệ con người trước “Diệm nhân”. Shinra Kusakabe là một chàng trai trẻ bị gắn biệt danh là “Dấu chân ác quỷ”, vì chân của cậu ấy có thể bốc cháy theo ý muốn. Sau khi cậu gia nhập Biệt đội cứu hỏa số 8, cậu đã cùng những đồng đội trong đội ngũ chiến đấu chống lại các Diệm nhân và theo đuổi lý tưởng anh hùng của mình. Trong hành trình bảo vệ nhân loại, Shinra dần phát hiện ra sự thật bất ngờ về nguyên nhân gây ra vụ hỏa hoạn dẫn tới cái chết đau đớn của gia đình cậu 12 năm về trước và quyết định cùng Biệt đội cứu hỏa số 8 tìm ra ngọn nguồn sự thật…', 122, 178, 43000, 16000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (15, 9, N'Đồ Chơi Lắp Ráp Rau Củ - Forange Block FC8290-4 - Cà Rốt (108 Mảnh Ghép)', N'	8935256611255', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935256611255.jpg', N'Đồ Chơi Lắp Ráp Rau Củ - Forange Block FC8290-4 - Cà Rốt (108 Mảnh Ghép)

- Thiết kế mới lạ: Nuôi dưỡng trí tưởng tượng và logic của con bạn với đồ chơi lắp ráp rau củ. Thiết kế độc đáo theo phong cách hoạt hình thu hút trẻ em và hỗ trợ trí tưởng tượng không gian và kỹ năng tư duy logic của trẻ. Hình dạng trái cây và màu sắc tươi sáng làm cho chúng trở nên sáng tạo và đẹp mắt.

- Nuôi dưỡng khả năng thực hành: Những khối xây dựng trái cây này nâng cao khả năng thực hành, kỹ năng vận động tinh, sự tập trung và tính kiên nhẫn, cùng với việc nuôi dưỡng sự sáng tạo và trí tưởng tượng thông qua việc sáng tạo thực hành.

- Vật liệu chất lượng hàng đầu: Các khối xây dựng rau củ bền và mịn được làm bằng vật liệu chất lượng cao được thiết kế để thúc đẩy sự thú vị và sáng tạo cho con bạn. Chất liệu thân thiện với môi trường và chất lượng đảm bảo an toàn và sức khỏe cho con bạn, đồng thời đảm bảo tính thẩm mỹ dễ chịu.

- Liên kết giữa cha mẹ và con cái: Sử dụng Khối xây dựng trái cây để tạo ra những kỷ niệm vui nhộn, củng cố mối quan hệ của bạn với con bạn. Cùng nhau, tận hưởng giải câu đố, xây dựng cấu trúc và chơi theo trí tưởng tượng nhằm thúc đẩy tinh thần đồng đội và khuyến khích sự sáng tạo.', 180, 90, 99000, 45000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (16, 9, N'Bộ Đồ Chơi Cát Động Lực 700g Và Khuôn - Star Kids K-341/4 - Màu Đỏ', N'	8935256613570', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935256613570.jpg', N'Bộ Đồ Chơi Cát Động Lực 700g Và Khuôn - Star Kids K-341/4 - Màu Đỏ

Sản phẩm đồ chơi giúp phát triển khả năng vận động cũng như khả năng sáng tạo cho trẻ rất được ưa chuộng của hầu hết các bậc phụ huynh và trẻ em hiện nay.

Sản phẩm này có đặc điểm là không dính tay, không độc hại, có độ kết dính cao nên dễ tạo hình, có nguồn gốc xuất xứ từ Thái Lan và đặc biệt có rất nhiều màu sắc để trẻ lựa chọn theo sở thích của mình.

Sản phẩm giúp trẻ kích thích, tăng cường sự cảm nhận của các giác quan, giúp trẻ tự do sáng tạo mà không cần đến bất kỳ sự hướng dẫn nào.

Do cát động lực liên kết tốt nên dễ dàng tạo thành các khối hình thù khác nhau dưới bàn tay của trẻ khi nhào nặn.', 171, 90, 229000, 121000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (17, 7, N'Hộp 24 Bút Lông Màu Acrylic Markers 1 Đầu - Colokit ACM-C004', N'	8935324015039', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935324015039.jpg', N'Hộp 24 Bút Lông Màu Acrylic Markers 1 Đầu - Colokit ACM-C004

Bút lông màu Acrylic Markers 1 đầu Thiên Long Colokit 24 màu với thiết kế đầu BRUSH linh hoạt đáp ứng được đa dạng nhu cầu sử dụng. Bút màu Acrylic khô nhanh, chống nước tốt và sử dụng được trên nhiều chất liệu như giấy, vải, nhựa, gốm…

Tính Năng Sản Phẩm:

- Sản phẩm có 24 màu tươi sáng, rõ nét, không phai màu theo thời gian.

- Đầu BRUSH linh hoạt.

- Ngòi bút chống mài mòn, mực ra đều.

- Khô nhanh, chống nước tốt.

- Vẽ được trên các chất liệu: canvas, vải, giấy, gỗ, nhựa, thủy tinh, gốm sứ, kim loại…

- Có khả năng chồng màu tốt.

- Nắp bút có thiết kế chống ngạt bảo đảm an toàn cho người dùng.

- Hộp đựng bút bằng nhựa cứng cáp.

- Phù hợp với người mới bắt đầu đến vẽ chuyên nghiệp.', 310, 260, 162000, 93000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (19, 9, N'Đồ Chơi Mô Hình DIY Sài Gòn Xưa - GP135-01 - Mọt Sài Gòn', N'8936149181145', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936149181145.jpg', N'Đồ Chơi Mô Hình DIY Sài Gòn Xưa - GP135-01 - Mọt Sài Gòn

Kích thước: 30 x 22 cm, Cao 40 cm

Nguyên vật liệu: Gỗ, hoa cỏ khô, vải, giấy, kim loại, đèn Led, gốm sứ,nhựa,

Sản phẩm bao gồm: Hộp Pin có công tắt, nguyên vật liệu lắp ráp, sách hướng dẫn Tiếng Việt

Bảo quản: Bảo quản nơi khô ráo, thoáng mát, tránh nước và môi trường ẩm ướt.

Thông số kỹ thuật: Kèm theo sản phẩm bên trong.

Lợi ích ứng dụng vào đời sống:

- Dùng thay thế đèn ngủ

- Trang trí bàn học, bàn làm việc

- Trang trí phòng khách

- Dùng làm quà tặng

- Trang trí quán cafe

- Thoả mãn đam mê', 242, 2070, 759000, 135000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (20, 8, N'Bìa Hộp Nhựa PP 150mm A4 - Stacom DC406', N'	8935318306969', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935318306969.jpg', N'Bìa Hộp Nhựa PP 150mm A4 - Stacom DC406

Hộp một ngăn được làm bằng nhựa PP cao cấp, khổ A4, độ bền cao, không độc hại, thân thiện môi trường, có nắp đậy khóa bằng nút dán.

Sản phẩm có khả năng lưu trữ nhiều tài liệu thích hợp dùng trong việc lưu trữ các hóa đơn, chứng từ.

Cấu tạo tiện lợi dễ sử dụng, luôn giữ hồ sơ, tài liệu phẵng phiu, sạch sẽ và tạo cảm giác thoải mái và dễ dàng khi sử dụng.

Thiết kế màu sắc trang nhã lịch sự hiện đại sang trọng phù hợp với môi trường văn phòng.', 140, 360, 110000, 67000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (22, 8, N'Kéo Văn Phòng 130 mm - Bauhinia HQT-9715 - Màu Xanh Dương', N'	6939412997155', N'https://cdn0.fahasa.com/media/catalog/product/6/9/6939412997155-mau3.jpg', N'Kéo Văn Phòng 130 mm - Bauhinia HQT-9715

- Sản phẩm làm từ hợp kim thép cao cấp có độ sắc bén giúp bạn cắt giấy dễ dàng, gọn ghẽ. Chất liệu thép không gỉ nâng cao tuổi thọ cho kéo.

- Kéo được bọc thêm lớp nhựa PP siêu bền ở cán, tạo cảm giác êm ái và thoải mái cho bạn khi cắt. Thiết kế này cũng giúp tránh cho đôi tay của bạn không đụng trúng lưỡi kéo khi sử dụng, đảm bảo an toàn tối ưu hơn.

- Lưỡi kéo dài, có kích thước 160mm giúp bạn rút ngắn thời gian cắt giấy đồng thời giữ cho vết cắt đều đẹp và chuẩn xác hơn.

- Lỗ khoét ở tay cầm lớn nên không làm gò bó ngón tay khi chuyển động.

- Kéo có thể dùng cắt giấy, bìa nhựa hoặc vải tùy theo mục đích sử dụng

- Phù hợp với đối tượng học sinh, sinh viên và dân văn phòng.', 411, 35, 28500, 15200, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (24, 10, N'Quản Lý Toàn Cầu- Managing Globally', N'8935086804544', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/quan_ly_toan_cau__managing_globally/2021_02_18_14_47_47_1-390x510.jpg', N'Quản Lý Toàn Cầu- Managing Globally', 123, 69, 24000, 15000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (26, 9, N'Đồ Chơi Mô Hình Siêu Xe Điều Khiển Từ Xa Và Đèn Giao Thông - Longbo 168-30N', N'	8935256611101', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935256611101.jpg', N'Đồ Chơi Mô Hình Siêu Xe Điều Khiển Từ Xa Và Đèn Giao Thông - Longbo 168-30N

- Đồ chơi dần hình thành kỹ năng quan sát cho bé nhờ việc bé quan sát chuyển động của đồ chơi hình dạng và màu sắc của chúng.

- Kỹ năng nghe là nhận thức đầu tiên của bé về thế giới bên ngoài. Bé được thu hút bởi các âm thanh và luôn di chuyển theo mọi âm thanh phát ra.

- Thông qua các trải nghiệm về xúc giác bé khám phá thế giới xung quanh và trau dồi kinh nghiệm phối hợp tay và mắt.

- Di chuyển và vận động một cách thoải mái, bé học được cách kiểm soát cơ thể mình và tự do khám phá thế giới xung quanh bé.

- Điều khiển sử dụng bộ 2 pin AA, xe sử dụng 2 pin 4.8V (bao gồm pin và bộ sạc) Sở hữu một chiếc xe giống như bố, tự điều khiển xe đi khắp nơi và khám phá thế giới xung quanh sẽ khiến các bé cảm thấy vô cùng thích thú.

- Sản phẩm ô tô siêu xe điều khiển từ xa với thiết kế nổi bật, màu sắc cuốn hút, là món quà phù hợp mà các mẹ có thể mua cho các con của mình.

Chiếc xe có thiết kế như thật với những đường nét mô phỏng chi tiết rất phù hợp để trưng bày ở phòng khách, phòng làm việc, showroom với kích cỡ thu nhỏ 16 lần sẽ trở thành một món sưu tập thú vị trong phòng của bạn.', 323, 450, 389000, 164000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (28, 11, N'Nuôi Dạy Bé Gái Từ 0 Đến 6 Tuổi (Tái Bản 2020)', N'	8935280906631', N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_196722.jpg', N'Tác giả của cuốn sách Nuôi dạy bé gái từ 0 – 6 tuổi là người đã có 20 năm nghiên cứu về sự trưởng thành của trẻ em, quan sát 12.000 trẻ ở nhiều độ tuổi khác nhau, từ em bé sơ sinh cho đến sinh viên đại học. Từ kinh nghiệm thực tiễn và nghiên cứu tác giả đã đúc kết được những điều quan trọng đối với sự phát triển của trẻ rằng:

Ngay từ khi sinh ra, giữa bé trai và bé gái đã có những đặc trưng khác nhau cả về não bộ cũng như hệ thần kinh vận động. Do vậy cách giáo dục cũng sẽ khác nhau. Nếu nắm được điểm mấu chốt trong cách nuôi dạy cho từng bé thì bố mẹ có thể phát triển năng lực của trẻ một cách toàn diện.

Với bé gái

Là người có khả năng cảm thụ và đồng cảm tốt.

Sở hữu khả năng đồng cảm tốt nên các bé gái luôn cư xử hòa nhã và thân thiện. Bé biết đi sớm nhưng giữ thăng bằng không tốt và dễ té ngã. Điều này là do sự phát triển của hệ thần kinh vận động toàn thân Nhưng bé lại giỏi trong những trò chơi đòi hỏi tính kiên nhẫn như gấp giấy hay vẽ tranh. Đôi khi bé phản kháng: “Không, không” là do tính kỷ luật chưa được hoàn thiện.

Bé gái hay thể hiện sự vui mừng khi được cùng chơi hòa thuận với bạn, lúc cả hai cùng chia sẻ cho nhau. Bé coi trọng quá trình thực hiện hơn là kết quả. Hơn nữa, với bé gái việc được mẹ ôm ấp, cưng nựng là một điều thật tuyệt vời.

Điều quan trọng đối với bé gái đó là được yêu thương, thấu hiểu, sẻ chia và giao tiếp.

Vì muốn được giao tiếp nên khả năng ngôn ngữ của bé gái phát triển nhanh. Bé dùng từ khéo léo, ríu rít kể cho bố mẹ nghe những chuyện mình gặp trong ngày hôm nay hay chuyện bạn bè.

Bố mẹ thường có cảm giác như bé gái phát triển sớm, trưởng thành một cách thuận lợi hơn so với bé trai. Nhưng điều đó không đồng nghĩa là ta có thể yên tâm với sự trưởng thành sớm của bé. Tâm lý của bé gái phức tạp hơn so với bé trai. Nhìn bé có vẻ ra dáng “người lớn” biết vâng lời nhưng thực ra thì nhõng nhẽo, ví dụ bé nói: “Không thích đâu!” nhưng trong lòng thì ngược lại, vì vậy việc nắm bắt được suy nghĩ, tình cảm thực sự của các bé gái là rất quan trọng.

Nuôi dạy bé gái từ 0 – 6 tuổi sẽ chỉ ra cho bố mẹ 7 bước quan trọng trong sự trưởng thành của các bé:

Bước 0 (0 tuổi): Kích thích năm giác quan → Nuôi dưỡng cảm nhận

Bước 1 (1 tuổi): Chia sẻ niềm vui “Yeah! Con làm được rồi” → Nuôi dưỡng tính tự chủ

Bước 2 (2 tuổi): Tôn trọng thế giới quan của trẻ → Nuôi dưỡng khả năng tưởng tượng

Bước 3 (3 tuổi): Tin tưởng, công nhận ý kiến của trẻ → Nuôi dưỡng tính không ỷ lại

Bước 4 (4 tuổi): Cho trẻ cơ hội tự mình suy nghĩ → Nuôi dưỡng khả năng giải quyết vấn đề

Bước 5 (5 tuổi): Để trẻ trải nghiệm việc giúp đỡ và được giúp đỡ → Nuôi dưỡng khả năng tự bày tỏ ý kiến cá nhân một cách rõ ràng

Bước 6 (6 tuổi): Để trẻ cảm nhận đầy đủ tình thương yêu → Nuôi dưỡng cảm giác khẳng định bản thân', 134, 236, 75000, 26000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (29, 11, N'Phương Pháp Giáo Dục Con Của Người Do Thái - Giúp Trẻ Tự Tin Bước Vào Cuộc Sống', N'	8936067605211', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936067605211.jpg', N'Phương Pháp Giáo Dục Con Của Người Do Thái - Giúp Trẻ Tự Tin Bước Vào Cuộc Sống

Xem trọng giáo dục của cha mẹ với con cái là truyền thống tốt đẹp nổi bật nhất của dân tộc Do Thái. Mặc dù phải trải qua rất nhiều khó khăn và luôn phải phiêu bạt khắp nơi nhưng người Do Thái vẫn không quên dành cho con nền giáo dục tốt nhất. Và, họ còn tìm ra những phương pháp giáo dục con đặc biệt.

Trí tuệ là tài sản lớn nhất của con

Người Do Thái sùng bái trí tuệ, trân trọng kiến thức, họ không chỉ có ý thức bồi dưỡng cho con cái khả năng tự học mà còn thường xuyên cổ vũ trẻ thu nhận kiến thức qua nhiều con đường khác nhau. Khi trẻ còn nhỏ, đại đa số bố mẹ Do Thái dùng những vật dụng hằng ngày để giúp trẻ học ngoại ngữ. Ví dụ, họ thường sử dụng cốc, chậu rửa mặt, khăn mặt,… để đặt câu hỏi, giúp trẻ học những từ mới đơn giản. Ngoài ra, lúc dẫn con cái đi mua đồ, cha mẹ Do Thái thường chú ý đến ánh mắt của trẻ, chọn những đồ mà trẻ thích, nhân cơ hội đó dạy trẻ ngoại ngữ.

Có thể thấy, cha mẹ Do Thái giống như người làm vườn chăm chỉ chăm chồi cây non, họ sẽ phân loại tri thức theo hứng thú và sở thích của con ở từng giai đoạn rồi mới truyền thụ cho trẻ, giúp trẻ tiếp thu nhẹ nhàng và hiệu quả.

Tự lập tự cường là kĩ năng sinh tồn của con

Cha mẹ Do Thái thường không nuông chiều con cái. Tình yêu của họ dành cho con đều có nguyên tắc, có mức độ. Nếu hành vi của trẻ vi phạm nguyên tắc, vượt quá giới hạn, cha mẹ sẽ không nương tay mà nghiêm khắc phê bình khuyên bảo. Những việc làm này khiến trẻ sống trẻ sống độc lập và có nguyên tắc, để khi trưởng thành là một người độc lập.

Kỹ năng sống độc lập có vai trò rất quan trọng đối với sự trưởng thành và phát triển của trẻ. Từ nhỏ, cha mẹ Do Thái đã hướng dẫn con làm các công việc trong gia đình như đổ rác, gấp quần áo, lau nhà,… để rèn luyện khả năng sống độc lập cho trẻ. Dù đôi lúc việc dạy những kĩ năng này mất nhiều thời gian hơn so với việc bố mẹ tự làm nhưng họ vẫn kiên trì chỉ bảo cho trẻ đến cùng. Vì họ hiểu rằng: Chỉ khi để trẻ học kĩ năng sống, trẻ mới có thể thực sự tách khỏi bố mẹ, thích nghi với cuộc sống, với xã hội. Cho nên trong quá trình dạy con, các bậc cha mẹ cần học theo phương pháp này, hết sức kiên nhẫn để chỉ bảo cho trẻ.

Quản lí tài chính là kĩ năng cơ bản của con

Người Do Thái ngoài việc hiểu giá trị của đồng tiền còn truyền dạy những kiến thức đó cho con cái để thế hệ sau hiểu được giá trị của nó. Khi trẻ được 3 tuổi, cha mẹ bắt đầu giảng giải cho trẻ hiểu giá trị và công dụng của đồng tiền. Họ thường cùng trẻ chơi trò chơi đoán giá trị tiền tệ để nâng cao khả năng nhận biết đồng tiền cho con. Khi đi mua sắm, cha mẹ Do Thái thường để trẻ so sánh giá cả của các loại sản phẩm khác nhau nhằm bồi dưỡng khả năng chi tiêu của trẻ.

Người Do Thái cho rằng dạy trẻ những kiến thức tài chính này là rất quan trọng vì người có khả năng quản lí tài chính và ý thức đầu tư giỏi sẽ biết kiếm tiền và nắm giữ tiền bạc. Các bậc cha mẹ nên học tập cách làm của người Do Thái, bồi dưỡng khả năng đầu tư, quản lí cho trẻ từ nhỏ để trẻ có một nền tảng vững chắc trong tương lai.

Cuốn sách chia sẻ với các bậc cha mẹ bí quyết giáo dục trẻ của một trong những dân tộc thông minh nhất Thế giới. Còn chần chừ gì mà không mở cuốn sách này ra và chào đón tương lai thành công của con bạn!', 410, 270, 85000, 29000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (30, 11, N'Học Montessori Để Dạy Trẻ Theo Phương Pháp Montessori - 60 Hoạt Động Montessori Giúp Trẻ Trưởng Thành: Chờ Con Lớn Thì Đã Muộn', N'8935212328401', N'https://cdn0.fahasa.com/media/catalog/product/h/o/hoc_montessori_de_day_tre_theo_phuong_phap_montessori___60_hoat_dong_montessori_giup_tre_truong_thanh_cho_con_lon_thi_da_muon_1_2018_07_16_14_12_38.jpg', N'Dạy trẻ theo phương pháp Montessori không chỉ giúp phát huy tất cả năng lực nhận thức và cảm nhận giác quan theo đúng độ tuổi phát triển của trẻ mà còn thỏa mãn lòng ham muốn tìm tòi, khám phá thế giới của trẻ nhỏ. Các cuốn sách trong bộ Học Montessori để dạy trẻ theo phương pháp Montessori, bên cạnh việc giới thiệu những lý thuyết khoa học về dạy trẻ  của Montessori còn đặc biệt chú trọng tới việc đưa ra các hoạt động thú vị và hữu ích cho trẻ. Lời hướng dẫn thực hiện hoạt động rất ngắn gọn, dễ hiểu và kết hợp với các hình ảnh sinh động, trực quan để cha mẹ có thể hướng dẫn trẻ thực hiện tại nhà.

Cuốn 60 hoạt động Montessori giúp trẻ trưởng thành: Chờ con lớn thì đã muộn đặc biệt quan tâm tới quá trình hoàn thiện các giác quan của trẻ. Cha mẹ có thể tạo các đồ chơi theo hướng dẫn để đánh thức các giác quan nhận biết và phân biệt màu sắc, âm thanh, mùi vị của trẻ nhỏ. Khi trẻ lớn hơn một chút, các hoạt động sẽ hướng dẫn trẻ rèn luyện sự khéo léo của đôi tay và từng bước làm quen với nếp sinh hoạt của gia đình.', 238, 300, 65000, 22000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (32, 11, N'Phương Pháp Đếm 123 Kỳ Diệu Dành Cho Trẻ Em (Tái Bản 2021)', N'	8935309500338', N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_235325.jpg', N'Phương Pháp Đếm 1-2-3 Kỳ Diệu Dành Cho Trẻ Em là một cuốn sách được thiết kế để giúp cha mẹ giải thích cho con về chương trình kỷ luật đơn giản nhất của Mỹ. Cuốn sách đã bán hơn một triệu bản vì những điều hướng dẫn trong sách dễ học theo và hiệu quả.

Hầu hết các cuốn sách về kỷ luật cho trẻ giải thích về chương trình cho cha mẹ, sau đó cha mẹ giải thích cho trẻ. Tuy nhiên cuốn sách Phương Pháp Đếm 1-2-3 Kỳ Diệu Dành Cho Trẻ Em giải thích trực tiếp cho trẻ những phương thức kỷ luật mới (với sự giúp đỡ của cha mẹ). 

Cuốn sách minh họa bốn màu này được trình bày dưới góc nhìn của trẻ và bao gồm các trò chơi, ô chữ, câu hỏi để thảo luận, giúp trẻ nhận biết và nhớ về phương pháp nhanh hơn, tốt hơn.

Mời các bạn đón đọc trọn bộ 3 cuốn trong Phương pháp đếm 1-2-3 Kỳ Diệu:

Phương pháp đếm 1-2-3 Kỳ Diệu - Dành cho Cha Mẹ

Phương pháp đếm 1-2-3 Kỳ Diệu - Dành cho Giáo Viên

Phương pháp đếm 1-2-3 Kỳ Diệu - Dành cho Trẻ Em', 222, 200, 89000, 2800, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (33, 2, N'Historie - Tập 7', N'8934974203797', N'https://cdn0.fahasa.com/media/catalog/product/n/x/nxbtre_full_17192024_041931_1.jpg', N'Historie - Tập 7

Historie kể về cuộc đời của Eumenes, tướng lĩnh và là người hầu cận trung thành nhất của Alexander Đại Đế. Qua đôi mắt của Eumenes, người đọc được chứng kiến những biến đổi thăng trầm của lịch sử đồng thời trải nghiệm nền văn hóa rực rỡ nhưng cũng đầy những góc tối của mảnh đất Hy Lạp hào hùng và tráng lệ.', 244, 244, 48000, 15000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (35, 2, N'Historie - Tập 6', N'	8934974203568', N'https://cdn0.fahasa.com/media/catalog/product/n/x/nxbtre_full_04022024_020240.jpg', N'Historie - Tập 6

Historie kể về cuộc đời của Eumenes, tướng lĩnh và là người hầu cận trung thành nhất của Alexander Đại Đế. Qua đôi mắt của Eumenes, người đọc được chứng kiến những biến đổi thăng trầm của lịch sử đồng thời trải nghiệm nền văn hóa rực rỡ nhưng cũng đầy những góc tối của mảnh đất Hy Lạp hào hùng và tráng lệ.', 249, 249, 48000, 15000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (36, 2, N'Historie - Tập 5 - Tặng Kèm Card Shikishi Có Chữ Ký Tác Giả', N'	8934974203322', N'https://cdn0.fahasa.com/media/catalog/product/n/x/nxbtre_full_18392024_033927_1.jpg', N'Historie - Tập 5

Historie kể về cuộc đời của Eumenes, tướng lĩnh và là người hầu cận trung thành nhất của Alexander Đại Đế. Qua đôi mắt của Eumenes, người đọc được chứng kiến những biến đổi thăng trầm của lịch sử đồng thời trải nghiệm nền văn hóa rực rỡ nhưng cũng đầy những góc tối của mảnh đất Hy Lạp hào hùng và tráng lệ.', 230, 230, 48000, 15000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (38, 2, N'3x3 Eyes - Cô Bé Ba Mắt - Tập 14 - Tặng Kèm Card Giấy', N'	8934974202462', N'https://cdn0.fahasa.com/media/catalog/product/n/x/nxbtre_full_04312024_093109.jpg', N'3x3 Eyes - Cô Bé Ba Mắt - Tập 14

Bộ truyện kể về chuyến phiêu lưu kỳ vĩ của Pai - người sống sót cuối cùng của bộ tộc Sanjiyan Unkara và người hầu cận bất tử của cô - “Vô” Fujii Yakumo. Với ước nguyện trở thành con người, họ lên đường tìm kiếm “Thuật Nhân Hoá” để được thoát khỏi kiếp sống của một yêu quái bất tử.

Và bây giờ, cuộc phiêu lưu kỳ thú của họ chính thức bắt đầu!', 395, 400, 90000, 25000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (39, 3, N'Sưởi Ấm Mặt Trời - Phần Tiếp Theo Của Cây Cam Ngọt Của Tôi', N'	8935235242173', N'https://cdn0.fahasa.com/media/catalog/product/s/u/suoi-am-mat-troi-01-_1_.jpg', N'Sưởi Ấm Mặt Trời

Zezé, cậu bé tinh nghịch siêu hạng đồng thời cũng đáng yêu bậc nhất ngày ngào giờ đã thoát khỏi cuộc sống nghèo khó, cũng không còn phải chịu cảnh bị đánh đập thường xuyên như trong quá khứ. Cậu đã chuyển đến Natal sống cùng gia đình cha đỡ đầu, được học ở một ngôi trường tốt, dần dần tiến bộ cả về mặt trí tuệ lẫn thể chất. Nhưng nỗi đau mất mát vẫn đè nặng lên trái tim cậu và Zezé vẫn là một cậu nhóc “ hầu như lúc nào cũng buồn”, thậm chí “có lẽ là một trong những cậu nhóc buồn nhất quả đất”.

Nhưng, may thay, Zezé đã tìm được những người bạn mới – cả ở đời thực lẫn trong tưởng tượng – luôn thấu hiểu và sát cánh bên cậu, cùng cậu đi qua hết thày những niềm vui cùng nỗi buồn, những khổ sở, thất vọng, những phiêu lưu mạo hiểm, giúp cậu đối thoại với cuộc sống muôn màu muôn vẻ, với nội tâm đầy mâu thuẫn và đồng thời với cả nỗi buồn thương sâu thẳm trong tâm hồn.

Sâu lắng, day dứt và có những khi buồn đến thắt lòng, nhưng đồng thời, Sưởi ấm mặt trời cũng tràn ngập hơi thở trẻ trung, trong sáng, tràn đầy sức sống và tình yêu thương.', 399, 400, 16000, 95000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (40, 3, N'Phía Tây Không Có Gì Lạ (Tái Bản 2022)', N'	8936203361247', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936071674135_2_1.jpg', N'Thế chiến thứ nhất nổ ra, những chàng trai đang ngồi trên ghế nhà trường bị chuyển thẳng ra mặt trận. Tại đây sự khốc liệt của chiến tranh đã khiến họ tê dại khi bom đạn không chỉ tước đi những phần cơ thể mà còn cả tâm hồn. Thế nên chưa kịp trưởng thành họ đã trở nên già nua, bởi gần với cái chết hơn là sự sống. Họ cũng chẳng còn tin tưởng ai, chẳng thiết tha điều gì, kể cả ngày trở về.

Cho nên khi tất cả đồng đội cùng trang lứa đã ngã xuống, cái chết đối với những chàng trai ấy là sự giải thoát. Họ nằm xuống nhẹ nhangfm thanh than đến độ tưởng như chẳng hề may may lay động đến thứ gì xung quanh, dù chỉ là một ngọn cỏ. Mặt trận hoàn toàn yên tĩnh, bản báo cáo chiến trường chỉ ghi vẻn vẹn một câu: “Ở phía Tây, không có gì lạ.” Phải, chẳng có gì lạ, chỉ có một người vừa rời khỏi cuộc đời khi độ tuổi mới chớm đôi mươi.

Thông tin tác giả:

Remarque (1898 – 1970) là nhà văn lừng danh người Đức. Ông nổi tiếng với Phía Tây không có gì lạ, một trong những tác phẩm hay nhất về Thế chiến I.Các tác phẩm tiêu biểu khác của ông như Ba người bạn, Khải hoàn môn, Đêm Lisbon…cũng góp phần không nhỏ trong việc khẳng định tài năng và danh tiếng của ông khắp năm châu. Năm 1931, ông được đề cử cả giải Nobel Văn chương và Hòa bình.

Phía Tây không có gì lạ (Im Westen nichts Neues – 1929) là kiệt tác đã đưa ngôi sao Remarque lên bầu trời văn chương. Chỉ trong vòng 18 tháng sau khi ra mắt, cuốn sách đã phát hành được 2,5 triệu bản, được dịch ra 22 ngôn ngữ và sau đó được nhiều lần chuyển thể lên màn ảnh và sân khấu với sự đón nhận nồng nhiệt từ phía công chúng.', 300, 300, 80000, 42000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (42, 3, N'Nếu Một Đêm Đông Có Người Lữ Khách (Tái Bản 2023)', N'	8935235239708', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935235239708.jpg', N'Nếu Một Đêm Đông Có Người Lữ Khách (Tái Bản 2023)

Một cái kết mở thì rất nhiều nhà văn giỏi đã làm, nhưng một cái mở không tiến lên, thậm chí không kết, thì hình như chỉ một người như Italo Calvino mới dám biến thành trò chơi tiểu thuyết của mình. Làm cho một cuốn tiểu thuyết “đi tới” trong sự tiến triển hợp lý và đẹp đã là khó, nhưng giữ cho một cuốn tiểu thuyết hoàn chỉnh đứng yên ở ngưỡng bắt đầu còn khó hơn nhiều lần.

Nếu một đêm đông có người lữ khách nhốt câu chuyện ngập ngừng trong vẻ tươi mới của sự khởi đầu trong suốt mấy trăm trang sách, buộc người đọc liên tục hào hứng với không ngớt những bước chân đầu tiên, dự cảm đầu tiên, đoán định đầu tiên. Cuốn tiểu thuyết từ khi ra đời đã giữ chân bao độc giả lòng vui sướng thỏa mãn ở ngay điểm xuất phát, và cũng là nguồn khai thác dồi dào cho không ít lý thuyết gia văn học nhìn thấy ở đây một trò chơi tài tình và một suy tư sâu sắc về bản chất của tiểu thuyết và văn chương.

TÁC GIẢ:
Italo Calvino (1923-1985) là một trong những nhà văn lớn nhất thế kỷ XX của Ý. Năm 1947 ông đã xuất bản tiểu thuyết đầu tay, Il sentiero dei nidi di ragno (Lối đi mạng nhện). Phần lớn tác phẩm của Calvino là kiệt tác: nhóm tiểu thuyết về thời quá khứ với tên gọi chung “Tổ tiên của chúng ta”, Il Visconte dimezzato (Tử tước chẻ đôi, 1952), Il Barone rampante (Nam tước trên cây, 1957) và Il Cavaliere inesistente (Hiệp sĩ không hiện hữu, 1959); Cosmicomics (1965); Những thành phố vô hình (1972), và đặc biệt là Nếu một đêm đông có người lữ khách… (1979). Calvino còn là một nhà phê bình rất tên tuổi với khối lượng trước tác đồ sộ.', 500, 500, 145000, 84000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (43, 3, N'Nhà Giả Kim (Tái Bản 2020)', N'8935235226272', N'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/nha_gia_kim_tai_ban_2020/2024_03_20_18_29_19_1-390x510.jpg', N'Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người. 

Tiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.

“Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. Ông đã thấy vua chúa và kẻ ăn xin đi qua biển cát này, cái biển cát thường xuyên thay hình đổi dạng vì gió thổi nhưng vẫn mãi mãi là biển cát mà ông đã biết từ thuở nhỏ. Tuy vậy, tự đáy lòng mình, ông không thể không cảm thấy vui trước hạnh phúc của mỗi người lữ khách, sau bao ngày chỉ có cát vàng với trời xanh nay được thấy chà là xanh tươi hiện ra trước mắt. ‘Có thể Thượng đế tạo ra sa mạc chỉ để cho con người biết quý trọng cây chà là,’ ông nghĩ.”

- Trích Nhà giả kim

Nhận định

“Sau Garcia Márquez, đây là nhà văn Mỹ Latinh được đọc nhiều nhất thế giới.” - The Economist, London, Anh

 

“Santiago có khả năng cảm nhận bằng trái tim như Hoàng tử bé của Saint-Exupéry.” - Frankfurter Allgemeine Zeitung, Đức', 219, 220, 79000, 26000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (45, 5, N'Goth - Những Kẻ Hắc Ám (Tái Bản 2024)', N'	8935235242272', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935235242272.jpg', N'Goth Những Kẻ Hắc Ám

Một cuốn sổ ghi chép quá trình giết người.Chiếc tủ lạnh chứa đầy bàn tay. Lũ chó bị bắt cóc.Vụ treo cổ kỳ quái.Đứa trẻ bị chôn sống. Cuốn băng thu âm giọng nói của người chết…

Hai học sinh cấp ba cùng nhau điều tra những vụ án kỳ lạ ở địa phương. Nhưng thay vì cố gắng ngăn chặn tội ác, nỗi ám ảnh với cái chết và sự giết chóc đã dẫn dắt chúng tiến vào bóng tối điên cuồng, nơi những cơn ác mộng trở thành sự thực.

Không chỉ là một cuốn tiểu thuyết kinh dị rùng rợn, GOTH còn ẩn chứa nỗi buồn và những chiêm nghiệm về cuộc sống, về bản chất con người và sự giác ngộ. Tác phẩm đã mang về cho Otsuichi giải thưởng Honkaku Mystery, được chuyển thể thành manga và phim điện ảnh.', 410, 400, 13800, 40000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (46, 5, N'Khi Địa Ngục Trống Rỗng', N'	8935325021855', N'https://cdn0.fahasa.com/media/catalog/product/b/_/b_a-1-khi-_a-ng_c-tr_ng-r_ng.jpg', N'Khi Địa Ngục Trống Rỗng

Khi địa ngục trống rỗng, ma quỷ loạn cõi trần.

Địa ngục vốn được coi là chốn u minh, rùng rợn, nơi giam giữ biết bao linh hồn tội lỗi và thống khổ. Nhưng nếu ma quỷ thực sự chỉ hoành hành cõi âm, liệu con người có biết đến cái ác, có bị bao oán linh và quỷ dữ quấy rầy?

Thế gian không có “quỷ đội lốt người”, cũng chẳng có oan hồn quỷ dữ nào tồn tại như người ta vẫn thường kể. Sự tồn tại đáng sợ nhất của tạo hóa chính là lòng người.

“Khi Địa Ngục Trống Rỗng” là tuyển tập truyện ngắn kinh dị, tâm linh đến từ ngòi bút đa dạng của nhiều tác giả khác nhau. 7 câu chuyện khắc họa những con quỷ, những vong hồn uất hận cùng những cái chết rùng rợn khác nhau, nhưng tất cả đều hướng tới chung một mục đích: đào sâu vào góc khuất tăm tối nhất trong tâm hồn con người.

Mục lục:

Truyện ngắn số 1: Thần ăn bóng

Truyện ngắn số 2: Cung đường tử khí

Truyện ngắn số 3: Anh Ba Bị

Truyện ngắn số 4: Thần Chết

Truyện ngắn số 5: Cây đa

Truyện ngắn số 6: Cabin trong rừng', 270, 270, 10900, 37100, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (47, 5, N'Trò Chơi Tình Ái', N'	9786044018171', N'https://cdn0.fahasa.com/media/catalog/product/b/i/bia1-tr_-ch_i-t_nh-_i.jpg', N'Trò Chơi Tình Ái

THÔNG TIN TÁC GIẢ:

Stephen King (sinh ngày 21 tháng 9 năm 1947) là nhà văn người Mỹ chuyên sáng tác thể loại kinh dị hoặc giả tưởng. Với những câu chuyện kinh dị và lối viết đa dạng của King đã giúp giới phê bình chấp nhận thể loại kinh dị giả tưởng là một thành phần của nền văn học trong thế kỷ XX. Cuối năm 2006, tổng số sách của ông đã bán được khoảng 350 triệu cuốn trên toàn cầu.

Nhiều tác phẩm của ông đã được chuyển thể thành phim, như Carrie (1976), The Shining (1980), Misery (1990), The Shawshank Redemption (1994), The Green Mile (1999)...

Ông đã đoạt nhiều giải thưởng văn học, kể cả giải Hugo cho tác phẩm Danse Macabre (1980) và Giải thưởng Tưởng niệm O. Henry cho truyện ngắn The Man in the Black Suit (1994).

TÓM TẮT NỘI DUNG:

“Trò chơi tình ái” mở đầu bằng bối cảnh tại một căn nhà gỗ xa lạ nằm tách biệt trong một khu rừng hoang, thi thoảng vọng lại từ không gian vắng lặng ngoài kia là tiếng kêu thê lương, thảm thiết của một con thú hoagn hoặc một con chim lạ. Hai vợ chồng Jessie đang tận hưởng kỳ nghỉ dưỡng “đặc biệt” trên giường và “trò chơi tình ái” mà người chồng Gerald’s đề xướng.

Jessie bị chồng mình trói hai tay vào thành giường, nhưng khi chuẩn bị hành sự thì chồng cô lên cơn đau tim rồi đổ gục xuống tử vong ngay tại chỗ. Khi ấy, cơn ác mộng của Jessie bắt đầu.

Trong tình thế ngặt nghèo như vậy, Jessie đã trải qua những cảm giác kinh khủng nhất trong cuộc đời mình, khi cô không thể kêu cứu, cũng chẳng có cách nào thoát ra khỏi cái còng chết tiệt đang còng tay mình với thành giường. Cơn khát, sự đau đớn xảy đến khiến cô trải qua một loạt những ảo giác kinh hoàng. Những giọng nói kỳ lạ vang lên trong đầu cô, họ đối thoại nhưng chẳng thể giải quyết được gì. Qua những trường đoạn miêu tả tâm lý đầy căng thẳng, độc giả dần dần được tiết lộ về quá khứ không mấy tốt đẹp của Jessie khi cô bị chính cha ruột của mình lạm dụng, cũng như cuộc sống hôn nhân không được trọn vẹn với người chồng của mình. Nỗi đau tâm lý ấy một lần nữa quay lại ám ảnh cô trong tình thế này.

Trong 24 giờ vật lộn giữa sự sống và cái chết cho chúng ta thấy một Jessie tổn thương và cũng kiên cường chẳng kém. Cô cố gắng thoát ra khỏi cái còng, đồng thời phải tranh đấu tâm lý dữ dội trong tâm trí của mình, đối diện với bóng ma ký ức đang quay lại để hành hạ cô.

“Trò chơi tình ái” sẽ là một trải nghiệm thú vị với người đọc, thông qua một câu chuyện mang tính chất giật gân, không xuất hiện ma quỷ, thế lực siêu nhiên thường thấy trong các tác phẩm khác của ông hoàng kinh dị Stephen King, nhưng cuốn sách mang lại những cảm giác “lạnh gáy, rùng rợn, hồi hộp” theo cách riêng biệt, khiến tâm trí bị bóp nghẹt qua “trải nghiệm kinh hoàng” tại căn nhà gỗ trong rừng mà nhân vật nữ chính đã trải qua.', 430, 430, 20800, 94000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (49, 4, N'Tác Phẩm Văn Học Trong Nhà Trường - Nhật Ký Trong Tù', N'	8935343700671', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935343700671.jpg', N'Tác Phẩm Văn Học Trong Nhà Trường - Nhật Ký Trong Tù

"Nhật ký trong tù" là một tập thơ chữ Hán, gồm 133 bài thơ được Chủ tịch Hồ Chí Minh sáng tác trong thời gian hơn một năm (từ 29/08/1942 đến 10/09/1943) Người bị chính quyền địa phương của Tưởng Giới Thạch bắt giam trái phép tại các nhà tù ở tỉnh Quảng Tây, Trung Quốc. Tập thơ ghi lại những cảnh sinh hoạt trong tù, lên án chế độ nhà tù hà khắc của chính quyền Quốc dân Đảng, thể hiện tinh thần lạc quan cách mạng và tình cảm nhân đạo cộng sản chủ nghĩa cao đẹp của Chủ tịch Hồ Chí Minh. "Nhật ký trong tù" được đánh giá là một văn kiện lịch sử quan trọng, một tác phẩm văn học xuất sắc, có tác dụng giáo dục sâu sắc phẩm chất và đạo đức cách mạng cho nhiều thế hệ.', 175, 175, 55000, 22000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (50, 4, N'Văn Học Cổ Điển - Gió Đùa Trong Liễu', N'	8936203364354', N'https://cdn0.fahasa.com/media/catalog/product/0/_/0_21.jpg', N'Văn Học Cổ Điển - Gió Đùa Trong Liễu

Xuôi theo bờ sông nơi vi vu gió đùa là một chốn có phong cảnh nên thơ và bầu không khí dễ chịu để thong thả ăn trưa với những bằng hữu thân thiết nhất. Nhưng cuộc sống không phải lúc nào cũng yên ả như thế. Chẳng hạn như khi Cóc chợt nổi cơn ham thích ôtô, say sưa đến mê muội, kéo theo Chuột Chũi, Chuột Sông và Lửng vào những cuộc phiêu lưu và cả những rắc rối…

Và ở đó, hơn một trăm năm nay, gió vẫn tinh nghịch len qua những vòm liễu, dịu dàng kể lại với hàng thế hệ độc giả câu chuyện về tình bạn đẹp của những cư dân bé nhỏ đáng mến sống bên dòng sông ấy.

GIỚI THIỆU TÁC GIẢ:

Kenneth Grahame (1859 - 1932) sinh ra ở Edinburgh, nhưng trải qua tuổi thơ cùng các anh chị em ruột tại nhà bà ngoại ở miền đồng quê Berkshire bên bờ sông Thames. Cảnh trí dòng sông và khu rừng Quarry tuyệt đẹp nơi đây chính là nguồn cảm hứng cho tác phẩm được yêu mến nhất của ông, Gió đùa trong liễu, mà ban đầu là những mẩu truyện kể lúc đi ngủ dành cho cậu con trai Alastair mà ông vẫn âu yếm gọi là Chuột Chít.

Từ khi ra mắt độc giả năm 1908, Gió đùa trong liễu đã liên tục được tái bản; nhiều lần được chuyển thể sân khấu, truyền hình, hoạt hình và điện ảnh. Tác phẩm kinh điển này cũng là chất liệu cho nhiều họa sĩ minh họa thỏa trí tưởng tượng và sáng tạo.', 300, 300, 100000, 40000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (51, 9, N'Thú Bông Thám Tử Lừng Danh Kaito Kid - Size M', N'	8936134263580', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936134263580.jpg', N'Thú Bông Thám Tử Lừng Danh Kaito Kid - Size M

Sản phẩm thú bông mới siêu hot với đặc điểm dễ nhận biết của nhân vật thám tử lừng danh Conan nổi tiếng.

Thành phần: vải veboa, ruột bông gòn, 100% polyester

Sản phẩm được làm bằng vải siêu mềm mịn. mang lại sự mềm mại và mượt mà.

Bông gòn nhồi bên trong là bông gòn trắng loại 1, độ đàn hồi tốt.

Sản phẩm có thể có sự khác biệt về độ to từ 1-2cm so với hình.

Chất liệu chất lượng cao không kích ứng da, phù hợp cho mọi lứa tuổi, đường may tỉ mỉ, tinh tế, hoạ tiết thêu sắc sảo.', 240, 240, 399000, 140000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (52, 7, N'Bóp Viết Nhựa Hình Thú 3D 01 - Phú Vinh Phát - Mẫu 7', N'	8935306041902', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935306041902-mau7.jpg', N'Bóp Viết Nhựa Hình Thú 3D 01 - Phú Vinh Phát

- Sản phẩm sở hữu kiểu dáng vô cùng trẻ trung và đẹp mắt.

- Sản phẩm được làm bằng chất liệu bền chắc với dây kéo trơn, dễ sử dụng, không bị kẹt giữa chừng.

- Kích thước nhỏ gọn, tính tiện dụng cao, sản phẩm có thể chứa đựng các vật dụng cá nhân gọn gàng, tiện lợi.

- Đây sẽ là món quà ấn tượng mà bạn có thể dành tặng cho các em nhỏ nhân dịp năm học sắp đến.', 92, 95, 65000, 26000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (53, 7, N'Bảng Viết Kèm Bút Lông - Keyroad KR972016', N'	6954884545826', N'https://cdn0.fahasa.com/media/catalog/product/6/9/6954884545826-mau4.jpg', N'Bảng Viết Kèm Bút Lông - Keyroad KR972016

Bảngcó thiết kế mặt bảng sáng bóng dễ dàng viết và lau chùi. Khung bảng được làm bằng chất liệu nhựa chắc chắn, giúp sản phẩm có độ bền cao.

Sản phẩm có kích thước nhỏ gọn, tiện dụng thích hợp cho đối tượng học sinh sinh viên.Bảng có thiết kế hiện đại, đẹp mắt, ở 4 góc còn được bo nhựa chắc chắn, tạo sự hài hòa và chắc chắn.Mặt bảng dễ dàng viết và lau chùi một cách nhanh chóng, ngoài ra còn chống trầy xước khi sử dụng.

Sản phẩm kèm 1 bút lông bảng với kiểu dáng hiện đại, thiết kế nổi bật. Mực tươi sáng, dễ lau chùi. Ngòi bút viết êm, không nhòe.', 153, 155, 79000, 17000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (54, 7, N'Nước Lau Bảng 250 ml - Mungyo MY-CL250', N'	8804819093022', N'https://cdn0.fahasa.com/media/catalog/product/8/8/8804819093022.jpg', N'Nước Lau Bảng 250ml MUNGYO MY-CL250

Nước Lau Bảng Mungyo - MY-CL250 chính là giải pháp tối ưu nhằm tạo lại độ trắng sạch ban đầu cho bảng viết sau một thời gian dài sử dụng. Nhờ công nghệ tiên tiến, sản phẩm chuyên dụng này sẽ giúp tẩy sạch các vết ố, màu mực khô lâu ngày trên bảng trắng mà không làm hư mặt bảng, không hại da tay và tuyệt đối an toàn cho sức khỏe người sử dụng.

Tái tạo độ trắng sạch cho bảng

Những đặc điểm nổi trội về chất liệu cho sản phẩm khả năng xóa sạch những vết ố vàng, màu mực khô lâu ngày, nhanh chóng trả lại độ trắng sạch ban đầu cho bảng viết.

Đặc biệt, các vết mực của bút lông dầu không thể xóa cũng sẽ được loại bỏ, ngăn chặn không cho các chất màu dính ngược lại bảng.

Không làm hư mặt bảng

Khác với các loại chất tẩy rửa người ta thường sử dụng để lau bảng, sản phẩm không có mùi khó chịu, bạn có thể dùng khăn thấm dung dịch lau nhiều lần mà không sợ mặt bảng bị hư hay ố vàng.

Các thành phần trong dung dịch bay hơi nhanh, bề mặt bảng sẽ chóng khô và sử dụng được ngay.

An toàn cho sức khỏe

Sản phẩm không có mùi khó chịu, không làm hại da tay, an toàn cho sức khỏe người sử dụng.', 100, 100, 88000, 28000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (55, 7, N'Lau Bảng Nam Châm - Marvy BE02', N'	1901011605705', N'https://cdn0.fahasa.com/media/catalog/product/1/9/1901011605705.jpg', N'Dụng Cụ Lau Bảng Có Nam Châm Marvy BE02

Sản phẩm với thiết kế có thể đính trên bảng từ dễ dàng, tiện dụng.

Dễ dàng cầm nắm và lau chùi.

Phù hợp cho các loại bảng từ không có khay để bút', 20, 20, 20500, 61000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (57, 8, N'Set 4 Bì Thư Giấy Mỹ Thuật Dập Nổi', N'	8936135373875', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936135373875.jpg', N'Set 4 Bì Thư Giấy Mỹ Thuật Dập Nổi - CDN 3875

- Bì thư giấy mỹ thuật đặc biệt dập nổi được thiết kế với biểu tượng của sự tinh tế và sáng tạo.

- Từ việc lựa chọn chất liệu cao cấp cho đến sự chăm chút trong từng chi tiết, mỗi chiếc bì thư mang đậm dấu ấn của sự chất lượng và độc đáo.

Thông tin về sản phẩm:

- Chạm Để Cảm Nhận

- Kích thước 95*140mm

- Chất liệu: Giấy mỹ thuật đặc biệt dập nổi

- 1 xấp/4c, kèm bộ sticker

- Bì thư đã lên kệ đa dạng các mẫu cho bạn lựa chọn

- Thiết kế kiểu dáng ấn tượng và độc đáo.', 25, 26, 45000, 14000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (59, 8, N'Giấy Note Hình Thỏ - ClassMate CL', N'	8936212222447', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936212222447.jpg', N'Giấy Note Hình Thỏ - ClassMate CL-SN017 có 2 kích thước, thiết kế hình chú thỏ dễ thương, đa dạng sự lựa chọn cho bạn.

THÔNG TIN CHI TIẾT SẢN PHẨM:

- Chất liệu: Giấy cao cấp

- Đóng gói: 1 túi có 2 kích thước : 13x48mm - 26x48mm

- Giấy Note CLASSMATE: Giúp ghi nhớ, hỗ trợ học thuộc lòng..

- Giấy có độ bền, có keo dính đằng sau tốt, dán chắc

- Giấy ghi chú bắt mực ghi tốt, mực nhanh khô, không gây nhòe hay lem, in ra mặt sau.

- Giấy note có thiết kế nhỏ gọn, dễ dàng sử dụng và tiện lợi mang theo trên người.', 9, 10, 18500, 69000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (60, 8, N'Bấm Kim Mini Số 10 Plus 210', N'	8936007451281', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936007451281.jpg', N'Bấm Kim Mini Số 10 Plus 210-V015 - Màu Xanh Dương

Chất liệu:

Bấm kim mini số 10 Plus 210 có thiết kế nhỏ gọn từ nhựa cứng với tone màu sắc trẻ trung, đẹp mắt kết hợp cùng chất liệu thép chống gỉ sét cao cấp, bền bỉ.

Công dụng:

Sản phẩm được dùng để bấm, kẹp các loại giấy tờ, tài liệu riêng biệt lại với nhau thành tập giúp cho việc phân loại, sắp xếp bảo quản và lưu trữ được tốt hơn, hiệu quả hơn.', 27, 28, 39000, 17000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (61, 8, N'Hộp Lớn Kim Bấm No.10', N'	8858741716887', N'https://cdn0.fahasa.com/media/catalog/product/8/8/8858741716887-3.jpg', N'Hộp Lớn Kim Bấm No.10 Double A là sản phẩm thiết yếu được sử dụng rộng rãi trong các trường học, văn phòng, cửa hàng photocopy. Sản phẩm giúp kẹp chặt, đóng gọn các giấy tờ, tài liệu, văn bản vào làm một đơn giản, dễ dàng mà không tốn quá nhiều thời gian, công sức.

Ghim dập số 10 Double A được làm từ chất liệu thép không gỉ sét, không làm ảnh hưởng đến các văn bản, giấy tờ. Chất liệu thép có độ bền cao, cho thời gian sử dụng lâu dài. Hộp gồm 1000 mẩu ghim phục vụ nhu cầu học tập, làm việc của người dùng.

Một hộp ghim lớn bao gồm 10 hộp ghim nhỏ vừa tiện lợi vừa tiết kiệm chi phí. Ghim đựng trong hộp giấy nhỏ, dễ dàng mang theo khi di chuyển.', 22, 22, 4500, 1000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (62, 8, N'Gỡ Kim Mesa SR-15', N'	8858121003033', N'https://cdn0.fahasa.com/media/catalog/product/8/8/8858121003033-mau3.jpg', N'Gỡ Kim Mesa SR-15

Sản phẩm giúp bạn gỡ kim được nhanh chóng, dễ dàng và chính xác hơn.

Phần tay cầm được làm từ nhựa chắc chắn, mũi gỡ được làm từ thép không gỉ cứng cáp, bền đẹp.

Được sản xuất từ chất liệu hợp kim thép cứng cáp, có độ bền cao cùng khả năng chịu lực và chống gỉ sét tốt, không bị oxy hóa hay mài mòn dù phải tiếp xúc thường xuyên với điều kiện làm việc ẩm ướt.

Sản phẩm có thiết kế nhỏ gọn và tiện lợi, có thể dùng trong văn phòng công ty, trường học...', 30, 30, 45000, 19000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (63, 8, N'Lịch Bàn 2024 - Năm “Thìn”', N'	8935325017476', N'https://cdn0.fahasa.com/media/catalog/product/i/m/img_3647.jpg', N'Lịch Bàn 2024 - Năm “Thìn” - Tập “Thiền”

Mọi người thường lầm tưởng “thiền” là khoanh chân ngồi yên một chỗ hàng giờ liền, nhưng thực ra “thiền” chính là việc chúng ta chú tâm hoàn toàn vào một hành động nào đó. Dù bạn có đang đọc sách, đang đi bộ, đang trò chuyện… thì chỉ cần để tâm và hiện diện trong khoảnh khắc mình đang sống thì đó cũng là một cách “hành thiền”.

Lấy cảm hứng từ năm Thìn (Rồng) và hoạt động Thiền, Skybooks cùng họa sĩ - tác giả Kulzsc đã phát hành bộ lịch 2024 độc quyền với tên gọi NĂM “THÌN” - TẬP “THIỀN”, chúng tôi hy vọng khi nhìn vào bộ lịch này bạn sẽ nhắc nhở bản thân tận hưởng mọi khoảnh khắc trong cuộc đời của mình.', 400, 400, 149000, 68000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (64, 9, N'Đồ Chơi Robot Biến Hình Tia Chớp Hành Động', N'	8936178582098', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936178582098.jpg', N'Đồ Chơi Robot Biến Hình Tia Chớp Hành Động  - Cresta DK81137 - Siêu Xe Bugatti

Với món đồ chơi biến hình, từ mô hình chiếc siêu xe có thể biến hình thành một chiến binh robot khi nhấn nút hoặc khi chạy với tốc độ và nút chạm vào lực nhất định.

Đồ chơi giúp bé tăng cường tính sáng tạo, rèn luyện tính kiên trì, tỉ mỉ khi lắp ráp và trải nghiệm.

Sản phẩm được đóng gói kĩ càng, gọn đẹp trong hộp nguyên đai nguyên kiện, là món quà ý nghĩa dành cho các bé.   

Sản phẩm được làm từ nguyên liệu an toàn không độc hại với trẻ nhỏ, dễ lắp ráp, dễ chơi và có độ bền cao.

Sản phẩm đạt quy chuẩn quốc gia về đồ chơi trẻ em QCVN 3:2019/BKHCN. Giấy chứng nhận hợp quy số: VIC/22.HQ/9.10.1011, cấp ngày 19/10/2022.

Hướng dẫn sử dụng : được mô tả chi tiết bằng tiếng Việt trên vỏ hộp', 100, 100, 115000, 54210, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (65, 9, N'Đồ Chơi Robot Biến Hình Tia Chớp Hành Động - Cresta DK81136 - Thiết Giáp Bộ Binh', N'	8936178582081', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936178582081.jpg', N'Đồ Chơi Robot Biến Hình Tia Chớp Hành Động  - Cresta DK81136 - Thiết Giáp Bộ Binh

Với món đồ chơi biến hình, từ mô hình chiếc thiết giáp bộ binh có thể biến hình thành một chiến binh robot khi nhấn nút hoặc khi chạy với tốc độ và nút chạm vào lực nhất định.

Đồ chơi giúp bé tăng cường tính sáng tạo, rèn luyện tính kiên trì, tỉ mỉ khi lắp ráp và trải nghiệm.

Sản phẩm được đóng gói kĩ càng, gọn đẹp trong hộp nguyên đai nguyên kiện, là món quà ý nghĩa dành cho các bé.   

Sản phẩm được làm từ nguyên liệu an toàn không độc hại với trẻ nhỏ, dễ lắp ráp, dễ chơi và có độ bền cao.

Sản phẩm đạt quy chuẩn quốc gia về đồ chơi trẻ em QCVN 3:2019/BKHCN. Giấy chứng nhận hợp quy số: VIC/22.HQ/9.10.1011, cấp ngày 19/10/2022.

Hướng dẫn sử dụng : được mô tả chi tiết bằng tiếng Việt trên vỏ hộp', 170, 170, 130000, 76000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (66, 9, N'Đồ Chơi Robot Giải Cứu Thế Giới', N'	8936178582562', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8936178582562.jpg', N'Đồ Chơi Robot Giải Cứu Thế Giới - Cresta DK81184

 Với món đồ chơi biến hình, bé có thể linh hoạt xoay chuyển các khớp nối, phóng tên lửa giải cứu thế giới

Sản phẩm có đèn led nhiều màu, âm thanh giả lập & bước đi robot sống động,

Đồ chơi giúp bé tăng cường tính sáng tạo, rèn luyện tính kiên trì, tỉ mỉ khi lắp ráp và trải nghiệm.

Sản phẩm được đóng gói kĩ càng, gọn đẹp trong hộp nguyên đai nguyên kiện, là món quà ý nghĩa dành cho các bé. Sản phẩm được làm từ nguyên liệu an toàn không độc hại với trẻ nhỏ, dễ lắp ráp, dễ chơi và có độ bền cao.', 456, 456, 280000, 94200, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (67, 7, N'Ba Lô Chống Gù - Size 34 - Miti ', N'	8935271737626', N'https://cdn0.fahasa.com/media/catalog/product/8/9/8935271737626.jpg', N'Ba Lô Chống Gù - Size 34 - Miti C11073_34_Kit2_Pin.D_Pin.L - Hello Kitty

HỆ THỐNG CHỐNG GÙ BPS (BACKPONE PROTECT SYSTEM) được sáng chế bởi Th.Sĩ - B. Sĩ Nhi Khoa Nguyễn Trí Kiên - TGĐ. Miti Group.

Thiết kế dạng đứng, phần đáy dài xuống được tì đè vào khung xương chậu (Phần vững chắc nhất của cột sống). Giúp cột sống luôn ở tư thế tự nhiên và không bị cong ưỡn ra trước.

Phần lưng: có mút dài êm dàn đều trọng lực. Rãnh lưng định vị ngay cột sống, tăng cường chống xô lệch sang 2 bên.

Quai đeo: thiết kế bo tròn vùng cổ, vai và có đệm êm ôm sát, giúp trợ lực 30% trọng lực cho cột sống. Có khóa trước ngực tăng cường chống xô lệch.

Chất liệu: Vải Polyester, nylon, PVC, dây kéo nylon.

Hướng dẫn sử dụng và bảo quản:

- Tránh mang vật dụng sắc nhọn, quá khổ để chứa đựng sản phẩm

- Không mang quá nặng so với sức chứa của sản phẩm

Cảnh báo vệ sinh an toàn:

- Không được dùng hoá chất tẩy rửa vì nó có thể làm sờn màu sản phẩm

- Không được ủi nhiệt độ cao sẽ gây biến dạng một số bề mặt sản phẩm.', 798, 800, 649000, 194000, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (68, 12, N'Hoa Học Trò - Số 1438', N'8938507004196', N'https://cdn0.fahasa.com/media/catalog/product/c/o/cover-1438-1-7852.jpg', N'Hoa Học Trò - Số 1438

Mời bạn “bỏ túi” được những bí quyết quan trọng để trở thành một thủ lĩnh toàn năng cùng Hoa Học Trò 1438 - phát hành ngày 1/8/2024 này nhé!

"NEGAV - Đừng có giỡn nữa mà"

Sau live stage 2 của Anh Trai Say Hi , đội trưởng team “tiểu học” - NEGAV giữ vị trí Top 2 “anh trai” được chú ý nhất khi dẫn dắt các thành viên thành công “leo” Top Trending YouTube. Mang danh “Út khờ” trên mạng xã hội là thế, song khi trở thành một đội trưởng hay “lao” vào công việc, NEGAV để lại không ít bất ngờ.

Giải mã công thức tạo nên những thủ lĩnh toàn năng

Trong thời đại 4.0, làm việc nhóm và lãnh đạo là những kỹ năng cần thiết cho tất cả mọi lĩnh vực, kể cả sáng tạo nội dung hay viết báo. Qua vòng Huấn luyện với dàn diễn giả xịn xò của Thử Thách Kim Cương 2024 - sân chơi mùa Hè do báo Hoa tổ chức, các bạn đọc tham gia đã “bỏ túi” được những bí quyết quan trọng để trở thành một thủ lĩnh toàn năng.

Mùa này là mùa gì thế? Mùa này là mùa check-in Đồng Nai đó bồ ơi!

Không có biển, không có núi, nhưng Đồng Nai lại có 7749 địa điểm ăn chơi phủ phê mà chắc chắn bạn sẽ phải lưu lại vào checklist ăn-đi-chill của mình đó! Cùng nhà Hoa khám phá nha.

Thử thách "đạp gió rẽ sóng" đi xỏ khuyên sau tốt nghiệp

Nhiều “bảnh” cho rằng xỏ khuyên là một cách thể hiện bản thân thú vị. Mặc dù phải chịu đau và tiêu tốn một khoản phí, không ít bạn vẫn mê tít trải nghiệm này. Vậy teen cần lưu ý gì khi "nhập môn" xỏ khuyên?

Z khởi nghiệp: Quán cà phê Mosaic của cô chủ nhỏ 14 tuổi

Từ việc kinh doanh những món đồ thủ công nhỏ, Thảo Nhi đã phát triển thành công hai thương hiệu và ba quán cà phê độc đáo. Vừa uống nước ăn bánh, vừa được trải nghiệm workshop làm tranh khảm, mô hình kinh doanh của cô bạn gây xôn xao trên mạng xã hội.', 99, 100, 20000, 5100, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (69, 12, N'Hoa Học Trò - Số 1437', N'	8938507004189', N'https://cdn0.fahasa.com/media/catalog/product/4/4/449846971-496295546188681-159461695031194807-n-1906.jpg', N'Hoa Học Trò - Số 1437

Kỳ thi vào lớp 10 và thi tốt nghiệp THPT đã chính thức khép lại, giờ đây teen cuối cấp có thể lên ngay lịch nghỉ Hè với vô vàn kế hoạch cực "chill" cùng Hoa Học Trò 1437.

Bài học từ Inside Out 2 - Tâm trạng cũng cần được "giải cứu"

Bộ phim Inside Out 2 đang “gây bão” phòng vé những ngày gần đây đưa ra góc nhìn thú vị về sự vận hành của cảm xúc và cách chúng điều khiển hoạt động của con người. Tuy nhiên, ngoài đời thực thì những cảm xúc ấy lại khó tách biệt, gọi tên, và kiểm soát hơn rất nhiều. Cùng nhà Hoa tìm hiểu xem chúng mình có thể làm gì để “giải cứu” tâm trạng của bản thân và “dọn dẹp cảm xúc” cho mình nhé!

Mở rộng chân trời cùng với chương trình công dân toàn cầu

Việc thay đổi, thích nghi với một môi trường mới chưa bao giờ dễ dàng, huống chi tận ba môi trường sống khác nhau trong một thời gian ngắn. Ấy vậy mà, ngay khi biết trường đại học của mình ở Mỹ có chương trình học và thực tập tại Úc và Singapore, Uyên Nhi đã không ngần ngại tham gia. Và cô bạn đã có một hành trình thú vị qua ba đất nước.

Gemini Hùng Huỳnh: Hành trình "Say Hi" với ước mơ "idol Việt thế hệ mới"

Chỉ sau 3 tập phát sóng của Anh Trai “Say Hi”, Gemini Hùng Huỳnh trở thành cái tên được khan giả “săn đón”, vượt qua nhiều “anh trai” lọt Top 3 anh trai nhận nhiều sự chú ý nhất. Cùng Hoa Học Trò 1437 trò chuyện cùng chàng trai thế hệ mới này nhé!

Đối phó với camera quay lén: Cẩm nang bảo vệ bản thân trước những "lỗ hở"

Thời gian gần đây, những lời tố cáo từ các nạn nhân bị camera giấu kín quay lén thu hút sự quan tâm rất lớn của teen mình. Ngoài việc đứng lên bảo vệ các nạn nhân và lên án tội phạm, nhiều bạn cũng lo lắng không biết nên làm gì để bảo vệ bản thân. Cùng nhà Hoa tìm cách bảo vệ bản thân trước những "lỗ hở" nhé!

Chuyện ngược đời mùa thi: Xấu hổ vì trường lấy điểm thấp

Điểm chuẩn thi vào lớp 10 của trường công lập (không chuyên) tại Hà Nội năm nay có xu hướng giảm. Có trường giảm 1 - 2 điểm so với năm ngoái, cá biệt có trường giảm sốc tới 17 điểm. Biến động này đã trở thành đề tài tranh cãi lớn trên mạng xã hội. Một số teen 2K9 trúng tuyển với điểm số rất cao tỏ ra bất mãn với việc hạ điểm chuẩn.', 100, 100, 20000, 5100, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (70, 12, N'Hoa Học Trò - Số 1416', N'	8938507003632', N'https://cdn0.fahasa.com/media/catalog/product/c/o/cover-1416-1-5983.jpg', N'Hoa Học Trò - Số 1416

Tháng 9 đến cũng là thời điểm teen đón năm học mới đầy hứng khởi. Hãy để Hoa Học Trò 1416 đồng hành cùng teen cho những bước chân rộn ràng đến trường nhé!

Du lịch Trung Quốc qua cửa khẩu có khó không?

Du lịch một số địa phương ở Trung Quốc thông qua cửa khẩu ngày càng thu hút giới trẻ bởi kinh phí phải chăng, không yêu cầu visa, thủ tục nhập cảnh đơn giản. Chỉ cần một vài ngày để trải nghiệm đất nước mới là lời mời gọi hấp dẫn hội mê du lịch. Cùng Hoa Học Trò 1416 khám phá hành trình bước chân sang thăm "người bạn hàng xóm" nào!

Độc thoại cũng là một "liều thuốc" chữa lành

Có khi nào bạn bị người khác bắt gặp đang độc thoại với những câu hỏi, những lời cảm thán ngốc nghếch? Thật ra, việc bâng quơ tự hỏi “Vì sao crush không thích mình?” hay “Mình có ổn không ta” không phải điều gì kỳ dị đâu mà còn mang lại nhiều lợi ích lắm đó! Cùng nhà Hoa tìm hiểu về những cuộc trò chuyện tưởng như “vô tri” mà lại rất lợi hại này nhé!

Những mẫu xe "hot" nhất mùa Back-2-School

Để tiết kiệm thời gian, chủ động và không tốn quá nhiều sức trên đường tới trường, teen THPT thường được ba mẹ trang bị cho một chú xế điện hoặc xế xăng mini. Mỗi loại xe đều có những ưu - nhược điểm khác nhau. Teen muốn trải nghiệm cảm giác nhẹ tênh trên mọi cung đường lại tiết kiệm có thể chọn “phe điện”, hội cứng tay lái hơn, muốn cảm giác mạnh mẽ hơn có thể chọn “xăng”. Để nhà Hoa chỉ cho bạn loại xe phù hợp mà cực kỳ "trendy" vào dịp năm học mới nha!

Lương Thùy Linh: Hoa hậu không chỉ xinh đẹp và đi làm từ thiện

Là một thủ lĩnh Gen Z luôn xông pha với tinh thần “đụng là chạm”, Lương Thùy Linh “phiên bản 2023” muốn làm nhiều hơn nữa vai trò của một Hoa hậu. Cùng Hoa Học Trò 1416 trò chuyện cùng nàng hậu Lương Thùy Linh nhé!', 99, 100, 20000, 5100, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (71, 12, N'Hoa Học Trò - Số 1432', N'	8938507004110', N'https://cdn0.fahasa.com/media/catalog/product/4/3/436752986-1085825769161524-2417033157991898941-n-1162.jpg', N'Hoa Học Trò - Số 1432

Nắng vàng rực rỡ tháng 5, cùng Hoa Học Trò 1432 khám phá những thông tin thú vị, mở ra bí kíp tận hưởng một mùa Hè tràn ngập niềm vui bạn nhé!

Tân thủ khoa Đại học Bách khoa Hà Nội mách bí kíp chinh phục TSA

Với 96.43/100 điểm tổng trong đó đạt 36.65 điểm Toán, 18.63 điểm Đọc hiểu và 35.87 điểm Khoa học và giải quyết vấn đề, bạn Vũ Đình Thái - học sinh lớp 12A1 trường THPT Tây Thụy Anh (Thái Bình) đã xuất sắc trở thành thủ khoa kỳ thi Đánh giá tư duy đợt 3 (TSA) của Đại học Bách khoa Hà Nội. Chia sẻ với nhà Hoa, cậu bạn đã đúc rút những kinh nghiệm hữu ích để gửi đến các sĩ tử chuẩn bị thi Đánh giá tư duy.

Bí kíp viết luận ngon như ăn bún từ các "thợ săn học bổng"

Đôi khi một chủ đề đơn giản được khai thác chi tiết và thú vị chính là điểm cộng của bài luận độc đáo trong mắt ban tuyển sinh. “Nhặt” ngay bí kíp để có bài luận mận keo từ các học bá nào!

Mặc thêm quần áo có bảo vệ ta khỏi quấy rối tình dục?

Khi một sự cố quấy rối tình dục xảy ra, nhiều nạn nhân bị đổ lỗi: “Chắc nó mặc váy ngắn/ áo mỏng…”, “ăn mặc như thế chả trách...”. Thật vô lý khi hành vi quấy rối được bình thường hoá, còn quyền tự do lựa chọn trang phục lại bị hạn chế. Có thật là quấy rối tình dục sẽ bị triệt tiêu nếu tất cả những gì ta làm là đắp thêm vải

Nhật ký "vượt khó" gặp oppa Baekhyun

Sau thành công của 2 đêm concert BLACKPINK tại SVĐ Mỹ Đình (Hà Nội) vào tháng 7 năm ngoái, ngày càng có nhiều idol K-Pop chọn Việt Nam làm địa điểm tổ chức concert hay họp fan. Điều đó đã giúp fan có cơ hội được thực hiện ước mơ “đu” concert của idol Baekhyun EXO.', 100, 100, 20000, 5100, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (72, 12, N'Hoa Học Trò - Số 1410', N'	8938507003540', N'https://cdn0.fahasa.com/media/catalog/product/c/o/cover-1410-1-1928.jpg', N'Hoa Học Trò - Số 1410

Kỳ thi vào 10 cũng như thi Tốt nghiệp THPT năm 2023 đang trong giai đoạn "nóng" hơn bao giờ hết. Hãy để Hoa Học Trò 1410 trở thành cơn gió mát lành, cùng teen "chiến đấu" với mùa Hè và kỳ vượt vũ môn đầy cam go nhé!

Đón đầu những thay đổi của giáo dục trong thời đại số 4.0

Theo quyết định của Thủ tướng Chính phủ, đến năm 2025, tỉ trọng tối thiểu nội dung chương trình Giáo dục phổ thông được triển khai dưới hình thức trực tuyến sẽ đạt trung bình 10% ở bậc trung học. Sở GD&ĐT TP.HCM thậm chí đã nâng tỉ lệ này lên đến 35%. Hãy cùng lắng nghe ý kiến của các bạn học sinh và thầy cô về những đổi mới mà chuyển đố số sẽ mang lại cho việc học tập của chúng mình trên Hoa Học Trò 1410 nhé!

Công thức cực chill cho mùa Hè cực cool

Năm học đã kết thúc, còn chần chờ gì mà không cất ba lô sách vở và tận hưởng mùa Hè đang vẫy gọi. Để nhà Hoa gửi cho bạn vài tín hiệu vũ trụ về các hoạt động hay ho trong Hè này nhé! Công thức này dành cho hội thích chill chill nhẹ nhàng và cả hội mê xê dịch luôn đó.

Ký sự chiến dịch chống nóng mùa Hè: "Chiến thuật" sai lầm tại "căn cứ" phòng máy lạnh

Trước cuộc tấn công gay gắt của mùa Hè với nhiệt độ có lúc lên đến hơn 40oC, nhiều teen đã quyết định “cố thủ” trong phòng với điều hòa. Tuy nhiên, sau vài ngày, hội teen đã gặp vô số vấn đề như khô da, mất nước và thậm chí là khó thở. Hoá ra, “kẻ thù” giấu mặt bấy lâu nay chính là chiếc máy lạnh! Cùng khám phá những bí quyết nhỏ để Hè này, cái nóng không còn là nỗi sợ.

Tại sao "bad boy" Min Ho gây sốt?

Sau thành công của loạt phim To All The Boys I’ve Loved Before, hành trình sang tận Hàn Quốc kiếm tìm tình yêu đích thực của cô em lém lỉnh Kitty trong XO, Kitty nhanh chóng chiếm lĩnh trái tim teen khắp châu Á. Trong đó, màn debut của nam diễn viên Sang Heon Lee (Min Ho) trở thành điểm sáng thu hút nhất. Cùng Hoa Học Trò đi tìm “dung mạo thật” của chàng hotboy này nhé!

Kỷ yếu lưu giữ kỷ niệm hay nguồn cơn gây ồn ào?

Chụp kỷ yếu vốn là hoạt động được mong đợi nhất dịp cuối cấp, nhưng mỗi khi mùa kỷ yếu gõ cửa, những thước phim, khung hình kỷ niệm luôn xuất hiện song song với đủ loại drama. Điều này khiến chủ đề được teen thảo luận không chỉ dừng lại ở “chụp gì, ở đâu”, mà còn là “ảnh kỷ yếu quan trọng đến thế sao?”. Không dễ để một bộ ảnh chung chiều lòng tất cả các thành viên, nhưng làm thế nào để có phương án phù hợp và một tác phẩm ưng ý?', 98, 100, 20000, 5100, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (73, 12, N'Hoa Học Trò - Số 1429', N'	8938507004028', N'https://cdn0.fahasa.com/media/catalog/product/c/o/cover-1429-1-1474.jpg', N'Hoa Học Trò - Số 1429

Những thông tin thú vị trên số báo Hoa Học Trò 1429 sẽ đồng hành cùng teen trong hành trình tháng 3 rực rỡ này đấy!

Khám phá "bộ giáp" kỹ năng giúp bạn làm chủ tương lai

Thế giới biến động hiện nay đang tạo ra rất nhiều thách thức mới cho các Gen Z. Để giúp giới trẻ vượt qua những thử thách tương lai này, các nền giáo dục đang ngày càng chú trọng đến việc trang bị cho học sinh những kỹ năng cần thiết. Hãy cùng nhà Hoa khám phá xem những kỹ năng đó là gì nhé!

Theo chân tiền bối khám phá "phía sau một chuyến bay"

Không nhất thiết phải ngồi ghế lái hay làm tiếp viên hàng không, teen vẫn có thể tận hưởng nhiều đãi ngộ xịn xò của ngành hàng không với nghề Bảo dưỡng máy bay. Cùng TikToker Thỏ Hoàng - người có hơn 7 năm làm nghề - khám phá đằng sau “đường bay” của nhân viên bảo dưỡng có gì thú vị nha!

Gen Z “khuấy đảo” Threads: Chỉ là viết thôi mà, có gì hot đến thế?

Nhắc đến Threads, chắc hẳn bạn đã biết đây là mạng xã hội của Meta từng rình rang ngay khi ra mắt. Ra đời khi người dùng đã “bội thực” với Facebook, Instagram, TikTok, X (Twitter)…, Threads nhanh chóng bị lãng quên chỉ trong vòng 1 - 2 tháng sau đó. Nhưng đáng ngạc nhiên là thời gian gần đây, nền tảng này lại xuất hiện trở lại trong top ưu tiên của teen.

Cách công ty của IU chống vé “chợ đen”

Những sân khấu nhiệt huyết của IU và sự tận tâm chuẩn bị kỹ lưỡng của công ty EDAM Ent (công ty quản lý IU) trong world tour “H.E.R” chính là một “next level” cho sự kết hợp hoàn hảo của “công ty có tầm, nghệ sĩ có tâm”.', 99, 100, 20000, 5100, 1, NULL)
INSERT [dbo].[tblSanpham] ([PK_iSanphamID], [FK_iTheloaiID], [sTensanpham], [sMavach], [sHinhanh], [sMota], [iTonkho], [fTrongluong], [fGiaban], [fGiavon], [isTrangthai], [dThoigiantao]) VALUES (74, 12, N'NULLHoa Học Trò - Số 1411', N'	8938507003557', N'https://cdn0.fahasa.com/media/catalog/product/3/5/354806518-239579205472300-5047249874043164374-n-4448.jpg', N'Hoa Học Trò - Số 1411

Những dự án hay ho, bí kíp học tập cực mới mẻ hay những trải nghiệm mùa Hè có trong Hoa Học Trò 1411 chắc chắn sẽ khiến teen vô cùng hào hứng.

Bắt tín hiệu đổi mới trong các dự án học tập

Với sự phát triển của công nghệ, AI, chuyển đổi số đang dần trở thành “người bạn” thân quen của học trò, không chỉ trong những bài giảng mà còn ở các hoạt động ngoại khoá. Cùng nhà Hoa xem thử các bạn trẻ thế hệ Z đã áp dụng công nghệ vào việc quản lý các dự án học tập như thế nào nhé!

Bí kíp học Văn theo phong cách "đề mở" dành cho teen 2K9

Qua các mùa thi tuyển sinh vào lớp 10 TP.HCM gần đây, có thể thấy được mức độ đánh đố của đề thi Văn khi nhiều sĩ tử tiết lộ “trúng tủ cũng chưa chắc làm được bài”. Điều đó cho thấy, lộ trình học Văn của teen 2K9 cũng cần phải có sự thay đổi ngay từ đầu năm.

Trải nghiệm thực tập từ tuổi teen

Thực tập không còn là một khái niệm xa lạ với các bạn trẻ Gen Z. Không chỉ riêng sinh viên đại học hay người đã đi làm mà hiện nay, học sinh THPT cũng tham gia các chương trình thực tập để trau dồi những kỹ năng mềm và kinh nghiệm làm việc chuyên nghiệp.

Gọi tên "báo thủ" khiến mùa Hè của teen "thất thủ"

Kỳ nghỉ Hè lý tưởng với nhiều teen là nằm thảnh thơi trong căn phòng có gió điều hòa mát lạnh, tránh nóng ở nhà xem Netflix, lướt mạng xã hội và thỉnh thoảng ra ngoài tụ tập bạn bè đổi gió. Ú òa, từ khóa “mất điện” lại khiến ngày Hè khác xa tưởng tượng, khiến một loạt “phi vụ chống nóng” dở khóc dở cười ra đời.

Phim VTV đua nhau kéo dài: Tham quá hóa nhàm?

Ngày càng có nhiều phim truyền hình giờ vàng của VTV kéo dài hơn dự kiến, số tập tăng thêm cũng ngày một nhiều hơn. Thêm tập có phải là cách hay để giữ chân khán giả trước màn hình?', 100, 100, 20000, 5100, 1, NULL)
SET IDENTITY_INSERT [dbo].[tblSanpham] OFF
GO
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (1, 1, N'ngocnguyen71e11@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (2, 3, N'ngockh@gmail.com', N'1234')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (3, 3, N'kh1@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (4, 3, N'kh2@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (5, 3, N'kh3@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (6, 3, N'kh4@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (7, 3, N'kh5@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (8, 3, N'nguyendat29122001@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (9, 3, N'tunnguyen@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (10, 3, N'maihoa@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (11, 3, N'kh10@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (12, 3, N'kh11@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (13, 3, N'kh13@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (14, 3, N'kh12@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (15, 3, N'kh14@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (16, 3, N'kh15@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (17, 3, N'kh6@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (18, 3, N'kh7@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (19, 3, N'kh8@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (20, 3, N'kh9@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (21, 3, N'kh16@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (22, 3, N'kh17@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (23, 3, N'kh23@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (24, 3, N'kh24@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (25, 3, N'kh25@gmail.com', N'123')
INSERT [dbo].[tblTaikhoan] ([PK_iTaikhoanID], [FK_iQuyenID], [sEmail], [sMatkhau]) VALUES (26, 3, N'kh26@gmail.com', N'123')
GO
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai], [FK_iDanhmucID]) VALUES (1, N'Sách tiếng Việt', 1)
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai], [FK_iDanhmucID]) VALUES (2, N'Manga', 1)
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai], [FK_iDanhmucID]) VALUES (3, N'Tiểu thuyết', 1)
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai], [FK_iDanhmucID]) VALUES (4, N'Tác phẩm kinh điển', 1)
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai], [FK_iDanhmucID]) VALUES (5, N'Huyền bí-Giả tưởng-Kinh dị', 1)
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai], [FK_iDanhmucID]) VALUES (6, N'FANTASY', 1)
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai], [FK_iDanhmucID]) VALUES (7, N'Dụng cụ học sinh', 2)
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai], [FK_iDanhmucID]) VALUES (8, N'Dụng cụ văn phòng', 2)
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai], [FK_iDanhmucID]) VALUES (9, N'Đồ chơi', 2)
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai], [FK_iDanhmucID]) VALUES (10, N'Kinh tế', 1)
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai], [FK_iDanhmucID]) VALUES (11, N'Nuôi dạy con', 1)
INSERT [dbo].[tblTheloai] ([PK_iTheloaiID], [sTentheloai], [FK_iDanhmucID]) VALUES (12, N'Báo - tạp chí', 1)
GO
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (1, N'Hà Nội')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (2, N'TP Hồ Chí Minh')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (3, N'Hải Phòng')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (4, N'Đà Nẵng')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (5, N'Hà Giang')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (6, N'Cao Bằng')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (7, N'Lai Châu')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (8, N'Lào Cai')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (9, N'Tuyên Quang')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (10, N'Lạng Sơn')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (11, N'Bắc Kạn')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (12, N'Thái Nguyên')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (13, N'Yên Bái')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (14, N'Sơn La')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (15, N'Phú Thọ')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (16, N'Vĩnh Phúc')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (17, N'Quảng Ninh')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (18, N'Bắc Giang')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (19, N'Bắc Ninh')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (20, N'Hải Dương')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (21, N'Hưng Yên')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (22, N'Hòa Bình')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (23, N'Hà Nam')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (24, N'Nam Định')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (25, N'Thái Bình')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (26, N'Ninh Bình')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (27, N'Thanh Hóa')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (28, N'Nghệ An')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (29, N'Hà Tĩnh')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (30, N'Quảng Bình')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (31, N'Quảng Trị')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (32, N'Thừa Thiên Huế')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (33, N'Quảng Nam')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (34, N'Quảng Ngãi')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (35, N'Bình Định')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (36, N'Phú Yên')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (37, N'Khánh Hòa')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (38, N'Ninh Thuận')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (39, N'Bình Thuận')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (40, N'Kon Tum')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (41, N'Gia Lai')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (42, N'Đắk Lắk')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (43, N'Đắk Nông')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (44, N'Lâm Đồng')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (45, N'Bình Phước')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (46, N'Tây Ninh')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (47, N'Bình Dương')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (48, N'Đồng Nai')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (49, N'Bà Rịa - Vũng Tàu')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (50, N'Long An')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (51, N'Tiền Giang')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (52, N'Bến Tre')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (53, N'Trà Vinh')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (54, N'Vĩnh Long')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (55, N'Đồng Tháp')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (56, N'An Giang')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (57, N'Kiên Giang')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (58, N'Cần Thơ')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (59, N'Hậu Giang')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (60, N'Sóc Trăng')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (61, N'Bạc Liêu')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (62, N'Cà Mau')
INSERT [dbo].[tblTinh] ([PK_iTinhID], [sTentinh]) VALUES (63, N'Điện Biên')
GO
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10101, 101, N'Phường Chương Dương Độ')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10102, 101, N'Phường Cửa Đông')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10103, 101, N'Phường Cửa Nam')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10104, 101, N'Phường Đồng Xuân')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10105, 101, N'Phường Hàng Bạc')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10106, 101, N'Phường Hàng Bài')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10107, 101, N'Phường Hàng Bồ')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10108, 101, N'Phường Hàng Bông')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10109, 101, N'Phường Hàng Buồm')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10110, 101, N'Phường Hàng Đào')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10111, 101, N'Phường Hàng Gai')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10112, 101, N'Phường Hàng Mã')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10113, 101, N'Phường Hàng Trống')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10114, 101, N'Phường Lý Thái Tổ')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10115, 101, N'Phường Phan Chu Trinh')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10116, 101, N'Phường Phúc Tân')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10117, 101, N'Phường Trần Hưng Đạo')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10118, 101, N'Phường Tràng Tiền')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10201, 102, N'Phường Cống Vị')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10202, 102, N'Phường Điện Biên')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10203, 102, N'Phường Đội Cấn')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10204, 102, N'Phường Giảng Võ')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10205, 102, N'Phường Kim Mã')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10206, 102, N'Phường Liễu Giai')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10207, 102, N'Phường Nguyễn Trung Trực')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10208, 102, N'Phường Ngọc Hà')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10209, 102, N'Phường Ngọc Khánh')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10210, 102, N'Phường Phúc Xá')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10211, 102, N'Phường Quán Thánh')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10212, 102, N'Phường Thành Công')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10213, 102, N'Phường Trúc Bạch')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (10214, 102, N'Phường Vĩnh Phúc')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20101, 201, N'Phường Bến Nghé')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20102, 201, N'Phường Bến Thành')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20103, 201, N'Phường Cầu Kho')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20104, 201, N'Phường Cầu Ông Lãnh')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20105, 201, N'Phường Cô Giang')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20106, 201, N'Phường Đa Kao')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20107, 201, N'Phường Nguyễn Cư Trinh')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20108, 201, N'Phường Nguyễn Thái Bình')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20109, 201, N'Phường Phạm Ngũ Lão')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20110, 201, N'Phường Tân Định')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20301, 203, N'Phường 1')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20302, 203, N'Phường 2')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20303, 203, N'Phường 3')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20304, 203, N'Phường 4')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20305, 203, N'Phường 5')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20306, 203, N'Phường 6')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20307, 203, N'Phường 7')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20308, 203, N'Phường 8')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20309, 203, N'Phường 9')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20310, 203, N'Phường 10')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20311, 203, N'Phường 11')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20312, 203, N'Phường 12')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20313, 203, N'Phường 13')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20314, 203, N'Phường 14')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (20315, 203, N'Phường 15')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (30101, 301, N'Phường An Biên')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (30102, 301, N'Phường Cát Dài')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (30103, 301, N'Phường Dư Hàng')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (30104, 301, N'Phường Đông Hải')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (30105, 301, N'Phường Dư Hàng Kênh')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (30106, 301, N'Phường Hàng Kênh')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (30107, 301, N'Phường Hồ Nam')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (30108, 301, N'Phường Kênh Dương')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (30109, 301, N'Phường Lam Sơn')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (30110, 301, N'Phường Nghĩa Xá')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (30111, 301, N'Phường Niệm Nghĩa')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (30112, 301, N'Phường Trại Cau')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (30113, 301, N'Phường Trại Chuối')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (40101, 401, N'Phường Bình Hiên')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (40102, 401, N'Phường Bình Thuận')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (40103, 401, N'Phường Hải Châu I')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (40104, 401, N'Phường Hải Châu II')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (40105, 401, N'Phường Hòa Cường Bắc')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (40106, 401, N'Phường Hòa Cường Nam')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (40107, 401, N'Phường Hòa Thuận Đông')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (40108, 401, N'Phường Hòa Thuận Tây')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (40109, 401, N'Phường Nam Dương')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (40110, 401, N'Phường Phước Ninh')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (40111, 401, N'Phường Thạch Thang')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (40112, 401, N'Phường Thanh Bình')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (40113, 401, N'Phường Thuận Phước')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (120401, 1204, N'Xã Cổ Lũng')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (120402, 1204, N'Xã Động Đạt')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (120403, 1204, N'Xã Hợp Thành')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (120404, 1204, N'Xã Ôn Lương')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (120405, 1204, N'Xã Phấn Mễ')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (120406, 1204, N'Xã Sơn Cẩm')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (120407, 1204, N'Xã Tức Tranh')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (120408, 1204, N'Xã Vô Tranh')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (120409, 1204, N'Xã Yên Đổ')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (120410, 1204, N'Xã Yên Lạc')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (270401, 2704, N'Xã Ái Thượng')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (270402, 2704, N'Xã Ban Công')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (270403, 2704, N'Xã Cổ Lũng')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (270404, 2704, N'Xã Điền Hạ')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (270405, 2704, N'Xã Điền Lư')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (270406, 2704, N'Xã Điền Quang')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (270407, 2704, N'Xã Điền Thượng')
GO
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (270408, 2704, N'Xã Hạ Trung')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (270409, 2704, N'Xã Kỳ Tân')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (270410, 2704, N'Xã Lũng Niêm')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (270411, 2704, N'Xã Lũng Cao')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (270412, 2704, N'Xã Thành Lâm')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (270413, 2704, N'Xã Thành Sơn')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (270414, 2704, N'Xã Thiết Kế')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (270415, 2704, N'Xã Thiết Ống')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (271901, 2719, N'Xã Quảng Bình')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (271902, 2719, N'Xã Quảng Hòa')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (271903, 2719, N'Xã Quảng Khê')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (271904, 2719, N'Xã Quảng Lĩnh')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (271905, 2719, N'Xã Quảng Lộc')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (271906, 2719, N'Xã Quảng Long')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (271907, 2719, N'Xã Quảng Ngọc')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (271908, 2719, N'Xã Quảng Phong')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (271909, 2719, N'Xã Quảng Phú')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (271910, 2719, N'Xã Quảng Thạch')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (271911, 2719, N'Xã Quảng Thái')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (271912, 2719, N'Xã Quảng Trung')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (271913, 2719, N'Xã Quảng Trường')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (271914, 2719, N'Xã Quảng Văn')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (271915, 2719, N'Xã Quảng Vọng')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280701, 2807, N'Xã Diễn An')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280702, 2807, N'Xã Diễn Bình')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280703, 2807, N'Xã Diễn Cát')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280704, 2807, N'Xã Diễn Đoài')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280705, 2807, N'Xã Diễn Đồng')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280706, 2807, N'Xã Diễn Hạnh')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280707, 2807, N'Xã Diễn Hoa')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280708, 2807, N'Xã Diễn Hoàng')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280709, 2807, N'Xã Diễn Hùng')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280710, 2807, N'Xã Diễn Kim')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280711, 2807, N'Xã Diễn Kỷ')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280712, 2807, N'Xã Diễn Lâm')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280713, 2807, N'Xã Diễn Liên')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280714, 2807, N'Xã Diễn Lộc')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280715, 2807, N'Xã Diễn Ngọc')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280716, 2807, N'Xã Diễn Phong')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280717, 2807, N'Xã Diễn Phú')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280718, 2807, N'Xã Diễn Quảng')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280719, 2807, N'Xã Diễn Tân')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280720, 2807, N'Xã Diễn Tháp')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280721, 2807, N'Xã Diễn Thành')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280722, 2807, N'Xã Diễn Thịnh')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280723, 2807, N'Xã Diễn Thọ')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280724, 2807, N'Xã Diễn Trung')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280725, 2807, N'Xã Diễn Trường')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280726, 2807, N'Xã Diễn Vạn')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280727, 2807, N'Xã Diễn Xuân')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (280728, 2807, N'Xã Diễn Yên')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (351001, 3510, N'Xã Bình Nghi')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (351002, 3510, N'Xã Phước An')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (351003, 3510, N'Xã Phước Hiệp')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (351004, 3510, N'Xã Phước Hòa')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (351005, 3510, N'Xã Phước Lộc')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (351006, 3510, N'Xã Phước Nghĩa')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (351007, 3510, N'Xã Phước Quang')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (351008, 3510, N'Xã Phước Sơn')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (351009, 3510, N'Xã Phước Thắng')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (351010, 3510, N'Xã Phước Thuận')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (421301, 4213, N'Xã Ea Kênh')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (421302, 4213, N'Xã Ea Kuăng')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (421303, 4213, N'Xã Ea Phê')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (421304, 4213, N'Xã Ea Uy')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (421305, 4213, N'Xã Ea Yiêng')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (421306, 4213, N'Xã Ea Yông')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (421307, 4213, N'Xã Hòa An')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (421308, 4213, N'Xã Hòa Đông')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (421309, 4213, N'Xã Hòa Tiến')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (421310, 4213, N'Xã Krông Búk')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (421311, 4213, N'Xã Krông Bông')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (421312, 4213, N'Xã Krông Năng')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (421313, 4213, N'Xã Tân Tiến')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (441101, 4411, N'Xã Đạ Rsal')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (441102, 4411, N'Xã Đạ Lây')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (441103, 4411, N'Xã Đạ M\ri')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (441104, 4411, N'Xã Đạ Ploa')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (441105, 4411, N'Xã Đạ Rsal')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (441106, 4411, N'Xã Đa Quyn')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (441107, 4411, N'Xã Đa Tẻh')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (441108, 4411, N'Xã Hương Lâm')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (441109, 4411, N'Xã Mỹ Đức')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (441110, 4411, N'Xã Quốc Oai')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (441111, 4411, N'Xã Triệu Hải')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (571301, 5713, N'Xã Dương Tơ')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (571302, 5713, N'Xã Hàm Ninh')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (571303, 5713, N'Xã Bãi Thơm')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (571304, 5713, N'Xã Cửa Cạn')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (571305, 5713, N'Xã Gành Dầu')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (571306, 5713, N'Xã Hòn Thơm')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (571307, 5713, N'Xã Thổ Châu')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (571308, 5713, N'Thị trấn Dương Đông')
INSERT [dbo].[tblXa] ([PK_iXaID], [FK_iHuyenID], [sTenxa]) VALUES (571309, 5713, N'Thị trấn An Thới')
GO
ALTER TABLE [dbo].[tblCTdonhang]  WITH CHECK ADD FOREIGN KEY([FK_iDonhangID])
REFERENCES [dbo].[tblDonhang] ([PK_iDonhangID])
GO
ALTER TABLE [dbo].[tblCTdonhang]  WITH CHECK ADD FOREIGN KEY([FK_iSanphamID])
REFERENCES [dbo].[tblSanpham] ([PK_iSanphamID])
GO
ALTER TABLE [dbo].[tblCTgiohang]  WITH CHECK ADD FOREIGN KEY([FK_iGiohangID])
REFERENCES [dbo].[tblGiohang] ([PK_iGiohangID])
GO
ALTER TABLE [dbo].[tblCTgiohang]  WITH CHECK ADD FOREIGN KEY([FK_iSanphamID])
REFERENCES [dbo].[tblSanpham] ([PK_iSanphamID])
GO
ALTER TABLE [dbo].[tblCTkhuyenmai]  WITH CHECK ADD FOREIGN KEY([FK_iKhuyenmaiID])
REFERENCES [dbo].[tblKhuyenmai] ([PK_iKhuyenmaiID])
GO
ALTER TABLE [dbo].[tblCTkhuyenmai]  WITH CHECK ADD FOREIGN KEY([FK_iSanphamID])
REFERENCES [dbo].[tblSanpham] ([PK_iSanphamID])
GO
ALTER TABLE [dbo].[tblCTphieukiemke]  WITH CHECK ADD FOREIGN KEY([FK_iPhieukiemke])
REFERENCES [dbo].[tblPhieukiemke] ([PK_iPhieukiemkeID])
GO
ALTER TABLE [dbo].[tblCTphieukiemke]  WITH CHECK ADD FOREIGN KEY([FK_iSanphamID])
REFERENCES [dbo].[tblSanpham] ([PK_iSanphamID])
GO
ALTER TABLE [dbo].[tblCTphieunhaphang]  WITH CHECK ADD FOREIGN KEY([FK_iPhieunhaphangID])
REFERENCES [dbo].[tblPhieunhaphang] ([PK_iPhieunhaphangID])
GO
ALTER TABLE [dbo].[tblCTphieunhaphang]  WITH CHECK ADD FOREIGN KEY([FK_iSanphamID])
REFERENCES [dbo].[tblSanpham] ([PK_iSanphamID])
GO
ALTER TABLE [dbo].[tblCTsach]  WITH CHECK ADD FOREIGN KEY([FK_iSanphamID])
REFERENCES [dbo].[tblSanpham] ([PK_iSanphamID])
GO
ALTER TABLE [dbo].[tblCTvanphongpham]  WITH CHECK ADD FOREIGN KEY([FK_iSanphamID])
REFERENCES [dbo].[tblSanpham] ([PK_iSanphamID])
GO
ALTER TABLE [dbo].[tblDanhgia]  WITH CHECK ADD FOREIGN KEY([FK_iCTdonhangID])
REFERENCES [dbo].[tblCTdonhang] ([PK_iCTdonhangID])
GO
ALTER TABLE [dbo].[tblDiachiKH]  WITH CHECK ADD FOREIGN KEY([FK_iHuyenID])
REFERENCES [dbo].[tblHuyen] ([PK_iHuyenID])
GO
ALTER TABLE [dbo].[tblDiachiKH]  WITH CHECK ADD FOREIGN KEY([FK_iTinhID])
REFERENCES [dbo].[tblTinh] ([PK_iTinhID])
GO
ALTER TABLE [dbo].[tblDiachiKH]  WITH CHECK ADD FOREIGN KEY([FK_iXaID])
REFERENCES [dbo].[tblXa] ([PK_iXaID])
GO
ALTER TABLE [dbo].[tblDiachiKH]  WITH CHECK ADD FOREIGN KEY([FK_sKHID])
REFERENCES [dbo].[tblKhachhang] ([PK_sKHID])
GO
ALTER TABLE [dbo].[tblDonhang]  WITH CHECK ADD FOREIGN KEY([FK_iTrangthai])
REFERENCES [dbo].[tblCTtrangthaidonhang] ([PK_iTrangthaidonhangID])
GO
ALTER TABLE [dbo].[tblDonhang]  WITH CHECK ADD FOREIGN KEY([FK_sDiachiKHID])
REFERENCES [dbo].[tblDiachiKH] ([PK_sDiachiKHID])
GO
ALTER TABLE [dbo].[tblDonhang]  WITH CHECK ADD FOREIGN KEY([FK_sKHID])
REFERENCES [dbo].[tblKhachhang] ([PK_sKHID])
GO
ALTER TABLE [dbo].[tblGiohang]  WITH CHECK ADD FOREIGN KEY([FK_iKHID])
REFERENCES [dbo].[tblKhachhang] ([PK_sKHID])
GO
ALTER TABLE [dbo].[tblHuyen]  WITH CHECK ADD FOREIGN KEY([FK_iTinhID])
REFERENCES [dbo].[tblTinh] ([PK_iTinhID])
GO
ALTER TABLE [dbo].[tblKhachhang]  WITH CHECK ADD FOREIGN KEY([FK_iTaikhoanID])
REFERENCES [dbo].[tblTaikhoan] ([PK_iTaikhoanID])
GO
ALTER TABLE [dbo].[tblNhanvien]  WITH CHECK ADD FOREIGN KEY([FK_iTaikhoanID])
REFERENCES [dbo].[tblTaikhoan] ([PK_iTaikhoanID])
GO
ALTER TABLE [dbo].[tblPhieunhaphang]  WITH CHECK ADD FOREIGN KEY([FK_sNCCID])
REFERENCES [dbo].[tblNhacungcap] ([PK_iNCCID])
GO
ALTER TABLE [dbo].[tblSanpham]  WITH CHECK ADD FOREIGN KEY([FK_iTheloaiID])
REFERENCES [dbo].[tblTheloai] ([PK_iTheloaiID])
GO
ALTER TABLE [dbo].[tblTaikhoan]  WITH CHECK ADD FOREIGN KEY([FK_iQuyenID])
REFERENCES [dbo].[tblPhanquyen] ([PK_iQuyenID])
GO
ALTER TABLE [dbo].[tblTheloai]  WITH CHECK ADD FOREIGN KEY([FK_iDanhmucID])
REFERENCES [dbo].[tblDanhmuc] ([PK_iDanhmucID])
GO
ALTER TABLE [dbo].[tblXa]  WITH CHECK ADD FOREIGN KEY([FK_iHuyenID])
REFERENCES [dbo].[tblHuyen] ([PK_iHuyenID])
GO
USE [master]
GO
ALTER DATABASE [db_OnlineBookStore] SET  READ_WRITE 
GO
