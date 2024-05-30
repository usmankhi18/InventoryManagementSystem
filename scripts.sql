USE [master]
GO
/****** Object:  Database [InventoryManagementSystem]    Script Date: 5/30/2024 11:51:41 AM ******/
CREATE DATABASE [InventoryManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InventoryManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\InventoryManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InventoryManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\InventoryManagementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [InventoryManagementSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InventoryManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InventoryManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InventoryManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InventoryManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InventoryManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InventoryManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InventoryManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [InventoryManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InventoryManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InventoryManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InventoryManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InventoryManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InventoryManagementSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [InventoryManagementSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [InventoryManagementSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [InventoryManagementSystem]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[ContractID] [int] NOT NULL,
	[SupplierID] [int] NULL,
	[ContractDate] [datetime] NULL,
	[Terms] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Address] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerLoyalty]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerLoyalty](
	[CustomerLoyaltyID] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[LoyaltyProgramID] [int] NULL,
	[PointsEarned] [int] NULL,
	[PointsRedeemed] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerLoyaltyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountID] [int] NOT NULL,
	[DiscountName] [nvarchar](255) NULL,
	[DiscountType] [nvarchar](255) NULL,
	[Value] [decimal](18, 2) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Position] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[InventoryID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[WarehouseLocation] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoyaltyProgram]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoyaltyProgram](
	[LoyaltyProgramID] [int] NOT NULL,
	[ProgramName] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[PointsPerDollar] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[LoyaltyProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Country] [nvarchar](100) NULL,
	[YearFounded] [int] NULL,
	[Website] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[LogoPath] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] NOT NULL,
	[MenuName] [nvarchar](255) NULL,
	[URL] [nvarchar](255) NULL,
	[ParentMenuID] [int] NULL,
	[DisplayOrder] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDiscount]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDiscount](
	[OrderDiscountID] [int] NOT NULL,
	[OrderID] [int] NULL,
	[DiscountID] [int] NULL,
	[DiscountAmount] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[OrderDate] [datetime] NULL,
	[CustomerID] [int] NULL,
	[EmployeeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] NOT NULL,
	[OrderID] [int] NULL,
	[PaymentDate] [datetime] NULL,
	[Amount] [decimal](18, 2) NULL,
	[PaymentMethod] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[ProductDetailID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[Specification] [nvarchar](255) NULL,
	[Value] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[LogoPath] [nvarchar](255) NULL,
	[StockQuantity] [int] NOT NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportID] [int] NOT NULL,
	[ReportType] [nvarchar](255) NULL,
	[GeneratedDate] [datetime] NULL,
	[GeneratedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[CustomerID] [int] NULL,
	[ReviewDate] [datetime] NULL,
	[Rating] [int] NULL,
	[Comment] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleMenu]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleMenu](
	[RoleMenuID] [int] NOT NULL,
	[RoleID] [int] NULL,
	[MenuID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[ContactName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierProduct]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierProduct](
	[SupplierID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SupplyPrice] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] NOT NULL,
	[TransactionType] [nvarchar](255) NULL,
	[TransactionDate] [datetime] NULL,
	[Amount] [decimal](18, 2) NULL,
	[CustomerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] NOT NULL,
	[Username] [nvarchar](255) NULL,
	[PasswordHash] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleID] [int] NOT NULL,
	[UserID] [int] NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[WarehouseID] [int] NOT NULL,
	[Location] [nvarchar](255) NULL,
	[Capacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Manufacturers] ON 
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [Description], [Country], [YearFounded], [Website], [Email], [Phone], [IsActive], [CreatedAt], [UpdatedAt], [LogoPath]) VALUES (1, N'Dell', N'An American multinational computer technology company that develops, sells, repairs, and supports computers and related products and services.', N'USA', 1984, N'https://www.dell.com/', N'info@dell.com', N'+1-800-624-9897', 1, CAST(N'2024-05-24T12:20:05.2433333' AS DateTime2), NULL, N'''/path/to/dell_logo.png''')
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [Description], [Country], [YearFounded], [Website], [Email], [Phone], [IsActive], [CreatedAt], [UpdatedAt], [LogoPath]) VALUES (2, N'HP', N'An American multinational information technology company that provides personal computing and other access devices, imaging, and printing products, and related technologies, solutions, and services.', N'USA', 1939, N'https://www.hp.com/', N'info@hp.com', N'+1-650-857-1501', 1, CAST(N'2024-05-24T12:20:05.2433333' AS DateTime2), NULL, N'''/path/to/hp_logo.png''')
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [Description], [Country], [YearFounded], [Website], [Email], [Phone], [IsActive], [CreatedAt], [UpdatedAt], [LogoPath]) VALUES (3, N'Lenovo', N'A Chinese multinational technology company that designs, develops, manufactures, and sells personal computers, tablet computers, smartphones, workstations, servers, electronic storage devices, IT management software, and smart televisions.', N'China', 1984, N'https://www.lenovo.com/', N'info@lenovo.com', N'+1-855-253-6686', 1, CAST(N'2024-05-24T12:20:05.2433333' AS DateTime2), NULL, N'''/path/to/lenovo_logo.png''')
GO
SET IDENTITY_INSERT [dbo].[Manufacturers] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [ManufacturerId], [Name], [Description], [Price], [IsActive], [CreatedAt], [UpdatedAt], [LogoPath], [StockQuantity], [CategoryID]) VALUES (1, 1, N'Latitude 9520', N'A premium business laptop with advanced security features.', CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2024-05-24T12:27:42.8833333' AS DateTime2), NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Products] ([Id], [ManufacturerId], [Name], [Description], [Price], [IsActive], [CreatedAt], [UpdatedAt], [LogoPath], [StockQuantity], [CategoryID]) VALUES (2, 1, N'OptiPlex 7090 Ultra', N'An innovative desktop solution that combines performance and versatility.', CAST(1200.00 AS Decimal(18, 2)), 1, CAST(N'2024-05-24T12:27:42.8833333' AS DateTime2), NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Products] ([Id], [ManufacturerId], [Name], [Description], [Price], [IsActive], [CreatedAt], [UpdatedAt], [LogoPath], [StockQuantity], [CategoryID]) VALUES (3, 2, N'HP Spectre x360', N'A convertible laptop with powerful performance and stunning design.', CAST(1300.00 AS Decimal(18, 2)), 1, CAST(N'2024-05-24T12:27:42.8833333' AS DateTime2), NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Products] ([Id], [ManufacturerId], [Name], [Description], [Price], [IsActive], [CreatedAt], [UpdatedAt], [LogoPath], [StockQuantity], [CategoryID]) VALUES (4, 2, N'HP Pavilion Gaming Desktop', N'A gaming desktop with powerful graphics and customizable LED lighting.', CAST(900.00 AS Decimal(18, 2)), 1, CAST(N'2024-05-24T12:27:42.8833333' AS DateTime2), NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Products] ([Id], [ManufacturerId], [Name], [Description], [Price], [IsActive], [CreatedAt], [UpdatedAt], [LogoPath], [StockQuantity], [CategoryID]) VALUES (5, 3, N'ThinkPad X1 Carbon', N'An ultralight business laptop with legendary durability.', CAST(1600.00 AS Decimal(18, 2)), 1, CAST(N'2024-05-24T12:27:42.8833333' AS DateTime2), NULL, NULL, 0, NULL)
GO
INSERT [dbo].[Products] ([Id], [ManufacturerId], [Name], [Description], [Price], [IsActive], [CreatedAt], [UpdatedAt], [LogoPath], [StockQuantity], [CategoryID]) VALUES (6, 3, N'IdeaPad Flex 5', N'A flexible 2-in-1 laptop with powerful performance and entertainment features.', CAST(700.00 AS Decimal(18, 2)), 1, CAST(N'2024-05-24T12:27:42.8833333' AS DateTime2), NULL, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Manufacturers] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Manufacturers] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_StockQuantity]  DEFAULT ((0)) FOR [StockQuantity]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[CustomerLoyalty]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomerLoyalty]  WITH CHECK ADD FOREIGN KEY([LoyaltyProgramID])
REFERENCES [dbo].[LoyaltyProgram] ([LoyaltyProgramID])
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([ParentMenuID])
REFERENCES [dbo].[Menu] ([MenuID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDiscount]  WITH CHECK ADD FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discount] ([DiscountID])
GO
ALTER TABLE [dbo].[OrderDiscount]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturers] ([Id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([GeneratedBy])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[RoleMenu]  WITH CHECK ADD FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menu] ([MenuID])
GO
ALTER TABLE [dbo].[RoleMenu]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[SupplierProduct]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[SupplierProduct]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
/****** Object:  StoredProcedure [dbo].[AddManufacturer]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddManufacturer]
    @Name NVARCHAR(255),
    @Description NVARCHAR(MAX),
    @Country NVARCHAR(255),
    @YearFounded INT,
    @Website NVARCHAR(255),
    @Email NVARCHAR(255),
    @Phone NVARCHAR(50),
    @LogoPath NVARCHAR(255),
    @IsActive BIT,
    @CreatedAt DATETIME
AS
BEGIN
    INSERT INTO Manufacturers (Name, Description, Country, YearFounded, Website, Email, Phone, LogoPath, IsActive, CreatedAt)
    VALUES (@Name, @Description, @Country, @YearFounded, @Website, @Email, @Phone, @LogoPath, @IsActive, @CreatedAt)
END
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProduct]
    @ManufacturerId INT,
    @Name NVARCHAR(255),
    @Description NVARCHAR(MAX),
    @Price DECIMAL(18, 2),
    @IsActive BIT,
    @CreatedAt DATETIME,
	@LogoPath NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Products (ManufacturerId, Name, Description, Price, IsActive, CreatedAt,LogoPath)
    VALUES (@ManufacturerId, @Name, @Description, @Price, @IsActive, @CreatedAt,@LogoPath)
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteManufacturer]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteManufacturer]
    @Id INT
AS
BEGIN
    DELETE FROM Manufacturers
    WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProduct]
    @Id INT
AS
BEGIN
    DELETE FROM Products
    WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllManufacturers]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllManufacturers]
AS
BEGIN
    SELECT Id, Name, Description, Country, YearFounded, Website, Email, Phone, LogoPath
    FROM Manufacturers
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProducts]
AS
BEGIN
    SELECT Id, ManufacturerId, Name, Description, Price, LogoPath
    FROM Products
END
GO
/****** Object:  StoredProcedure [dbo].[GetManufacturerById]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetManufacturerById]
    @Id INT
AS
BEGIN
    SELECT Id, Name, Description, Country, YearFounded, Website, Email, Phone, LogoPath
    FROM Manufacturers
    WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductById]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductById]
    @Id INT
AS
BEGIN
    SELECT Id, ManufacturerId, Name, Description, Price, LogoPath
    FROM Products
    WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductsByManufacturerId]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductsByManufacturerId]
    @ManufacturerId INT
AS
BEGIN
    SELECT Id, ManufacturerId, Name, Description, Price, LogoPath
    FROM Products
    WHERE ManufacturerId = @ManufacturerId
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateManufacturer]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateManufacturer]
    @Id INT,
    @Name NVARCHAR(255),
    @Description NVARCHAR(MAX),
    @Country NVARCHAR(255),
    @YearFounded INT,
    @Website NVARCHAR(255),
    @Email NVARCHAR(255),
    @Phone NVARCHAR(50),
    @LogoPath NVARCHAR(255),
    @IsActive BIT,
    @UpdatedAt DATETIME
AS
BEGIN
    UPDATE Manufacturers
    SET Name = @Name,
        Description = @Description,
        Country = @Country,
        YearFounded = @YearFounded,
        Website = @Website,
        Email = @Email,
        Phone = @Phone,
        LogoPath = @LogoPath,
        IsActive = @IsActive,
        UpdatedAt = @UpdatedAt
    WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 5/30/2024 11:51:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProduct]
    @Id INT,
    @ManufacturerId INT,
    @Name NVARCHAR(255),
    @Description NVARCHAR(MAX),
    @Price DECIMAL(18, 2),
    @IsActive BIT,
    @LogoPath NVARCHAR(255),
    @UpdatedAt DATETIME
AS
BEGIN
    UPDATE Products
    SET ManufacturerId = @ManufacturerId,
        Name = @Name,
        Description = @Description,
        Price = @Price,
        IsActive = @IsActive,
        LogoPath = @LogoPath,
        UpdatedAt = @UpdatedAt
    WHERE Id = @Id
END
GO
USE [master]
GO
ALTER DATABASE [InventoryManagementSystem] SET  READ_WRITE 
GO
