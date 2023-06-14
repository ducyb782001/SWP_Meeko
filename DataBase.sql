USE [master]
GO
/****** Object:  Database [SWP391_QN]    Script Date: 6/14/2023 9:56:15 PM ******/
CREATE DATABASE [SWP391_QN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391_QN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\SWP391_QN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_QN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\SWP391_QN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SWP391_QN] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391_QN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391_QN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391_QN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391_QN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391_QN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391_QN] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391_QN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP391_QN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391_QN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391_QN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391_QN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391_QN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391_QN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391_QN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391_QN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391_QN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP391_QN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391_QN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391_QN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391_QN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391_QN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391_QN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391_QN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391_QN] SET RECOVERY FULL 
GO
ALTER DATABASE [SWP391_QN] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391_QN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391_QN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391_QN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391_QN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391_QN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391_QN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWP391_QN', N'ON'
GO
ALTER DATABASE [SWP391_QN] SET QUERY_STORE = OFF
GO
USE [SWP391_QN]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/14/2023 9:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [text] NULL,
	[isParent] [bit] NOT NULL,
	[ParentID] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collections]    Script Date: 6/14/2023 9:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collections](
	[CollectionID] [int] IDENTITY(1,1) NOT NULL,
	[CollectionName] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
	[Descreption] [text] NULL,
 CONSTRAINT [PK_Collections] PRIMARY KEY CLUSTERED 
(
	[CollectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/14/2023 9:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/14/2023 9:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[EmloyeeID] [int] NULL,
	[DateTime] [datetime] NOT NULL,
	[PaymentMethod] [int] NOT NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 6/14/2023 9:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Method] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Collection]    Script Date: 6/14/2023 9:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Collection](
	[ProductId] [varchar](10) NOT NULL,
	[CollectionId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [Product_Collection_PKs] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Tag]    Script Date: 6/14/2023 9:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Tag](
	[ProductId] [varchar](10) NOT NULL,
	[TagId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [Product_Tag_PKs] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/14/2023 9:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [varchar](10) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Price] [money] NULL,
	[Quantity] [int] NULL,
	[Status] [bit] NULL,
	[ClassName] [nvarchar](255) NULL,
	[ClassValue] [nvarchar](50) NULL,
	[createDate] [date] NULL,
	[ParentId] [varchar](10) NULL,
	[CategoryId] [int] NULL,
	[IsParent] [bit] NOT NULL,
	[isBestSeller] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/14/2023 9:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 6/14/2023 9:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/14/2023 9:56:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](255) NULL,
	[Phone] [varchar](10) NULL,
	[DOB] [date] NULL,
	[Address] [text] NULL,
	[Avatar] [text] NULL,
	[RoleID] [int] NOT NULL,
	[ManagerID] [int] NULL,
	[Status] [bit] NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (1, N'Gối ôm', 1, NULL, 0, 9)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (2, N'Tựa lưng, gối cổ', 1, NULL, 0, 9)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (3, N'Gấu bông', 1, NULL, 0, 9)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (4, N'Máy phun sương', 1, NULL, 0, 10)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (5, N'Đồ chơi', 1, NULL, 0, 10)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (6, N'Đèn ngủ', 1, NULL, 0, 10)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (7, N'Mùi hương', 1, NULL, 0, 10)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (8, N'Nghe nhạc', 1, NULL, 0, 10)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (9, N'Mềm mại', 1, NULL, 1, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (10, N'Thư giãn', 1, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Collections] ON 

INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [Status], [Descreption]) VALUES (1, N'Quà tặng bố', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [Status], [Descreption]) VALUES (3, N'Quà tặng mẹ', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [Status], [Descreption]) VALUES (4, N'Quà tặng người yêu', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [Status], [Descreption]) VALUES (5, N'Set du lịch', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [Status], [Descreption]) VALUES (7, N'Quà tặng ông bà', 1, NULL)
SET IDENTITY_INSERT [dbo].[Collections] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity]) VALUES (1, 2, N'P001', 1)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity]) VALUES (2, 2, N'P003', 1)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity]) VALUES (3, 4, N'P006', 1)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity]) VALUES (4, 5, N'P007', 1)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity]) VALUES (5, 9, N'P008', 1)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity]) VALUES (6, 9, N'P004', 2)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity]) VALUES (7, 10, N'P001', 1)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [Quantity]) VALUES (8, 11, N'P005', 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmloyeeID], [DateTime], [PaymentMethod], [Status]) VALUES (2, 3, 1, CAST(N'2023-05-20T11:35:05.000' AS DateTime), 1, 3)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmloyeeID], [DateTime], [PaymentMethod], [Status]) VALUES (4, 4, 2, CAST(N'2023-04-29T08:48:50.000' AS DateTime), 3, 2)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmloyeeID], [DateTime], [PaymentMethod], [Status]) VALUES (5, 2, 3, CAST(N'2032-05-21T15:21:36.000' AS DateTime), 1, 3)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmloyeeID], [DateTime], [PaymentMethod], [Status]) VALUES (9, 1, 2, CAST(N'2023-05-17T16:05:34.000' AS DateTime), 1, 3)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmloyeeID], [DateTime], [PaymentMethod], [Status]) VALUES (10, 1, 2, CAST(N'2023-05-17T09:13:56.000' AS DateTime), 1, 3)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmloyeeID], [DateTime], [PaymentMethod], [Status]) VALUES (11, 1, 3, CAST(N'2023-05-20T00:00:00.000' AS DateTime), 3, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([PaymentId], [Method], [Status]) VALUES (1, N'Cash', 1)
INSERT [dbo].[Payments] ([PaymentId], [Method], [Status]) VALUES (3, N'VNPay', 1)
INSERT [dbo].[Payments] ([PaymentId], [Method], [Status]) VALUES (4, N'MoMo', 0)
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (N'P001', 1, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (N'P001', 3, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (N'P002', 1, 0)
INSERT [dbo].[Product_Collection] ([ProductId], [CollectionId], [DeleteFlag]) VALUES (N'P002', 7, 0)
GO
INSERT [dbo].[Product_Tag] ([ProductId], [TagId], [DeleteFlag]) VALUES (N'P001', 1, 0)
INSERT [dbo].[Product_Tag] ([ProductId], [TagId], [DeleteFlag]) VALUES (N'P001', 2, 0)
INSERT [dbo].[Product_Tag] ([ProductId], [TagId], [DeleteFlag]) VALUES (N'P003', 4, 0)
INSERT [dbo].[Product_Tag] ([ProductId], [TagId], [DeleteFlag]) VALUES (N'P004', 1, 0)
GO
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassName], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [isBestSeller]) VALUES (N'P001', N'Tranh thêu chữ Lộc', 120.0000, 12, 1, NULL, NULL, NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassName], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [isBestSeller]) VALUES (N'P002', N'Cốc sứ trái tim', 100.0000, 32, 1, N'Màu sắc', N'Trắng', NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassName], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [isBestSeller]) VALUES (N'P003', N'Cốc sứ trái tim', 110.0000, 14, 1, N'Màu sắc', N'Đen', NULL, N'P002', NULL, 0, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassName], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [isBestSeller]) VALUES (N'P004', N'Móc khóa Pubg', 75.0000, 51, 1, NULL, NULL, NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassName], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [isBestSeller]) VALUES (N'P005', N'Mô hình xe Ducati', 500.0000, 3, 1, NULL, NULL, NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassName], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [isBestSeller]) VALUES (N'P006', N'Gấu Teddy', 150.0000, 8, 1, N'Kích Thước', N'1m', NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassName], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [isBestSeller]) VALUES (N'P007', N'Gấu Teddy', 250.0000, 6, 1, N'Kích Thước', N'1m8', NULL, N'P007', NULL, 0, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassName], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [isBestSeller]) VALUES (N'P008', N'Mô hình Toyota Camty', 350.0000, 14, 1, N'Màu sắc', N'Đen', NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassName], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [isBestSeller]) VALUES (N'P009', N'Mô hình Toyota Cảmy', 370.0000, 9, 1, N'Màu sắc', N'Trắng', NULL, N'P008', NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (1, N'Admin', 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (2, N'Staff', 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [DeleteFlag]) VALUES (3, N'Customer', 0)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([TagId], [TagName], [Status], [Description]) VALUES (1, N'Gấu nhồi bông', 1, NULL)
INSERT [dbo].[Tags] ([TagId], [TagName], [Status], [Description]) VALUES (2, N'Đồ Decor', 1, NULL)
INSERT [dbo].[Tags] ([TagId], [TagName], [Status], [Description]) VALUES (3, N'Giá rẻ', 1, NULL)
INSERT [dbo].[Tags] ([TagId], [TagName], [Status], [Description]) VALUES (4, N'Đồ phòng ngủ', 1, NULL)
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (1, N'Nguyễn Ánh Linh', N'cus1@gmail.com', N'123', N'0987654321', CAST(N'1999-12-02' AS Date), N'Hà Ðông, Hà N?i', NULL, 1, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (2, N'Đào Phúc Lộc', N'cus2@gmail.com', N'123', N'0987283476', CAST(N'1992-02-15' AS Date), NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (3, N'Quyền Hải Long', N'cus3@gmail.com', N'123', N'0332837477', CAST(N'2002-06-23' AS Date), N'Lao Cai', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (4, N'Nguyễn Quang Huy', N'cus4@gmail.com', N'123', N'0982678876', CAST(N'2001-05-04' AS Date), N'Khu?t Duy Ti?n, Hà N?i', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (5, N'Trần Trí Dũng', N'cus5@gmail.com', N'123', N'0982678432', NULL, NULL, NULL, 2, 1, 0, N'Khách hàng không có thông tin')
INSERT [dbo].[User] ([UserID], [FullName], [Email], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (6, N'Vũ Duy Nam', N'cus6@gmail.com', N'123', N'0983123122', CAST(N'2001-10-06' AS Date), NULL, NULL, 2, 1, 1, N'C?n xin d?a ch? khách hàng')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Payments] FOREIGN KEY([PaymentMethod])
REFERENCES [dbo].[Payments] ([PaymentId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Payments]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User] FOREIGN KEY([EmloyeeID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_User]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User1] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_User1]
GO
ALTER TABLE [dbo].[Product_Collection]  WITH CHECK ADD  CONSTRAINT [FK_Product_Collection_Collections] FOREIGN KEY([CollectionId])
REFERENCES [dbo].[Collections] ([CollectionID])
GO
ALTER TABLE [dbo].[Product_Collection] CHECK CONSTRAINT [FK_Product_Collection_Collections]
GO
ALTER TABLE [dbo].[Product_Collection]  WITH CHECK ADD  CONSTRAINT [FK_Product_Collection_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Product_Collection] CHECK CONSTRAINT [FK_Product_Collection_Products]
GO
ALTER TABLE [dbo].[Product_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Product_Tag_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Product_Tag] CHECK CONSTRAINT [FK_Product_Tag_Products]
GO
ALTER TABLE [dbo].[Product_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Product_Tag_Tags1] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[Product_Tag] CHECK CONSTRAINT [FK_Product_Tag_Tags1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Products] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Products]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User]
GO
USE [master]
GO
ALTER DATABASE [SWP391_QN] SET  READ_WRITE 
GO
