USE [master]
GO
/****** Object:  Database [Kafe]    Script Date: 4.11.2022 19:25:51 ******/
CREATE DATABASE [Kafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kafe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Kafe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kafe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Kafe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Kafe] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kafe] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Kafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kafe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Kafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kafe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Kafe] SET  MULTI_USER 
GO
ALTER DATABASE [Kafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kafe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kafe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kafe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Kafe] SET QUERY_STORE = OFF
GO
USE [Kafe]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 4.11.2022 19:25:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[KullaniciNo] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [varchar](50) NULL,
	[Sifre] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[Telefon] [varchar](50) NULL,
	[PersonelNo] [int] NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[KullaniciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personeller]    Script Date: 4.11.2022 19:25:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personeller](
	[PersonelNo] [int] IDENTITY(1,1) NOT NULL,
	[PersonelAdi] [varchar](50) NULL,
	[Sifre] [varchar](50) NULL,
 CONSTRAINT [PK_Personeller] PRIMARY KEY CLUSTERED 
(
	[PersonelNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparişler]    Script Date: 4.11.2022 19:25:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparişler](
	[SiparisNo] [int] IDENTITY(1,1) NOT NULL,
	[SiparisAdi] [varchar](50) NULL,
	[SiparisAdres] [varchar](50) NULL,
	[UrunNo] [int] NULL,
	[SiparisAdet] [int] NULL,
	[SiparisTutari] [int] NULL,
 CONSTRAINT [PK_Siparişler] PRIMARY KEY CLUSTERED 
(
	[SiparisNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 4.11.2022 19:25:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[UrunNo] [int] IDENTITY(1,1) NOT NULL,
	[UrunAdi] [varchar](50) NOT NULL,
	[UrunFiyati] [int] NULL,
	[KullanimTarihi] [varchar](50) NULL,
	[UretimTarihi] [varchar](50) NULL,
	[PersonelNo] [int] NULL,
 CONSTRAINT [PK_Urunler_1] PRIMARY KEY CLUSTERED 
(
	[UrunNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([KullaniciNo], [KullaniciAdi], [Sifre], [Mail], [Telefon], [PersonelNo]) VALUES (1, N'Şerife', N'123', N'123@gmail.com', N'(555) 555-5555', NULL)
INSERT [dbo].[Kullanicilar] ([KullaniciNo], [KullaniciAdi], [Sifre], [Mail], [Telefon], [PersonelNo]) VALUES (2, N'serife', N'123', N'fer', N'(111) 111-1111', NULL)
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
GO
SET IDENTITY_INSERT [dbo].[Personeller] ON 

INSERT [dbo].[Personeller] ([PersonelNo], [PersonelAdi], [Sifre]) VALUES (1, N'Serife', N'123')
INSERT [dbo].[Personeller] ([PersonelNo], [PersonelAdi], [Sifre]) VALUES (2, N'Rabia', N'123')
INSERT [dbo].[Personeller] ([PersonelNo], [PersonelAdi], [Sifre]) VALUES (3, N'Ayse', NULL)
SET IDENTITY_INSERT [dbo].[Personeller] OFF
GO
SET IDENTITY_INSERT [dbo].[Siparişler] ON 

INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (1, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (2, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (3, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (4, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (5, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (6, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (7, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (8, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (9, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (10, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (11, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (12, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (13, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (14, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (15, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (16, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (17, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (18, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (19, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (20, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (21, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (22, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (23, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (24, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (25, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (26, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (27, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (28, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (29, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (30, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (31, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (32, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (33, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (34, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (35, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (36, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (37, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (38, N'su', N'sdfsgf', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (39, N'dgag', N'dsfsgd', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (40, N'dgag', N'dsfsgd', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (41, N'dsdg', N'sdgsdg', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (42, N'dsdg', N'sdgsdg', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (43, N'dsdg', N'sdgsdg', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (44, N'dsdg', N'sdgsdg', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (45, N'dsdg', N'sdgsdg', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (46, N'dsdg', N'sdgsdg', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (47, N'dsdg', N'sdgsdg', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (48, N'dsdg', N'sdgsdg', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (49, N'dsdg', N'sdgsdg', 1, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (50, N'dffd', N'df', 1, 3, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (51, N'dffd', N'df', 1, 3, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (52, N'dffd', N'df', 1, 3, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (53, N'dffd', N'df', 1, 3, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (54, N'dffd', N'df', 1, 3, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (55, N'dffd', N'df', 1, 3, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (56, N'dffd', N'df', 1, 3, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (57, N'dffd', N'df', 1, 3, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (58, N'dffd', N'df', 1, 3, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (59, N'dffd', N'df', 1, 3, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (60, N'dffd', N'df', 1, 3, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (61, N'gar', N'ryaery', 1, 2, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (62, N'gar', N'ryaery', 1, 2, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (63, N'rt', N'srturt', 1, 2, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (64, N'xfg', N'fgjfg', 1, 2, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (65, N'are', N'rege', 0, 1, 0)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (66, N'ry', N'dfhz', 1, 2, 10)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (67, N'ry', N'dfhz', 0, 2, 10)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (68, N'gfg', N'sdgsg', 0, 2, 10)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (69, N'gfg', N'sdgsg', 1, 2, 10)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (70, N'gfg', N'sdgsg', 1, 2, 10)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (71, N'jkghj', N'gkjg', 1, 2, 10)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (72, N'jkghj', N'gkjg', 0, 2, 10)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (73, N'dfgdfh', N'fdhdfh', 1, 2, 10)
INSERT [dbo].[Siparişler] ([SiparisNo], [SiparisAdi], [SiparisAdres], [UrunNo], [SiparisAdet], [SiparisTutari]) VALUES (74, N'dfgdfh', N'fdhdfh', 3, 2, 10)
SET IDENTITY_INSERT [dbo].[Siparişler] OFF
GO
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([UrunNo], [UrunAdi], [UrunFiyati], [KullanimTarihi], [UretimTarihi], [PersonelNo]) VALUES (1, N'Simitidjghalhglre', 25554545, N'1', N'8', 1)
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdi], [UrunFiyati], [KullanimTarihi], [UretimTarihi], [PersonelNo]) VALUES (6, N'Simitidjghalhglre', 25554545, N'1', N'8', 1)
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdi], [UrunFiyati], [KullanimTarihi], [UretimTarihi], [PersonelNo]) VALUES (7, N'Simitidjghalhglre', 25554545, N'32', N'8', 1)
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdi], [UrunFiyati], [KullanimTarihi], [UretimTarihi], [PersonelNo]) VALUES (8, N'Simitidjghalhglre', 25554545, N'32', N'8', 1)
INSERT [dbo].[Urunler] ([UrunNo], [UrunAdi], [UrunFiyati], [KullanimTarihi], [UretimTarihi], [PersonelNo]) VALUES (9, N'Simitidjghalhglre', 25554545, N'32', N'8', 1)
SET IDENTITY_INSERT [dbo].[Urunler] OFF
GO
ALTER TABLE [dbo].[Kullanicilar]  WITH CHECK ADD  CONSTRAINT [FK_Kullanicilar_Personeller] FOREIGN KEY([PersonelNo])
REFERENCES [dbo].[Personeller] ([PersonelNo])
GO
ALTER TABLE [dbo].[Kullanicilar] CHECK CONSTRAINT [FK_Kullanicilar_Personeller]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Personeller] FOREIGN KEY([PersonelNo])
REFERENCES [dbo].[Personeller] ([PersonelNo])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Personeller]
GO
/****** Object:  StoredProcedure [dbo].[KullaniciGiris]    Script Date: 4.11.2022 19:25:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KullaniciGiris] 
@KullaniciAdi varchar(50),
@Sifre varchar(50)
as begin 
select * from Kullanicilar where KullaniciAdi= @KullaniciAdi and Sifre=@Sifre
end
GO
/****** Object:  StoredProcedure [dbo].[PersonelGirisi]    Script Date: 4.11.2022 19:25:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PersonelGirisi]
@PersonelAdi varchar(50),
@Sifre varchar (50)
as begin 
select * from Personeller where PersonelAdi=@PersonelAdi and Sifre=@Sifre
end
GO
USE [master]
GO
ALTER DATABASE [Kafe] SET  READ_WRITE 
GO
