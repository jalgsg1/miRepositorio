USE [master]
GO
/****** Object:  Database [BD_Musicos]    Script Date: 23/03/2016 01:51:37 a.m. ******/
CREATE DATABASE [BD_Musicos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_Musicos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BD_Musicos.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BD_Musicos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BD_Musicos_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BD_Musicos] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_Musicos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_Musicos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_Musicos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_Musicos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_Musicos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_Musicos] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_Musicos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_Musicos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_Musicos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_Musicos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_Musicos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_Musicos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_Musicos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_Musicos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_Musicos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_Musicos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_Musicos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_Musicos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_Musicos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_Musicos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_Musicos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_Musicos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_Musicos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_Musicos] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_Musicos] SET  MULTI_USER 
GO
ALTER DATABASE [BD_Musicos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_Musicos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_Musicos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_Musicos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BD_Musicos] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_Musicos', N'ON'
GO
USE [BD_Musicos]
GO
/****** Object:  Table [dbo].[ALBUMES]    Script Date: 23/03/2016 01:51:37 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ALBUMES](
	[id] [int] NOT NULL,
	[nombreAlbum] [varchar](200) NOT NULL,
	[disquera] [varchar](100) NOT NULL,
	[anno] [int] NOT NULL,
 CONSTRAINT [PK_ALBUMES] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ARTISTAS]    Script Date: 23/03/2016 01:51:37 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ARTISTAS](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fechaNac] [date] NOT NULL,
	[biografia] [varchar](500) NULL,
 CONSTRAINT [PK_ARTISTAS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CANCIONES]    Script Date: 23/03/2016 01:51:37 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CANCIONES](
	[id] [int] NOT NULL,
	[nombreCancion] [varchar](400) NOT NULL,
	[genero] [varchar](50) NOT NULL,
	[idCompositor] [int] NOT NULL,
 CONSTRAINT [PK_CANCIONES_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PISTAS]    Script Date: 23/03/2016 01:51:37 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PISTAS](
	[idAlbum] [int] NOT NULL,
	[numPista] [int] NOT NULL,
	[duracion] [time](0) NOT NULL,
	[idCancion] [int] NOT NULL,
	[idInterprete] [int] NOT NULL,
 CONSTRAINT [PK_PISTAS] PRIMARY KEY CLUSTERED 
(
	[idAlbum] ASC,
	[numPista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[CANCIONES]  WITH CHECK ADD  CONSTRAINT [FK_CANCIONES_idCompositor] FOREIGN KEY([idCompositor])
REFERENCES [dbo].[ARTISTAS] ([id])
GO
ALTER TABLE [dbo].[CANCIONES] CHECK CONSTRAINT [FK_CANCIONES_idCompositor]
GO
ALTER TABLE [dbo].[PISTAS]  WITH CHECK ADD  CONSTRAINT [FK_PISTAS_idAlbumes] FOREIGN KEY([idAlbum])
REFERENCES [dbo].[ALBUMES] ([id])
GO
ALTER TABLE [dbo].[PISTAS] CHECK CONSTRAINT [FK_PISTAS_idAlbumes]
GO
ALTER TABLE [dbo].[PISTAS]  WITH CHECK ADD  CONSTRAINT [FK_PISTAS_idArtistas] FOREIGN KEY([idInterprete])
REFERENCES [dbo].[ARTISTAS] ([id])
GO
ALTER TABLE [dbo].[PISTAS] CHECK CONSTRAINT [FK_PISTAS_idArtistas]
GO
ALTER TABLE [dbo].[PISTAS]  WITH CHECK ADD  CONSTRAINT [FK_PISTAS_idCanciones] FOREIGN KEY([idCancion])
REFERENCES [dbo].[CANCIONES] ([id])
GO
ALTER TABLE [dbo].[PISTAS] CHECK CONSTRAINT [FK_PISTAS_idCanciones]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FK de CANCIONES a ARTISTAS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CANCIONES', @level2type=N'CONSTRAINT',@level2name=N'FK_CANCIONES_idCompositor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'hh:mm:ss[nanosec]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PISTAS', @level2type=N'COLUMN',@level2name=N'duracion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Referencia a Albumes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PISTAS', @level2type=N'CONSTRAINT',@level2name=N'FK_PISTAS_idAlbumes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Referencia a ARTISTAS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PISTAS', @level2type=N'CONSTRAINT',@level2name=N'FK_PISTAS_idArtistas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'referencia a CANCIONES' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PISTAS', @level2type=N'CONSTRAINT',@level2name=N'FK_PISTAS_idCanciones'
GO
USE [master]
GO
ALTER DATABASE [BD_Musicos] SET  READ_WRITE 
GO
