USE [master]
GO
/****** Object:  Database [FarmasiProducts]    Script Date: 19.11.2022 20:18:49 ******/
CREATE DATABASE [FarmasiProducts]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FarmasiProducts', FILENAME = N'C:\Users\Şerife GÖKDAŞ\Desktop\MSSQL15.SQLEXPRESS\MSSQL\DATA\FarmasiProducts.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FarmasiProducts_log', FILENAME = N'C:\Users\Şerife GÖKDAŞ\Desktop\MSSQL15.SQLEXPRESS\MSSQL\DATA\FarmasiProducts_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FarmasiProducts] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FarmasiProducts].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FarmasiProducts] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FarmasiProducts] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FarmasiProducts] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FarmasiProducts] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FarmasiProducts] SET ARITHABORT OFF 
GO
ALTER DATABASE [FarmasiProducts] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FarmasiProducts] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FarmasiProducts] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FarmasiProducts] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FarmasiProducts] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FarmasiProducts] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FarmasiProducts] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FarmasiProducts] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FarmasiProducts] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FarmasiProducts] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FarmasiProducts] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FarmasiProducts] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FarmasiProducts] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FarmasiProducts] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FarmasiProducts] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FarmasiProducts] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FarmasiProducts] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FarmasiProducts] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FarmasiProducts] SET  MULTI_USER 
GO
ALTER DATABASE [FarmasiProducts] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FarmasiProducts] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FarmasiProducts] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FarmasiProducts] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FarmasiProducts] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FarmasiProducts] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FarmasiProducts] SET QUERY_STORE = OFF
GO
USE [FarmasiProducts]
GO
/****** Object:  Table [dbo].[Categorys]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
 CONSTRAINT [PK_Categorys] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Makeup]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makeup](
	[MakeupId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[MakeupCategory] [varchar](50) NULL,
	[MakeupType] [varchar](50) NULL,
	[MakeupName] [varchar](50) NULL,
	[MakeupCode] [char](7) NULL,
	[MakeupPrice] [money] NULL,
	[MakeupDescription] [text] NULL,
 CONSTRAINT [PK_Makeup] PRIMARY KEY CLUSTERED 
(
	[MakeupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfume]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfume](
	[PerfumeId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[PerfumeCategory] [varchar](50) NULL,
	[PerfumeType] [varchar](50) NULL,
	[PerfumeName] [varchar](50) NULL,
	[PerfumeCode] [char](7) NULL,
	[PerfumePrice] [money] NULL,
	[PerfumeDescription] [text] NULL,
 CONSTRAINT [PK_Perfume] PRIMARY KEY CLUSTERED 
(
	[PerfumeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonelCare]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonelCare](
	[PersonelCareId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[PersonelCareCategory] [varchar](50) NULL,
	[PersonelCareType] [varchar](50) NULL,
	[PersonelCareName] [varchar](50) NULL,
	[PersonelCareCode] [char](7) NULL,
	[PersonelCarePrice] [money] NULL,
	[PersonelCareDescription] [text] NULL,
 CONSTRAINT [PK_PersonelCare] PRIMARY KEY CLUSTERED 
(
	[PersonelCareId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[StaffId] [int] IDENTITY(1,1) NOT NULL,
	[StaffNameSurname] [varchar](50) NULL,
	[StaffPassword] [varchar](50) NULL,
	[StaffMail] [varchar](50) NULL,
	[StaffPhone] [char](11) NULL,
 CONSTRAINT [PK_Staffs] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorys] ON 

INSERT [dbo].[Categorys] ([CategoryId], [CategoryName]) VALUES (1, N'Makeup')
INSERT [dbo].[Categorys] ([CategoryId], [CategoryName]) VALUES (2, N'Pefume')
INSERT [dbo].[Categorys] ([CategoryId], [CategoryName]) VALUES (3, N'PersonalCare')
SET IDENTITY_INSERT [dbo].[Categorys] OFF
GO
SET IDENTITY_INSERT [dbo].[Makeup] ON 

INSERT [dbo].[Makeup] ([MakeupId], [CategoryId], [MakeupCategory], [MakeupType], [MakeupName], [MakeupCode], [MakeupPrice], [MakeupDescription]) VALUES (1, 1, N'Eye', N'Eyeshadow', N'Eyeshadow 1', N'123456 ', 20.0000, N'Eyeshadow 1')
INSERT [dbo].[Makeup] ([MakeupId], [CategoryId], [MakeupCategory], [MakeupType], [MakeupName], [MakeupCode], [MakeupPrice], [MakeupDescription]) VALUES (2, 1, N'Eye', N'Eyeshadow', N'Eyeshadow 2', N'2234567', 30.0000, N'Eyeshadow 2')
INSERT [dbo].[Makeup] ([MakeupId], [CategoryId], [MakeupCategory], [MakeupType], [MakeupName], [MakeupCode], [MakeupPrice], [MakeupDescription]) VALUES (3, 1, N'Eye', N'Eyeshadow', N'Eyeshadow 2', N'1234567', 30.0000, N'Eyeshadow 2')
SET IDENTITY_INSERT [dbo].[Makeup] OFF
GO
SET IDENTITY_INSERT [dbo].[Perfume] ON 

INSERT [dbo].[Perfume] ([PerfumeId], [CategoryId], [PerfumeCategory], [PerfumeType], [PerfumeName], [PerfumeCode], [PerfumePrice], [PerfumeDescription]) VALUES (1, 2, N'Women''s Perfume', N'Perfume', N'Perfume for Women', N'123457 ', 200.0000, N'Perfume for Women')
INSERT [dbo].[Perfume] ([PerfumeId], [CategoryId], [PerfumeCategory], [PerfumeType], [PerfumeName], [PerfumeCode], [PerfumePrice], [PerfumeDescription]) VALUES (2, 2, N'Women''s Perfume', N'Perfume', N'2Perfume for Women', N'123456 ', 200.0000, N'Perfume for Women')
SET IDENTITY_INSERT [dbo].[Perfume] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonelCare] ON 

INSERT [dbo].[PersonelCare] ([PersonelCareId], [CategoryId], [PersonelCareCategory], [PersonelCareType], [PersonelCareName], [PersonelCareCode], [PersonelCarePrice], [PersonelCareDescription]) VALUES (1, 3, N'Hair Care', N'Shampoo', N'Black Shampoo', N'1234567', 100.0000, N'Black Shampoo is for a perfect hair. It''s a awesome product for wamen.')
INSERT [dbo].[PersonelCare] ([PersonelCareId], [CategoryId], [PersonelCareCategory], [PersonelCareType], [PersonelCareName], [PersonelCareCode], [PersonelCarePrice], [PersonelCareDescription]) VALUES (2, 3, N'Hair Care', N'Shampoo', N'Black Shampoo', N'1234567', 105.0000, N'Black Shampoo is for a perfect hair. It''s a awesome product for wamen.')
INSERT [dbo].[PersonelCare] ([PersonelCareId], [CategoryId], [PersonelCareCategory], [PersonelCareType], [PersonelCareName], [PersonelCareCode], [PersonelCarePrice], [PersonelCareDescription]) VALUES (3, 3, N'Hair Care', N'Shampoo', N'Black Shampoo', N'1234567', 102.0000, N'Black Shampoo is for a perfect hair. It''s a awesome product for wamen.')
INSERT [dbo].[PersonelCare] ([PersonelCareId], [CategoryId], [PersonelCareCategory], [PersonelCareType], [PersonelCareName], [PersonelCareCode], [PersonelCarePrice], [PersonelCareDescription]) VALUES (4, 3, N'Hair Care', N'Shampoo', N'Black Shampoo', N'1234567', 250.0000, N'Black Shampoo is for a perfect hair. It''s a awesome product for wamen.')
SET IDENTITY_INSERT [dbo].[PersonelCare] OFF
GO
SET IDENTITY_INSERT [dbo].[Staffs] ON 

INSERT [dbo].[Staffs] ([StaffId], [StaffNameSurname], [StaffPassword], [StaffMail], [StaffPhone]) VALUES (1, N'şerife', N'123', N'sdjkfsd', N'654        ')
INSERT [dbo].[Staffs] ([StaffId], [StaffNameSurname], [StaffPassword], [StaffMail], [StaffPhone]) VALUES (2, N'şerife', N'123', N'sdjkfsd', N'654        ')
INSERT [dbo].[Staffs] ([StaffId], [StaffNameSurname], [StaffPassword], [StaffMail], [StaffPhone]) VALUES (3, N'serife', N'1234', N'fds', N'21         ')
INSERT [dbo].[Staffs] ([StaffId], [StaffNameSurname], [StaffPassword], [StaffMail], [StaffPhone]) VALUES (4, N'serifee', N'12345', N'dfgd', N'21         ')
SET IDENTITY_INSERT [dbo].[Staffs] OFF
GO
ALTER TABLE [dbo].[Makeup]  WITH CHECK ADD  CONSTRAINT [FK_Makeup_Categorys] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categorys] ([CategoryId])
GO
ALTER TABLE [dbo].[Makeup] CHECK CONSTRAINT [FK_Makeup_Categorys]
GO
ALTER TABLE [dbo].[Perfume]  WITH CHECK ADD  CONSTRAINT [FK_Perfume_Categorys] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categorys] ([CategoryId])
GO
ALTER TABLE [dbo].[Perfume] CHECK CONSTRAINT [FK_Perfume_Categorys]
GO
ALTER TABLE [dbo].[PersonelCare]  WITH CHECK ADD  CONSTRAINT [FK_PersonelCare_Categorys] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categorys] ([CategoryId])
GO
ALTER TABLE [dbo].[PersonelCare] CHECK CONSTRAINT [FK_PersonelCare_Categorys]
GO
/****** Object:  StoredProcedure [dbo].[CAdd]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[CAdd]
@CategoryName varchar(50)
as begin 
insert into Categorys (CategoryName) Values (@CategoryName)
end
GO
/****** Object:  StoredProcedure [dbo].[CDelete]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CDelete]
@CategoryId int
as begin
delete from Categorys where CategoryId=@CategoryId
end
GO
/****** Object:  StoredProcedure [dbo].[CList]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CList]
as begin 
select * from Categorys
end
GO
/****** Object:  StoredProcedure [dbo].[CUpdate]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CUpdate]
@CategoryId int,
@CategoryName varchar(50)
as begin 
update Categorys set CategoryName=@CategoryName where CategoryId=@CategoryId 
end
GO
/****** Object:  StoredProcedure [dbo].[M100]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[M100]
as begin 
select * from Makeup where MakeupPrice<100
end
GO
/****** Object:  StoredProcedure [dbo].[MAdd]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[MAdd]
@CategoryId int,
@MakeupCategory varchar(50),
@MakeupType varchar(50),
@MakeupName varchar(50),
@MakeupCode char(7),
@MakeupPrice money,
@MakeupDescription text
as begin
insert into Makeup (CategoryId, MakeupCategory,MakeupType,MakeupName,MakeupCode,MakeupPrice,MakeupDescription) values 
(@CategoryId,@MakeupCategory,@MakeupType,@MakeupName,@MakeupCode,@MakeupPrice,@MakeupDescription)
end
GO
/****** Object:  StoredProcedure [dbo].[MandPCcode]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[MandPCcode]
as begin 
select * from Makeup m inner join PersonelCare pc on m.CategoryId=pc.CategoryId where MakeupCode<9999911 and PersonelCareCode<9999911
end
GO
/****** Object:  StoredProcedure [dbo].[MDelete]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MDelete]
@MakeupId int
as begin
delete from Makeup where MakeupId=@MakeupId
end
GO
/****** Object:  StoredProcedure [dbo].[MFace]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MFace]
as begin
select * from Makeup where MakeupCategory='Face'
end
GO
/****** Object:  StoredProcedure [dbo].[MList]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MList]
as begin 
select * from Makeup
end
GO
/****** Object:  StoredProcedure [dbo].[MUpdate]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MUpdate]
@MakeupId int,
@CategoryId int,
@MakeupCategory varchar(50),
@MakeupType varchar(50),
@MakeupName varchar(50),
@MakeupCode char(7),
@MakeupPrice money,
@MakeupDescription text
as begin
update Makeup set CategoryId=@CategoryId, MakeupCategory=@MakeupCategory, MakeupType=@MakeupType, MakeupName=@MakeupName,MakeupCode=@MakeupCode, MakeupPrice=@MakeupPrice, MakeupDescription=@MakeupDescription
where MakeupId=@MakeupId
end
GO
/****** Object:  StoredProcedure [dbo].[PAdd]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PAdd]
@CategoryId int,
@PerfumeCategory varchar(50),
@PerfumeType varchar(50),
@PerfumeName varchar(50),
@PerfumeCode char(7),
@PerfumePrice money,
@PerfumeDescription text
as begin
insert into Perfume(CategoryId, PerfumeCategory,PerfumeType,PerfumeName,PerfumeCode,PerfumePrice,PerfumeDescription) values
(@CategoryId,@PerfumeCategory,@PerfumeType,@PerfumeName,@PerfumeCode,@PerfumePrice,@PerfumeDescription)
end
GO
/****** Object:  StoredProcedure [dbo].[PandPC]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PandPC]
as begin 
select * from Perfume p Full join PersonelCare pc on p.CategoryId=pc.CategoryId where PerfumePrice<200 and PersonelCarePrice<200
end
GO
/****** Object:  StoredProcedure [dbo].[PCAdd]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PCAdd]
@CategoryId int,
@PersonelCareCategory varchar(50),
@PersonelCareType varchar(50),
@PersonelCareName varchar(50),
@PersonelCareCode char(7),
@PersonelCarePrice money,
@PersonelCareDescription text
as begin
insert into PersonelCare (CategoryId, PersonelCareCategory,PersonelCareType,PersonelCareName,PersonelCareCode,PersonelCarePrice,PersonelCareDescription) values
(@CategoryId,@PersonelCareCategory,@PersonelCareType,@PersonelCareName,@PersonelCareCode,@PersonelCarePrice,@PersonelCareDescription)
end
GO
/****** Object:  StoredProcedure [dbo].[PCDelete]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PCDelete]
@PersonelCareId int
as begin
delete from PersonelCare where PersonelCareId=@PersonelCareId
end
GO
/****** Object:  StoredProcedure [dbo].[PCList]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PCList]
as begin 
select * from PersonelCare
end
GO
/****** Object:  StoredProcedure [dbo].[PCUpdate]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PCUpdate]
@PersonelCareId int,
@CategoryId int,
@PersonelCareCategory varchar(50),
@PersonelCareType varchar(50),
@PersonelCareName varchar(50),
@PersonelCareCode char(7),
@PersonelCarePrice money,
@PersonelCareDescription text
as begin
update PersonelCare set CategoryId=@CategoryId, PersonelCareCategory=@PersonelCareCategory, PersonelCareType=@PersonelCareType, PersonelCareName=@PersonelCareName,PersonelCareCode=@PersonelCareCode, PersonelCarePrice=@PersonelCarePrice, PersonelCareDescription=@PersonelCareDescription
where PersonelCareId=@PersonelCareId
end
GO
/****** Object:  StoredProcedure [dbo].[PDelete]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PDelete]
@PerfumeId int
as begin
delete from Perfume where PerfumeId=@PerfumeId
end
GO
/****** Object:  StoredProcedure [dbo].[PList]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PList]
as begin 
select * from Perfume
end
GO
/****** Object:  StoredProcedure [dbo].[PUpdate]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PUpdate]
@PerfumeId int,
@CategoryId int,
@PerfumeCategory varchar(50),
@PerfumeType varchar(50),
@PerfumeName varchar(50),
@PerfumeCode char(7),
@PerfumePrice money,
@PerfumeDescription text
as begin
update Perfume set CategoryId=@CategoryId, PerfumeCategory=@PerfumeCategory, PerfumeType=@PerfumeType, PerfumeName=@PerfumeName,PerfumeCode=@PerfumeCode, PerfumePrice=@PerfumePrice, PerfumeDescription=@PerfumeDescription
where PerfumeId=@PerfumeId
end
GO
/****** Object:  StoredProcedure [dbo].[SAdd]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SAdd]
@StaffNameSurname varchar(50),
@StaffPassword varchar(50),
@StaffMail varchar(50),
@StaffPhone char(11)
as begin 
insert into Staffs (StaffNameSurname,StaffPassword,StaffMail,StaffPhone) values
(@StaffNameSurname,@StaffPassword,@StaffMail,@StaffPhone)
end
GO
/****** Object:  StoredProcedure [dbo].[SDelete]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SDelete]
@StaffId int
as begin
delete from Staffs where StaffId=@StaffId
end
GO
/****** Object:  StoredProcedure [dbo].[SList]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SList]
as begin 
select * from Staffs
end
GO
/****** Object:  StoredProcedure [dbo].[SUpdate]    Script Date: 19.11.2022 20:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SUpdate] 
@StaffId int,
@StaffNameSurname varchar(50),
@StaffPassword varchar(50),
@StaffMail varchar(50),
@StaffPhone char(11)
as begin
update Staffs set StaffNameSurname=@StaffNameSurname, StaffPassword=@StaffPassword, StaffMail=@StaffMail,StaffPhone=@StaffPhone
where StaffId=@StaffId
end
GO
USE [master]
GO
ALTER DATABASE [FarmasiProducts] SET  READ_WRITE 
GO
