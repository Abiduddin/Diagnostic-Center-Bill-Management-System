USE [master]
GO
/****** Object:  Database [DiagnosticDB]    Script Date: 10/21/2018 1:57:25 AM ******/
CREATE DATABASE [DiagnosticDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DiagnosticDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DiagnosticDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DiagnosticDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DiagnosticDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DiagnosticDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DiagnosticDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DiagnosticDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DiagnosticDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DiagnosticDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DiagnosticDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DiagnosticDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DiagnosticDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DiagnosticDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DiagnosticDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DiagnosticDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DiagnosticDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DiagnosticDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DiagnosticDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DiagnosticDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DiagnosticDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DiagnosticDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DiagnosticDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DiagnosticDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DiagnosticDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DiagnosticDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DiagnosticDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DiagnosticDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DiagnosticDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DiagnosticDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DiagnosticDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DiagnosticDB] SET  MULTI_USER 
GO
ALTER DATABASE [DiagnosticDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DiagnosticDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DiagnosticDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DiagnosticDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DiagnosticDB]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 10/21/2018 1:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[BirthDate] [varchar](50) NOT NULL,
	[MobileNo] [varchar](11) NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 10/21/2018 1:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment](
	[BillNo] [int] NOT NULL,
	[TotalFee] [int] NOT NULL,
	[DueDate] [varchar](50) NOT NULL,
	[IsPaid] [bit] NOT NULL,
 CONSTRAINT [PK_Payment_1] PRIMARY KEY CLUSTERED 
(
	[BillNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Test]    Script Date: 10/21/2018 1:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Test](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Fee] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestRequest]    Script Date: 10/21/2018 1:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[BillNo] [int] NOT NULL,
 CONSTRAINT [PK_TestRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestType]    Script Date: 10/21/2018 1:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TestType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[PatientPayment]    Script Date: 10/21/2018 1:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PatientPayment] as
select p.BillNo,p.TotalFee, p.DueDate,p.IsPaid,Patient.MobileNo from Payment as p LEFT JOIN 
TestRequest as t on p.BillNo = t.BillNo
LEFT JOIN Patient on t.PatientId = Patient.Id
GO
/****** Object:  View [dbo].[TestTypeRequestView]    Script Date: 10/21/2018 1:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TestTypeRequestView] AS
select tr.TestId,t.TypeId,t.Fee,p.DueDate from TestRequest as tr left join test as t on tr.TestId = t.Id
left join Payment as p on tr.BillNo = p.BillNo
GO
/****** Object:  View [dbo].[UnpaidBillView]    Script Date: 10/21/2018 1:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[UnpaidBillView] as
Select DISTINCT py.BillNo,p.MobileNo,p.Name,py.TotalFee,py.DueDate from Payment as py left join TestRequest as tr on py.BillNo=tr.BillNo
left join Patient as p on tr.PatientId=p.Id where py.IsPaid = 0
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([Id], [Name], [BirthDate], [MobileNo]) VALUES (12, N'Sana Un', N'2009-01-01', N'01834343335')
INSERT [dbo].[Patient] ([Id], [Name], [BirthDate], [MobileNo]) VALUES (13, N'kalam kha', N'2009-10-01', N'01834343334')
INSERT [dbo].[Patient] ([Id], [Name], [BirthDate], [MobileNo]) VALUES (14, N'jamal khan', N'2007-01-10', N'01834343333')
INSERT [dbo].[Patient] ([Id], [Name], [BirthDate], [MobileNo]) VALUES (15, N'jamil khna', N'2000-03-22', N'01832322221')
INSERT [dbo].[Patient] ([Id], [Name], [BirthDate], [MobileNo]) VALUES (16, N'Kabir khan', N'1994-07-12', N'01834343444')
INSERT [dbo].[Patient] ([Id], [Name], [BirthDate], [MobileNo]) VALUES (17, N'hamid uddin', N'1999-10-26', N'01832322521')
INSERT [dbo].[Patient] ([Id], [Name], [BirthDate], [MobileNo]) VALUES (18, N'Mutahar islam', N'1999-06-15', N'01832442221')
SET IDENTITY_INSERT [dbo].[Patient] OFF
INSERT [dbo].[Payment] ([BillNo], [TotalFee], [DueDate], [IsPaid]) VALUES (1340837, 1350, N'2018-10-19', 1)
INSERT [dbo].[Payment] ([BillNo], [TotalFee], [DueDate], [IsPaid]) VALUES (1753847, 350, N'2018-01-01', 0)
INSERT [dbo].[Payment] ([BillNo], [TotalFee], [DueDate], [IsPaid]) VALUES (2693027, 1200, N'2018-01-01', 1)
INSERT [dbo].[Payment] ([BillNo], [TotalFee], [DueDate], [IsPaid]) VALUES (4440088, 500, N'2018-01-01', 0)
INSERT [dbo].[Payment] ([BillNo], [TotalFee], [DueDate], [IsPaid]) VALUES (7552804, 350, N'2018-10-19', 0)
INSERT [dbo].[Payment] ([BillNo], [TotalFee], [DueDate], [IsPaid]) VALUES (8274175, 350, N'2018-01-01', 0)
INSERT [dbo].[Payment] ([BillNo], [TotalFee], [DueDate], [IsPaid]) VALUES (8385173, 1150, N'2018-10-19', 0)
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([Id], [Name], [Fee], [TypeId]) VALUES (1, N'RBS', 150, 1)
INSERT [dbo].[Test] ([Id], [Name], [Fee], [TypeId]) VALUES (2, N'ECG', 150, 5)
INSERT [dbo].[Test] ([Id], [Name], [Fee], [TypeId]) VALUES (3, N'Hard X-Ray', 200, 6)
INSERT [dbo].[Test] ([Id], [Name], [Fee], [TypeId]) VALUES (1002, N'Echo', 1000, 11)
SET IDENTITY_INSERT [dbo].[Test] OFF
SET IDENTITY_INSERT [dbo].[TestRequest] ON 

INSERT [dbo].[TestRequest] ([Id], [TestId], [PatientId], [BillNo]) VALUES (6, 1, 12, 1753847)
INSERT [dbo].[TestRequest] ([Id], [TestId], [PatientId], [BillNo]) VALUES (7, 3, 12, 1753847)
INSERT [dbo].[TestRequest] ([Id], [TestId], [PatientId], [BillNo]) VALUES (8, 3, 13, 8274175)
INSERT [dbo].[TestRequest] ([Id], [TestId], [PatientId], [BillNo]) VALUES (9, 2, 13, 8274175)
INSERT [dbo].[TestRequest] ([Id], [TestId], [PatientId], [BillNo]) VALUES (10, 2, 14, 4440088)
INSERT [dbo].[TestRequest] ([Id], [TestId], [PatientId], [BillNo]) VALUES (11, 3, 14, 4440088)
INSERT [dbo].[TestRequest] ([Id], [TestId], [PatientId], [BillNo]) VALUES (12, 1, 14, 4440088)
INSERT [dbo].[TestRequest] ([Id], [TestId], [PatientId], [BillNo]) VALUES (13, 1002, 15, 2693027)
INSERT [dbo].[TestRequest] ([Id], [TestId], [PatientId], [BillNo]) VALUES (14, 3, 15, 2693027)
INSERT [dbo].[TestRequest] ([Id], [TestId], [PatientId], [BillNo]) VALUES (15, 2, 16, 1340837)
INSERT [dbo].[TestRequest] ([Id], [TestId], [PatientId], [BillNo]) VALUES (16, 3, 16, 1340837)
INSERT [dbo].[TestRequest] ([Id], [TestId], [PatientId], [BillNo]) VALUES (17, 1002, 16, 1340837)
INSERT [dbo].[TestRequest] ([Id], [TestId], [PatientId], [BillNo]) VALUES (18, 1002, 17, 8385173)
INSERT [dbo].[TestRequest] ([Id], [TestId], [PatientId], [BillNo]) VALUES (19, 1, 17, 8385173)
INSERT [dbo].[TestRequest] ([Id], [TestId], [PatientId], [BillNo]) VALUES (20, 1, 18, 7552804)
INSERT [dbo].[TestRequest] ([Id], [TestId], [PatientId], [BillNo]) VALUES (21, 3, 18, 7552804)
SET IDENTITY_INSERT [dbo].[TestRequest] OFF
SET IDENTITY_INSERT [dbo].[TestType] ON 

INSERT [dbo].[TestType] ([Id], [Name]) VALUES (1, N'Blood')
INSERT [dbo].[TestType] ([Id], [Name]) VALUES (3, N'Urine')
INSERT [dbo].[TestType] ([Id], [Name]) VALUES (5, N'ECG')
INSERT [dbo].[TestType] ([Id], [Name]) VALUES (6, N'X-Ray')
INSERT [dbo].[TestType] ([Id], [Name]) VALUES (9, N'PSS')
INSERT [dbo].[TestType] ([Id], [Name]) VALUES (11, N'Echo')
SET IDENTITY_INSERT [dbo].[TestType] OFF
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_TestType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[TestType] ([Id])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_TestType]
GO
ALTER TABLE [dbo].[TestRequest]  WITH CHECK ADD  CONSTRAINT [FK_TestRequest_Test] FOREIGN KEY([BillNo])
REFERENCES [dbo].[Payment] ([BillNo])
GO
ALTER TABLE [dbo].[TestRequest] CHECK CONSTRAINT [FK_TestRequest_Test]
GO
USE [master]
GO
ALTER DATABASE [DiagnosticDB] SET  READ_WRITE 
GO
