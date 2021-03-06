USE [master]
GO
/****** Object:  Database [a4sdb]    Script Date: 9/15/2015 2:41:43 PM ******/
CREATE DATABASE [a4sdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'a4sdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\a4sdb.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'a4sdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\a4sdb_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [a4sdb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [a4sdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [a4sdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [a4sdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [a4sdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [a4sdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [a4sdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [a4sdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [a4sdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [a4sdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [a4sdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [a4sdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [a4sdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [a4sdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [a4sdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [a4sdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [a4sdb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [a4sdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [a4sdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [a4sdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [a4sdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [a4sdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [a4sdb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [a4sdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [a4sdb] SET RECOVERY FULL 
GO
ALTER DATABASE [a4sdb] SET  MULTI_USER 
GO
ALTER DATABASE [a4sdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [a4sdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [a4sdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [a4sdb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [a4sdb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'a4sdb', N'ON'
GO
USE [a4sdb]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Anime]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[JapaneseTitle] [nvarchar](max) NULL,
	[EnglistTitle] [nvarchar](max) NULL,
	[VietnameseTitle] [nvarchar](max) NULL,
	[Episodes] [int] NULL,
	[AiredDate] [datetime] NULL,
	[EndedDate] [datetime] NULL,
	[Duration] [int] NULL,
	[Rating] [int] NULL,
	[Synopsis] [ntext] NOT NULL,
	[OpeningTheme] [nvarchar](2048) NULL,
	[InsertTheme] [nvarchar](2048) NULL,
	[EndingTheme] [nvarchar](2048) NULL,
 CONSTRAINT [PK_Anime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AnimeCharacter]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimeCharacter](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AnimeId] [int] NOT NULL,
	[CharacterId] [int] NOT NULL,
 CONSTRAINT [PK_AnimeCharacter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AnimeGenre]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimeGenre](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AnimeId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
 CONSTRAINT [PK_AnimeGenre] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AnimeProducer]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimeProducer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AnimeId] [int] NOT NULL,
	[ProducerId] [int] NOT NULL,
 CONSTRAINT [PK_AnimeProducer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AnimeStaff]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimeStaff](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AnimeId] [int] NOT NULL,
	[StaffId] [int] NOT NULL,
	[Role] [nvarchar](128) NULL,
 CONSTRAINT [PK_AnimeStaff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Character]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[JapaneseName] [nvarchar](512) NULL,
	[AvatarUrl] [nvarchar](512) NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Character] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CharacterImage]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterImage](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CharacterId] [int] NOT NULL,
	[AvatarUrl] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_CharacterImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CharacterSeiyuu]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterSeiyuu](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CharacterId] [int] NOT NULL,
	[SeiyuuId] [int] NOT NULL,
	[Role] [nvarchar](128) NULL,
 CONSTRAINT [PK_CharacterVoiceActor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FavoritedAnime]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoritedAnime](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[AnimeId] [int] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[DeletedDate] [datetime] NULL,
 CONSTRAINT [PK_FavoritedAnime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FavoritedCharacter]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoritedCharacter](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[CharacterId] [int] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[DeletedDate] [datetime] NULL,
 CONSTRAINT [PK_FavoritedCharacter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FavoritedSeiyuu]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoritedSeiyuu](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[SeiyuuId] [int] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[DeletedDate] [datetime] NULL,
 CONSTRAINT [PK_FavoritedSeiyuu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FollowedAnime]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FollowedAnime](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[AnimeId] [int] NOT NULL,
	[AddedDate] [datetime] NOT NULL,
	[DeletedDate] [datetime] NULL,
	[IsViewed] [bit] NOT NULL,
 CONSTRAINT [PK_FollowedAnime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genre]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producer]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[FamilyName] [nvarchar](256) NULL,
	[JapaneseName] [nvarchar](512) NULL,
	[JapaneseFamilyName] [nvarchar](512) NULL,
	[AvatarUrl] [nvarchar](512) NULL,
	[Birthday] [date] NULL,
	[Website] [nvarchar](512) NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StaffImage]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffImage](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SeiyuuId] [int] NOT NULL,
	[AvatarUrl] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_SeiyuuImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ViewedAnime]    Script Date: 9/15/2015 2:41:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViewedAnime](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[AnimeId] [int] NOT NULL,
	[ViewedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ViewedAnime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 9/15/2015 2:41:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 9/15/2015 2:41:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 9/15/2015 2:41:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 9/15/2015 2:41:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 9/15/2015 2:41:44 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 9/15/2015 2:41:44 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AnimeCharacter]  WITH CHECK ADD  CONSTRAINT [FK_AnimeCharacter_Anime] FOREIGN KEY([AnimeId])
REFERENCES [dbo].[Anime] ([Id])
GO
ALTER TABLE [dbo].[AnimeCharacter] CHECK CONSTRAINT [FK_AnimeCharacter_Anime]
GO
ALTER TABLE [dbo].[AnimeCharacter]  WITH CHECK ADD  CONSTRAINT [FK_AnimeCharacter_Character] FOREIGN KEY([CharacterId])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[AnimeCharacter] CHECK CONSTRAINT [FK_AnimeCharacter_Character]
GO
ALTER TABLE [dbo].[AnimeGenre]  WITH CHECK ADD  CONSTRAINT [FK_AnimeGenre_Anime] FOREIGN KEY([AnimeId])
REFERENCES [dbo].[Anime] ([Id])
GO
ALTER TABLE [dbo].[AnimeGenre] CHECK CONSTRAINT [FK_AnimeGenre_Anime]
GO
ALTER TABLE [dbo].[AnimeGenre]  WITH CHECK ADD  CONSTRAINT [FK_AnimeGenre_Genre] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([Id])
GO
ALTER TABLE [dbo].[AnimeGenre] CHECK CONSTRAINT [FK_AnimeGenre_Genre]
GO
ALTER TABLE [dbo].[AnimeProducer]  WITH CHECK ADD  CONSTRAINT [FK_AnimeProducer_Anime] FOREIGN KEY([AnimeId])
REFERENCES [dbo].[Anime] ([Id])
GO
ALTER TABLE [dbo].[AnimeProducer] CHECK CONSTRAINT [FK_AnimeProducer_Anime]
GO
ALTER TABLE [dbo].[AnimeProducer]  WITH CHECK ADD  CONSTRAINT [FK_AnimeProducer_Producer] FOREIGN KEY([ProducerId])
REFERENCES [dbo].[Producer] ([Id])
GO
ALTER TABLE [dbo].[AnimeProducer] CHECK CONSTRAINT [FK_AnimeProducer_Producer]
GO
ALTER TABLE [dbo].[AnimeStaff]  WITH CHECK ADD  CONSTRAINT [FK_AnimeStaff_Anime] FOREIGN KEY([AnimeId])
REFERENCES [dbo].[Anime] ([Id])
GO
ALTER TABLE [dbo].[AnimeStaff] CHECK CONSTRAINT [FK_AnimeStaff_Anime]
GO
ALTER TABLE [dbo].[AnimeStaff]  WITH CHECK ADD  CONSTRAINT [FK_AnimeStaff_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([Id])
GO
ALTER TABLE [dbo].[AnimeStaff] CHECK CONSTRAINT [FK_AnimeStaff_Staff]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CharacterImage]  WITH CHECK ADD  CONSTRAINT [FK_CharacterImage_Character] FOREIGN KEY([CharacterId])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[CharacterImage] CHECK CONSTRAINT [FK_CharacterImage_Character]
GO
ALTER TABLE [dbo].[CharacterSeiyuu]  WITH CHECK ADD  CONSTRAINT [FK_CharacterSeiyuu_Staff] FOREIGN KEY([SeiyuuId])
REFERENCES [dbo].[Staff] ([Id])
GO
ALTER TABLE [dbo].[CharacterSeiyuu] CHECK CONSTRAINT [FK_CharacterSeiyuu_Staff]
GO
ALTER TABLE [dbo].[CharacterSeiyuu]  WITH CHECK ADD  CONSTRAINT [FK_CharacterVoiceActor_Character] FOREIGN KEY([CharacterId])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[CharacterSeiyuu] CHECK CONSTRAINT [FK_CharacterVoiceActor_Character]
GO
ALTER TABLE [dbo].[FavoritedAnime]  WITH CHECK ADD  CONSTRAINT [FK_FavoritedAnime_Anime] FOREIGN KEY([AnimeId])
REFERENCES [dbo].[Anime] ([Id])
GO
ALTER TABLE [dbo].[FavoritedAnime] CHECK CONSTRAINT [FK_FavoritedAnime_Anime]
GO
ALTER TABLE [dbo].[FavoritedAnime]  WITH CHECK ADD  CONSTRAINT [FK_FavoritedAnime_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[FavoritedAnime] CHECK CONSTRAINT [FK_FavoritedAnime_AspNetUsers]
GO
ALTER TABLE [dbo].[FavoritedCharacter]  WITH CHECK ADD  CONSTRAINT [FK_FavoritedCharacter_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[FavoritedCharacter] CHECK CONSTRAINT [FK_FavoritedCharacter_AspNetUsers]
GO
ALTER TABLE [dbo].[FavoritedCharacter]  WITH CHECK ADD  CONSTRAINT [FK_FavoritedCharacter_Character] FOREIGN KEY([CharacterId])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[FavoritedCharacter] CHECK CONSTRAINT [FK_FavoritedCharacter_Character]
GO
ALTER TABLE [dbo].[FavoritedSeiyuu]  WITH CHECK ADD  CONSTRAINT [FK_FavoritedSeiyuu_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[FavoritedSeiyuu] CHECK CONSTRAINT [FK_FavoritedSeiyuu_AspNetUsers]
GO
ALTER TABLE [dbo].[FavoritedSeiyuu]  WITH CHECK ADD  CONSTRAINT [FK_FavoritedSeiyuu_Staff] FOREIGN KEY([SeiyuuId])
REFERENCES [dbo].[Staff] ([Id])
GO
ALTER TABLE [dbo].[FavoritedSeiyuu] CHECK CONSTRAINT [FK_FavoritedSeiyuu_Staff]
GO
ALTER TABLE [dbo].[FollowedAnime]  WITH CHECK ADD  CONSTRAINT [FK_FollowedAnime_Anime] FOREIGN KEY([AnimeId])
REFERENCES [dbo].[Anime] ([Id])
GO
ALTER TABLE [dbo].[FollowedAnime] CHECK CONSTRAINT [FK_FollowedAnime_Anime]
GO
ALTER TABLE [dbo].[FollowedAnime]  WITH CHECK ADD  CONSTRAINT [FK_FollowedAnime_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[FollowedAnime] CHECK CONSTRAINT [FK_FollowedAnime_AspNetUsers]
GO
ALTER TABLE [dbo].[StaffImage]  WITH CHECK ADD  CONSTRAINT [FK_SeiyuuImage_Seiyuu] FOREIGN KEY([SeiyuuId])
REFERENCES [dbo].[Staff] ([Id])
GO
ALTER TABLE [dbo].[StaffImage] CHECK CONSTRAINT [FK_SeiyuuImage_Seiyuu]
GO
ALTER TABLE [dbo].[ViewedAnime]  WITH CHECK ADD  CONSTRAINT [FK_ViewedAnime_Anime] FOREIGN KEY([AnimeId])
REFERENCES [dbo].[Anime] ([Id])
GO
ALTER TABLE [dbo].[ViewedAnime] CHECK CONSTRAINT [FK_ViewedAnime_Anime]
GO
ALTER TABLE [dbo].[ViewedAnime]  WITH CHECK ADD  CONSTRAINT [FK_ViewedAnime_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ViewedAnime] CHECK CONSTRAINT [FK_ViewedAnime_AspNetUsers]
GO
USE [master]
GO
ALTER DATABASE [a4sdb] SET  READ_WRITE 
GO
