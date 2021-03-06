 
CREATE DATABASE [LIBRERIA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LIBRERIA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LIBRERIA.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LIBRERIA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\LIBRERIA_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LIBRERIA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LIBRERIA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LIBRERIA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LIBRERIA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LIBRERIA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LIBRERIA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LIBRERIA] SET ARITHABORT OFF 
GO
ALTER DATABASE [LIBRERIA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LIBRERIA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LIBRERIA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LIBRERIA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LIBRERIA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LIBRERIA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LIBRERIA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LIBRERIA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LIBRERIA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LIBRERIA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LIBRERIA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LIBRERIA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LIBRERIA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LIBRERIA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LIBRERIA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LIBRERIA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LIBRERIA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LIBRERIA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LIBRERIA] SET  MULTI_USER 
GO
ALTER DATABASE [LIBRERIA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LIBRERIA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LIBRERIA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LIBRERIA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [LIBRERIA] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LIBRERIA]
GO
/****** Object:  Table [dbo].[T_AUTORES]    Script Date: 22/02/2021 9:42:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_AUTORES](
	[ID_AUTOR] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE_AUTOR] [nvarchar](150) NULL,
	[FECHA_NACIMIENTO_AUTOR] [datetime] NULL,
	[CIUDAD_AUTOR] [nvarchar](150) NULL,
	[CORREO_AUTOR] [nvarchar](150) NULL,
 CONSTRAINT [PK_T_AUTORES] PRIMARY KEY CLUSTERED 
(
	[ID_AUTOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_EDITORIALES]    Script Date: 22/02/2021 9:42:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_EDITORIALES](
	[ID_EDITORIAL] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE_EDITORIAL] [nvarchar](150) NULL,
	[DIRECCION_EDITORIAL] [nvarchar](150) NULL,
	[TELEFONO_EDITORIAL] [decimal](18, 0) NULL,
	[CORREO_EDITORIAL] [nvarchar](150) NULL,
	[MAXIMO_LIBROS_RESGISTRADOS_EDITORIAL] [int] NULL,
 CONSTRAINT [PK_T_EDITORIALES] PRIMARY KEY CLUSTERED 
(
	[ID_EDITORIAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_LIBROS]    Script Date: 22/02/2021 9:42:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_LIBROS](
	[ID_LIBRO] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](150) NULL,
	[Año] [int] NULL,
	[Genero] [nvarchar](150) NULL,
	[Numero_Paginas] [int] NULL,
	[Editorial] [int] NULL,
	[Autor] [int] NULL,
 CONSTRAINT [PK_T_Libros] PRIMARY KEY CLUSTERED 
(
	[ID_LIBRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[V_LIBROS]    Script Date: 22/02/2021 9:42:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_LIBROS]
AS
SELECT        dbo.T_LIBROS.Titulo, dbo.T_LIBROS.Año, dbo.T_LIBROS.Genero, dbo.T_LIBROS.Numero_Paginas, dbo.T_AUTORES.NOMBRE_AUTOR, dbo.T_EDITORIALES.NOMBRE_EDITORIAL
FROM            dbo.T_AUTORES INNER JOIN
                         dbo.T_LIBROS ON dbo.T_AUTORES.ID_AUTOR = dbo.T_LIBROS.Autor INNER JOIN
                         dbo.T_EDITORIALES ON dbo.T_LIBROS.Editorial = dbo.T_EDITORIALES.ID_EDITORIAL

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[70] 4[5] 2[5] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "T_AUTORES"
            Begin Extent = 
               Top = 182
               Left = 368
               Bottom = 363
               Right = 703
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T_LIBROS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 300
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T_EDITORIALES"
            Begin Extent = 
               Top = 0
               Left = 375
               Bottom = 170
               Right = 703
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1545
         Width = 1920
         Width = 1830
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_LIBROS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_LIBROS'
GO
USE [master]
GO
ALTER DATABASE [LIBRERIA] SET  READ_WRITE 
GO
