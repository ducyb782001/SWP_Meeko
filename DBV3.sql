USE [master]
GO
/****** Object:  Database [SWP391_QN]    Script Date: 6/21/2023 6:41:52 PM ******/
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
/****** Object:  Table [dbo].[Best_Seller]    Script Date: 6/21/2023 6:41:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Best_Seller](
	[ProductID] [int] NOT NULL,
	[deleteFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/21/2023 6:41:52 PM ******/
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
/****** Object:  Table [dbo].[Collections]    Script Date: 6/21/2023 6:41:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collections](
	[CollectionID] [int] IDENTITY(1,1) NOT NULL,
	[CollectionName] [nvarchar](255) NOT NULL,
	[link] [varchar](max) NULL,
	[Status] [bit] NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Collections] PRIMARY KEY CLUSTERED 
(
	[CollectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 6/21/2023 6:41:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ImgID] [int] IDENTITY(1,1) NOT NULL,
	[link] [varchar](max) NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ImgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[New_Arrival]    Script Date: 6/21/2023 6:41:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[New_Arrival](
	[ProductID] [int] NOT NULL,
	[deleteFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/21/2023 6:41:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/21/2023 6:41:52 PM ******/
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
/****** Object:  Table [dbo].[Payments]    Script Date: 6/21/2023 6:41:52 PM ******/
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
/****** Object:  Table [dbo].[Product_Collection]    Script Date: 6/21/2023 6:41:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Collection](
	[ProductId] [int] NOT NULL,
	[CollectionId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [Product_Collection_PKs] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Tag]    Script Date: 6/21/2023 6:41:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Tag](
	[ProductId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [Product_Tag_PKs] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/21/2023 6:41:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Price] [money] NULL,
	[Quantity] [int] NULL,
	[Status] [bit] NULL,
	[ClassType] [int] NULL,
	[ClassValue] [nvarchar](50) NULL,
	[createDate] [date] NULL,
	[ParentId] [int] NULL,
	[CategoryId] [int] NULL,
	[IsParent] [bit] NULL,
	[Description] [text] NULL,
	[avatar] [varchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/21/2023 6:41:52 PM ******/
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
/****** Object:  Table [dbo].[Tags]    Script Date: 6/21/2023 6:41:52 PM ******/
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
/****** Object:  Table [dbo].[Type]    Script Date: 6/21/2023 6:41:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[TypeID] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/21/2023 6:41:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Email] [varchar](255) NULL,
	[EmailID] [text] NULL,
	[Password] [varchar](255) NULL,
	[Phone] [varchar](10) NULL,
	[DOB] [date] NULL,
	[Address] [text] NULL,
	[Avatar] [text] NULL,
	[RoleID] [int] NULL,
	[ManagerID] [int] NULL,
	[Status] [bit] NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Best_Seller] ([ProductID], [deleteFlag]) VALUES (16, 0)
INSERT [dbo].[Best_Seller] ([ProductID], [deleteFlag]) VALUES (20, 0)
INSERT [dbo].[Best_Seller] ([ProductID], [deleteFlag]) VALUES (22, 0)
INSERT [dbo].[Best_Seller] ([ProductID], [deleteFlag]) VALUES (13, 0)
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
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (11, N'Cuộc sống thường ngày', 1, NULL, 1, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (12, N'Bình nước', 1, NULL, 0, 11)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (14, N'Cốc', 1, NULL, 0, 11)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (16, N'Phòng ngủ', 1, NULL, 0, 11)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (17, N'Quạt', 1, NULL, 0, 11)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (18, N'Đồng hồ', 1, NULL, 0, 11)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (19, N'Đồ gia dụng', 1, NULL, 0, 11)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (20, N'Nhỏ Xinh', 1, NULL, 1, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (21, N'Móc khóa', 1, NULL, 0, 20)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (22, N'Vòng tay', 1, NULL, 0, 20)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (23, N'Cuộc sống thường ngày', 1, NULL, 1, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (27, N'Bình nước', 1, NULL, 0, 23)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (28, N'Cốc', 1, NULL, 0, 23)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Status], [Description], [isParent], [ParentID]) VALUES (29, N'Quạt', 1, NULL, 0, 23)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Collections] ON 

INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (1, N'FOR HIM', N'https://bizweb.dktcdn.net/thumb/compact/100/450/808/collections/10-37c9706f-413a-4123-b0d6-07905851440b.png?v=1648550713910', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (3, N'FOR HER', N'https://bizweb.dktcdn.net/thumb/compact/100/450/808/collections/9-228daf39-c660-4d00-9cc0-b9bbdb8f0e1d.png?v=1648550696500', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (4, N'Cuộc sống thường ngày', N'https://bizweb.dktcdn.net/thumb/compact/100/450/808/collections/cuo-c-so-ng-thu-o-ng-nga-y.png?v=1648549034233', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (5, N'Thư Giãn', N'https://bizweb.dktcdn.net/thumb/compact/100/450/808/collections/thu-gia-n.png?v=1648549150917', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (7, N'Trang trí nhà cửa', N'https://bizweb.dktcdn.net/thumb/compact/100/450/808/collections/trang-tri-nha-cu-a.png?v=1648549061927', 1, NULL)
INSERT [dbo].[Collections] ([CollectionID], [CollectionName], [link], [Status], [Description]) VALUES (8, N'Tiện ích', N'https://bizweb.dktcdn.net/thumb/compact/100/450/808/collections/tie-n-i-ch.png?v=1648548924423', 1, NULL)
SET IDENTITY_INSERT [dbo].[Collections] OFF
GO
INSERT [dbo].[New_Arrival] ([ProductID], [deleteFlag]) VALUES (1, 0)
INSERT [dbo].[New_Arrival] ([ProductID], [deleteFlag]) VALUES (2, 0)
INSERT [dbo].[New_Arrival] ([ProductID], [deleteFlag]) VALUES (8, 0)
INSERT [dbo].[New_Arrival] ([ProductID], [deleteFlag]) VALUES (15, 0)
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
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (1, N'Gấu trúc ống tre', 220.0000, 30, 1, NULL, NULL, NULL, NULL, 9, 1, N'* Thông tin chi ti?t: - Ch?t li?u: Lông m?m m?n, du?c nh?i bông gò...', N'https://bizweb.dktcdn.net/thumb/large/100/450/808/products/b4fe0c25-cce5-4e70-95c2-04428110d7f2.jpg?v=1686794184000')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (2, N'Gấu Lena Lotso', 220.0000, 43, 1, NULL, NULL, NULL, NULL, 9, 1, N'* Thông tin chi ti?t:  - Ch?t li?u: Lông m?m m?n, du?c nh?i b...
', N'https://bizweb.dktcdn.net/thumb/large/100/450/808/products/e3f34c41-b25f-4996-bb4e-d8410b968ebc.jpg?v=1686793942000')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (3, N'Thỏ bông Cinna êm mềm 30cm', 280.0000, 57, 1, NULL, NULL, NULL, NULL, 9, 1, N'* Thông tin chi ti?t: - Ch?t li?u: Lông m?m m?n, du?c nh?i bông ca...', N'https://bizweb.dktcdn.net/thumb/large/100/450/808/products/7c77d0eb-87a1-457b-b024-ef90213fa382.jpg?v=1686394374000')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (4, N'Cừu ong êm mềm Momi 45cm', 320.0000, 45, 1, NULL, NULL, NULL, NULL, 9, 1, N'* Thông tin chi ti?t:  - Ch?t li?u: Lông + n? nhung m?m ...', N'https://bizweb.dktcdn.net/thumb/large/100/450/808/products/56ee7474-48bf-4d80-ac6d-f204a9760e87.jpg?v=1686793718000')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (5, N'Mèo mun mắt liếc Kiki', 480.0000, 12, 1, 2, N'60cm', NULL, NULL, 9, 1, N'* Thông tin chi ti?t:  - Ch?t li?u: Lông xù m?m m?n, du?c nh?...', N'https://bizweb.dktcdn.net/thumb/large/100/450/808/products/81b7a107-b8d3-4ae8-b64a-610eb9d6a5d2.jpg?v=1686645159000')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (6, N'Mèo mun mắt liếc Kiki', 350.0000, 8, 1, 2, N'40cm', NULL, 5, 9, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (7, N'Mèo mun mắt liếc Kiki', 250.0000, 6, 1, 2, N'35cm', NULL, 5, 9, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (8, N'Móc khoá cung hoàng đạo Hiha', 90.0000, 14, 1, 1, N'Bạch Dượng', NULL, NULL, 20, 1, N'* Thông tin chi ti?t: - Kích thu?c: 10cm - Ch?t li?u: N? m?m m?n ca...', N'https://bizweb.dktcdn.net/thumb/large/100/450/808/products/7c77d0eb-87a1-457b-b024-ef90213fa382.jpg?v=1686394374000')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (9, N'Móc khoá cung hoàng đạo Hiha', 90.0000, 34, 1, 1, N'Kim ngưu', NULL, 8, 20, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (10, N'Móc khoá cung hoàng đạo Hiha', 90.0000, 23, 1, 1, N'Song tử', NULL, 8, 20, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (11, N'Móc khoá cung hoàng đạo Hiha', 90.0000, 42, 1, 1, NULL, NULL, 8, 20, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (12, N'Móc khoá cung hoàng đạo Hiha', 90.0000, 13, 1, 1, N'Bọ cạp', NULL, 8, 20, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (13, N'Sưởi ấm Minty Cat kiêm đèn ngủ và sạc dự phòng', 750.0000, 10, 1, 3, N'Hồng', NULL, NULL, 16, 1, N'M?t ngày tr?i l?nh có bé mèo Minty ?m áp ? c?nh su?i...', N'https://bizweb.dktcdn.net/thumb/large/100/450/808/products/b59b5dec-803d-44f9-afce-f348590ff169.jpg?v=1680665073050')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (14, N'Sưởi ấm Minty Cat kiêm đèn ngủ và sạc dự phòng', 750.0000, 8, 1, 3, N'Đỏ', NULL, NULL, 16, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (15, N'Bé cáo cam bông mềm Capi', 390.0000, 23, 1, NULL, NULL, NULL, NULL, 9, 1, N'* Thông tin chi ti?t bé Cáo: - Ch?t li?u: Lông xù siêu m?m m?n, êm ...', N'https://bizweb.dktcdn.net/thumb/large/100/450/808/products/c818e665-7153-4ff9-989b-a24ad5c80fa9.jpg?v=1684150788000')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (16, N'Cốc sứ cao cấp Pomi Cup', 180.0000, 19, 1, 2, N'Bánh Mì', NULL, NULL, 14, 1, N'Nh?ng chi?c c?c bánh xinh x?n, ng?t ngào ti?p thêm nhi?u vitamin vu...', N'https://bizweb.dktcdn.net/thumb/large/100/450/808/products/9b74e1bd-74a5-4f88-919e-ba8105e08883.jpg?v=1678933460000')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (17, N'Cốc sứ cao cấp Pomi Cup', 180.0000, 8, 1, 2, N'Phô mai', NULL, 16, 14, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (18, N'Cốc sứ cao cấp Pomi Cup', 180.0000, 11, 1, 2, N'Donut', NULL, 16, 14, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (19, N'Bé lừa bông Winnie', 390.0000, 14, 1, NULL, NULL, NULL, NULL, 9, 1, N'* Thông tin chi ti?t bé L?a bông: - Ch?t li?u: Lông xù siêu m?m m?n...', N'https://bizweb.dktcdn.net/thumb/large/100/450/808/products/cfa1d6c5-ffa0-4fcd-8349-51e83792254e.jpg?v=1684150755000')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (20, N'Quạt tích điện cao cấp Sora Fan', 520.0000, 0, 0, 3, N'Hồng', NULL, NULL, 29, 1, N'* Thông tin chi ti?t: - Ch?c nang: qu?t tích di?n d? bàn van phòng...', N'https://bizweb.dktcdn.net/thumb/large/100/450/808/products/9eecf7c3-f5ae-466f-a109-bd2c5d15fdb6.jpg?v=1684898264000')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (21, N'Quạt tích điện cao cấp Sora Fan', 520.0000, 0, 0, 3, N'Đỏ', NULL, 20, 29, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (22, N'Cốc cao cấp Lily Cup kèm nắp và thìa', 190.0000, 5, 1, 2, N'Trái tim hoa', NULL, NULL, 14, 1, N'C?c xinh lung linh nhu m?t vu?n hoa thom ngát. Giúp b?n nhâm ...', N'https://bizweb.dktcdn.net/thumb/large/100/450/808/products/b1b9f23f-351b-4aea-a007-c677d04a4e1a.jpg?v=1677144357000')
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (23, N'Cốc cao cấp Lily Cup kèm nắp và thìa', 190.0000, 0, 0, 2, N'Hoa tuylip tím', NULL, 22, 14, 0, NULL, NULL)
INSERT [dbo].[Products] ([ProductId], [Name], [Price], [Quantity], [Status], [ClassType], [ClassValue], [createDate], [ParentId], [CategoryId], [IsParent], [Description], [avatar]) VALUES (24, N'Cốc cao cấp Lily Cup kèm nắp và thìa', 190.0000, 2, 1, 2, N'Hoa tuylip hồng', NULL, 22, 14, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
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
INSERT [dbo].[Type] ([TypeID], [Name]) VALUES (1, N'Loại')
INSERT [dbo].[Type] ([TypeID], [Name]) VALUES (2, N'Kích thước')
INSERT [dbo].[Type] ([TypeID], [Name]) VALUES (3, N'Màu sắc')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (1, N'Nguyễn Ánh Linh', N'cus1@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', CAST(N'1999-12-02' AS Date), N'Hà Ðông, Hà N?i', NULL, 1, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (2, N'Đào Phúc Lộc', N'cus2@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987283476', CAST(N'1992-02-15' AS Date), NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (3, N'Quyền Hải Long', N'cus3@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0332837477', CAST(N'2002-06-23' AS Date), N'Lao Cai', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (4, N'Nguyễn Quang Huy', N'cus4@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0982678876', CAST(N'2001-05-04' AS Date), N'Khu?t Duy Ti?n, Hà N?i', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (5, N'Trần Trí Dũng', N'cus5@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0982678432', NULL, NULL, NULL, 2, 1, 0, N'Khách hàng không có thông tin')
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (6, N'Vũ Duy Nam', N'cus6@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0983123122', CAST(N'2001-10-06' AS Date), NULL, NULL, 2, 1, 1, N'C?n xin d?a ch? khách hàng')
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (7, N'Nguyen Duc Minh', NULL, NULL, N'53e6086284353cb73d4979f08537d950', NULL, NULL, NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (8, N'Nguyen Duc Minh', NULL, N'108801319630039114694', N'53e6086284353cb73d4979f08537d950', NULL, NULL, NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (10, N'Minh Nguyen', N'minhnd101001@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', NULL, N'helooooooooo', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (11, N'Nguyen Minh', NULL, N'118315661978952123595', NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (12, N'Minh Nguyen', N'nono@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'1234567890', NULL, N'Ðu?ng Ðiên Biên, thành ph? Yên Bái', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (13, N'Nguyen Duc Minh', N'khongco@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'3534543256', NULL, N'Hà N?i', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (14, N'Nguyen Duc Minh', N'ndminh.work@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', CAST(N'2023-06-06' AS Date), N'Hà N?i', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (15, N'helo', N'efgsdgk@gmail.com', NULL, N'53e6086284353cb73d4979f08537d950', N'0987654321', CAST(N'2023-06-15' AS Date), N'Hà N?i', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (16, N'check check', N'test@gmail.com', NULL, N'202cb962ac59075b964b07152d234b70', N'0987654321', CAST(N'2002-06-13' AS Date), N'', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[User] ([UserID], [FullName], [Email], [EmailID], [Password], [Phone], [DOB], [Address], [Avatar], [RoleID], [ManagerID], [Status], [Description]) VALUES (17, N'Minh Nguyễn', NULL, N'106099637354725921371', NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Best_Seller]  WITH CHECK ADD  CONSTRAINT [FK_Best_seller_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Best_Seller] CHECK CONSTRAINT [FK_Best_seller_Products]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Products]
GO
ALTER TABLE [dbo].[New_Arrival]  WITH CHECK ADD  CONSTRAINT [FK_New_Arrival_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[New_Arrival] CHECK CONSTRAINT [FK_New_Arrival_Products]
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
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Products1] FOREIGN KEY([ClassType])
REFERENCES [dbo].[Type] ([TypeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Products1]
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
