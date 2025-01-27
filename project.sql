USE [master]
GO
/****** Object:  Database [project]    Script Date: 10/03/2024 1:16:11 CH ******/
CREATE DATABASE [project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [project] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [project] SET ARITHABORT OFF 
GO
ALTER DATABASE [project] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [project] SET  MULTI_USER 
GO
ALTER DATABASE [project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [project] SET QUERY_STORE = ON
GO
ALTER DATABASE [project] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [project]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/03/2024 1:16:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 10/03/2024 1:16:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[color_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[color_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 10/03/2024 1:16:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NULL,
	[quantity] [int] NOT NULL,
	[price_per_unit] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/03/2024 1:16:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_date] [datetime] NOT NULL,
	[total_amount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColor]    Script Date: 10/03/2024 1:16:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColor](
	[product_id] [int] NOT NULL,
	[color_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[color_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/03/2024 1:16:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[release_date] [date] NULL,
	[Quantity] [int] NULL,
	[c_id] [int] NULL,
	[url_img] [nvarchar](255) NULL,
	[url_img2] [nvarchar](255) NULL,
	[url_img3] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSpecifications]    Script Date: 10/03/2024 1:16:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSpecifications](
	[product_id] [int] NOT NULL,
	[screen_size] [nvarchar](50) NULL,
	[cpu] [nvarchar](50) NULL,
	[ram] [nvarchar](50) NULL,
	[storage_capacity] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 10/03/2024 1:16:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[user_id] [int] NOT NULL,
	[first_name] [nvarchar](255) NULL,
	[last_name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[image_path] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/03/2024 1:16:11 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[is_admin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [cname]) VALUES (1, N'Iphone')
INSERT [dbo].[Category] ([category_id], [cname]) VALUES (2, N'Macbook')
INSERT [dbo].[Category] ([category_id], [cname]) VALUES (3, N'Ipad')
INSERT [dbo].[Category] ([category_id], [cname]) VALUES (4, N'Apple watch')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([color_id], [name]) VALUES (1, N'Red')
INSERT [dbo].[Color] ([color_id], [name]) VALUES (2, N'Black')
INSERT [dbo].[Color] ([color_id], [name]) VALUES (3, N'White')
INSERT [dbo].[Color] ([color_id], [name]) VALUES (4, N'Gold')
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1, 1, 13, 1, CAST(999.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (2, 1, 4, 1, CAST(999.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (3, 2, 13, 1, CAST(999.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (4, 2, 2, 1, CAST(1099.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (5, 2, 4, 1, CAST(999.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (6, 3, 31, 1, CAST(899.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (7, 3, 2, 1, CAST(1099.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (8, 3, 3, 1, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (9, 3, 17, 1, CAST(999.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (10, 4, 14, 1, CAST(1099.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (11, 4, 3, 1, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (12, 4, 1, 1, CAST(999.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (13, 5, 2, 1, CAST(1099.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (14, 6, 3, 1, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (15, 7, 12, 2, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (16, 7, 32, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (17, 8, 31, 2, CAST(899.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (18, 8, 4, 2, CAST(999.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (19, 8, 2, 1, CAST(1099.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (20, 8, 5, 1, CAST(1099.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (21, 9, 1, 1, CAST(999.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (22, 9, 3, 1, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (23, 10, 3, 1, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (24, 11, 16, 1, CAST(2400.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (25, 11, 4, 1, CAST(999.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1024, 1011, 32, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1025, 1011, 3, 1, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1026, 1012, 1, 1, CAST(999.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1027, 1013, 27, 1, CAST(1599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1028, 1013, 24, 1, CAST(699.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1029, 1014, 2, 1, CAST(1099.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1030, 1014, 32, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1031, 1015, 16, 1, CAST(2400.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1032, 1015, 3, 1, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1033, 1015, 24, 1, CAST(699.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1034, 1015, 31, 1, CAST(899.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1035, 1016, 18, 1, CAST(1499.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1036, 1016, 20, 1, CAST(1499.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1037, 1016, 28, 1, CAST(1299.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1038, 1017, 32, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1039, 1017, 30, 1, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1040, 1017, 15, 1, CAST(1699.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1041, 1018, 15, 1, CAST(1699.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1042, 1018, 3, 1, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1043, 1018, 26, 1, CAST(899.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1044, 1018, 6, 1, CAST(699.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1045, 1019, 27, 1, CAST(1599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1046, 1019, 23, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1047, 1019, 31, 1, CAST(899.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1048, 1020, 16, 1, CAST(2400.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1049, 1020, 4, 1, CAST(999.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1050, 1020, 29, 1, CAST(399.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1051, 1021, 22, 1, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1052, 1021, 25, 1, CAST(699.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1053, 1021, 33, 1, CAST(499.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1054, 1022, 24, 1, CAST(699.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1055, 1022, 31, 1, CAST(899.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1056, 1022, 13, 1, CAST(999.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1057, 1023, 18, 1, CAST(1499.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1058, 1023, 20, 1, CAST(1499.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1059, 1023, 29, 1, CAST(399.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1060, 1024, 22, 1, CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1061, 1024, 27, 1, CAST(1599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1062, 1024, 16, 1, CAST(2400.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1063, 1025, 27, 1, CAST(1599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1064, 1025, 8, 1, CAST(1099.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1065, 1025, 32, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1066, 1025, 15, 1, CAST(1699.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1067, 1026, 31, 1, CAST(899.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1068, 1026, 20, 1, CAST(1499.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1069, 1026, 19, 1, CAST(999.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1070, 1026, 9, 1, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1071, 1027, 16, 1, CAST(2400.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1072, 1027, 27, 1, CAST(1599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1073, 1027, 12, 1, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1074, 1028, 18, 1, CAST(1499.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1075, 1028, 14, 1, CAST(1099.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1076, 1028, 35, 1, CAST(349.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1077, 1029, 16, 1, CAST(2400.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1078, 1029, 14, 1, CAST(1099.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1079, 1029, 31, 1, CAST(899.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1080, 1029, 29, 1, CAST(399.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1081, 1029, 30, 1, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1082, 1030, 24, 1, CAST(699.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1083, 1030, 26, 1, CAST(899.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1084, 1031, 32, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1085, 1032, 3, 1, CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1086, 1033, 17, 1, CAST(999.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1087, 1034, 32, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1088, 1035, NULL, 1, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1089, 1036, NULL, 1, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1090, 1037, 32, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1091, 1038, 32, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1092, 1039, 32, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1093, 1040, 32, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1094, 1041, 14, 1, CAST(1099.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1095, 1042, 32, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1096, 1043, 32, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1097, 1047, 32, 1, CAST(599.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1098, 1048, 33, 1, CAST(499.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1099, 1049, 29, 1, CAST(900.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1100, 1050, 24, 1, CAST(699.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1101, 1051, 32, 1, CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1102, 1052, 29, 1, CAST(900.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1103, 1053, 18, 3, CAST(1499.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1104, 1054, 16, 1, CAST(2400.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1105, 1055, 31, 1, CAST(899.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price_per_unit]) VALUES (1106, 1056, 32, 1, CAST(599.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1, 2, CAST(N'2023-09-29T00:00:00.000' AS DateTime), CAST(1999.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (2, 2, CAST(N'2023-09-29T00:00:00.000' AS DateTime), CAST(3097.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (3, 2, CAST(N'2023-09-29T00:00:00.000' AS DateTime), CAST(3796.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (4, 2, CAST(N'2023-08-29T00:00:00.000' AS DateTime), CAST(2897.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (5, 2, CAST(N'2023-08-29T00:00:00.000' AS DateTime), CAST(1099.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (6, 3, CAST(N'2023-08-29T00:00:00.000' AS DateTime), CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (7, 3, CAST(N'2023-08-29T00:00:00.000' AS DateTime), CAST(2197.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (8, 3, CAST(N'2023-07-29T00:00:00.000' AS DateTime), CAST(5994.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (9, 3, CAST(N'2023-07-29T00:00:00.000' AS DateTime), CAST(1798.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (10, 3, CAST(N'2023-07-29T00:00:00.000' AS DateTime), CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (11, 4, CAST(N'2023-07-29T00:00:00.000' AS DateTime), CAST(3399.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1011, 4, CAST(N'2023-07-30T00:00:00.000' AS DateTime), CAST(1398.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1012, 4, CAST(N'2023-07-30T00:00:00.000' AS DateTime), CAST(999.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1013, 4, CAST(N'2023-06-30T00:00:00.000' AS DateTime), CAST(2298.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1014, 4, CAST(N'2023-06-30T00:00:00.000' AS DateTime), CAST(1698.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1015, 5, CAST(N'2023-06-30T00:00:00.000' AS DateTime), CAST(4797.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1016, 5, CAST(N'2023-06-30T00:00:00.000' AS DateTime), CAST(4297.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1017, 6, CAST(N'2023-06-30T00:00:00.000' AS DateTime), CAST(3097.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1018, 6, CAST(N'2023-06-30T00:00:00.000' AS DateTime), CAST(4096.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1019, 6, CAST(N'2023-05-30T00:00:00.000' AS DateTime), CAST(3097.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1020, 6, CAST(N'2023-05-30T00:00:00.000' AS DateTime), CAST(3798.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1021, 6, CAST(N'2023-05-30T00:00:00.000' AS DateTime), CAST(3198.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1022, 6, CAST(N'2023-10-30T00:00:00.000' AS DateTime), CAST(2597.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1023, 7, CAST(N'2023-10-30T00:00:00.000' AS DateTime), CAST(3397.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1024, 7, CAST(N'2023-10-30T00:00:00.000' AS DateTime), CAST(5999.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1025, 2, CAST(N'2023-10-30T00:00:00.000' AS DateTime), CAST(4996.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1026, 2, CAST(N'2023-10-30T00:00:00.000' AS DateTime), CAST(4196.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1027, 2, CAST(N'2023-10-30T00:00:00.000' AS DateTime), CAST(4798.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1028, 10, CAST(N'2023-10-30T00:00:00.000' AS DateTime), CAST(2947.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1029, 10, CAST(N'2023-08-30T00:00:00.000' AS DateTime), CAST(5596.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1030, 10, CAST(N'2023-10-30T00:00:00.000' AS DateTime), CAST(1598.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1031, 2, CAST(N'2023-10-30T00:00:00.000' AS DateTime), CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1032, 3, CAST(N'2023-10-30T00:00:00.000' AS DateTime), CAST(799.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1033, 4, CAST(N'2023-10-31T00:00:00.000' AS DateTime), CAST(999.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1034, 2, CAST(N'2023-10-31T00:00:00.000' AS DateTime), CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1035, 3, CAST(N'2023-10-31T00:00:00.000' AS DateTime), CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1036, 4, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1037, NULL, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1038, NULL, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1039, 2, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1040, 2, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1041, 2, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(1099.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1042, 2, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1043, 3, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1044, NULL, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1045, NULL, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1046, NULL, CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1047, 10, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1048, 10, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(499.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1049, 10, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(900.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1050, 10, CAST(N'2023-05-01T00:00:00.000' AS DateTime), CAST(699.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1051, 7, CAST(N'2023-07-01T00:00:00.000' AS DateTime), CAST(599.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1052, 10, CAST(N'2023-11-02T00:00:00.000' AS DateTime), CAST(900.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1053, 10, CAST(N'2023-11-02T00:00:00.000' AS DateTime), CAST(4497.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1054, 10, CAST(N'2024-01-13T00:00:00.000' AS DateTime), CAST(2400.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1055, 10, CAST(N'2024-01-27T00:00:00.000' AS DateTime), CAST(899.00 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_amount]) VALUES (1056, 10, CAST(N'2024-01-28T00:00:00.000' AS DateTime), CAST(599.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (1, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (1, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (1, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (1, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (2, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (2, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (2, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (2, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (3, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (3, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (3, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (3, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (4, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (4, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (4, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (4, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (5, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (5, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (5, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (5, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (6, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (6, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (6, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (6, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (7, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (7, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (7, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (7, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (8, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (8, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (8, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (8, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (9, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (9, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (9, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (9, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (10, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (10, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (10, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (10, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (11, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (11, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (11, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (11, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (12, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (12, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (12, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (12, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (13, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (13, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (13, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (13, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (14, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (14, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (14, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (14, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (15, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (15, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (15, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (15, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (16, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (16, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (16, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (16, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (17, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (17, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (17, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (17, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (18, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (18, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (18, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (18, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (19, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (19, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (19, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (19, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (20, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (20, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (20, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (20, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (21, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (21, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (21, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (21, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (22, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (22, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (22, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (22, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (23, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (23, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (23, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (23, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (24, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (24, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (24, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (24, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (25, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (25, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (25, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (25, 4)
GO
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (26, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (26, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (26, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (26, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (27, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (27, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (27, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (27, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (28, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (28, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (28, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (28, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (29, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (29, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (29, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (29, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (30, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (30, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (30, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (30, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (31, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (31, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (31, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (31, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (32, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (32, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (32, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (32, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (33, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (33, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (33, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (33, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (34, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (34, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (34, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (34, 4)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (35, 1)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (35, 2)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (35, 3)
INSERT [dbo].[ProductColor] ([product_id], [color_id]) VALUES (35, 4)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (1, N'iPhone 11 Pro', N'The high-end iPhone 11 Pro with triple-camera system and OLED display.', CAST(999.00 AS Decimal(10, 2)), CAST(N'2019-09-20' AS Date), 47, 1, N'https://cdn.hoanghamobile.com/i/preview/Uploads/2020/09/17/ip11_white.jpg', N'https://product.hstatic.net/1000406564/product/iphone11-t_aee18f9ee5c04fae8621c531089b9cf0_master.jpg', N'https://bizweb.dktcdn.net/100/310/135/products/iphone11-select-2019-family-jpeg-4f6abb75-8cd2-4803-a7ee-95821f0d5ea8.jpg?v=1631987796097')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (2, N'iPhone 11 Pro Max', N'The larger iPhone 11 Pro Max with triple-camera system and OLED display.', CAST(1099.00 AS Decimal(10, 2)), CAST(N'2019-09-20' AS Date), 25, 1, N'https://cdn.tgdd.vn/Products/Images/42/188705/iphone-11-pro-vang-600x600-200x200.jpg', N'https://nhatnammobile.com/wp-content/uploads/2023/02/11-pro-max_1612693328.jpg', N'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2020/10/14/844798/Iphone-11-Pro-Max.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (3, N'iPhone 12', N'A powerful smartphone with A14 Bionic chip and Super Retina XDR display.', CAST(799.00 AS Decimal(10, 2)), CAST(N'2020-10-13' AS Date), 91, 1, N'https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-tim-1-600x600.jpg', N'https://product.hstatic.net/1000016460/product/iphone-12-mini-select-2021_9cc6eb899b94489ab3e7f0bcb63bd0b2.jpeg', N'https://www.apple.com/newsroom/images/product/iphone/standard/apple_iphone-12-spring21_purple_04202021_big.jpg.large.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (4, N'iPhone 12 Pro', N'The high-end iPhone 12 Pro with triple-camera system and LiDAR.', CAST(999.00 AS Decimal(10, 2)), CAST(N'2020-10-13' AS Date), 44, 1, N'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-iphone-12-pro-blue-2020?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1635202834000', N'https://images.macrumors.com/t/fDhw-Ulp9OJsgEoRiN7X5E6510s=/1200x1200/smart/article-new/2020/10/iphone12progold.jpg', N'https://i.ebayimg.com/images/g/Su0AAOSwJr9lHFxj/s-l400.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (5, N'iPhone 12 Pro Max', N'The larger iPhone 12 Pro Max with triple-camera system and LiDAR.', CAST(1099.00 AS Decimal(10, 2)), CAST(N'2020-10-13' AS Date), 29, 1, N'https://cdn.tgdd.vn/Products/Images/42/213033/iphone-12-pro-max-xam-new-600x600-200x200.jpg', N'https://mobileworld.com.vn/uploads/product/brand/iphone-12-pro-max-128gb-256gb-512gb-trang-thien-long-mobile.jpg', N'https://mobileworld.com.vn/uploads/news/11_2022/iPhone%2012%20Pro%20Max.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (6, N'iPhone 13', N'The latest iPhone 13 with A15 Bionic chip and improved dual-camera system.', CAST(699.00 AS Decimal(10, 2)), CAST(N'2021-09-24' AS Date), 149, 1, N'https://cdn.hoanghamobile.com/i/preview/Uploads/2021/09/15/image-removebg-preview-12.png', N'https://images.moneycontrol.com/static-mcnews/2021/10/Apple-iPhone-13-4.jpg?impolicy=website&width=1600&height=900', N'https://cdn.viettelstore.vn/Images/Product/ProductImage/452166194.jpeg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (7, N'iPhone 13 Pro', N'The high-end iPhone 13 Pro with ProMotion display and advanced camera system.', CAST(999.00 AS Decimal(10, 2)), CAST(N'2021-09-24' AS Date), 100, 1, N'https://bizweb.dktcdn.net/100/116/615/products/iphone-13-pro-max-green-select-ac09ca2c-ff59-423a-858f-345a22f6d23f.png?v=1683739302423', N'https://cdn-img-v2.webbnc.net/uploadv2/web/82/8269/product/2021/10/26/04/45/1635234299_03_23_lifestyle_ecosystem_galaxyfold3_watch4classi.jpg', N'https://www.apple.com/newsroom/images/product/iphone/standard/Apple_iPhone-13-Pro_iPhone-13-Pro-Max_09142021_inline.jpg.large.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (8, N'iPhone 13 Pro Max', N'The larger iPhone 13 Pro Max with ProMotion display and advanced camera system.', CAST(1099.00 AS Decimal(10, 2)), CAST(N'2021-09-24' AS Date), 69, 1, N'https://smartviets.com/upload/ip%2013%20prm/apple_iphone_13_pro_max_128gb_oro_01_l.jpg', N'https://cdn-img-v2.webbnc.net/uploadv2/web/82/8269/product/2021/10/26/04/45/1635234299_03_23_lifestyle_ecosystem_galaxyfold3_watch4classi.jpg', N'https://cdn-v2.didongviet.vn/files/products/2023/3/26/1/1682495538648_iphone_13_pro_max_xanh_duong_didongviet.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (9, N'iPhone 14', N'The next-generation iPhone 14 with improved performance and features.', CAST(799.00 AS Decimal(10, 2)), CAST(N'2022-10-14' AS Date), 199, 1, N'https://cdn-v2.didongviet.vn/files/media/catalog/product/i/p/iphone-14-128gb-mau-tim-1-didongviet.jpg', N'https://img.websosanh.vn/v2/users/root_product/images/dien-thoai-iphone-14/kvvhcjys7qkik.jpg', N'https://media.wired.com/photos/6332360740fe1e8870aa3bc0/master/pass/iPhone-14-Review-Gear.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (10, N'iPhone 14 Pro', N'The high-end iPhone 14 Pro with advanced camera technology and more.', CAST(999.00 AS Decimal(10, 2)), CAST(N'2022-10-14' AS Date), 150, 1, N'https://media-ik.croma.com/prod/https://media.croma.com/image/upload/v1662703105/Croma%20Assets/Communication/Mobiles/Images/261963_oqrd6j.png?tr=w-600', N'https://mobileworld.com.vn/uploads/news/09_2022/iphone-14-check-out-what-is-new-in-apples-new-phone.jpg', N'https://cdn.xtmobile.vn/vnt_upload/news/05_2023/30/So-sanh-iphone-14-pro-max-quoc-te-va-chinh-hang-vn-a-nen-mua-ban-nao-xtmobile.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (11, N'iPhone 14 Pro Max', N'The larger iPhone 14 Pro Max with advanced camera technology and more.', CAST(1099.00 AS Decimal(10, 2)), CAST(N'2022-10-14' AS Date), 100, 1, N'https://m.media-amazon.com/images/I/51GZNF-UxFL.jpg', N'https://mobileworld.com.vn/uploads/news/09_2022/iphone-14-check-out-what-is-new-in-apples-new-phone.jpg', N'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2023/2/14/1147651/Screen-Shot-2023-02--01.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (12, N'iPhone 15', N'The latest iPhone 15 with even more advanced features and performance.', CAST(799.00 AS Decimal(10, 2)), CAST(N'2023-09-15' AS Date), 197, 1, N'https://www.apple.com/newsroom/images/2023/09/apple-debuts-iphone-15-and-iphone-15-plus/article/Apple-iPhone-15-lineup-hero-230912_inline.jpg.large.jpg', N'https://akm-img-a-in.tosshub.com/indiatoday/images/media_bank/202309/iphone-15-084541573-16x9_0.png?VersionId=pRutG6KiIBL2acG2uAAUgRABAsECOi4k&size=690:388', N'https://www.cnet.com/a/img/resize/71701e7c6d9b94a8ec44c4e9610106a49c05e468/hub/2022/12/16/eb02a6aa-f331-4fbe-9e5f-35efd2198f8d/p1002240-1.jpg?auto=webp&fit=crop&height=900&width=1200')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (13, N'iPhone 15 Pro', N'The high-end iPhone 15 Pro with exceptional camera capabilities and more.', CAST(999.00 AS Decimal(10, 2)), CAST(N'2023-09-15' AS Date), 147, 1, N'https://shopdunk.com/images/thumbs/0020316_iphone-15-pro-512gb.webp', N'https://images.macrumors.com/t/SuHt0iQuSjaO-ExOZzJieONGf_I=/2500x/article-new/2023/09/iPhone-15-Pro-Lineup-Feature.jpg', N'https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-blue-thumbnew-600x600.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (14, N'iPhone 15 Pro Max', N'The larger iPhone 15 Pro Max with exceptional camera capabilities and more.', CAST(1099.00 AS Decimal(10, 2)), CAST(N'2023-09-15' AS Date), 96, 1, N'https://thegioialo.vn/wp-content/uploads/2023/09/iphone-15-pro-max-blue.jpg', N'https://images.macrumors.com/t/SuHt0iQuSjaO-ExOZzJieONGf_I=/2500x/article-new/2023/09/iPhone-15-Pro-Lineup-Feature.jpg', N'https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-blue-thumbnew-600x600.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (15, N'Macbook Air 2023', N'The sleek Macbook Air with Retina display.', CAST(1699.00 AS Decimal(10, 2)), CAST(N'2023-11-07' AS Date), 47, 2, N'https://www.apple.com/newsroom/images/live-action/wwdc-2023/standard/macbook-air-15-in/Apple-WWDC23-MacBook-Air-15-in-hero-230605.jpg.og.jpg?202310101746', N'https://shopdunk.com/images/thumbs/0018755_thong-so-macbook-air-15-inch-2023_1600.jpeg', N'https://i.rtings.com/assets/products/LoQhXCms/apple-macbook-air-15-2023/design-medium.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (16, N'Macbook Pro M2', N'The powerful Macbook Pro with Touch Bar and Retina display.', CAST(2400.00 AS Decimal(10, 2)), CAST(N'2023-11-07' AS Date), 23, 2, N'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mbp14-spacegray-select-202301?wid=4000&hei=2422&fmt=jpeg&qlt=90&.v=1671304673229', N'https://minhtuanmobile.com/uploads/editer/images/macbook-pro-m2-2022-minhtuanmobile2.jpeg', N'https://www.apple.com/newsroom/images/product/mac/standard/Apple-MacBook-Pro-M2-Pro-and-M2-Max-hero-230117.jpg.og.jpg?202310101641')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (17, N'Macbook Air 2019', N'The sleek Macbook Air with Retina display.', CAST(999.00 AS Decimal(10, 2)), CAST(N'2019-07-09' AS Date), 48, 2, N'https://cdn.mos.cms.futurecdn.net/HvjfsxzQHCZxpUYTVgyBDM.jpg', N'https://m.media-amazon.com/images/I/51O8E51WxxL.jpg', N'https://cdn.tgdd.vn/Products/Images/44/207682/apple-macbook-air-2019-i5-16ghz-8gb-128gb-mvfm2sa-13-32-600x600.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (18, N'Macbook Pro 2023', N'The powerful Macbook Pro with Touch Bar and Retina display.', CAST(1499.00 AS Decimal(10, 2)), CAST(N'2023-07-09' AS Date), 24, 2, N'https://www.apple.com/newsroom/images/product/mac/standard/Apple-MacBook-Pro-M2-Pro-and-M2-Max-hero-230117_Full-Bleed-Image.jpg.large.jpg', N'https://media.cnn.com/api/v1/images/stellar/prod/230125131405-macbook-pro-14-inch-2023-review-cnnu-7.jpg?c=original', N'https://cdn.vox-cdn.com/thumbor/TLh0-T33GJnR4Qf_VKQXjFFxCbw=/0x0:2040x1360/2040x1360/filters:focal(1020x680:1021x681)/cdn.vox-cdn.com/uploads/chorus_asset/file/24371426/236492_MacBook_Pro_16__2023__AKrales_0009.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (19, N'Macbook Air 2021', N'The sleek and powerful Macbook Air with M2 chip and Retina display.', CAST(999.00 AS Decimal(10, 2)), CAST(N'2021-03-18' AS Date), 49, 2, N'https://img.websosanh.vn/v2/users/review/images/web29xkvieg0f.jpg?compress=85', N'https://assets-prd.ignimgs.com/2021/01/27/m1-macbook-air-4-1611791801127.jpeg', N'https://media.cnn.com/api/v1/images/stellar/prod/201116214842-13-macbook-air-review-silicon-underscoredjpg.jpg?q=x_0,y_41,h_1471,w_2615,c_crop/h_720,w_1280')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (20, N'Macbook Pro 2021', N'The high-performance Macbook Pro with M1 Pro/Max chip and advanced features.', CAST(1499.00 AS Decimal(10, 2)), CAST(N'2021-10-18' AS Date), 27, 2, N'https://www.digitaltrends.com/wp-content/uploads/2021/11/macbook-pro-2021-01.jpg?p=1', N'https://www.cnet.com/a/img/resize/c55c6e326fb3b056fdd91232d41d3bbd1ddecc1c/hub/2021/10/23/3f7efb9e-d587-45ff-a0a8-056d81bc102e/macbook-pro-2021-cnet-review-21.jpg?auto=webp&fit=crop&height=675&width=1200', N'https://cdn.mos.cms.futurecdn.net/EyYgyZa5ktC9tLjhxr3ZwE.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (21, N'Macbook Air 2022', N'The sleek and powerful Macbook Air with M3 chip and Retina display.', CAST(1099.00 AS Decimal(10, 2)), CAST(N'2022-04-15' AS Date), 40, 2, N'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-midnight-select-20220606?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1653084303665', N'https://anphat.com.vn/media/news/0706_m2color.jpg', N'https://techland.com.vn/wp-content/uploads/2022/07/macbook-air-starlight-gallery2-20220606_GEO_US.jpeg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (22, N'Macbook Pro 2022', N'The high-performance Macbook Pro with M2 Pro/Max chip and advanced features.', CAST(2000.00 AS Decimal(10, 2)), CAST(N'2022-11-20' AS Date), 23, 2, N'https://cdn.tgdd.vn/Files/2022/09/19/1470683/thumb.jpg', N'https://bizweb.dktcdn.net/100/458/805/products/mbp-spacegray-select-202206-jpeg.jpg?v=1690446857270', N'https://mac24h.vn/images/thumbnails/500/500/detailed/49/Macbook_Pro_M2.png?t=1654688116')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (23, N'iPad 2021', N'The latest iPad with A13 Bionic chip and stunning Retina display.', CAST(599.00 AS Decimal(10, 2)), CAST(N'2021-09-14' AS Date), 99, 3, N'https://www.apple.com/newsroom/images/product/ipad/standard/apple_ipad-pro-spring21_hero_04202021_big.jpg.large.jpg', N'https://onewaymobile.vn/images/products/2021/05/30/original/ipad-pro-m1-11-_1622345251-copy-copy-copy.png', N'https://cdn.sforum.vn/sforum/wp-content/uploads/2022/09/iPad-10.2-2021-review-same-old-same-gold.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (24, N'iPad mini 2022', N'The latest iPad with A13 Bionic chip and stunning Retina display.', CAST(699.00 AS Decimal(10, 2)), CAST(N'2022-09-14' AS Date), 95, 3, N'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1640010115-9505908_R_Z001A.jpg?crop=1xw:1xh;center,top&resize=980:*', N'https://svstore.vn/uploads/source/ipad-mini-5/ipad-mini-select-202109.jpg', N'https://hips.hearstapps.com/hmg-prod/images/gettyimages-1344395550.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (25, N'iPad Pro 2022', N'The latest iPad with A13 Bionic chip and stunning Retina display.', CAST(699.00 AS Decimal(10, 2)), CAST(N'2022-10-14' AS Date), 99, 3, N'https://media.wired.com/photos/635af3bc3c668b3d581922c6/3:2/w_2400,h_1600,c_limit/iPad-Pro-2022-Gear.jpg', N'https://cdn.mos.cms.futurecdn.net/JGnbU9b4SeRgaWcbDGThFL.jpg', N'https://cdn.arstechnica.net/wp-content/uploads/2022/10/iPad_front.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (26, N'iPad Air 5', N'The latest iPad with A13 Bionic chip and stunning Retina display.', CAST(899.00 AS Decimal(10, 2)), CAST(N'2022-09-14' AS Date), 98, 3, N'https://www.nhataostore.com/Content/Images/SanPham/iPad%20Air%205%20(2022)%20M1%2010.9-inch%20Wifi%20256GB%20-%20LLA%20Tr%E1%BA%AFng.JPG', N'https://product.hstatic.net/200000348419/product/ipad_air_5_wifi_chinh_hang_47567c8eed43443a99495769989ea83f_master.png', N'https://file.hstatic.net/200000144777/article/1_148980b6d7284a52973cb4a0812d9e27_1024x1024.png')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (27, N'iPad Pro 12.9', N'TThe 10th generation iPad with A10 Fusion chip and Retina display.', CAST(1599.00 AS Decimal(10, 2)), CAST(N'2022-09-14' AS Date), 95, 3, N'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-ipad-pro-12-wifi-spacegray-2021?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1674663706569', N'https://www.digitaltrends.com/wp-content/uploads/2021/05/apple-ipad-pro-2021-2.jpg?p=1', N'https://product.hstatic.net/1000283534/product/maubac_1_77a016e15dc1433d87fc9f8f9aac2bfe.png')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (28, N'iPad Pro 11', N'The 9th generation iPad with A10 Fusion chip and Retina display.', CAST(1299.00 AS Decimal(10, 2)), CAST(N'2021-09-10' AS Date), 79, 3, N'https://gaumobile.com/images/products/2022/05/06/original/ipad-pro-11-select-cell-silver-202104_1651835926.jpg', N'https://cdn.sforum.vn/sforum/wp-content/uploads/2023/04/danh-gia-ipad-pro-m1-1.jpg', N'https://www.zdnet.com/a/img/resize/4a24376c2e28381ae1f1f6023fcc089cd2432afb/2023/01/20/7c86c0d1-62be-4c54-babf-85a5a5d0c87e/ipad-pro-11-next-to-ipad-pro-12-9.jpg?auto=webp&fit=crop&height=1200&width=1200')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (29, N'Apple Watch SE', N'The Apple Watch SE with larger display and ECG capabilities.', CAST(900.00 AS Decimal(10, 2)), CAST(N'2022-09-21' AS Date), 75, 4, N'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MT3D3ref_VW_34FR+watch-case-44-aluminum-midnight-nc-se_VW_34FR+watch-face-44-aluminum-midnight-se_VW_34FR?wid=2000&hei=2000&fmt=png-alpha&.v=1694507496485', N'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/se-case-unselect-gallery-1-202309_FMT_WHH?wid=752&hei=720&fmt=p-jpg&qlt=80&.v=1692943833392', N'https://www.apple.com/v/apple-watch-se/m/images/overview/hero/hero__d5yx0jn6usae_large.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (30, N'Apple Watch Ultra', N'The Apple Watch Ultra with larger display and ECG capabilities.', CAST(799.00 AS Decimal(10, 2)), CAST(N'2022-09-21' AS Date), 78, 4, N'https://images.fpt.shop/unsafe/fit-in/800x800/filters:quality(5):fill(white)/fptshop.com.vn/Uploads/Originals/2022/9/8/637982457565218496_apple-watch-ultra-49mm-alpine-loop-cam-dd.jpg', N'https://www.apple.com/newsroom/images/product/watch/standard/Apple-Watch-Ultra-3up-hero-220907.jpg.news_app_ed.jpg', N'https://futureworld.com.vn/media/catalog/product/cache/4dbf4504e0d2fdef53ffcd9886d02b04/v/n/vn_apple_watch_ultra_cell_49mm_titanium_midnight_ocean_band_pdp_image_position-1.jpg')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (31, N'Apple Watch Ultra 2', N'The Apple Watch Ultra 2 with larger display and ECG capabilities.', CAST(899.00 AS Decimal(10, 2)), CAST(N'2023-09-21' AS Date), 71, 4, N'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MT5W3ref_VW_34FR+watch-49-titanium-ultra2_VW_34FR+watch-face-49-trail-ultra2_VW_34FR?wid=2000&hei=2000&fmt=png-alpha&.v=1694507270905', N'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ultra-band-unselect-gallery-1-202309?wid=5120&hei=3280&fmt=p-jpg&qlt=80&.v=1693544686346', N'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MT5J3ref_VW_34FR+watch-49-titanium-ultra2_VW_34FR+watch-face-49-alpine-ultra2_VW_34FR?wid=2000&hei=2000&fmt=png-alpha&.v=1694507270905')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (32, N'Apple Watch Series 9', N'The Apple Watch Series 9 with larger display and ECG capabilities.', CAST(599.00 AS Decimal(10, 2)), CAST(N'2023-09-21' AS Date), 64, 4, N'https://www.apple.com/v/apple-watch-series-9/b/images/overview/chip/close-up_endframe__9woalcec7wiy_large.jpg', N'https://www.apple.com/newsroom/images/2023/09/apple-introduces-the-advanced-new-apple-watch-series-9/article/Apple-Watch-S9-carbon-neutral-lineup-230912_big.jpg.large.jpg', N'https://www.apple.com/vn/apple-watch-series-9/images/meta/watch_series_9_gps_lte__c1wax4zkgf42_og.png')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (33, N'Apple Watch Series 8', N'The Apple Watch Series 8 with larger display and ECG capabilities.', CAST(499.00 AS Decimal(10, 2)), CAST(N'2022-09-21' AS Date), 78, 4, N'https://bachlongmobile.com/media/catalog/product/cache/2/image/040ec09b1e35df139433887a97daa66f/a/p/apple-watch-s8-41mm-trang-kem-thumbtz-650x650.png', N'https://imgs.viettelstore.vn/Images/Product/ProductImage/dong-ho-thong-minh/Apple/Apple%20Watch%20Series%208%20GPS%2045mm/Apple-Watch-Series-8-GPS-45mm-1.jpg', N'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/HQWU2?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1681150923637')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (34, N'Apple Watch Series 7', N'The Apple Watch Series 7 with larger display and ECG capabilities.', CAST(400.00 AS Decimal(10, 2)), CAST(N'2021-09-21' AS Date), 80, 4, N'https://didongthongminh.vn/upload_images/images/products/apple-watch-series-7/original/Apple_Watch_Series_7_Cell_45mm_Starlight_Aluminum_Starlight_Sport_Band_PDP_Image_Position-1__VN_1665855475_1.jpg', N'https://www.apple.com/newsroom/images/product/watch/standard/Apple_watch-series7_hero_09142021_big.jpg.large.jpg', N'https://product.hstatic.net/200000348419/product/apple_watch_series_7_cellular_mat_thep_day_stainless_76a343c8fe9b42afa30334bec0863cfc_master.png')
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [release_date], [Quantity], [c_id], [url_img], [url_img2], [url_img3]) VALUES (35, N'Apple Watch Series 6', N'The Apple Watch Series 6 with Always-On Retina display and built-in compass.', CAST(349.00 AS Decimal(10, 2)), CAST(N'2020-09-20' AS Date), 69, 4, N'https://www.trumiwatch.vn/wp-content/uploads/2020/12/Apple-Watch-Series-6-Gold-F.jpg', N'https://tanvienthanh.com/wp-content/uploads/2019/09/a1-7852-1600198375.jpg', N'https://www.trumiwatch.vn/wp-content/uploads/2020/12/Apple-Watch-Series-6-Blue-F.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (1, N'5.8 inches', N'A13 Bionic', N'4 GB', N'64 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (2, N'6.5 inches', N'A13 Bionic', N'4 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (3, N'6.1 inches', N'A14 Bionic', N'6 GB', N'128 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (4, N'6.3 inches', N'A14 Bionic', N'6 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (5, N'6.5 inches', N'A14 Bionic', N'6 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (6, N'6.1 inches', N'A15 Bionic', N'6 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (7, N'6.5 inches', N'A15 Bionic', N'6 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (8, N'6.7 inches', N'A15 Bionic', N'6 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (9, N'6.1 inches', N'A16 Bionic', N'6 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (10, N'6.5 inches', N'A16 Bionic', N'6 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (11, N'6.7 inches', N'A16 Bionic', N'6 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (12, N'6.1 inches', N'A17 Bionic', N'6 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (13, N'6.5 inches', N'A17 Bionic', N'6 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (14, N'6.7 inches', N'A17 Bionic', N'6 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (15, N'15.4 inches', N'Apple M2', N'8 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (16, N'13.3 inch, 2560 x 1600 Pixels, OLED', N'Apple M2', N'8 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (17, N'13.3 inch, 2.560 x 1.600 Retina True', N'1.6GHz Intel Core i5-8210Y', N'8 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (18, N'14.2 inch, 3024 x 1964 Pixels, OLED', N'Apple M2 Pro, 10-Core', N'16 GB', N'512 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (19, N'15.4 inches.', N'Apple M2 Pro, 10-Core', N'16 GB', N'512 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (20, N'14.2 inch, 3024 x 1964 Pixels, OLED', N'Apple M2 Pro, 10-Core', N'16 GB', N'512 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (21, N'15.4 inches.', N'Apple M2 Pro, 10-Core', N'16 GB', N'512 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (22, N'14.2 inch, 3024 x 1964 Pixels, OLED', N'Apple M2 Pro, 10-Core', N'16 GB', N'512 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (23, N'11 inches', N'Apple M1, 8-Core', N'8 GB', N'128 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (24, N'11 inches', N'Apple M1, 8-Core', N'8 GB', N'128 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (25, N'11 inches', N'Apple M1, 8-Core', N'8 GB', N'128 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (26, N'11 inches', N'Apple M1, 8-Core', N'8 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (27, N'12.9 inches', N'Apple M1, 8-Core', N'8 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (28, N'11 inches', N'Apple M1, 8-Core', N'8 GB', N'256 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (29, N'1.78 inches', N'Apple S5', N'4 GB', N'32 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (30, N'1.78 inches', N'Apple S8', N'8 GB', N'64 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (31, N'1.78 inches', N'Apple S9', N'8 GB', N'64 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (32, N'1.78 inches', N'Apple S7', N'6 GB', N'64 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (33, N'1.78 inches', N'Apple S6', N'6 GB', N'32 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (34, N'1.78 inches', N'Apple S8', N'8 GB', N'32 GB')
INSERT [dbo].[ProductSpecifications] ([product_id], [screen_size], [cpu], [ram], [storage_capacity]) VALUES (35, N'1.78 inches', N'Apple S8', N'8 GB', N'32 GB')
GO
INSERT [dbo].[UserDetails] ([user_id], [first_name], [last_name], [email], [phone], [address], [image_path]) VALUES (1, N'huy ', N'Hoang', N'hello@gmail.com', N'0964162443', N'hai duong', NULL)
INSERT [dbo].[UserDetails] ([user_id], [first_name], [last_name], [email], [phone], [address], [image_path]) VALUES (2, N'Gau', N'Fubao', N'mihtuan199xxx@gmail.com', N'0964123123', N'vinh', NULL)
INSERT [dbo].[UserDetails] ([user_id], [first_name], [last_name], [email], [phone], [address], [image_path]) VALUES (3, N'huy', N'hoang', N'fcbatbai11@gmail.com', N'0876356721', N'hue', NULL)
INSERT [dbo].[UserDetails] ([user_id], [first_name], [last_name], [email], [phone], [address], [image_path]) VALUES (4, N'phi', N'hong', N'zzzasd@gmail.com', N'0123876324', N'sai gon', NULL)
INSERT [dbo].[UserDetails] ([user_id], [first_name], [last_name], [email], [phone], [address], [image_path]) VALUES (5, N'nguoi', N'dung', N'user@gmail.com', N'0765412311', N'da nang', NULL)
INSERT [dbo].[UserDetails] ([user_id], [first_name], [last_name], [email], [phone], [address], [image_path]) VALUES (6, N'huy', N'kim', N'huy123@gmail.com', N'0847651321', N'ha noi', NULL)
INSERT [dbo].[UserDetails] ([user_id], [first_name], [last_name], [email], [phone], [address], [image_path]) VALUES (7, N'', N'', N'mihtuan199xxx@gmail.com', N'', N'', NULL)
INSERT [dbo].[UserDetails] ([user_id], [first_name], [last_name], [email], [phone], [address], [image_path]) VALUES (10, N'gau', N'fubao 1', N'mihtuan199xxx@gmail.com', N'098717623871', N'da nang', NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [password], [is_admin]) VALUES (1, N'admin', N'123', 1)
INSERT [dbo].[Users] ([user_id], [username], [password], [is_admin]) VALUES (2, N'fubao', N'12345', 0)
INSERT [dbo].[Users] ([user_id], [username], [password], [is_admin]) VALUES (3, N'sa', N'1', 0)
INSERT [dbo].[Users] ([user_id], [username], [password], [is_admin]) VALUES (4, N'hongpro', N'12345', 0)
INSERT [dbo].[Users] ([user_id], [username], [password], [is_admin]) VALUES (5, N'user', N'123', 0)
INSERT [dbo].[Users] ([user_id], [username], [password], [is_admin]) VALUES (6, N'huy', N'1234', 0)
INSERT [dbo].[Users] ([user_id], [username], [password], [is_admin]) VALUES (7, N'zzz', N'1', 0)
INSERT [dbo].[Users] ([user_id], [username], [password], [is_admin]) VALUES (10, N'gau fubao', N'12345', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD FOREIGN KEY([color_id])
REFERENCES [dbo].[Color] ([color_id])
GO
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([c_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[ProductSpecifications]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
USE [master]
GO
ALTER DATABASE [project] SET  READ_WRITE 
GO
