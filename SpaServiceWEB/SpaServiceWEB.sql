USE [master]
GO
/****** Object:  Database [BeautySystemDB]    Script Date: 17/07/2022 11:29:58 CH ******/
CREATE DATABASE [BeautySystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BeautySystemDB', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BeautySystemDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BeautySystemDB_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BeautySystemDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BeautySystemDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BeautySystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BeautySystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BeautySystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BeautySystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BeautySystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BeautySystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BeautySystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BeautySystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BeautySystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BeautySystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BeautySystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BeautySystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BeautySystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BeautySystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BeautySystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BeautySystemDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BeautySystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BeautySystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BeautySystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BeautySystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BeautySystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BeautySystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BeautySystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BeautySystemDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BeautySystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [BeautySystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BeautySystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BeautySystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BeautySystemDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BeautySystemDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BeautySystemDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BeautySystemDB', N'ON'
GO
ALTER DATABASE [BeautySystemDB] SET QUERY_STORE = OFF
GO
USE [BeautySystemDB]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 17/07/2022 11:30:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CusID] [varchar](20) NOT NULL,
	[Fullname] [nvarchar](60) NULL,
	[Phone] [nvarchar](12) NULL,
	[Zalo] [varchar](300) NULL,
	[Image] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 17/07/2022 11:30:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpID] [varchar](10) NOT NULL,
	[SpaID] [varchar](10) NULL,
	[Fullname] [nvarchar](60) NULL,
	[Phone] [nvarchar](12) NULL,
	[Zalo] [varchar](300) NULL,
	[Image] [varchar](200) NULL,
	[EmpType] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 17/07/2022 11:30:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [varchar](20) NOT NULL,
	[CusID] [varchar](20) NULL,
	[OrderTime] [datetime] NULL,
	[EmpIDAccept] [varchar](10) NULL,
	[PaymentFormID] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 17/07/2022 11:30:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [varchar](22) NOT NULL,
	[OrderID] [varchar](20) NULL,
	[SpaServiceID] [varchar](15) NULL,
	[TimeFrom] [datetime] NULL,
	[TimeTo] [datetime] NULL,
	[ServiceFormID] [varchar](5) NULL,
	[Phone] [nvarchar](12) NULL,
	[Address] [nvarchar](200) NULL,
	[EmpIDRequest] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentForm]    Script Date: 17/07/2022 11:30:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentForm](
	[PaymentFormID] [int] NOT NULL,
	[PaymentFormName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentFormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 17/07/2022 11:30:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceID] [varchar](15) NOT NULL,
	[ServiceType] [varchar](5) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceForm]    Script Date: 17/07/2022 11:30:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceForm](
	[ServiceFormID] [varchar](5) NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceFormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 17/07/2022 11:30:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceType](
	[ServiceType] [varchar](5) NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Spa]    Script Date: 17/07/2022 11:30:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spa](
	[SpaID] [varchar](10) NOT NULL,
	[SpaName] [nvarchar](100) NULL,
	[Phone] [nvarchar](12) NULL,
	[Address] [nvarchar](200) NULL,
	[Email] [varchar](30) NULL,
	[Website] [varchar](300) NULL,
	[Zalo] [varchar](300) NULL,
	[Facebook] [varchar](300) NULL,
	[Description] [nvarchar](max) NULL,
	[Logo] [varchar](200) NULL,
	[Image] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[SpaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpaService]    Script Date: 17/07/2022 11:30:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpaService](
	[SpaServiceID] [varchar](15) NOT NULL,
	[ServiceID] [varchar](15) NULL,
	[SpaID] [varchar](10) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [bigint] NULL,
	[DiscountMoney] [bigint] NULL,
	[DiscountPercent] [float] NULL,
	[Response] [int] NULL,
	[Image] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[SpaServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Service] ([ServiceID], [ServiceType], [Description], [Image]) VALUES (N'1294760864', N'T1240', N'Phụ nữ sau độ tuổi 30 da thường xuất hiện dấu hiệu của lão hóa. Những mảng thâm, nám dần xuất hiện, làn da trở nên loang lổ không đều màu, làm cho làn da trở nên mất sức sống và mất tự tin khi họ giao tiếp.', N'spv1294760864.jpg')
INSERT [dbo].[Service] ([ServiceID], [ServiceType], [Description], [Image]) VALUES (N'1721591935', N'T4600', N'Các phương pháp giảm mỡ luôn được nhiều chị em quan tâm, tìm kiếm và áp dụng. Chúng ta cũng có nhiều cách giảm cân tại nhà nhưng đem lại không nhiều lợi ích, cùng như mất khá nhiều thời gian. Khi bạn đến spa, bạn vừa được thư giãn với không gian thoải mái, vừa tiết kiệm tối đa thời gian và nhận thấy được sự thay đổi ngay tức khắc. Đó là điều mà chị em chúng ta luôn mong muốn và đạt được', N'spv1721591935.jpg')
INSERT [dbo].[Service] ([ServiceID], [ServiceType], [Description], [Image]) VALUES (N'205498775', N'T1675', N'Phương pháp phổ biến chuyên giải quyết các vấn đề về da như khô ráp, thiếu sức sống, lão hoá. Tuỳ thuộc vào làn da mà tại các tiệm spa luôn có các liệu trình phù hợp. Sau đây là những lưu ý khi bạn muốn đăng ký chăm sóc da mặt ở các spa', N'spv205498775.jpg')
INSERT [dbo].[Service] ([ServiceID], [ServiceType], [Description], [Image]) VALUES (N'2093654734', N'T1675', N'Là hình thức thư giãn phổ biến mà bất cứ các spa chăm sóc sức khỏe nào cũng có. Dựa trên sự phát triển tiếp thu văn hoá mà các tiệm spa hiện nay ngày càng thay đổi, đa dạng hơn để phù hợp với lối sống chung của xã hội. Giúp hỗ trợ cân bằng khí huyết, đẩy lùi các bệnh về xương khớp và nhìn chung với các loại mô hình massage nào cũng đầy đủ các dụng cụ cần thiết như: tinh dầu,khăn, gối và giường massage,..', N'2093654734.jpg')
INSERT [dbo].[Service] ([ServiceID], [ServiceType], [Description], [Image]) VALUES (N'22785460', N'T1675', N'Nhu cầu làm trắng hiện nay ngày càng được chị em phụ nữ quan tâm và sử dụng. Chính vì thế, các tiệm spa lớn nhỏ bắt đầu triển khai loại hình dịch vụ này cũng như sử dụng nhiều liệu pháp khác nhau để mang lại hiệu quả nổi bật cho người sử dụng. Một số phương pháp tắm trắng phổ biến', N'spv22785460.jpg')
INSERT [dbo].[Service] ([ServiceID], [ServiceType], [Description], [Image]) VALUES (N'308946685', N'T7317', N'Wax lông là phương pháp sẽ đem lại những tác động tích cực đến làn da, giúp thuận lợi trong quá trình tẩy da chết trên da. Lông sau khi wax thường mọc lại chậm và thưa hơn. Ít bị đau hay kích ứng da nếu bạn thực hiện đúng cách. Việc lựa chọn Spa để thực hiện quá trình này là sự lựa chọn đúng đắn. ', N'308946685.jpg')
INSERT [dbo].[Service] ([ServiceID], [ServiceType], [Description], [Image]) VALUES (N'424446946', N'T1675', N'· Không rửa mặt lại trong khoảng 12h để các dưỡng chất spa phát huy tối đa tác dụng  · Không sờ hay đụng vào các vết mụn 24h sau đó để tránh các tình trạng tổn thương, sưng tấy làn da.  · Giảm thiểu các hoạt động mạnh để tránh tình trạng đổ nhiều mồ hôi khiến các dưỡng chất trở nên mất tác dụng  · Da mặt sau khi trị liệu rất mỏng. Vì vậy bạn cần che chắn cẩn thận khi đi ra ngoài, tránh các tiếp xúc từ tia UV xuyên qua da.', N'spv424446946.jpg')
INSERT [dbo].[Service] ([ServiceID], [ServiceType], [Description], [Image]) VALUES (N'460397361', N'T4840', N'Xông hơi được chia thành hai loại cơ bản: xông hơi khô và xông hơi ướt. Mỗi loại có cách sử dụng và ưu nhược điểm khác nhau. ', N'spv460397361.jpg')
INSERT [dbo].[Service] ([ServiceID], [ServiceType], [Description], [Image]) VALUES (N'554805945', N'T1159', N'Mụn là một trong những trở ngại khiến mọi người dễ mất tự ti với làn da khuyết điểm. Đây là bệnh lý về da mặt mà tất cả chúng ta đều đã từng mắc phải, nhất là giai đoạn dậy thì. Tùy từng trường hợp da mà xuất hiện nhiều loại mụn khác nhau: mụn đầu đen, mụn đỏ, mụn nhọt,..', N'spv554805945.jpg')
GO
INSERT [dbo].[ServiceType] ([ServiceType], [Description]) VALUES (N'T1159', N'Điều Trị Mụn')
INSERT [dbo].[ServiceType] ([ServiceType], [Description]) VALUES (N'T1240', N'Điều Trị Nám')
INSERT [dbo].[ServiceType] ([ServiceType], [Description]) VALUES (N'T1432', N'Điều Trị Sẹo')
INSERT [dbo].[ServiceType] ([ServiceType], [Description]) VALUES (N'T1675', N'Chăm Sóc Da')
INSERT [dbo].[ServiceType] ([ServiceType], [Description]) VALUES (N'T1756', N'Điều Trị Thâm')
INSERT [dbo].[ServiceType] ([ServiceType], [Description]) VALUES (N'T2094', N'Thẩm Mỹ')
INSERT [dbo].[ServiceType] ([ServiceType], [Description]) VALUES (N'T4600', N'Giảm Béo')
INSERT [dbo].[ServiceType] ([ServiceType], [Description]) VALUES (N'T4840', N'Dịch Vụ Khác')
INSERT [dbo].[ServiceType] ([ServiceType], [Description]) VALUES (N'T7317', N'Tẩy wax lông')
GO
INSERT [dbo].[Spa] ([SpaID], [SpaName], [Phone], [Address], [Email], [Website], [Zalo], [Facebook], [Description], [Logo], [Image]) VALUES (N'10141', N'Life Spa Cần Thơ', NULL, N' 105 Trần Văn Khéo, Cái Khế, Ninh Kiều, TP Cần Thơ.', N'0292.3769.722', NULL, NULL, N'SpaCatTienCanTho', N'Seoul Spa tự tin mang lại cho quý khách những dịch tốt và hiệu quả nhất.', N'slogo10141.jpg', N'Spa10141.jpg')
INSERT [dbo].[Spa] ([SpaID], [SpaName], [Phone], [Address], [Email], [Website], [Zalo], [Facebook], [Description], [Logo], [Image]) VALUES (N'17286', N'Sen River Spa ', N'0936 586 486', N'Trụ sở chính: 110 Hoa Lan, P2, Q. Phú Nhuận, TP. HCM.', N'songsenltd@gmail.com', N'http://senriverspa.com/', N'0936 598 678', NULL, N'Sen River Spa Cần Thơ được biết đến bởi phong cách spa-thiền. Tại nơi đây bạn sẽ như thoát khỏi chốn bụi trần ồn ào, xóa tan mọi căng thẳng lo âu của cuộc sống thường ngày và bước vào một không gian thanh bình, yên tĩnh để thư giãn và cân bằng lại cuộc sống.', N'slogo17286.jpg', N'Spa17286.jpg')
INSERT [dbo].[Spa] ([SpaID], [SpaName], [Phone], [Address], [Email], [Website], [Zalo], [Facebook], [Description], [Logo], [Image]) VALUES (N'20062', N' Lona Spa', N'1900779902', N'138/29/26B Trần Hưng Đạo, Q.Ninh Kiều , TP.Cần Thơ.', N' lonahomespa@gmail.com', N'lonahomespa.com/', NULL, NULL, N'Lona Spa nổi tiếng tại Cần Thơ luôn xem sự đổi mới từ những xu hướng mới nhất, tinh túy nhất của ngành làm đẹp thế giới … để giúp các chị em chăm sóc sắc đẹp một cách tối ưu nhất là sứ mệnh của mình.', N'slogo20062.png', N'Spa20062.jpg')
INSERT [dbo].[Spa] ([SpaID], [SpaName], [Phone], [Address], [Email], [Website], [Zalo], [Facebook], [Description], [Logo], [Image]) VALUES (N'29365', N'Hà Lan Beauty – Spa Cần Thơ', N'0915.96.9498', N'34, Lý Hồng Thành, Cái Khế, Q. Ninh Kiều, TP Cần Thơ.', N'SpaCanthoct@gmail.com', N'https://spacantho.vn/', N'0915.96.9498', NULL, N'Hà Lan Beauty – Spa Cần Thơ là nơi dành để thư giãn sau những giờ làm việc. Đánh tan mệt mỏi, giảm stress, giúp cơ thể khỏe mạnh và tươi trẻ hơn.', N'logo29365.jpg', N'29365.jpg')
INSERT [dbo].[Spa] ([SpaID], [SpaName], [Phone], [Address], [Email], [Website], [Zalo], [Facebook], [Description], [Logo], [Image]) VALUES (N'45925', N'Spa Cát Tiên', N'0795813688', N'can tho city', N'ntthanha20158@cusc.ctu.edu.vn', N'15sada', N'415601214132', N'SpaCatTienCanTho', NULL, N'logo45925.jpg', N'Spa45925.jpg')
GO
INSERT [dbo].[SpaService] ([SpaServiceID], [ServiceID], [SpaID], [Description], [Price], [DiscountMoney], [DiscountPercent], [Response], [Image]) VALUES (N'1710978716', N'554805945', N'10141', N' Life Spa không ngừng học hỏi và luôn tìm kiếm những giải pháp tốt nhất về Massage.', 300000, 0, 0, 0, N'spv1710978716.jpg')
INSERT [dbo].[SpaService] ([SpaServiceID], [ServiceID], [SpaID], [Description], [Price], [DiscountMoney], [DiscountPercent], [Response], [Image]) VALUES (N'2011750553', N'308946685', N'10141', NULL, 350000, 0, 0, 0, N'spv2011750553.jpg')
INSERT [dbo].[SpaService] ([SpaServiceID], [ServiceID], [SpaID], [Description], [Price], [DiscountMoney], [DiscountPercent], [Response], [Image]) VALUES (N'393351918', N'1294760864', N'10141', N'Seoul Spa chi nhánh Cần Thơ được đầu tư hệ thống máy móc và thiết bị hiện đại, tiên tiến', 15000, 0, 0, 0, N'spv393351918.jpg')
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([SpaID])
REFERENCES [dbo].[Spa] ([SpaID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([CusID])
REFERENCES [dbo].[Customer] ([CusID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([EmpIDAccept])
REFERENCES [dbo].[Employee] ([EmpID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([PaymentFormID])
REFERENCES [dbo].[PaymentForm] ([PaymentFormID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([EmpIDRequest])
REFERENCES [dbo].[Employee] ([EmpID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ServiceFormID])
REFERENCES [dbo].[ServiceForm] ([ServiceFormID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([SpaServiceID])
REFERENCES [dbo].[SpaService] ([SpaServiceID])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([ServiceType])
REFERENCES [dbo].[ServiceType] ([ServiceType])
GO
ALTER TABLE [dbo].[SpaService]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[SpaService]  WITH CHECK ADD FOREIGN KEY([SpaID])
REFERENCES [dbo].[Spa] ([SpaID])
GO
USE [master]
GO
ALTER DATABASE [BeautySystemDB] SET  READ_WRITE 
GO
