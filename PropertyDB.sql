USE [master]
GO
/****** Object:  Database [ProperyProjectDB]    Script Date: 2021-12-10 2:58:59 PM ******/
CREATE DATABASE [ProperyProjectDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProperyProjectDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER2017\MSSQL\DATA\ProperyProjectDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProperyProjectDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER2017\MSSQL\DATA\ProperyProjectDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProperyProjectDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProperyProjectDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProperyProjectDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProperyProjectDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProperyProjectDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProperyProjectDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProperyProjectDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProperyProjectDB] SET  MULTI_USER 
GO
ALTER DATABASE [ProperyProjectDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProperyProjectDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProperyProjectDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProperyProjectDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProperyProjectDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProperyProjectDB] SET QUERY_STORE = OFF
GO
USE [ProperyProjectDB]
GO
/****** Object:  Table [dbo].[Apartments]    Script Date: 2021-12-10 2:58:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartments](
	[ApartmentId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingId] [int] NOT NULL,
	[UserId] [int] NULL,
	[Availability] [nchar](20) NOT NULL,
	[RentalDate] [datetime] NULL,
	[LeaseLength] [int] NULL,
 CONSTRAINT [PK_Apartments2] PRIMARY KEY CLUSTERED 
(
	[ApartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 2021-12-10 2:58:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buildings](
	[BuildingId] [int] IDENTITY(1,1) NOT NULL,
	[Price] [int] NOT NULL,
	[NumOfRooms] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Province] [nvarchar](50) NOT NULL,
	[PostalCode] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Buildings2] PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact Reports]    Script Date: 2021-12-10 2:58:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact Reports](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[ToUserId] [int] NOT NULL,
	[FromUserId] [int] NOT NULL,
	[Message] [nvarchar](150) NULL,
	[ReportType] [nchar](50) NOT NULL,
	[AppointmentDate] [datetime] NULL,
 CONSTRAINT [PK_Contact Reports2] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2021-12-10 2:58:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nchar](20) NOT NULL,
	[Password] [nchar](20) NOT NULL,
	[Firstname] [nchar](20) NOT NULL,
	[Lastname] [nchar](20) NOT NULL,
	[UserType] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Users2] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Apartments] ON 

INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [UserId], [Availability], [RentalDate], [LeaseLength]) VALUES (1, 1, 1, N'Taken               ', CAST(N'2020-04-20T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [UserId], [Availability], [RentalDate], [LeaseLength]) VALUES (2, 1, 2, N'Taken               ', CAST(N'2020-04-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [UserId], [Availability], [RentalDate], [LeaseLength]) VALUES (4, 0, 18, N'Taken               ', CAST(N'2020-01-10T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [UserId], [Availability], [RentalDate], [LeaseLength]) VALUES (5, 1, 14, N'Taken               ', CAST(N'2020-01-10T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [UserId], [Availability], [RentalDate], [LeaseLength]) VALUES (6, 10, 18, N'Taken               ', CAST(N'2021-10-12T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [UserId], [Availability], [RentalDate], [LeaseLength]) VALUES (7, 8, 18, N'Taken               ', CAST(N'2021-10-12T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [UserId], [Availability], [RentalDate], [LeaseLength]) VALUES (8, 3, NULL, N'Available           ', NULL, NULL)
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [UserId], [Availability], [RentalDate], [LeaseLength]) VALUES (9, 2, NULL, N'Available           ', NULL, NULL)
INSERT [dbo].[Apartments] ([ApartmentId], [BuildingId], [UserId], [Availability], [RentalDate], [LeaseLength]) VALUES (10, 8, NULL, N'Available           ', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Apartments] OFF
GO
SET IDENTITY_INSERT [dbo].[Buildings] ON 

INSERT [dbo].[Buildings] ([BuildingId], [Price], [NumOfRooms], [Address], [City], [Province], [PostalCode], [Country]) VALUES (1, 100000, 5, N'Rue Sherbrooke', N'Montreal', N'Quebec', N'A3V2DC', N'Canada')
INSERT [dbo].[Buildings] ([BuildingId], [Price], [NumOfRooms], [Address], [City], [Province], [PostalCode], [Country]) VALUES (2, 50000, 8, N'300 Cote-Sainte-Luc', N'Montreal', N'Quebec', N'123ABC', N'Canada')
INSERT [dbo].[Buildings] ([BuildingId], [Price], [NumOfRooms], [Address], [City], [Province], [PostalCode], [Country]) VALUES (3, 20000, 4, N'901 Saint Catherine', N'Montreal', N'Quebec', N'A4GS8K', N'Canada')
INSERT [dbo].[Buildings] ([BuildingId], [Price], [NumOfRooms], [Address], [City], [Province], [PostalCode], [Country]) VALUES (4, 30000, 3, N'29 Saint Jean Baptise', N'Chateauguay', N'Quebec', N'D8LD6J', N'Canada')
INSERT [dbo].[Buildings] ([BuildingId], [Price], [NumOfRooms], [Address], [City], [Province], [PostalCode], [Country]) VALUES (5, 20000, 2, N'26 Saint Croix', N'Saint-Laurent', N'Quebec', N'AS9 D7S', N'Canada')
SET IDENTITY_INSERT [dbo].[Buildings] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact Reports] ON 

INSERT [dbo].[Contact Reports] ([MessageId], [ToUserId], [FromUserId], [Message], [ReportType], [AppointmentDate]) VALUES (1, 1, 1, N'Hello', N'Message                                           ', CAST(N'2021-03-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Contact Reports] ([MessageId], [ToUserId], [FromUserId], [Message], [ReportType], [AppointmentDate]) VALUES (2, 0, 0, N'lol', N'appointment                                       ', CAST(N'2021-02-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Contact Reports] ([MessageId], [ToUserId], [FromUserId], [Message], [ReportType], [AppointmentDate]) VALUES (3, 12, 1, N'Hey Alex', N'Chill                                             ', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Contact Reports] ([MessageId], [ToUserId], [FromUserId], [Message], [ReportType], [AppointmentDate]) VALUES (4, 0, 0, N'hey', N'appointment                                       ', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Contact Reports] ([MessageId], [ToUserId], [FromUserId], [Message], [ReportType], [AppointmentDate]) VALUES (5, 0, 0, N'Test', N'appointment                                       ', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Contact Reports] ([MessageId], [ToUserId], [FromUserId], [Message], [ReportType], [AppointmentDate]) VALUES (6, 9, 0, N'Tester', N'appointment                                       ', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Contact Reports] ([MessageId], [ToUserId], [FromUserId], [Message], [ReportType], [AppointmentDate]) VALUES (7, 0, 12, N'return', N'appointment                                       ', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Contact Reports] ([MessageId], [ToUserId], [FromUserId], [Message], [ReportType], [AppointmentDate]) VALUES (8, 1, 12, N'Return Message', N'Message                                           ', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Contact Reports] ([MessageId], [ToUserId], [FromUserId], [Message], [ReportType], [AppointmentDate]) VALUES (9, 12, 0, N'Hey', N'appointment                                       ', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Contact Reports] ([MessageId], [ToUserId], [FromUserId], [Message], [ReportType], [AppointmentDate]) VALUES (10, 12, 12, N'Test Return', N'appointment                                       ', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Contact Reports] ([MessageId], [ToUserId], [FromUserId], [Message], [ReportType], [AppointmentDate]) VALUES (11, 1, 12, N'Hello Shaun', N'message                                           ', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Contact Reports] ([MessageId], [ToUserId], [FromUserId], [Message], [ReportType], [AppointmentDate]) VALUES (12, 14, 15, N'Account is in trouble', N'message                                           ', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Contact Reports] ([MessageId], [ToUserId], [FromUserId], [Message], [ReportType], [AppointmentDate]) VALUES (13, 15, 18, N'i need help', N'appointment                                       ', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Contact Reports] ([MessageId], [ToUserId], [FromUserId], [Message], [ReportType], [AppointmentDate]) VALUES (14, 18, 15, N'no problem', N'appointment                                       ', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Contact Reports] ([MessageId], [ToUserId], [FromUserId], [Message], [ReportType], [AppointmentDate]) VALUES (15, 18, 15, N'Hello Raza', N'message                                           ', CAST(N'2021-10-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Contact Reports] ([MessageId], [ToUserId], [FromUserId], [Message], [ReportType], [AppointmentDate]) VALUES (16, 15, 18, N'Thank', N'appointment                                       ', CAST(N'2020-01-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Contact Reports] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Username], [Password], [Firstname], [Lastname], [UserType]) VALUES (15, N'admin               ', N'admin               ', N'Admin               ', N'Admin               ', N'Property Owner      ')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Firstname], [Lastname], [UserType]) VALUES (17, N'alex                ', N'alex                ', N'alex                ', N'alex                ', N'Property Manager    ')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Firstname], [Lastname], [UserType]) VALUES (18, N'raza                ', N'raza                ', N'raza                ', N'raza                ', N'Tenant              ')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Firstname], [Lastname], [UserType]) VALUES (14, N'shaunsobz           ', N'shaun               ', N'shaun               ', N'shaun               ', N'Tenant              ')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Firstname], [Lastname], [UserType]) VALUES (16, N'test                ', N'test                ', N'test                ', N'test                ', N'Property Manager    ')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [ProperyProjectDB] SET  READ_WRITE 
GO
