USE [master]
GO
/****** Object:  Database [ecommerce]    Script Date: 30/05/2017 03:23:56 ******/
CREATE DATABASE [ecommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eCommerceDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\eCommerceDB.mdf' , SIZE = 3328KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'eCommerceDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\eCommerceDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ecommerce] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ecommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ecommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ecommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ecommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ecommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [ecommerce] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ecommerce] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ecommerce] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [ecommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ecommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ecommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ecommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ecommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ecommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ecommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ecommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ecommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ecommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ecommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ecommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ecommerce] SET  MULTI_USER 
GO
ALTER DATABASE [ecommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ecommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ecommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ecommerce] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ecommerce]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 30/05/2017 03:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 30/05/2017 03:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](255) NOT NULL,
	[CategoryDescription] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 30/05/2017 03:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](255) NOT NULL,
	[sex] [varchar](10) NULL,
	[UserName] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Address] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[ContactNumber] [varchar](15) NOT NULL,
	[UserType] [varchar](10) NOT NULL DEFAULT ('customer'),
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 30/05/2017 03:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[FeatureID] [int] IDENTITY(1,1) NOT NULL,
	[MetaFeatureID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[FeatureDescription] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MetaFeature]    Script Date: 30/05/2017 03:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetaFeature](
	[MetaFeatureID] [int] IDENTITY(1,1) NOT NULL,
	[FeatureName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MetaFeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 30/05/2017 03:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[DateOrdered] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 30/05/2017 03:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ProductDescription] [text] NULL,
	[ProductImageURL] [varchar](255) NULL,
	[ProductPrice] [decimal](18, 2) NOT NULL,
	[Discount] [int] NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK__Product__B40CC6ED2E1BDC42] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductOrderStatus]    Script Date: 30/05/2017 03:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOrderStatus](
	[ProductOrderStatusId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductOrderStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Review]    Script Date: 30/05/2017 03:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Rating] [int] NULL,
	[ReviewTitle] [nvarchar](500) NOT NULL,
	[ReviewDescription] [text] NOT NULL,
	[ReviewDate] [date] NOT NULL,
 CONSTRAINT [PK__Review__74BC79AE46E78A0C] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 30/05/2017 03:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartID], [CustomerID], [ProductID], [Quantity]) VALUES (61, 7, 17, 1)
INSERT [dbo].[Cart] ([CartID], [CustomerID], [ProductID], [Quantity]) VALUES (66, 1, 12, 1)
INSERT [dbo].[Cart] ([CartID], [CustomerID], [ProductID], [Quantity]) VALUES (1066, 1, 18, 1)
INSERT [dbo].[Cart] ([CartID], [CustomerID], [ProductID], [Quantity]) VALUES (1067, 1, 35, 1)
INSERT [dbo].[Cart] ([CartID], [CustomerID], [ProductID], [Quantity]) VALUES (1068, 1, 26, 1)
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (1, N'Mobile', N'This category contains mobile phones')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (2, N'Laptop', N'Laptops are in this category')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (3, N'Clothes', N'Shirts , T Shirts and wearables.')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (4, N'Books', N'Buy latest books from here')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (5, N'Watch', N'Get latest watches')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (6, N'Game', N'All the triple A games are available plus more')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (7, N'Tablet', N'Ipads, Nexus7 and many more')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (8, N'Camera', N'Great deals on cameras')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDescription]) VALUES (9, N'Footwear', N'Buy stylish footwears')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [sex], [UserName], [Password], [Address], [email], [ContactNumber], [UserType]) VALUES (1, N'Gaurav Butola', N'Male', N'GauravButola', N'mypass', N'123, abc road, New Delhi', N'gaurav@butola.com', N'4444444444', N'admin')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [sex], [UserName], [Password], [Address], [email], [ContactNumber], [UserType]) VALUES (6, N'Himanshu Aggarwal', N'Male', N'himanshu', N'him', N'123, Race course,New Delhi - 110003,Delhi', N'yehhhimanshu@gmail.com', N'9999999999', N'customer')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [sex], [UserName], [Password], [Address], [email], [ContactNumber], [UserType]) VALUES (7, N'Gurmeet Singh Rana', N'Male', N'gurmeet', N'rana', N'457, badarpur,
New Delhi - 110003,
Delhi', N'gurmeet@gmail.com', N'8888888888', N'customer')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [sex], [UserName], [Password], [Address], [email], [ContactNumber], [UserType]) VALUES (10, N'Ankit Rawat', N'Male', N'Ankit', N'ankit', N'456 road, abc street,
Chennai, India.', N'ankit@gmail.com', N'5656985458', N'customer')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [sex], [UserName], [Password], [Address], [email], [ContactNumber], [UserType]) VALUES (11, N'ahad', N'Male', N'ahad001', N'123456', N'hthyjnhnnhjm ', N'aha@y.com', N'090078601', N'customer')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [sex], [UserName], [Password], [Address], [email], [ContactNumber], [UserType]) VALUES (12, N'ali', N'Male', N'ali', N'ali', N's', N'ali@dd.com', N'777', N'customer')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Feature] ON 

INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (9, 1, 10, N'Samsung')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (10, 5, 10, N'No')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (12, 6, 10, N'Yes')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (13, 1, 29, N'Rockstar')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (14, 7, 29, N'18GB')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (15, 4, 29, N'1.5')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (17, 8, 29, N'Windows Vista (plus Service Pack 1), Windows XP')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (18, 9, 30, N'Rockstar Games')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (19, 4, 30, N'1GB')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (20, 8, 30, N'Windows Vista (plus Service Pack 1), Windows XP')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (21, 7, 30, N'16 Gb')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (22, 1, 31, N'Asus ')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (23, 5, 31, N'Yes')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (24, 6, 31, N'Yes')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (25, 8, 31, N'Android')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (26, 3, 31, N'1.2MB')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (27, 10, 31, N'7 Inch')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (28, 11, 31, N'Yes')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (29, 12, 32, N'Point & Shoot')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (30, 13, 32, N'Strap Color')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (31, 14, 32, N'49.5 mm')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (32, 1, 32, N'Casio')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (33, 1, 33, N'Fastrack')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (34, 15, 33, N'Round')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (35, 16, 33, N'Grey Numbers')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (36, 1, 34, N'Sony')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (37, 17, 34, N'21x')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (38, 18, 34, N'3 Inch')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (39, 1, 35, N'Sony')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (40, 2, 35, N'Black')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (41, 19, 35, N'Cyber-shot')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (42, 1, 36, N'Puma')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (43, 2, 36, N'White')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (44, 20, 36, N'515 gm')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (45, 1, 11, N'Acer')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (46, 2, 11, N'Black')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (47, 7, 11, N'500GB')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (48, 8, 11, N'Ubuntu Linux')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (49, 10, 11, N'15.6 Inch')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (50, 1, 12, N'Micromax')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (51, 4, 12, N'1 GB')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (52, 5, 12, N'Yes')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (53, 18, 12, N'5 Inch')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (54, 3, 12, N'2 MP')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (55, 11, 12, N'Yes')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (56, 2, 12, N'Black')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (57, 1, 13, N'Apple')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (58, 1, 17, N'United Colors of benetton')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (59, 21, 27, N'600')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (60, 21, 18, N'562')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (61, 21, 21, N'567')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (62, 1, 14, N'LG')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (63, 5, 14, N'Yes')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (64, 1, 26, N'Wrangler')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (65, 9, 24, N'Apress')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (66, 1, 23, N'Levi''s')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (67, 1, 28, N'Dell')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (68, 22, 37, N'10')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (69, 23, 11, N'2')
INSERT [dbo].[Feature] ([FeatureID], [MetaFeatureID], [ProductID], [FeatureDescription]) VALUES (70, 20, 38, N'ss')
SET IDENTITY_INSERT [dbo].[Feature] OFF
SET IDENTITY_INSERT [dbo].[MetaFeature] ON 

INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (1, N'Brand')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (2, N'Colour')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (3, N'Camera')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (4, N'RAM')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (5, N'3G')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (6, N'WiFi')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (7, N'Hard Disk')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (8, N'Operating System')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (9, N'Publisher')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (10, N'Screen')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (11, N'Touchscreen')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (12, N'Type')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (13, N'Strap Material')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (14, N'Diameter')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (15, N'Dial Shape')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (16, N'Other Body Features')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (17, N'Optical Zoom')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (18, N'Screen Size')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (19, N'Series')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (20, N'Weight')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (21, N'Number of Pages')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (22, N'Thickness')
INSERT [dbo].[MetaFeature] ([MetaFeatureID], [FeatureName]) VALUES (23, N'a')
SET IDENTITY_INSERT [dbo].[MetaFeature] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [CustomerID], [ProductID], [DateOrdered]) VALUES (2, 1, 12, CAST(N'2013-10-16' AS Date))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [ProductID], [DateOrdered]) VALUES (3, 1, 21, CAST(N'2013-10-16' AS Date))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [ProductID], [DateOrdered]) VALUES (4, 1, 18, CAST(N'2013-10-16' AS Date))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [ProductID], [DateOrdered]) VALUES (5, 1, 24, CAST(N'2013-10-16' AS Date))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [ProductID], [DateOrdered]) VALUES (6, 1, 18, CAST(N'2013-10-16' AS Date))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [ProductID], [DateOrdered]) VALUES (7, 1, 11, CAST(N'2013-10-16' AS Date))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [ProductID], [DateOrdered]) VALUES (8, 1, 31, CAST(N'2013-10-18' AS Date))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [ProductID], [DateOrdered]) VALUES (9, 1, 17, CAST(N'2013-10-18' AS Date))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [ProductID], [DateOrdered]) VALUES (10, 1, 31, CAST(N'2013-10-18' AS Date))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [ProductID], [DateOrdered]) VALUES (11, 1, 10, CAST(N'2013-10-18' AS Date))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [ProductID], [DateOrdered]) VALUES (12, 1, 27, CAST(N'2013-10-18' AS Date))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [ProductID], [DateOrdered]) VALUES (13, 7, 28, CAST(N'2013-10-18' AS Date))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [ProductID], [DateOrdered]) VALUES (14, 7, 26, CAST(N'2013-10-18' AS Date))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [ProductID], [DateOrdered]) VALUES (15, 7, 10, CAST(N'2013-10-18' AS Date))
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (10, N'Samsung Grand', N'The Galaxy just got a little better with the Grand Duos released by Samsung. The phone is mainly targeted at the Indian Smart Phone market since we are increasingly become Dual Connection users. Camera Specifics It comes with a powerful 8 MP Camera in the rear and a high quality 2 MP secondary camera. It is also capable of Full HD Recording. Expansive Storage The Samsung Galaxy Grand Duos supports an expandable memory storage of up to 64 GB with the help of compatible memory cards. Operating System The phone runs on the latest Android v4.1 Jelly Bean Operating System. Peek-a-Do With Samsung’s Multi Window Viewing capability, you can use more than one app at the same time, being able to see both windows side by side.', N'~\Site_data\product_images\grand.jpg', CAST(18000.00 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (11, N'Acer Laptop', N'Laptops meant for everyday use are usually preferred by people over other types as they are tuned for a wide range of performance. Intel 2nd Gen Pentium Dual Core Processor The second generation dual core Intel Processor clocks in at 2.2 GHz which is fast enough for your everyday processes. Intel Mobile HM70 Express Chipset The steadiness of the Intel Mobile chipset on offer with this model is highly noted among power users for its stability and ease of availability. 2 GB DDR3 RAM The system comes with 2 GB DDR3 RAM which is quite a lot for an everyday system. In case you still feel you need more, you can always upgrade it to 8 GB. The more RAM that a system has, the more multitasking it can handle. Linux Operating System The ideal OS is important for those who need it for specific tasks. Everyday use will not necessarily mandate the use of Windows. You also have a wide range of personalization options with a Linux OS. The system thus comes ported with a Linux Operating System.', N'~\Site_data\product_images\acerlaptop.jpeg', CAST(30000.00 AS Decimal(18, 2)), NULL, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (12, N'Micromax Canvas 2', N'Micromax is a great phone for those who want a full feature experience within a budget. The manufacturers have managed to create budget phones with high end features that should prove to be quite a competition for the established players in the smart phone business. Expansive Storage The Micromax Canvas 2 A110 smart phone comes with an expandable storage of 32 GB which can be attained with the help of compatible memory cards. Massive Screen It also sports a huge 5 inch LCD Capacitive Touchscreen which can be used for viewing your favorite videos and high quality pictures. Operating System', N'~\Site_data\product_images\canvas2.jpg', CAST(11000.00 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (13, N'Iphone', N'Apple Iphone 4S', N'~\Site_data\product_images\iphone.jpeg', CAST(45000.00 AS Decimal(18, 2)), NULL, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (14, N'Nexus 4', N'New Nexus 4 from Google', N'~\Site_data\product_images\nexus4.jpeg', CAST(23000.00 AS Decimal(18, 2)), 10, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (17, N'UCB T-Shirt', N'United Colors of benetton tshirt', N'~\Site_data\product_images\ucb.jpg', CAST(300.00 AS Decimal(18, 2)), NULL, 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (18, N'C++ Primer', N'Book for learning C++', N'~\Site_data\product_images\primer.jpg', CAST(500.00 AS Decimal(18, 2)), 4, 4)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (21, N'Javascript the good parts', N'Book by Douglas Crockford', N'~\Site_data\product_images\js.jpg', CAST(1564.00 AS Decimal(18, 2)), NULL, 4)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (23, N'Levi''s Slim Fit Slight Washed', N'Levi''s Slim Fit Slight Washed Effect Men''s Jeans', N'~\Site_data\product_images\levis.jpeg', CAST(1250.00 AS Decimal(18, 2)), 20, 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (24, N'Pro ASP and .Net 2010 ', N'Book for professional .Net developers on ASP.NET', N'~\Site_data\product_images\aspBook.jpg', CAST(545.00 AS Decimal(18, 2)), 0, 4)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (26, N'Wrangler''s Jeans', N'Wrangler Regular Fit Men''s Jeans', N'~\Site_data\product_images\jeans.jpg', CAST(1154.00 AS Decimal(18, 2)), 10, 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (27, N'The Oath of the Vayuputras', N'India’s own super hero is finally here. Shiva has risen yet again to destroy the evildoers. The last of the Shiva Trilogy, this book promises to keep the readers gripped while the great warrior discovers who his true enemies are and gives it his all to destroy them.', N'~\Site_data\product_images\shiva.jpeg', CAST(175.00 AS Decimal(18, 2)), 0, 4)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (28, N'Dell Vostro 2520', N'Dell Vostro 2520 Laptop (2nd Gen PDC/ 2GB/ 320GB/ Win8)', N'~\Site_data\product_images\dell.jpeg', CAST(25000.00 AS Decimal(18, 2)), 0, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (29, N'Grand Theft Auto IV', N'Description

Grand Theft Auto IV: Complete is the ultimate Grand Theft Auto IV game experience available. The perfect choice for both players coming to Rockstar Games open-world third-person action-adventure masterpiece for the first time, as well as fans of the series looking for the most complete GTA IV experience possible, Grand Theft Auto IV: Complete has everything players need to delve into every inch of terrain, every story and every character lurking in the crime-ridden streets of the fictional Liberty City. Game edition contains the original GTA IV game for Xbox 360, both stand-alone game episodes originally released as downloadable content, plus extras included in this special edition. See the complete contents below.

Grand Theft Auto IV

Grand Theft Auto IV concerns the experiences of Nikolai "Niko" Bellic, a new immigrant from an undisclosed eastern European country whose troubled past and the persuasion of his cousin Roman have brought him to the fictional Liberty City. Unfortunately, Nikos search for the American Dream and a much needed fresh start, hits an immediate snag when the rags to riches story Roman spun to pique Nikos interest is exposed as not only a complete fabrication, but a ploy to enlist Nikos well-known skills as a tough guy against the ample list of enemies clamoring for Romans debt-ridden blood. Yet, because Roman is the only person Niko knows in Liberty City he begrudgingly accepts his role as Romans protector despite the deception. But as time goes on Niko comes into his own and his experience on the wrong side of the tracks proves more valuable than he could have ever imagined as he fights for survival and later supremacy on the crime ridden streets of Liberty City.', N'~\Site_data\product_images\gta.jpeg', CAST(599.00 AS Decimal(18, 2)), 0, 6)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (30, N'Max Payne 3', N'Max Payne fans, get ready to inflict maximum pain with the next installment in the franchise that comes packed with new features and better realistic graphics. Max Payne 3 is the third part in the story and you get to play an older, cynical and world-weary Max who continues to drown his sorrows with alcohol and painkillers. This game is ideal for hard-core and casual gamers who enjoy a plot based shooter game. This version of the game is suitable for use on computers.

Max Payne 3 was developed by Rockstar Studios and is published for use on the PC by Rockstar Games. This action-packed game has an ESRB rating of M 17+ as the contents of the game include intense violence, blood and gore, sexual content and strong language. Max Payne also depicts drug abuse with his constant popping of pain killers to keep him alive and kicking.', N'~\Site_data\product_images\max.jpeg', CAST(999.00 AS Decimal(18, 2)), 0, 6)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (31, N'Nexus 7', N'Combining the best of technology with unsurpassed beauty in a device that is sure to warrant more than just a glance, the Nexus 7C from Google is a tablet that is made for those things that matter most to us.

Latest in Software

Bringing the beautiful simplicity of Android to the palm of your hand, the Nexus 7C comes with the 4.2 Jelly Bean operating system that can be upgraded easily to the latest release. Offering the best in terms of functionality, the operating system choose to strike the fine balance between exemplary performance and simplistic usage. With NFC support, the tablet also lets you share with the least amount of hassle with the Android Beam making life  and transfers easier.

Android 4.2 (Jelly Bean) OS
1.2 GHz NVIDIA Tegra3 Quad Core Processor
1.2 MP Front Facing Camera
7-inch Capacitive Touchscreen
Wi-Fi Enabled
3G Support', N'~\Site_data\product_images\nexus7.jpeg', CAST(14099.00 AS Decimal(18, 2)), 0, 7)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (32, N'Casio Edifice Analog Watch', N'Coming from Casio’s highly reputed Edifice series of men’s watches, comes this tastefully designed multi-functional analog timepiece. This battery powered Edifice timepiece from Casio has a very eye-catching watch face which manages to effortlessly combine the finer elements of style and sophistication. Utilising a perfect mix of light and dark colours as well as a generous addition of chrome, this Edifice watch projects a much accentuated sense of fashion and character.

The incredible assortment of features include a stainless steel case and strap, mineral glass and screw-lock case back, for a look and feel that will suit almost any occasion or adventurous activity that you choose to indulge in.', N'~\Site_data\product_images\casio.jpeg', CAST(4620.00 AS Decimal(18, 2)), 0, 5)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (33, N'Fastrack Basics Analog', N'Men accessorize mainly with watches and hence it is important to have a collection of watches for different occasions; a luxury watch for occasions, a sports watch, a formal watch for office wear and also a daily wear casual watch. While choosing a daily wear watch, it is good to keep in mind that it has to coordinate with a wide variety of outfits.

This Fastrack Basics Analog watch has been designed for men who look for versatility in their daily wear watches. The analog mechanism that it employs has been a long-time favorite for the precision in timekeeping it is famous for. This casual wear watch can be paired with any attire; wear it to a night out with your friends or to dinner with the family.
', N'~\Site_data\product_images\fast.jpeg', CAST(895.00 AS Decimal(18, 2)), 0, 5)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (34, N'SONY DSC-H100', N'KEY FEATURES OF SONY DSC-H100 POINT & SHOOT
21x Optical Zoom
35 mm Equivalent Focal Length: 25 - 525 mm
HD Recording
16.1 Megapixel Camera
ISO 80 - 3200 Sensitivity
Super HAD CCD Image Sensor
f/3.1- f/8.9 Aperture', N'~\Site_data\product_images\sony.jpeg', CAST(11000.00 AS Decimal(18, 2)), 0, 8)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (35, N'SONY CYBER-SHOT', N'KEY FEATURES OF SONY CYBER-SHOT DSC-W710 POINT & SHOOT (BLACK)
35 mm Equivalent Focal Length: 28 - 140 mm
16.1 Megapixel Camera
2.7 inch ClearPhoto TFT LCD
Super HAD CCD Image Sensor
5x Optical Zoom and 20x Digital Zoom
HD Recording
f/3.2 - f/6.5 Aperture', N'~\Site_data\product_images\cyber.jpeg', CAST(5691.00 AS Decimal(18, 2)), 10, 8)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (36, N'Puma Iridium', N'For the perfect agility when striking and the ideal freedom of movement while running across the pitch, every aspiring cricketer needs shoes that will support his feet in all the right ways. These Puma Iridium II Full Spike Mid Cricket Shoes are made with 11 spikes on the soles for the right grip on sand when you run. With panel detailing, these shoes have a color decoration with white, princess blue and black shades. The shoes are built with a lace-up detail that is covered with velcro fastening. The cushioned ankle helps keep your feet comforted and in the right position at all times.

Based in Germany, Puma is synonymous with comfort and style. Makers of stylish sports shoes, the brand keeps you in sync with the latest fashion trends.', N'~\Site_data\product_images\shoes.jpeg', CAST(4548.00 AS Decimal(18, 2)), 12, 9)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (37, N'K&R ', N'by dennis ritchie', N'~\Site_data\product_images\Dhoni.jpg', CAST(123.00 AS Decimal(18, 2)), 0, 4)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDescription], [ProductImageURL], [ProductPrice], [Discount], [CategoryID]) VALUES (38, N'ss', N'ss', N'~\Site_data\product_images\Chrysanthemum.jpg', CAST(55.00 AS Decimal(18, 2)), 10, 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductOrderStatus] ON 

INSERT [dbo].[ProductOrderStatus] ([ProductOrderStatusId], [CustomerId], [ProductId], [StatusId], [Quantity], [CreatedDate]) VALUES (2, 1, 30, 2, 1, CAST(N'2017-05-28 02:07:01.370' AS DateTime))
INSERT [dbo].[ProductOrderStatus] ([ProductOrderStatusId], [CustomerId], [ProductId], [StatusId], [Quantity], [CreatedDate]) VALUES (3, 1, 12, 2, 1, CAST(N'2017-05-28 02:09:25.580' AS DateTime))
INSERT [dbo].[ProductOrderStatus] ([ProductOrderStatusId], [CustomerId], [ProductId], [StatusId], [Quantity], [CreatedDate]) VALUES (4, 1, 31, 2, 1, CAST(N'2017-05-28 02:11:25.233' AS DateTime))
INSERT [dbo].[ProductOrderStatus] ([ProductOrderStatusId], [CustomerId], [ProductId], [StatusId], [Quantity], [CreatedDate]) VALUES (6, 1, 18, 3, 1, CAST(N'2017-05-28 03:18:46.867' AS DateTime))
INSERT [dbo].[ProductOrderStatus] ([ProductOrderStatusId], [CustomerId], [ProductId], [StatusId], [Quantity], [CreatedDate]) VALUES (7, 1, 33, 2, 1, CAST(N'2017-05-28 18:21:55.023' AS DateTime))
INSERT [dbo].[ProductOrderStatus] ([ProductOrderStatusId], [CustomerId], [ProductId], [StatusId], [Quantity], [CreatedDate]) VALUES (8, 1, 21, 2, 1, CAST(N'2017-05-28 19:57:41.797' AS DateTime))
INSERT [dbo].[ProductOrderStatus] ([ProductOrderStatusId], [CustomerId], [ProductId], [StatusId], [Quantity], [CreatedDate]) VALUES (10, 1, 29, 2, 1, CAST(N'2017-05-29 23:57:58.503' AS DateTime))
INSERT [dbo].[ProductOrderStatus] ([ProductOrderStatusId], [CustomerId], [ProductId], [StatusId], [Quantity], [CreatedDate]) VALUES (11, 1, 26, 3, 1, CAST(N'2017-05-29 23:59:48.277' AS DateTime))
INSERT [dbo].[ProductOrderStatus] ([ProductOrderStatusId], [CustomerId], [ProductId], [StatusId], [Quantity], [CreatedDate]) VALUES (12, 1, 33, 3, 1, CAST(N'2017-05-30 00:13:09.867' AS DateTime))
INSERT [dbo].[ProductOrderStatus] ([ProductOrderStatusId], [CustomerId], [ProductId], [StatusId], [Quantity], [CreatedDate]) VALUES (16, 1, 31, 2, 1, CAST(N'2017-05-30 00:43:35.517' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductOrderStatus] OFF
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Rating], [ReviewTitle], [ReviewDescription], [ReviewDate]) VALUES (8, 1, 10, 2, N'Good product', N'I do not recommend this product', CAST(N'2013-05-03' AS Date))
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Rating], [ReviewTitle], [ReviewDescription], [ReviewDate]) VALUES (9, 1, 10, 4, N'Go for micromax and when done with it..then come get this one!', N'For those who are criticizing its display,I know its TFT but i don''t see any problem with it,the resolution is ~199ppi,its actually samsung galaxy grand''s screen squeezed into a smaller frame so its more sharper than grand,not being AMOLED or IPS display actually compliments its battery life.. 

So please check out its display in person before writing your crap over here..

Biggest pro of this phone is battery, it easily lasts a whole day. 1 Gb ram also helps you through productive multitasking. Dedicated Graphics gives a decent gaming experience which is further complimented by the screen size. Sophisticated games like nova 3 runs smoothly without lag by bringing down the details a little bit, ', CAST(N'2013-10-17' AS Date))
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Rating], [ReviewTitle], [ReviewDescription], [ReviewDate]) VALUES (10, 7, 18, 1, N'Great book that requires serious dedication from the reader.', N'This book is a lot longer than your average introductory book and rightly so. It is packed with information, that is both necessary and useful. Properly reading and doing the examples and exercises given in the book will give you a firm grasp of the C++ language. But you have to remain dedicated and not cheat because at times the exercises might seem mundane but remember that there is a reason that it is there. Solution for various exercises have been given here 

I have personally gone through that the site and corrected a few errors that I spotted, if you find any do the same.', CAST(N'2013-10-18' AS Date))
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Rating], [ReviewTitle], [ReviewDescription], [ReviewDate]) VALUES (11, 7, 13, 2, N'India the new dumping ground!!!', N'Congratulations to all proud Indians. Apple has chosen us as the main dumping ground for old iPhones. The iPhone 4 is a 3 year old phone! It released at a price of 30k 3 years ago.
What is the price now?
Why?
Why do you people still buy it?
Have some sense people and please value your money.
This is phone with 512MB Ram and 800 Mhz single core processor. Even though it supports the latest iOS. It doesn''t support half the features. And how much are your paying for this.
Apple is fooling all of us. And still we fall for this. Ridiculous! 
For the same money go for a better Windows phone or Android phone. Much better value of money. Do some research and you will know!', CAST(N'2013-10-18' AS Date))
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Rating], [ReviewTitle], [ReviewDescription], [ReviewDate]) VALUES (12, 7, 13, 2, N'Buy Nexus4 instead.', N'Why this if you can Buy Nexus 4 for this Price ?
Buy Nexus 4 for this price instead of this shitty iPhone 4. 

800 mhz processor,5MP cam,8 gb internal. And 25k for this phone ? 

Buy nexus 4 - 1.7 quad core processor,8mp cam,16 gb internal . 

iPhones suck', CAST(N'2013-10-18' AS Date))
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Rating], [ReviewTitle], [ReviewDescription], [ReviewDate]) VALUES (13, 7, 13, 5, N'iPhone 4 vs Xolo ? what are you comparing!', N'
Guys, comparing XOLO with Apple iphone 4 is not correct. For three reasons -

1. iphone 4 was released 3 years ago. While Xolo is 2013 model.
2. Apple hardware is best in class, not comparing with MHz or Gigs of RAM. But the quality, iOS is the only mobile operating system which was delivered almost bug free. 
3. Apple is obviously priced higher, still it managed to get sales > 50 million units per fiscal year, this is a class that a manufacturer has set, and maintained in last 6 years. This is not a joke, and Xolo stands no where when it comes to support.

Personally using any of the iphones that I had, I never ever faced problems with hardware or software. Battery, for any of the smart phone will drain fast be it Samsung or Apple or Micromax. 
Now I stopped using iphone because I am bored of it, and moved to HTC One, I still feel that iPhone was better. Though unlocking and jailbreaking is painful than rooting an android.

Source :- I am a previous user of most of the categories of Apple iphone''s 3gs, 4, 4s. Also, I am currently using HTC One.', CAST(N'2013-10-18' AS Date))
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Rating], [ReviewTitle], [ReviewDescription], [ReviewDate]) VALUES (14, 1, 31, 4, N'This tab was launched in 2012 and it went for 199$ (without tax and shipping) in the US google play store. ', N'Easily the best device @ 9999- If you wait for the 2013 Nexus 7 it will surely be close to 20k
This tab was launched in 2012 and it went for 199$ (without tax and shipping) in the US google play store. 

It was launched in India for around 20 thousand INR. People could not stop complaining. The reason is very simple. It cost Google/Asus around 200$ to make this tablet and when you sell it at that price you expect the play store to give you profits.

Google plan is that with this tablet you will buy songs, books and movies from playstore and it will make money so thats why it was price at 199$ in US.

How many of us Indias buy movies in playstore ??? songs ??? Books ??? not that money so Google will not make profit.

Another problem is that it has to take in account for the aftersales service and that is a big expense for the company.
', CAST(N'2013-10-18' AS Date))
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Rating], [ReviewTitle], [ReviewDescription], [ReviewDate]) VALUES (15, 1, 31, 5, N'The best value-for-money device ever!', N'The best value-for-money device ever!
At 10k, it is not only has the best features from a well-known brand, it has the best features from any brand, period!

Compared with Galaxy Tab 3 Wi-Fi @12.5k it is better in every respect be it screen resolution, screen quality, processor, battery backup, Andriod version, internal memory. The only downside is that it is 30 grams heavier and doesn''t support a MicroSD card.

I had no plans of buying a tablet, but when the price dropped to 10 frakking k, I simply couldn''t resist. It''s a STEAL for this price. And now after using it for 3 days, it is money very well spent. Performance is very smooth and all graphics-intensive games play without any lag.', CAST(N'2013-10-18' AS Date))
SET IDENTITY_INSERT [dbo].[Review] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusId], [Status]) VALUES (1, N'Cart')
INSERT [dbo].[Status] ([StatusId], [Status]) VALUES (2, N'Place Order')
INSERT [dbo].[Status] ([StatusId], [Status]) VALUES (3, N'whish List')
SET IDENTITY_INSERT [dbo].[Status] OFF
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Cart] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Customer_Cart]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Product_Cart] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Product_Cart]
GO
ALTER TABLE [dbo].[Feature]  WITH CHECK ADD  CONSTRAINT [FK_MetaFeature_Feature] FOREIGN KEY([MetaFeatureID])
REFERENCES [dbo].[MetaFeature] ([MetaFeatureID])
GO
ALTER TABLE [dbo].[Feature] CHECK CONSTRAINT [FK_MetaFeature_Feature]
GO
ALTER TABLE [dbo].[Feature]  WITH CHECK ADD  CONSTRAINT [FK_ProductID_Feature] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Feature] CHECK CONSTRAINT [FK_ProductID_Feature]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Order] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Customer_Order]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Product_Order] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Product_Order]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Category_Product] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Category_Product]
GO
ALTER TABLE [dbo].[ProductOrderStatus]  WITH CHECK ADD  CONSTRAINT [fk_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[ProductOrderStatus] CHECK CONSTRAINT [fk_Customer]
GO
ALTER TABLE [dbo].[ProductOrderStatus]  WITH CHECK ADD  CONSTRAINT [fk_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductOrderStatus] CHECK CONSTRAINT [fk_Product]
GO
ALTER TABLE [dbo].[ProductOrderStatus]  WITH CHECK ADD  CONSTRAINT [fk_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[ProductOrderStatus] CHECK CONSTRAINT [fk_Status]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Review] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Customer_Review]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Product_Review] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Product_Review]
GO
USE [master]
GO
ALTER DATABASE [ecommerce] SET  READ_WRITE 
GO
