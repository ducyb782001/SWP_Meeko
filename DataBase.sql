USE [master]
GO
/****** Object:  Database [Yoga_Center]    Script Date: 6/14/2023 7:18:25 PM ******/
CREATE DATABASE [Yoga_Center]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Yoga_Center', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\Yoga_Center.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Yoga_Center_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MYDATA\MSSQL\DATA\Yoga_Center_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Yoga_Center] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Yoga_Center].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Yoga_Center] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Yoga_Center] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Yoga_Center] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Yoga_Center] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Yoga_Center] SET ARITHABORT OFF 
GO
ALTER DATABASE [Yoga_Center] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Yoga_Center] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Yoga_Center] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Yoga_Center] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Yoga_Center] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Yoga_Center] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Yoga_Center] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Yoga_Center] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Yoga_Center] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Yoga_Center] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Yoga_Center] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Yoga_Center] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Yoga_Center] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Yoga_Center] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Yoga_Center] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Yoga_Center] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Yoga_Center] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Yoga_Center] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Yoga_Center] SET  MULTI_USER 
GO
ALTER DATABASE [Yoga_Center] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Yoga_Center] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Yoga_Center] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Yoga_Center] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Yoga_Center] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Yoga_Center] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Yoga_Center', N'ON'
GO
ALTER DATABASE [Yoga_Center] SET QUERY_STORE = OFF
GO
USE [Yoga_Center]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 6/14/2023 7:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[classID] [int] NOT NULL,
	[cusPhone] [char](10) NOT NULL,
	[isPresent] [bit] NULL,
 CONSTRAINT [PK_Attendance_1] PRIMARY KEY CLUSTERED 
(
	[classID] ASC,
	[cusPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 6/14/2023 7:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[billID] [int] NOT NULL,
	[time] [date] NULL,
	[courseID] [int] NULL,
	[cusPhone] [char](10) NOT NULL,
	[price] [float] NOT NULL,
	[voucher] [char](50) NULL,
	[discount_price] [float] NULL,
	[final_price] [float] NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[billID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/14/2023 7:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] NOT NULL,
	[type] [nchar](10) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 6/14/2023 7:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[classID] [int] IDENTITY(1,1) NOT NULL,
	[courseID] [int] NULL,
	[ptPhone] [char](10) NULL,
	[name] [nvarchar](50) NULL,
	[description] [text] NULL,
	[total_sessions] [int] NULL,
	[capacity] [int] NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[classID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classslot]    Script Date: 6/14/2023 7:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classslot](
	[slotID] [int] NOT NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
 CONSTRAINT [PK_Classslot] PRIMARY KEY CLUSTERED 
(
	[slotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 6/14/2023 7:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[courseID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 6/14/2023 7:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[eventID] [int] NOT NULL,
	[eventName] [nvarchar](max) NULL,
	[courseID] [int] NULL,
	[discount] [float] NULL,
	[daystart] [smalldatetime] NULL,
	[dayend] [smalldatetime] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[eventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 6/14/2023 7:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[courseID] [int] NOT NULL,
	[cusPhone] [char](10) NOT NULL,
	[comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_Feedback_1] PRIMARY KEY CLUSTERED 
(
	[courseID] ASC,
	[cusPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 6/14/2023 7:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[newsID] [int] IDENTITY(1,1) NOT NULL,
	[stPhone] [char](10) NOT NULL,
	[title] [nvarchar](100) NULL,
	[postDate] [datetime] NULL,
	[image] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[categoryID] [int] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[newsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 6/14/2023 7:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[roomID] [varchar](5) NOT NULL,
	[locate] [nvarchar](50) NOT NULL,
	[roomNumber] [nchar](5) NOT NULL,
	[status] [bit] NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 6/14/2023 7:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[scheduleID] [int] IDENTITY(1,1) NOT NULL,
	[classID] [int] NOT NULL,
	[ptPhone] [char](10) NOT NULL,
	[slotID] [int] NOT NULL,
	[roomID] [varchar](5) NOT NULL,
	[day] [date] NOT NULL,
	[customerID] [char](10) NOT NULL,
	[deleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Schedule_1] PRIMARY KEY CLUSTERED 
(
	[scheduleID] ASC,
	[classID] ASC,
	[ptPhone] ASC,
	[slotID] ASC,
	[roomID] ASC,
	[day] ASC,
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/14/2023 7:18:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[phone] [char](10) NOT NULL,
	[password] [nchar](20) NOT NULL,
	[userlogin] [nchar](20) NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](100) NULL,
	[gender] [nchar](10) NULL,
	[role] [char](2) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([categoryID], [type], [status]) VALUES (1, N'Blog      ', 1)
INSERT [dbo].[Category] ([categoryID], [type], [status]) VALUES (2, N'Product   ', 1)
INSERT [dbo].[Category] ([categoryID], [type], [status]) VALUES (3, N'Other     ', 1)
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([classID], [courseID], [ptPhone], [name], [description], [total_sessions], [capacity]) VALUES (2, 2, N'0987654444', N'YogaTest', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
INSERT [dbo].[Classslot] ([slotID], [start_time], [end_time]) VALUES (1, CAST(N'07:30:00' AS Time), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Classslot] ([slotID], [start_time], [end_time]) VALUES (2, CAST(N'09:10:00' AS Time), CAST(N'10:40:00' AS Time))
INSERT [dbo].[Classslot] ([slotID], [start_time], [end_time]) VALUES (3, CAST(N'10:40:00' AS Time), CAST(N'12:20:00' AS Time))
INSERT [dbo].[Classslot] ([slotID], [start_time], [end_time]) VALUES (4, NULL, NULL)
INSERT [dbo].[Classslot] ([slotID], [start_time], [end_time]) VALUES (5, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([courseID], [name], [description], [image], [price]) VALUES (2, N'Basic', N'Khóa học cơ bản dành cho người mới bắt đâu', N'123', CAST(2000000 AS Decimal(18, 0)))
INSERT [dbo].[Courses] ([courseID], [name], [description], [image], [price]) VALUES (3, N'Advance', N'Khóa học nâng cao', N'32', CAST(3000000 AS Decimal(18, 0)))
INSERT [dbo].[Courses] ([courseID], [name], [description], [image], [price]) VALUES (4, N'Teacher', N'Khóa học dành cho người muốn làm giáo viên', N'2323', CAST(5000000 AS Decimal(18, 0)))
INSERT [dbo].[Courses] ([courseID], [name], [description], [image], [price]) VALUES (5, N'Therapy', N'Khóa học trị liệu', N'23322', CAST(10000000 AS Decimal(18, 0)))
INSERT [dbo].[Courses] ([courseID], [name], [description], [image], [price]) VALUES (6, N'null', N'null', N'null', NULL)
INSERT [dbo].[Courses] ([courseID], [name], [description], [image], [price]) VALUES (7, N'null', N'null', N'null', NULL)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
INSERT [dbo].[Room] ([roomID], [locate], [roomNumber], [status], [description]) VALUES (N'BE123', N'Beta', N'123  ', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Schedule] ON 

INSERT [dbo].[Schedule] ([scheduleID], [classID], [ptPhone], [slotID], [roomID], [day], [customerID], [deleteFlag]) VALUES (1, 2, N'0987654444', 1, N'BE123', CAST(N'2023-05-29' AS Date), N'0987654323', 1)
INSERT [dbo].[Schedule] ([scheduleID], [classID], [ptPhone], [slotID], [roomID], [day], [customerID], [deleteFlag]) VALUES (2, 2, N'0987654444', 1, N'BE123', CAST(N'2023-06-02' AS Date), N'0987654323', 0)
INSERT [dbo].[Schedule] ([scheduleID], [classID], [ptPhone], [slotID], [roomID], [day], [customerID], [deleteFlag]) VALUES (3, 2, N'0987654444', 1, N'BE123', CAST(N'2023-06-03' AS Date), N'0987654323', 0)
INSERT [dbo].[Schedule] ([scheduleID], [classID], [ptPhone], [slotID], [roomID], [day], [customerID], [deleteFlag]) VALUES (4, 2, N'0987654444', 2, N'BE123', CAST(N'2023-06-02' AS Date), N'0987654323', 0)
INSERT [dbo].[Schedule] ([scheduleID], [classID], [ptPhone], [slotID], [roomID], [day], [customerID], [deleteFlag]) VALUES (5, 2, N'0987654444', 5, N'BE123', CAST(N'2023-05-31' AS Date), N'0987654323', 0)
INSERT [dbo].[Schedule] ([scheduleID], [classID], [ptPhone], [slotID], [roomID], [day], [customerID], [deleteFlag]) VALUES (6, 2, N'0987654444', 3, N'BE123', CAST(N'2023-06-07' AS Date), N'0987654321', 1)
INSERT [dbo].[Schedule] ([scheduleID], [classID], [ptPhone], [slotID], [roomID], [day], [customerID], [deleteFlag]) VALUES (7, 2, N'0987654444', 1, N'BE123', CAST(N'2023-06-07' AS Date), N'0987654321', 0)
SET IDENTITY_INSERT [dbo].[Schedule] OFF
GO
INSERT [dbo].[User] ([phone], [password], [userlogin], [name], [address], [gender], [role], [status]) VALUES (N'0123456789', N'1                   ', N'admin               ', N'ADMIN', N'123', N'Male      ', N'AD', 1)
INSERT [dbo].[User] ([phone], [password], [userlogin], [name], [address], [gender], [role], [status]) VALUES (N'0987654321', N'1                   ', N'Vu                  ', N'Thien Vu', N'882 hoang ma', N'Male      ', N'US', 1)
INSERT [dbo].[User] ([phone], [password], [userlogin], [name], [address], [gender], [role], [status]) VALUES (N'0987654322', N'1                   ', N'Nhat                ', N'Trinh Nhat', N'87 man thien', N'FeMale    ', N'US', 1)
INSERT [dbo].[User] ([phone], [password], [userlogin], [name], [address], [gender], [role], [status]) VALUES (N'0987654323', N'1                   ', N'Nguyen              ', N'Hiep Nguyen', N'77 nghia dia', N'FeMale    ', N'US', 1)
INSERT [dbo].[User] ([phone], [password], [userlogin], [name], [address], [gender], [role], [status]) VALUES (N'0987654444', N'123                 ', N'dkfhsdfsdf          ', N'Tran Duc Long', N'oke', N'Male      ', N'ST', 1)
INSERT [dbo].[User] ([phone], [password], [userlogin], [name], [address], [gender], [role], [status]) VALUES (N'3453434534', N'12345678H           ', N'uisdfgsdf           ', N'dfgdfgd gsdfgsdfg', N'sdfgsdfg', N'FeMale    ', N'ST', 1)
INSERT [dbo].[User] ([phone], [password], [userlogin], [name], [address], [gender], [role], [status]) VALUES (N'3456456345', N'12345678H           ', N'lLongng             ', N'Long Nguyen', N'vvvvvvvvvvvvvvv', N'FeMale    ', N'ST', 1)
INSERT [dbo].[User] ([phone], [password], [userlogin], [name], [address], [gender], [role], [status]) VALUES (N'5555555555', N'1                   ', N'oke                 ', N'Long he', N'hehe', N'Male      ', N'ST', 1)
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Class] FOREIGN KEY([classID])
REFERENCES [dbo].[Class] ([classID])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Class]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_User1] FOREIGN KEY([cusPhone])
REFERENCES [dbo].[User] ([phone])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_User1]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Courses] FOREIGN KEY([courseID])
REFERENCES [dbo].[Courses] ([courseID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Courses]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_User] FOREIGN KEY([cusPhone])
REFERENCES [dbo].[User] ([phone])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_User]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Courses1] FOREIGN KEY([courseID])
REFERENCES [dbo].[Courses] ([courseID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Courses1]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_User1] FOREIGN KEY([ptPhone])
REFERENCES [dbo].[User] ([phone])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_User1]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Courses] FOREIGN KEY([courseID])
REFERENCES [dbo].[Courses] ([courseID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Courses]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Courses] FOREIGN KEY([courseID])
REFERENCES [dbo].[Courses] ([courseID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Courses]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_User1] FOREIGN KEY([cusPhone])
REFERENCES [dbo].[User] ([phone])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_User1]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Category]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_User] FOREIGN KEY([stPhone])
REFERENCES [dbo].[User] ([phone])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_User]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Class] FOREIGN KEY([classID])
REFERENCES [dbo].[Class] ([classID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Class]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Classslot] FOREIGN KEY([slotID])
REFERENCES [dbo].[Classslot] ([slotID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Classslot]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Room] FOREIGN KEY([roomID])
REFERENCES [dbo].[Room] ([roomID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Room]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_User] FOREIGN KEY([ptPhone])
REFERENCES [dbo].[User] ([phone])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_User]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_User1] FOREIGN KEY([customerID])
REFERENCES [dbo].[User] ([phone])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_User1]
GO
USE [master]
GO
ALTER DATABASE [Yoga_Center] SET  READ_WRITE 
GO
