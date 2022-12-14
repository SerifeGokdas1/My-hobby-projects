USE [master]
GO
/****** Object:  Database [Transport]    Script Date: 6.12.2022 19:24:39 ******/
CREATE DATABASE [Transport]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Transport', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Transport.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Transport_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Transport_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Transport] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Transport].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Transport] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Transport] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Transport] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Transport] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Transport] SET ARITHABORT OFF 
GO
ALTER DATABASE [Transport] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Transport] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Transport] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Transport] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Transport] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Transport] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Transport] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Transport] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Transport] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Transport] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Transport] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Transport] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Transport] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Transport] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Transport] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Transport] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Transport] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Transport] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Transport] SET  MULTI_USER 
GO
ALTER DATABASE [Transport] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Transport] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Transport] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Transport] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Transport] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Transport] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Transport] SET QUERY_STORE = OFF
GO
USE [Transport]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerNameSurname] [varchar](50) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Mail] [varchar](50) NOT NULL,
	[PaymentMethod] [varchar](50) NOT NULL,
	[ShipmentId] [int] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](50) NULL,
	[EmployeeSurname] [varchar](50) NULL,
	[EmployeePassword] [varchar](50) NULL,
	[EmployeeMail] [varchar](50) NULL,
	[EmployeePhone] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipments]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipments](
	[ShipmentId] [int] IDENTITY(1,1) NOT NULL,
	[ShipmentName] [varchar](50) NULL,
	[ShippingConsigneeAddress] [varchar](50) NULL,
	[ShippingSenderAddress] [varchar](50) NULL,
	[Distance] [int] NULL,
	[DistanceAmount] [int] NULL,
	[EmployeeId] [int] NULL,
	[VehicleId] [int] NULL,
 CONSTRAINT [PK_Shipments] PRIMARY KEY CLUSTERED 
(
	[ShipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [nvarchar](128) NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
 CONSTRAINT [PK_sysdiagrams] PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicles]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicles](
	[VehicleId] [int] IDENTITY(1,1) NOT NULL,
	[VehicleType] [varchar](50) NULL,
	[VehicleCapacity] [int] NULL,
	[VehicleDriver] [varchar](50) NULL,
 CONSTRAINT [PK_Vehicles] PRIMARY KEY CLUSTERED 
(
	[VehicleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EmployeeSurname], [EmployeePassword], [EmployeeMail], [EmployeePhone]) VALUES (1, N'serife', N'hfgt', N'123', N'ht', 54)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
/****** Object:  Index [IX_FK_Customers_Shipment]    Script Date: 6.12.2022 19:24:39 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Customers_Shipment] ON [dbo].[Customers]
(
	[ShipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Shipment_Employees]    Script Date: 6.12.2022 19:24:39 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Shipment_Employees] ON [dbo].[Shipments]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Shipment_Vehicles]    Script Date: 6.12.2022 19:24:39 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Shipment_Vehicles] ON [dbo].[Shipments]
(
	[VehicleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Shipment] FOREIGN KEY([ShipmentId])
REFERENCES [dbo].[Shipments] ([ShipmentId])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Shipment]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_Shipment_Employees]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Vehicles] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicles] ([VehicleId])
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_Shipment_Vehicles]
GO
/****** Object:  StoredProcedure [dbo].[CAdd]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CAdd]
@CustomerNameSurname varchar(50),
@Address text,
@Phone varchar(50),
@Mail  varchar(50),
@PaymentMethod varchar(50),
@ShipmentId int
as begin 
insert into Customers(CustomerNameSurname, Address, Phone, Mail, PaymentMethod, ShipmentId) Values 
(@CustomerNameSurname, @Address, @Phone, @Mail, @PaymentMethod, @ShipmentId)
end
GO
/****** Object:  StoredProcedure [dbo].[CDelete]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CDelete]
@CustomerId int
as begin 
delete from Customers 
where CustomerId=@CustomerId
end
GO
/****** Object:  StoredProcedure [dbo].[CList]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[CList]
as begin 
select * from Customers
end
GO
/****** Object:  StoredProcedure [dbo].[CUpdate]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CUpdate]
@CustomerId int,
@CustomerNameSurname varchar(50),
@Address text,
@Phone varchar(50),
@Mail  varchar(50),
@PaymentMethod varchar(50),
@ShipmentId int
as begin 
update Customers set CustomerNameSurname=@CustomerNameSurname, Address=@Address, Phone=@Phone, Mail=@Mail, PaymentMethod=@PaymentMethod, ShipmentId=@ShipmentId
where CustomerId=@CustomerId
end
GO
/****** Object:  StoredProcedure [dbo].[EAdd]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EAdd]
@EmployeeName varchar (50),
@EmployeeSurname varchar (50),
@EmployeePassword varchar (50),
@EmployeeMail varchar(50),
@EmployeePhone int
as begin 
insert into Employees(EmployeeName, EmployeeSurname, EmployeePassword, EmployeeMail, EmployeePhone) Values 
(@EmployeeName, @EmployeeSurname, @EmployeePassword, @EmployeeMail, @EmployeePhone)
end
GO
/****** Object:  StoredProcedure [dbo].[EDelete]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EDelete]
@EmployeeId int
as begin 
delete from Employees 
where EmployeeId=@EmployeeId
end
GO
/****** Object:  StoredProcedure [dbo].[EList]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[EList]
as begin 
select * from Employees
end
GO
/****** Object:  StoredProcedure [dbo].[EUpdate]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EUpdate]
@EmployeeId int,
@EmployeeName varchar (50),
@EmployeeSurname varchar (50),
@EmployeePassword varchar (50),
@EmployeeMail varchar(50),
@EmployeePhone int
as begin 
update Employees set EmployeeName=@EmployeeName, EmployeeSurname=@EmployeeSurname, EmployeePassword=@EmployeePassword, EmployeeMail=@EmployeeMail, EmployeePhone=@EmployeePhone
where EmployeeId=@EmployeeId
end
GO
/****** Object:  StoredProcedure [dbo].[SAdd]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SAdd]
@ShipmentName varchar(50),
@ShippingConsigneeAddress varchar(50),
@ShippingSenderAddress varchar(50),
@Distance int,
@DistanceAmount int,
@EmployeeId int,
@VehicleId int
as begin 
insert into Shipment(ShipmentName, ShippingConsigneeAddress, ShippingSenderAddress, Distance, DistanceAmount,EmployeeId,VehicleId) Values 
(@ShipmentName, @ShippingConsigneeAddress, @ShippingSenderAddress, @Distance, @DistanceAmount,@EmployeeId,@VehicleId)
end
GO
/****** Object:  StoredProcedure [dbo].[SDelete]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SDelete]
@ShipmentId int
as begin 
delete from Shipment 
where ShipmentId=@ShipmentId
end
GO
/****** Object:  StoredProcedure [dbo].[SList]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SList]
as begin 
select * from Shipment
end
GO
/****** Object:  StoredProcedure [dbo].[SUpdate]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SUpdate]
@ShipmentId int,
@ShipmentName varchar(50),
@ShippingConsigneeAddress varchar(50),
@ShippingSenderAddress varchar(50),
@Distance int,
@DistanceAmount int,
@EmployeeId int,
@VehicleId int
as begin 
update Shipment set ShipmentName=@ShipmentName, ShippingConsigneeAddress=@ShippingConsigneeAddress, ShippingSenderAddress=@ShippingSenderAddress, Distance=@Distance, DistanceAmount=@DistanceAmount, EmployeeId=@EmployeeId, VehicleId=@VehicleId
where ShipmentId=@ShipmentId
end
GO
/****** Object:  StoredProcedure [dbo].[VAdd]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[VAdd]
@VehicleType varchar(50),
@VehicleCapacity int,
@VehicleDriver varchar(50)
as begin 
insert into Vehicles(VehicleType, VehicleCapacity, VehicleDriver) Values 
(@VehicleType, @VehicleCapacity, @VehicleDriver)
end
GO
/****** Object:  StoredProcedure [dbo].[VDelete]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[VDelete]
@VehicleId int
as begin 
delete from Vehicles 
where VehicleId=@VehicleId
end
GO
/****** Object:  StoredProcedure [dbo].[VList]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[VList]
as begin 
select * from Vehicles
end
GO
/****** Object:  StoredProcedure [dbo].[VUpdate]    Script Date: 6.12.2022 19:24:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[VUpdate]
@VehicleId int,
@VehicleType varchar(50),
@VehicleCapacity int,
@VehicleDriver varchar(50)
as begin 
update Vehicles set VehicleType=@VehicleType, VehicleCapacity=@VehicleCapacity, VehicleDriver=@VehicleDriver
where VehicleId=@VehicleId
end
GO
USE [master]
GO
ALTER DATABASE [Transport] SET  READ_WRITE 
GO
