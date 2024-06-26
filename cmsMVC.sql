USE [master]
GO
/****** Object:  Database [CustomCMS]    Script Date: 3/20/2024 1:21:08 PM ******/
CREATE DATABASE [CustomCMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CustomCMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CustomCMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CustomCMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CustomCMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CustomCMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CustomCMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CustomCMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CustomCMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CustomCMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CustomCMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [CustomCMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CustomCMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CustomCMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CustomCMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CustomCMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CustomCMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CustomCMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CustomCMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CustomCMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CustomCMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CustomCMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CustomCMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CustomCMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CustomCMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CustomCMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CustomCMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CustomCMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CustomCMS] SET RECOVERY FULL 
GO
ALTER DATABASE [CustomCMS] SET  MULTI_USER 
GO
ALTER DATABASE [CustomCMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CustomCMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CustomCMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CustomCMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CustomCMS', N'ON'
GO
USE [CustomCMS]
GO
/****** Object:  User [saadmin]    Script Date: 3/20/2024 1:21:08 PM ******/
CREATE USER [saadmin] FOR LOGIN [saadmin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CMSUserRoleId] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Pwd] [nvarchar](200) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](200) NULL,
	[isDeleted] [bit] NOT NULL,
	[isDisabled] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumContent]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[AlbumId] [int] NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_AlbumContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albums](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Image] [nvarchar](500) NULL,
	[VideoFile] [nvarchar](500) NULL,
	[DisplayOrder] [int] NOT NULL,
	[IsHidden] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Albums] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumsItems]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumsItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AlbumId] [int] NOT NULL,
	[LangId] [int] NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[YoutubeVideo] [nvarchar](500) NULL,
	[ItemType] [nvarchar](100) NULL,
	[Image] [nvarchar](500) NULL,
	[MobileImage] [nvarchar](500) NULL,
	[Fileitem] [nvarchar](500) NULL,
	[Videoitem] [nvarchar](500) NULL,
	[OrderDisplay] [int] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[isHidden] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AlbumsItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Culture] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Descr] [text] NULL,
	[LogDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageContentTypeFields]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageContentTypeFields](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[TypeId] [int] NOT NULL,
	[TypeName] [nvarchar](100) NULL,
 CONSTRAINT [PK_PageContentTypeFields] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageContentTypesIds]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageContentTypesIds](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_PageContentTypesIds] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Link] [nvarchar](max) NOT NULL,
	[FriendlyUrl] [nvarchar](max) NULL,
	[PageContentID] [int] NOT NULL,
	[PageTemplateID] [int] NOT NULL,
	[MenuOrder] [int] NOT NULL,
	[isHidden] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagesContents]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagesContents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NOT NULL,
	[LangId] [int] NOT NULL,
	[ContentFieldID] [int] NOT NULL,
	[ContentFieldTypeID] [int] NOT NULL,
	[HtmlContent] [nvarchar](max) NULL,
	[ImageContent] [nvarchar](max) NULL,
	[FileContent] [nvarchar](max) NULL,
	[DateContent] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PagesContents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagesContentTypes]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagesContentTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_ContentTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagesFriendlyUrl]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagesFriendlyUrl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[FriendlyUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_PagesFriendlyUrl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagesGallery]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagesGallery](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PageId] [int] NOT NULL,
	[Image] [nvarchar](500) NULL,
	[Display] [int] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[isHidden] [bit] NOT NULL,
 CONSTRAINT [PK_ProjectGallery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageTemplate]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageTemplate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Link] [nvarchar](200) NULL,
	[ContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_PageTemplate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscribers]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscribers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](250) NULL,
	[SubscriptionDate] [datetime] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[IpAddress] [nvarchar](250) NULL,
 CONSTRAINT [PK_Subscribers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddresses]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AddressName] [nvarchar](200) NULL,
	[Address1] [nvarchar](500) NULL,
	[Address2] [nvarchar](500) NULL,
	[Country] [nvarchar](200) NULL,
	[Phone] [nvarchar](30) NULL,
	[City] [nvarchar](200) NULL,
	[State] [nvarchar](200) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[RequestedDate] [datetime] NULL,
	[Approved] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[IsDefaultAddress] [bit] NOT NULL,
 CONSTRAINT [PK_UserAddresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/20/2024 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[FirstName] [nvarchar](200) NULL,
	[LastName] [nvarchar](200) NULL,
	[Mobile] [nvarchar](200) NULL,
	[JobTitle] [nvarchar](200) NULL,
	[CompanyName] [nvarchar](200) NULL,
	[FBProfileId] [nvarchar](500) NULL,
	[Blocked] [bit] NOT NULL,
	[RegisteredDate] [datetime] NOT NULL,
	[IpAddress] [nvarchar](500) NULL,
	[isDeleted] [bit] NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[ConfirmationDate] [datetime] NULL,
	[FirstLoginDate] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [CMSUserRoleId], [UserName], [Pwd], [FirstName], [LastName], [Email], [isDeleted], [isDisabled], [CreateDate]) VALUES (1, 1, N'admin', N'l|?E???\?S??l^.??z', N'admin', N'admin', N'admin@admin.com', 0, 0, CAST(N'2021-01-28T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[AlbumContent] ON 

INSERT [dbo].[AlbumContent] ([Id], [LangId], [AlbumId], [Title], [Description]) VALUES (2, 1, 4, N'The Root', N'This is the Root folder 1')
INSERT [dbo].[AlbumContent] ([Id], [LangId], [AlbumId], [Title], [Description]) VALUES (3, 1, 5, N'Album 1', N'Album 1')
SET IDENTITY_INSERT [dbo].[AlbumContent] OFF
SET IDENTITY_INSERT [dbo].[Albums] ON 

INSERT [dbo].[Albums] ([Id], [ParentId], [Name], [Image], [VideoFile], [DisplayOrder], [IsHidden], [IsDeleted]) VALUES (4, -1, NULL, N'3da569dc-0753-4220-9bc4-84a575b1f5d7.jpg', NULL, 1, 0, 0)
INSERT [dbo].[Albums] ([Id], [ParentId], [Name], [Image], [VideoFile], [DisplayOrder], [IsHidden], [IsDeleted]) VALUES (5, 4, NULL, N'50d8b70e-a6e4-412c-88eb-ceec9cec9b6d.jpg', NULL, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[Albums] OFF
SET IDENTITY_INSERT [dbo].[Language] ON 

INSERT [dbo].[Language] ([Id], [Name], [Culture]) VALUES (1, N'English', N'En-US')
SET IDENTITY_INSERT [dbo].[Language] OFF
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (38, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2021-02-03T15:03:04.387' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (39, 1, N'Create Page', N'User ''admin'' Created a page: ''Home 2''', CAST(N'2021-02-03T15:47:11.923' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (40, 1, N'Create Page', N'User ''admin'' Created a page: ''test empty''', CAST(N'2021-02-04T09:36:17.167' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (41, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home 2''', CAST(N'2021-02-04T09:39:18.980' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (42, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home 2''', CAST(N'2021-02-21T11:11:16.337' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (43, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home 2''', CAST(N'2021-02-21T15:09:54.010' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (44, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home 2''', CAST(N'2021-02-21T15:22:18.597' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (45, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home 2''', CAST(N'2021-02-21T15:25:01.283' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (46, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home 2''', CAST(N'2021-02-21T15:37:12.743' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (47, 1, N'Edit Page', N'User ''admin'' updated a page: ''test empty''', CAST(N'2021-02-21T15:51:25.367' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (48, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2021-02-21T15:53:31.793' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (49, 1, N'Create Page', N'User ''admin'' Created a page: ''test Empty 2''', CAST(N'2021-03-01T10:28:27.297' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (50, 1, N'Create Page', N'User ''admin'' Created a page: ''test Team 3''', CAST(N'2021-03-01T10:44:08.750' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (51, 1, N'Edit Page', N'User ''admin'' updated a page: ''test Team 3''', CAST(N'2021-03-01T11:34:49.133' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (52, 1, N'Edit Page', N'User ''admin'' updated a page: ''test Team 3''', CAST(N'2021-03-01T11:38:37.627' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (53, 1, N'Edit Page', N'User ''admin'' updated a page: ''test Team 3''', CAST(N'2021-03-01T11:50:33.033' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (54, 1, N'Edit Page', N'User ''admin'' updated a page: ''test Team 3''', CAST(N'2021-03-01T11:54:34.647' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (55, 1, N'Edit Page', N'User ''admin'' updated a page: ''test Team 3''', CAST(N'2021-03-01T12:11:41.773' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (56, 1, N'Edit Page', N'User ''admin'' updated a page: ''test Empty 2''', CAST(N'2021-03-01T13:26:54.280' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (57, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2021-03-03T11:16:43.297' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (58, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2021-03-07T17:18:50.963' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (59, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2021-03-07T17:26:02.810' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (60, 1, N'Create Page', N'User ''admin'' Created a page: ''test Team 4''', CAST(N'2021-03-07T17:28:00.930' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (61, 1, N'Edit Page', N'User ''admin'' updated a page: ''test empty''', CAST(N'2021-03-07T17:48:28.830' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (62, 1, N'Edit Page', N'User ''admin'' updated a page: ''test empty''', CAST(N'2021-03-07T17:49:55.593' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (63, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2021-03-22T08:06:49.217' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (64, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2021-03-22T08:13:21.480' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (65, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2021-03-22T08:13:50.420' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (66, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2021-03-22T10:40:50.090' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (67, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2021-03-22T10:49:06.957' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (68, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2021-03-22T10:49:36.887' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (69, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2021-03-22T11:12:40.187' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (70, 1, N'Create Page', N'User ''admin'' Created a page: ''test items 3''', CAST(N'2021-03-22T11:32:43.597' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (71, 1, N'Edit Page', N'User ''admin'' updated a page: ''test items 3''', CAST(N'2021-03-22T11:32:59.243' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (72, 1, N'Edit Page', N'User ''admin'' updated a page: ''test items 3''', CAST(N'2021-03-22T11:53:06.047' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (73, 1, N'Edit Page', N'User ''admin'' updated a page: ''test items 3''', CAST(N'2021-03-22T11:56:35.933' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (74, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2021-03-22T12:14:50.833' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (75, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2021-10-17T14:12:52.190' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (76, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2021-10-17T14:13:13.907' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (77, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home ''', CAST(N'2022-01-25T10:19:20.023' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (78, 1, N'Create Page', N'User ''admin'' Created a page: ''test home''', CAST(N'2022-01-25T10:56:49.563' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (79, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T11:18:24.220' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (80, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T11:21:04.140' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (81, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T11:48:24.360' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (82, 1, N'Create Page', N'User ''admin'' Created a page: ''Home ''', CAST(N'2022-01-25T11:49:09.080' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (83, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T11:50:25.283' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (84, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T11:53:10.337' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (85, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T11:56:15.433' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (86, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T11:56:32.937' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (87, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T11:57:17.287' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (88, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T11:58:01.740' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (89, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T12:01:18.040' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (90, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T12:01:35.637' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (91, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T12:02:19.937' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (92, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T12:02:38.163' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (93, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T12:04:57.237' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (94, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T12:06:00.537' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (95, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T12:11:06.103' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (96, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T12:19:49.757' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (97, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T12:22:38.777' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (98, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-25T12:23:01.057' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (99, 1, N'Create Page', N'User ''admin'' Created a page: ''Home ''', CAST(N'2022-01-25T12:39:47.497' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (100, 1, N'Create Page', N'User ''admin'' Created a page: ''Home''', CAST(N'2022-01-25T12:43:47.490' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (101, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-25T12:45:30.467' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (102, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-25T12:46:20.057' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (103, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-25T13:01:15.177' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (104, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-25T13:01:34.403' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (105, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-25T13:01:48.087' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (106, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-25T13:06:36.617' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (107, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-25T13:07:42.423' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (108, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-25T13:09:43.593' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (109, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-25T13:13:08.547' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (110, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-25T13:13:21.277' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (111, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-25T13:13:44.940' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (112, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-25T13:14:00.770' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (113, 1, N'Create Page', N'User ''admin'' Created a page: ''Sub home''', CAST(N'2022-01-25T13:14:34.317' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (114, 1, N'Edit user', N'User ''admin'' Edit the information of: ''admin''', CAST(N'2022-01-25T13:36:13.497' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (115, 1, N'Edit user', N'User ''admin'' Edit the information of: ''admin''', CAST(N'2022-01-25T13:36:24.707' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (116, 1, N'Edit user', N'User ''admin'' Edit the information of: ''admin''', CAST(N'2022-01-25T13:36:32.053' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (117, 1, N'Change Password', N'User ''admin'' changed password of: ''admin''', CAST(N'2022-01-25T13:36:43.377' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (118, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-25T13:38:17.470' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (119, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-25T13:38:49.613' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1114, 1, N'Create Page', N'User ''admin'' Created a page: ''test home''', CAST(N'2022-01-25T19:53:40.933' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1115, 1, N'Create Page', N'User ''admin'' Created a page: ''test home''', CAST(N'2022-01-25T19:55:31.647' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1116, 1, N'Create Page', N'User ''admin'' Created a page: ''test home''', CAST(N'2022-01-25T19:56:51.893' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1117, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-26T09:49:28.857' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1118, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-26T09:52:55.320' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1119, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-26T10:01:54.803' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1120, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-26T10:06:43.177' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1121, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-26T11:25:08.543' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1122, 1, N'Create Page', N'User ''admin'' Created a page: ''Banners''', CAST(N'2022-01-26T11:25:41.357' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1123, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-26T11:25:52.310' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1124, 1, N'Create Page', N'User ''admin'' Created a page: ''Banner 1''', CAST(N'2022-01-26T11:28:23.003' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1125, 1, N'Create Page', N'User ''admin'' Created a page: ''Banner2''', CAST(N'2022-01-26T11:28:57.540' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1126, 1, N'Edit Page', N'User ''admin'' updated a page: ''Banner2''', CAST(N'2022-01-26T11:29:05.553' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1127, 1, N'Edit Page', N'User ''admin'' updated a page: ''Banner 1''', CAST(N'2022-01-26T11:49:21.967' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1128, 1, N'Edit Page', N'User ''admin'' updated a page: ''Banner2''', CAST(N'2022-01-26T11:49:38.440' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1129, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-26T11:49:56.800' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1130, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-26T12:05:33.130' AS DateTime))
GO
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1131, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-26T12:06:02.243' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1132, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-26T12:26:20.027' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1133, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-26T12:34:02.347' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1134, 1, N'Create Page', N'User ''admin'' Created a page: ''Objectives List''', CAST(N'2022-01-26T12:37:05.280' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1135, 1, N'Create Page', N'User ''admin'' Created a page: ''7k''', CAST(N'2022-01-26T12:37:43.390' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1136, 1, N'Create Page', N'User ''admin'' Created a page: ''109''', CAST(N'2022-01-26T12:38:08.243' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1137, 1, N'Create Page', N'User ''admin'' Created a page: ''35''', CAST(N'2022-01-26T12:38:41.130' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1138, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-26T12:50:08.907' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1139, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-26T13:20:44.893' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1140, 1, N'Create Page', N'User ''admin'' Created a page: ''Menu''', CAST(N'2022-01-26T13:29:05.010' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1141, 1, N'Create Page', N'User ''admin'' Created a page: ''Social media''', CAST(N'2022-01-26T13:30:05.293' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1142, 1, N'Create Page', N'User ''admin'' Created a page: ''Instagram''', CAST(N'2022-01-26T13:31:36.647' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1143, 1, N'Edit Page', N'User ''admin'' updated a page: ''Instagram''', CAST(N'2022-01-26T13:31:54.997' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1144, 1, N'Create Page', N'User ''admin'' Created a page: ''Facebook''', CAST(N'2022-01-26T13:32:48.127' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1145, 1, N'Edit Page', N'User ''admin'' updated a page: ''Facebook''', CAST(N'2022-01-26T13:32:58.293' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1146, 1, N'Create Page', N'User ''admin'' Created a page: ''Twitter''', CAST(N'2022-01-26T13:33:40.127' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1147, 1, N'Edit Page', N'User ''admin'' updated a page: ''Twitter''', CAST(N'2022-01-26T13:33:47.770' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1148, 1, N'Edit Page', N'User ''admin'' updated a page: ''Instagram''', CAST(N'2022-01-26T13:34:01.493' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1149, 1, N'Edit Page', N'User ''admin'' updated a page: ''Facebook''', CAST(N'2022-01-26T13:34:21.087' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1150, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-26T13:35:14.343' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1151, 1, N'Create Page', N'User ''admin'' Created a page: ''Whatsapp''', CAST(N'2022-01-26T13:35:54.410' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1152, 1, N'Edit Page', N'User ''admin'' updated a page: ''Whatsapp''', CAST(N'2022-01-26T13:36:02.260' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1153, 1, N'Edit Page', N'User ''admin'' updated a page: ''Root''', CAST(N'2022-01-26T13:54:58.167' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1154, 1, N'Create Page', N'User ''admin'' Created a page: ''Support''', CAST(N'2022-01-26T13:58:50.310' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1155, 1, N'Create Page', N'User ''admin'' Created a page: ''Support''', CAST(N'2022-01-26T13:58:50.313' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1156, 1, N'Create Page', N'User ''admin'' Created a page: ''About''', CAST(N'2022-01-26T13:59:08.483' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1157, 1, N'Create Page', N'User ''admin'' Created a page: ''Contact''', CAST(N'2022-01-26T13:59:22.800' AS DateTime))
INSERT [dbo].[Log] ([Id], [UserId], [Title], [Descr], [LogDate]) VALUES (1158, 1, N'Edit Page', N'User ''admin'' updated a page: ''Home''', CAST(N'2022-01-26T14:07:03.247' AS DateTime))
SET IDENTITY_INSERT [dbo].[Log] OFF
SET IDENTITY_INSERT [dbo].[PageContentTypeFields] ON 

INSERT [dbo].[PageContentTypeFields] ([id], [ParentID], [Name], [TypeId], [TypeName]) VALUES (0, 0, N'Title', 2, N'Text')
INSERT [dbo].[PageContentTypeFields] ([id], [ParentID], [Name], [TypeId], [TypeName]) VALUES (5, 0, N'Image', 3, N'Image')
INSERT [dbo].[PageContentTypeFields] ([id], [ParentID], [Name], [TypeId], [TypeName]) VALUES (6, 0, N'Date1', 5, N'Date')
INSERT [dbo].[PageContentTypeFields] ([id], [ParentID], [Name], [TypeId], [TypeName]) VALUES (7, 0, N'File1', 4, N'File')
INSERT [dbo].[PageContentTypeFields] ([id], [ParentID], [Name], [TypeId], [TypeName]) VALUES (8, 0, N'Gallery1', 7, N'GalleryItem')
INSERT [dbo].[PageContentTypeFields] ([id], [ParentID], [Name], [TypeId], [TypeName]) VALUES (9, 0, N'multi_Items_Node', 6, N'Items')
SET IDENTITY_INSERT [dbo].[PageContentTypeFields] OFF
SET IDENTITY_INSERT [dbo].[PageContentTypesIds] ON 

INSERT [dbo].[PageContentTypesIds] ([Id], [Name]) VALUES (1, N'Html')
INSERT [dbo].[PageContentTypesIds] ([Id], [Name]) VALUES (2, N'Text')
INSERT [dbo].[PageContentTypesIds] ([Id], [Name]) VALUES (3, N'Image')
INSERT [dbo].[PageContentTypesIds] ([Id], [Name]) VALUES (4, N'File')
INSERT [dbo].[PageContentTypesIds] ([Id], [Name]) VALUES (5, N'Date')
INSERT [dbo].[PageContentTypesIds] ([Id], [Name]) VALUES (6, N'Items')
INSERT [dbo].[PageContentTypesIds] ([Id], [Name]) VALUES (7, N'GalleryItem')
SET IDENTITY_INSERT [dbo].[PageContentTypesIds] OFF
SET IDENTITY_INSERT [dbo].[Pages] ON 

INSERT [dbo].[Pages] ([Id], [ParentId], [Name], [Link], [FriendlyUrl], [PageContentID], [PageTemplateID], [MenuOrder], [isHidden], [isDeleted]) VALUES (1, -1, N'Root', N'/', N'/', 2, 0, 1, 0, 0)
INSERT [dbo].[Pages] ([Id], [ParentId], [Name], [Link], [FriendlyUrl], [PageContentID], [PageTemplateID], [MenuOrder], [isHidden], [isDeleted]) VALUES (7, 1, N'Home', N'/Home/index?pageid=7', N'/home', 1, 1, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[Pages] OFF
SET IDENTITY_INSERT [dbo].[PagesContentTypes] ON 

INSERT [dbo].[PagesContentTypes] ([Id], [Name]) VALUES (0, N'Default')
INSERT [dbo].[PagesContentTypes] ([Id], [Name]) VALUES (1, N'Home')
INSERT [dbo].[PagesContentTypes] ([Id], [Name]) VALUES (2, N'RootContent')
SET IDENTITY_INSERT [dbo].[PagesContentTypes] OFF
SET IDENTITY_INSERT [dbo].[PageTemplate] ON 

INSERT [dbo].[PageTemplate] ([id], [Name], [Link], [ContentTypeId]) VALUES (0, N'Default', N'', 0)
INSERT [dbo].[PageTemplate] ([id], [Name], [Link], [ContentTypeId]) VALUES (1, N'Home', N'/Home/Index', 1)
SET IDENTITY_INSERT [dbo].[PageTemplate] OFF
ALTER TABLE [dbo].[AlbumContent]  WITH CHECK ADD  CONSTRAINT [FK_AlbumContent_Albums] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Albums] ([Id])
GO
ALTER TABLE [dbo].[AlbumContent] CHECK CONSTRAINT [FK_AlbumContent_Albums]
GO
ALTER TABLE [dbo].[AlbumContent]  WITH CHECK ADD  CONSTRAINT [FK_AlbumContent_Language] FOREIGN KEY([LangId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[AlbumContent] CHECK CONSTRAINT [FK_AlbumContent_Language]
GO
ALTER TABLE [dbo].[AlbumsItems]  WITH CHECK ADD  CONSTRAINT [FK_AlbumsItems_Albums] FOREIGN KEY([AlbumId])
REFERENCES [dbo].[Albums] ([Id])
GO
ALTER TABLE [dbo].[AlbumsItems] CHECK CONSTRAINT [FK_AlbumsItems_Albums]
GO
ALTER TABLE [dbo].[AlbumsItems]  WITH CHECK ADD  CONSTRAINT [FK_AlbumsItems_Language] FOREIGN KEY([LangId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[AlbumsItems] CHECK CONSTRAINT [FK_AlbumsItems_Language]
GO
ALTER TABLE [dbo].[PageContentTypeFields]  WITH CHECK ADD  CONSTRAINT [FK_PageContentTypeFields_PagesContentTypes] FOREIGN KEY([ParentID])
REFERENCES [dbo].[PagesContentTypes] ([Id])
GO
ALTER TABLE [dbo].[PageContentTypeFields] CHECK CONSTRAINT [FK_PageContentTypeFields_PagesContentTypes]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_PageTemplate] FOREIGN KEY([PageTemplateID])
REFERENCES [dbo].[PageTemplate] ([id])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_PageTemplate]
GO
ALTER TABLE [dbo].[PagesContents]  WITH CHECK ADD  CONSTRAINT [FK_PagesContents_Pages] FOREIGN KEY([PageID])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[PagesContents] CHECK CONSTRAINT [FK_PagesContents_Pages]
GO
ALTER TABLE [dbo].[PagesFriendlyUrl]  WITH CHECK ADD  CONSTRAINT [FK_PagesFriendlyUrl_Language] FOREIGN KEY([LangId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[PagesFriendlyUrl] CHECK CONSTRAINT [FK_PagesFriendlyUrl_Language]
GO
ALTER TABLE [dbo].[PagesGallery]  WITH CHECK ADD  CONSTRAINT [FK_PagesGallery_Pages] FOREIGN KEY([PageId])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[PagesGallery] CHECK CONSTRAINT [FK_PagesGallery_Pages]
GO
USE [master]
GO
ALTER DATABASE [CustomCMS] SET  READ_WRITE 
GO
