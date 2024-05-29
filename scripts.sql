USE [InventoryManagementSystem]
GO
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 5/27/2024 6:35:29 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 5/27/2024 6:35:29 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
INSERT [dbo].[Products] ([Id], [ManufacturerId], [Name], [Description], [Price], [IsActive], [CreatedAt], [UpdatedAt], [LogoPath]) VALUES (1, 1, N'Latitude 9520', N'A premium business laptop with advanced security features.', CAST(1500.00 AS Decimal(18, 2)), 1, CAST(N'2024-05-24T12:27:42.8833333' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [ManufacturerId], [Name], [Description], [Price], [IsActive], [CreatedAt], [UpdatedAt], [LogoPath]) VALUES (2, 1, N'OptiPlex 7090 Ultra', N'An innovative desktop solution that combines performance and versatility.', CAST(1200.00 AS Decimal(18, 2)), 1, CAST(N'2024-05-24T12:27:42.8833333' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [ManufacturerId], [Name], [Description], [Price], [IsActive], [CreatedAt], [UpdatedAt], [LogoPath]) VALUES (3, 2, N'HP Spectre x360', N'A convertible laptop with powerful performance and stunning design.', CAST(1300.00 AS Decimal(18, 2)), 1, CAST(N'2024-05-24T12:27:42.8833333' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [ManufacturerId], [Name], [Description], [Price], [IsActive], [CreatedAt], [UpdatedAt], [LogoPath]) VALUES (4, 2, N'HP Pavilion Gaming Desktop', N'A gaming desktop with powerful graphics and customizable LED lighting.', CAST(900.00 AS Decimal(18, 2)), 1, CAST(N'2024-05-24T12:27:42.8833333' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [ManufacturerId], [Name], [Description], [Price], [IsActive], [CreatedAt], [UpdatedAt], [LogoPath]) VALUES (5, 3, N'ThinkPad X1 Carbon', N'An ultralight business laptop with legendary durability.', CAST(1600.00 AS Decimal(18, 2)), 1, CAST(N'2024-05-24T12:27:42.8833333' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Products] ([Id], [ManufacturerId], [Name], [Description], [Price], [IsActive], [CreatedAt], [UpdatedAt], [LogoPath]) VALUES (6, 3, N'IdeaPad Flex 5', N'A flexible 2-in-1 laptop with powerful performance and entertainment features.', CAST(700.00 AS Decimal(18, 2)), 1, CAST(N'2024-05-24T12:27:42.8833333' AS DateTime2), NULL, NULL)
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
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturers] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[AddManufacturer]    Script Date: 5/27/2024 6:35:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 5/27/2024 6:35:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteManufacturer]    Script Date: 5/27/2024 6:35:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 5/27/2024 6:35:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllManufacturers]    Script Date: 5/27/2024 6:35:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 5/27/2024 6:35:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetManufacturerById]    Script Date: 5/27/2024 6:35:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetProductById]    Script Date: 5/27/2024 6:35:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetProductsByManufacturerId]    Script Date: 5/27/2024 6:35:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateManufacturer]    Script Date: 5/27/2024 6:35:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 5/27/2024 6:35:30 PM ******/
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
