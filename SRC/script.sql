USE [CarSell]
GO
/****** Object:  Table [dbo].[car_details]    Script Date: 12/21/2024 3:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[car_details](
	[carId] [int] IDENTITY(1,1) NOT NULL,
	[carName] [nvarchar](500) NULL,
	[price] [decimal](10, 0) NULL,
	[carCategory] [varchar](45) NULL,
	[year] [varchar](255) NULL,
	[photo] [varchar](45) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[carId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 12/21/2024 3:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cId] [int] IDENTITY(1,1) NOT NULL,
	[carId] [int] NULL,
	[uId] [int] NULL,
	[total_price] [float] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 12/21/2024 3:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [varchar](45) NULL,
	[uId] [int] NULL,
	[address] [nvarchar](500) NULL,
	[car_name] [nvarchar](500) NULL,
	[quantity] [int] NULL,
	[price] [varchar](45) NULL,
	[payment] [varchar](45) NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 12/21/2024 3:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[email] [varchar](100) NULL,
	[phone] [varchar](45) NULL,
	[password] [varchar](45) NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[car_details] ON 

INSERT [dbo].[car_details] ([carId], [carName], [price], [carCategory], [year], [photo], [quantity]) VALUES (1, N'Lexus R570', CAST(520000000 AS Decimal(10, 0)), N'New', N'2010', N'new1.jpg', 1)
INSERT [dbo].[car_details] ([carId], [carName], [price], [carCategory], [year], [photo], [quantity]) VALUES (2, N'BMW320I', CAST(550000000 AS Decimal(10, 0)), N'New', N'2014', N'new2.jpg', 2)
INSERT [dbo].[car_details] ([carId], [carName], [price], [carCategory], [year], [photo], [quantity]) VALUES (3, N'MercedesC200', CAST(520000000 AS Decimal(10, 0)), N'New', N'2015', N'new3.jpg', 4)
INSERT [dbo].[car_details] ([carId], [carName], [price], [carCategory], [year], [photo], [quantity]) VALUES (4, N'Raptor', CAST(850000000 AS Decimal(10, 0)), N'New', N'2020', N'new4.png', 1)
INSERT [dbo].[car_details] ([carId], [carName], [price], [carCategory], [year], [photo], [quantity]) VALUES (10, N'Toyota Camry', CAST(450000000 AS Decimal(10, 0)), N'New', N'2012', N'new5.jpg', 3)
INSERT [dbo].[car_details] ([carId], [carName], [price], [carCategory], [year], [photo], [quantity]) VALUES (11, N'Honda Accord', CAST(480000000 AS Decimal(10, 0)), N'New', N'2013', N'new6.jpg', 2)
INSERT [dbo].[car_details] ([carId], [carName], [price], [carCategory], [year], [photo], [quantity]) VALUES (12, N'Ford Mustang', CAST(2000000000 AS Decimal(10, 0)), N'New', N'2018', N'new7.jpg', 1)
INSERT [dbo].[car_details] ([carId], [carName], [price], [carCategory], [year], [photo], [quantity]) VALUES (13, N'Nissan GTR', CAST(2200000000 AS Decimal(10, 0)), N'New', N'2021', N'new8.jpg', 1)
INSERT [dbo].[car_details] ([carId], [carName], [price], [carCategory], [year], [photo], [quantity]) VALUES (14, N'Chevrolet Corvette', CAST(5200000000 AS Decimal(10, 0)), N'New', N'2019', N'new9.jpg', 1)
INSERT [dbo].[car_details] ([carId], [carName], [price], [carCategory], [year], [photo], [quantity]) VALUES (15, N'Audi A4', CAST(600000000 AS Decimal(10, 0)), N'New', N'2016', N'new10.jpg', 2)
INSERT [dbo].[car_details] ([carId], [carName], [price], [carCategory], [year], [photo], [quantity]) VALUES (34, N'LandRover', CAST(400000000 AS Decimal(10, 0)), N'Sale', N'2008', N'sale1.jpg', 1)
INSERT [dbo].[car_details] ([carId], [carName], [price], [carCategory], [year], [photo], [quantity]) VALUES (37, N'Toyota Vios', CAST(280000000 AS Decimal(10, 0)), N'Sale', N'2012', N'sale2.jpg', 6)
INSERT [dbo].[car_details] ([carId], [carName], [price], [carCategory], [year], [photo], [quantity]) VALUES (38, N'Honda Civic', CAST(800000000 AS Decimal(10, 0)), N'Trend', N'newYear', N'trend1.jpg', 0)
INSERT [dbo].[car_details] ([carId], [carName], [price], [carCategory], [year], [photo], [quantity]) VALUES (39, N'Ford Everest', CAST(350000000 AS Decimal(10, 0)), N'Trend', N'2015', N'trend2.jpg', 2)
INSERT [dbo].[car_details] ([carId], [carName], [price], [carCategory], [year], [photo], [quantity]) VALUES (40, N'Toyota Hilux', CAST(550000000 AS Decimal(10, 0)), N'Trend', N'2018', N'trend3.jpg', 2)
INSERT [dbo].[car_details] ([carId], [carName], [price], [carCategory], [year], [photo], [quantity]) VALUES (41, N'VinfastLuxA', CAST(500000000 AS Decimal(10, 0)), N'New', N'2020', N'sale3.jpg', 1)
SET IDENTITY_INSERT [dbo].[car_details] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [order_id], [uId], [address], [car_name], [quantity], [price], [payment], [date]) VALUES (1, N'ORD-503', 3, N'hoa lac', N'Honda Civic', 2, N'1.6E9', N'COD', CAST(N'2024-07-14' AS Date))
INSERT [dbo].[order] ([id], [order_id], [uId], [address], [car_name], [quantity], [price], [payment], [date]) VALUES (2, N'ORD-217', 3, N'thai hoa town', N'VinfastLuxA', 1, N'5.0E8', N'COD', CAST(N'2024-07-14' AS Date))
INSERT [dbo].[order] ([id], [order_id], [uId], [address], [car_name], [quantity], [price], [payment], [date]) VALUES (3, N'ORD-280', 3, N'nghe an', N'Nissan GTR', 1, N'2.2E9', N'COD', CAST(N'2024-07-15' AS Date))
INSERT [dbo].[order] ([id], [order_id], [uId], [address], [car_name], [quantity], [price], [payment], [date]) VALUES (4, N'ORD-126', 3, N'hoa lac', N'Honda Civic', 1, N'8.0E8', N'COD', CAST(N'2024-07-19' AS Date))
INSERT [dbo].[order] ([id], [order_id], [uId], [address], [car_name], [quantity], [price], [payment], [date]) VALUES (5, N'ORD-407', 3, N'hoa lac', N'Honda Civic', 2, N'1.6E9', N'COD', CAST(N'2024-07-19' AS Date))
INSERT [dbo].[order] ([id], [order_id], [uId], [address], [car_name], [quantity], [price], [payment], [date]) VALUES (6, N'ORD-581', 3, N'fpt', N'VinfastLuxA', 2, N'1.0E9', N'COD', CAST(N'2024-07-19' AS Date))
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [name], [email], [phone], [password], [role]) VALUES (1, N'Admin', N'admin@gmail.com', N'0858425777', N'admin', 1)
INSERT [dbo].[user] ([id], [name], [email], [phone], [password], [role]) VALUES (2, N'Anh Tuan', N't@gmail.com', N'0123456789', N'020804', 2)
INSERT [dbo].[user] ([id], [name], [email], [phone], [password], [role]) VALUES (3, N'Tun dz so one fpt', N'kurominato1312@gmail.com', N'0858425777', N'123456', 2)
INSERT [dbo].[user] ([id], [name], [email], [phone], [password], [role]) VALUES (4, N'Nguoi ngu', N'hoduyanh2992005@gmail.com', N'0858425777', N'123456', 2)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD FOREIGN KEY([carId])
REFERENCES [dbo].[car_details] ([carId])
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD FOREIGN KEY([uId])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([uId])
REFERENCES [dbo].[user] ([id])
GO
