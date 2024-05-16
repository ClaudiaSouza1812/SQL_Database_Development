USE [master]
GO
/****** Object:  Database [Vacations_ClaudiaSouza]    Script Date: 08/04/2024 17:44:19 ******/
CREATE DATABASE [Vacations_ClaudiaSouza]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vacations_ClaudiaSouza', FILENAME = N'C:\Restart11\Data\Vacations_ClaudiaSouza.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vacations_ClaudiaSouza_log', FILENAME = N'C:\Restart11\Data\Vacations_ClaudiaSouza_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vacations_ClaudiaSouza].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET RECOVERY FULL 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET  MULTI_USER 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Vacations_ClaudiaSouza', N'ON'
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET QUERY_STORE = OFF
GO
USE [Vacations_ClaudiaSouza]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 08/04/2024 17:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 08/04/2024 17:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[SecondName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Title] [nvarchar](30) NULL,
	[Superior] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 08/04/2024 17:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[RequestDate] [date] NOT NULL,
	[ApprovalDate] [date] NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vacation]    Script Date: 08/04/2024 17:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacation](
	[VacationID] [int] IDENTITY(1,1) NOT NULL,
	[RequestID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[TotalDays] [char](2) NULL,
	[Approved] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_Vacation] PRIMARY KEY CLUSTERED 
(
	[VacationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestDetail]    Script Date: 08/04/2024 17:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestDetail](
	[RequestID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[VacationID] [int] NOT NULL,
 CONSTRAINT [PK_RequestDetail] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC,
	[EmployeeID] ASC,
	[VacationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([DepartmentID], [Name]) VALUES (1, N'Tecnologias de Informação')
GO
INSERT [dbo].[Department] ([DepartmentID], [Name]) VALUES (2, N'Recursos Humanos')
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([EmployeeID], [DepartmentID], [Code], [FirstName], [SecondName], [LastName], [Title], [Superior]) VALUES (1, 1, N'PT-PRT-TI-000120', N'Maria', N'Antónia', N'de Castro Sá', NULL, 2)
GO
INSERT [dbo].[Employee] ([EmployeeID], [DepartmentID], [Code], [FirstName], [SecondName], [LastName], [Title], [Superior]) VALUES (2, 2, N'PT-PRT-HR-000012', N'Carolina', N'Franco', N'de Lima', N'Manager', NULL)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 
GO
INSERT [dbo].[Request] ([RequestID], [EmployeeID], [RequestDate], [ApprovalDate]) VALUES (1, 1, CAST(N'2019-02-25' AS Date), CAST(N'2019-03-04' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[Vacation] ON 
GO
INSERT [dbo].[Vacation] ([VacationID], [RequestID], [StartDate], [EndDate], [TotalDays], [Approved]) VALUES (1, 1, CAST(N'2019-03-04' AS Date), CAST(N'2019-03-08' AS Date), N'5 ', N'Yes')
GO
INSERT [dbo].[Vacation] ([VacationID], [RequestID], [StartDate], [EndDate], [TotalDays], [Approved]) VALUES (2, 1, CAST(N'2019-07-29' AS Date), CAST(N'2019-08-16' AS Date), N'15', N'Yes')
GO
INSERT [dbo].[Vacation] ([VacationID], [RequestID], [StartDate], [EndDate], [TotalDays], [Approved]) VALUES (3, 1, CAST(N'2019-12-23' AS Date), CAST(N'2020-01-03' AS Date), N'8 ', N'No')
GO
SET IDENTITY_INSERT [dbo].[Vacation] OFF
GO
INSERT [dbo].[RequestDetail] ([RequestID], [EmployeeID], [VacationID]) VALUES (1, 1, 1)
GO
INSERT [dbo].[RequestDetail] ([RequestID], [EmployeeID], [VacationID]) VALUES (1, 1, 2)
GO
INSERT [dbo].[RequestDetail] ([RequestID], [EmployeeID], [VacationID]) VALUES (1, 1, 3)
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([Superior])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Employee]
GO
ALTER TABLE [dbo].[Vacation]  WITH CHECK ADD  CONSTRAINT [FK_Vacation_Request] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Request] ([RequestID])
GO
ALTER TABLE [dbo].[Vacation] CHECK CONSTRAINT [FK_Vacation_Request]
GO
ALTER TABLE [dbo].[RequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_RequestDetail_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[RequestDetail] CHECK CONSTRAINT [FK_RequestDetail_Employee]
GO
ALTER TABLE [dbo].[RequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_RequestDetail_Request] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Request] ([RequestID])
GO
ALTER TABLE [dbo].[RequestDetail] CHECK CONSTRAINT [FK_RequestDetail_Request]
GO
ALTER TABLE [dbo].[RequestDetail]  WITH CHECK ADD  CONSTRAINT [FK_RequestDetail_Vacation] FOREIGN KEY([VacationID])
REFERENCES [dbo].[Vacation] ([VacationID])
GO
ALTER TABLE [dbo].[RequestDetail] CHECK CONSTRAINT [FK_RequestDetail_Vacation]
GO
USE [master]
GO
ALTER DATABASE [Vacations_ClaudiaSouza] SET  READ_WRITE 
GO
