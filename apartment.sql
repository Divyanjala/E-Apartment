USE [master]
GO
/****** Object:  Database [EApartment]    Script Date: 1/18/2023 9:41:54 PM ******/
CREATE DATABASE [EApartment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EApartment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EApartment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EApartment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EApartment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EApartment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EApartment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EApartment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EApartment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EApartment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EApartment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EApartment] SET ARITHABORT OFF 
GO
ALTER DATABASE [EApartment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EApartment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EApartment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EApartment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EApartment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EApartment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EApartment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EApartment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EApartment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EApartment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EApartment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EApartment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EApartment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EApartment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EApartment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EApartment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EApartment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EApartment] SET RECOVERY FULL 
GO
ALTER DATABASE [EApartment] SET  MULTI_USER 
GO
ALTER DATABASE [EApartment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EApartment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EApartment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EApartment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EApartment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EApartment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EApartment', N'ON'
GO
ALTER DATABASE [EApartment] SET QUERY_STORE = OFF
GO
USE [EApartment]
GO
/****** Object:  Table [dbo].[Apartment_types]    Script Date: 1/18/2023 9:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment_types](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[type_code] [varchar](50) NULL,
	[description] [text] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Apartment_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartments]    Script Date: 1/18/2023 9:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartments](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[building_id] [bigint] NULL,
	[apartment_type_id] [bigint] NULL,
	[status] [int] NULL,
	[description] [text] NULL,
	[amount] [float] NULL,
	[apartment_code] [varchar](50) NULL,
 CONSTRAINT [PK_Apartments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 1/18/2023 9:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_id] [bigint] NULL,
	[date] [date] NULL,
	[status] [int] NULL,
	[apartment_type_id] [bigint] NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 1/18/2023 9:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buildings](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[building_code] [varchar](50) NULL,
	[location] [varchar](50) NULL,
	[description] [text] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 1/18/2023 9:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[telephone1] [int] NULL,
	[telephone2] [int] NULL,
	[nic] [varchar](50) NULL,
	[customer_code] [varchar](50) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lease_shedules]    Script Date: 1/18/2023 9:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lease_shedules](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[reservation_id] [bigint] NULL,
	[started_date] [date] NULL,
	[end_date] [date] NULL,
	[amount] [float] NULL,
	[payment_status] [int] NULL,
	[type] [varchar](50) NULL,
 CONSTRAINT [PK_Lease_shedules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parking_spaces]    Script Date: 1/18/2023 9:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parking_spaces](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[parking_space_number] [varchar](50) NULL,
	[status] [int] NULL,
	[description] [text] NULL,
	[fee] [float] NULL,
	[type] [int] NULL,
	[building_id] [bigint] NULL,
 CONSTRAINT [PK_Parcking_spaces] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 1/18/2023 9:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [varchar](50) NULL,
	[amount] [date] NULL,
	[status] [int] NULL,
	[reshedule_id] [bigint] NULL,
	[lease_shedule_id] [bigint] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reschedule_details]    Script Date: 1/18/2023 9:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reschedule_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[reservation_id] [bigint] NULL,
	[reschedule_date] [date] NULL,
	[lease_started_date] [date] NULL,
	[lease_end_date] [date] NULL,
	[created_at] [date] NULL,
	[created_by] [bigint] NULL,
	[updated_at] [date] NULL,
	[updated_by] [bigint] NULL,
	[reschedule_code] [varchar](50) NULL,
	[approved_by] [bigint] NULL,
	[approved_at] [date] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Reschedule_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 1/18/2023 9:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_id] [bigint] NULL,
	[reservation_code] [varchar](50) NULL,
	[apartment_id] [bigint] NULL,
	[advance_amount] [float] NULL,
	[deposit_amount] [float] NULL,
	[refund_date] [varbinary](50) NULL,
	[refund_status] [int] NULL,
	[servant_id] [bigint] NULL,
	[status] [int] NULL,
	[created_at] [varchar](50) NULL,
	[created_by] [bigint] NULL,
	[updated_at] [varchar](50) NULL,
	[updated_by] [bigint] NULL,
	[addtional_parking_id] [bigint] NULL,
	[approved_by] [bigint] NULL,
	[approved_at] [varchar](50) NULL,
	[agreement_code] [varchar](50) NULL,
	[agreement_start_date] [varchar](50) NULL,
	[agreement_end_date] [varchar](50) NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servants]    Script Date: 1/18/2023 9:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servants](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[telephone1] [int] NULL,
	[telephone2] [int] NULL,
	[nic] [varchar](50) NULL,
	[servant_code] [varchar](50) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Servants] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/18/2023 9:41:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[user_role] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD  CONSTRAINT [FK_Apartments_Apartment_types] FOREIGN KEY([apartment_type_id])
REFERENCES [dbo].[Apartment_types] ([id])
GO
ALTER TABLE [dbo].[Apartments] CHECK CONSTRAINT [FK_Apartments_Apartment_types]
GO
ALTER TABLE [dbo].[Apartments]  WITH CHECK ADD  CONSTRAINT [FK_Apartments_Buildings] FOREIGN KEY([building_id])
REFERENCES [dbo].[Buildings] ([id])
GO
ALTER TABLE [dbo].[Apartments] CHECK CONSTRAINT [FK_Apartments_Buildings]
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_Apartment_types] FOREIGN KEY([apartment_type_id])
REFERENCES [dbo].[Apartment_types] ([id])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_Apartment_types]
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_Customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_Customers]
GO
ALTER TABLE [dbo].[Lease_shedules]  WITH CHECK ADD  CONSTRAINT [FK_Lease_shedules_Reservations] FOREIGN KEY([reservation_id])
REFERENCES [dbo].[Reservations] ([id])
GO
ALTER TABLE [dbo].[Lease_shedules] CHECK CONSTRAINT [FK_Lease_shedules_Reservations]
GO
ALTER TABLE [dbo].[Parking_spaces]  WITH CHECK ADD  CONSTRAINT [FK_Parcking_spaces_Buildings] FOREIGN KEY([building_id])
REFERENCES [dbo].[Buildings] ([id])
GO
ALTER TABLE [dbo].[Parking_spaces] CHECK CONSTRAINT [FK_Parcking_spaces_Buildings]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Lease_shedules] FOREIGN KEY([lease_shedule_id])
REFERENCES [dbo].[Lease_shedules] ([id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Lease_shedules]
GO
ALTER TABLE [dbo].[Reschedule_details]  WITH CHECK ADD  CONSTRAINT [FK_Reschedule_details_Reservations] FOREIGN KEY([reservation_id])
REFERENCES [dbo].[Reservations] ([id])
GO
ALTER TABLE [dbo].[Reschedule_details] CHECK CONSTRAINT [FK_Reschedule_details_Reservations]
GO
ALTER TABLE [dbo].[Reschedule_details]  WITH CHECK ADD  CONSTRAINT [FK_Reschedule_details_Users] FOREIGN KEY([updated_by])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Reschedule_details] CHECK CONSTRAINT [FK_Reschedule_details_Users]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Apartments1] FOREIGN KEY([apartment_id])
REFERENCES [dbo].[Apartments] ([id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Apartments1]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Parcking_spaces] FOREIGN KEY([addtional_parking_id])
REFERENCES [dbo].[Parking_spaces] ([id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Parcking_spaces]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Servants1] FOREIGN KEY([servant_id])
REFERENCES [dbo].[Servants] ([id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Servants1]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Users] FOREIGN KEY([updated_by])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Users]
GO
USE [master]
GO
ALTER DATABASE [EApartment] SET  READ_WRITE 
GO
