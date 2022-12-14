USE [PROG260FA22]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_InfoReport_Character'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_InfoReport_Character'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_FullReport_Character'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_FullReport_Character'
GO
/****** Object:  StoredProcedure [dbo].[spFindNonTypeSwordFighters]    Script Date: 10/30/2022 9:33:51 PM ******/
DROP PROCEDURE [dbo].[spFindNonTypeSwordFighters]
GO
/****** Object:  StoredProcedure [dbo].[spFindCharactersWithNoMaps]    Script Date: 10/30/2022 9:33:51 PM ******/
DROP PROCEDURE [dbo].[spFindCharactersWithNoMaps]
GO
ALTER TABLE [dbo].[Character] DROP CONSTRAINT [FK_Character_Character_Types]
GO
ALTER TABLE [dbo].[Character] DROP CONSTRAINT [FK_Character_Character_Maps]
GO
ALTER TABLE [dbo].[Character] DROP CONSTRAINT [FK_Character_Characte_Info]
GO
/****** Object:  View [dbo].[vw_InfoReport_Character]    Script Date: 10/30/2022 9:33:51 PM ******/
DROP VIEW [dbo].[vw_InfoReport_Character]
GO
/****** Object:  View [dbo].[vw_FullReport_Character]    Script Date: 10/30/2022 9:33:51 PM ******/
DROP VIEW [dbo].[vw_FullReport_Character]
GO
/****** Object:  Table [dbo].[Character]    Script Date: 10/30/2022 9:33:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Character]') AND type in (N'U'))
DROP TABLE [dbo].[Character]
GO
/****** Object:  Table [dbo].[Character_Types]    Script Date: 10/30/2022 9:33:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Character_Types]') AND type in (N'U'))
DROP TABLE [dbo].[Character_Types]
GO
/****** Object:  Table [dbo].[Character_Maps]    Script Date: 10/30/2022 9:33:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Character_Maps]') AND type in (N'U'))
DROP TABLE [dbo].[Character_Maps]
GO
/****** Object:  Table [dbo].[Character_Info]    Script Date: 10/30/2022 9:33:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Character_Info]') AND type in (N'U'))
DROP TABLE [dbo].[Character_Info]
GO
/****** Object:  UserDefinedFunction [dbo].[fnConvertBoolStringToBit]    Script Date: 10/30/2022 9:33:51 PM ******/
DROP FUNCTION [dbo].[fnConvertBoolStringToBit]
GO
/****** Object:  UserDefinedFunction [dbo].[fnConvertBoolStringToBit]    Script Date: 10/30/2022 9:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fnConvertBoolStringToBit]
(
	-- Add the parameters for the function here
	@OriginalCharBool nvarchar(max),
	@SwordFighterBool nvarchar(max),
	@MagicUserBool nvarchar(max)
)
RETURNS nvarchar(max)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ConcatenatedString nvarchar(max)
	DECLARE @OriginalCharBit bit
	DECLARE @SwordFighterBit bit
	DECLARE @MagicUserBit bit

	-- Add the T-SQL statements to compute the return value here
	SET @OriginalCharBit = CASE WHEN @OriginalCharBool = 'TRUE' THEN 1 ELSE 0 END
	SET @SwordFighterBit = CASE WHEN @SwordFighterBool = 'TRUE' THEN 1 ELSE 0 END
	SET @MagicUserBit = CASE WHEN @MagicUserBool = 'TRUE' THEN 1 ELSE 0 END

	SELECT @ConcatenatedString = CONVERT(nvarchar(1), @OriginalCharBit) + CONVERT(nvarchar(1), @SwordFighterBit) + CONVERT(nvarchar(1), @MagicUserBit)

	-- Return the result of the function
	RETURN @ConcatenatedString

END
GO
/****** Object:  Table [dbo].[Character_Info]    Script Date: 10/30/2022 9:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character_Info](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Original_Character] [nvarchar](50) NULL,
	[Sword_Fighter] [nvarchar](50) NULL,
	[Magic_User] [nvarchar](50) NULL,
 CONSTRAINT [PK_Characte_Info] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Character_Maps]    Script Date: 10/30/2022 9:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character_Maps](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Map_Location] [nvarchar](50) NULL,
	[Heading] [char](2) NULL,
 CONSTRAINT [PK_Character_Maps] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Character_Types]    Script Date: 10/30/2022 9:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character_Types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Character_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Character]    Script Date: 10/30/2022 9:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Character] [nvarchar](50) NOT NULL,
	[TypeID] [int] NULL,
	[MapID] [int] NULL,
	[InfoID] [int] NULL,
 CONSTRAINT [PK_Character] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_FullReport_Character]    Script Date: 10/30/2022 9:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_FullReport_Character]
AS
SELECT     dbo.Character.ID, dbo.Character.Character, dbo.Character_Types.Type, dbo.Character_Maps.Map_Location, dbo.Character_Maps.Heading, dbo.Character_Info.Original_Character, dbo.Character_Info.Sword_Fighter, dbo.Character_Info.Magic_User
FROM        dbo.Character INNER JOIN
                  dbo.Character_Info ON dbo.Character.InfoID = dbo.Character_Info.ID LEFT OUTER JOIN
                  dbo.Character_Maps ON dbo.Character.MapID = dbo.Character_Maps.ID LEFT OUTER JOIN
                  dbo.Character_Types ON dbo.Character.TypeID = dbo.Character_Types.ID
GO
/****** Object:  View [dbo].[vw_InfoReport_Character]    Script Date: 10/30/2022 9:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_InfoReport_Character]
AS
SELECT     dbo.Character.ID, dbo.Character.Character, dbo.fnConvertBoolStringToBit(dbo.Character_Info.Original_Character, dbo.Character_Info.Sword_Fighter, dbo.Character_Info.Magic_User) AS Info_Binary
FROM        dbo.Character LEFT OUTER JOIN
                  dbo.Character_Info ON dbo.Character.InfoID = dbo.Character_Info.ID
GO
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_Characte_Info] FOREIGN KEY([InfoID])
REFERENCES [dbo].[Character_Info] ([ID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_Characte_Info]
GO
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_Character_Maps] FOREIGN KEY([MapID])
REFERENCES [dbo].[Character_Maps] ([ID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_Character_Maps]
GO
ALTER TABLE [dbo].[Character]  WITH CHECK ADD  CONSTRAINT [FK_Character_Character_Types] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Character_Types] ([ID])
GO
ALTER TABLE [dbo].[Character] CHECK CONSTRAINT [FK_Character_Character_Types]
GO
/****** Object:  StoredProcedure [dbo].[spFindCharactersWithNoMaps]    Script Date: 10/30/2022 9:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spFindCharactersWithNoMaps]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [dbo].[Character].ID, [dbo].[Character].Character
	FROM [dbo].[Character]
	LEFT JOIN [dbo].[Character_Maps] ON [dbo].[Character_Maps].ID = [dbo].[Character].MapID
	WHERE [dbo].[Character_Maps].Map_Location is NULL
END
GO
/****** Object:  StoredProcedure [dbo].[spFindNonTypeSwordFighters]    Script Date: 10/30/2022 9:33:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spFindNonTypeSwordFighters] 
	-- Add the parameters for the stored procedure here
	@TypeToExclude nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [dbo].[Character].ID, [dbo].[Character].Character
	FROM [dbo].[Character]
	INNER JOIN [dbo].[Character_Types] ON [dbo].[Character_Types].ID = [dbo].[Character].TypeID
	INNER JOIN [dbo].[Character_Info] ON [dbo].[Character_Info].ID = [dbo].[Character].InfoID
	WHERE [dbo].[Character_Types].Type != @TypeToExclude and [dbo].[Character_Info].Sword_Fighter = 'TRUE'
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "Character"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Character_Info"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 507
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Character_Types"
            Begin Extent = 
               Top = 7
               Left = 797
               Bottom = 126
               Right = 991
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Character_Maps"
            Begin Extent = 
               Top = 7
               Left = 555
               Bottom = 148
               Right = 749
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_FullReport_Character'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_FullReport_Character'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "Character"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Character_Info"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 507
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_InfoReport_Character'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_InfoReport_Character'
GO
