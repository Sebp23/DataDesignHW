USE [PROG260FA22]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_SubscribersDependants'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_SubscribersDependants'
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoSubscribers]    Script Date: 12/5/2022 5:34:58 PM ******/
DROP PROCEDURE [dbo].[InsertIntoSubscribers]
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoDependent]    Script Date: 12/5/2022 5:34:58 PM ******/
DROP PROCEDURE [dbo].[InsertIntoDependent]
GO
ALTER TABLE [dbo].[Dependants] DROP CONSTRAINT [FK_Dependants_Subscribers]
GO
/****** Object:  View [dbo].[vw_SubscribersDependants]    Script Date: 12/5/2022 5:34:58 PM ******/
DROP VIEW [dbo].[vw_SubscribersDependants]
GO
/****** Object:  Table [dbo].[Dependants]    Script Date: 12/5/2022 5:34:58 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dependants]') AND type in (N'U'))
DROP TABLE [dbo].[Dependants]
GO
/****** Object:  Table [dbo].[Subscribers]    Script Date: 12/5/2022 5:34:58 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subscribers]') AND type in (N'U'))
DROP TABLE [dbo].[Subscribers]
GO
/****** Object:  Table [dbo].[Subscribers]    Script Date: 12/5/2022 5:34:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscribers](
	[subscriber_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](max) NOT NULL,
	[last_name] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NULL,
 CONSTRAINT [PK_Subscribers] PRIMARY KEY CLUSTERED 
(
	[subscriber_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dependants]    Script Date: 12/5/2022 5:34:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dependants](
	[dependant_id] [int] IDENTITY(1,1) NOT NULL,
	[subscriber_id] [int] NOT NULL,
	[first_name] [nvarchar](max) NOT NULL,
	[last_name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Dependants] PRIMARY KEY CLUSTERED 
(
	[dependant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_SubscribersDependants]    Script Date: 12/5/2022 5:34:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_SubscribersDependants]
AS
SELECT     dbo.Subscribers.subscriber_id AS SubscriberID, CONCAT(dbo.Subscribers.first_name, ' ', dbo.Subscribers.last_name) AS Subscriber, dbo.Dependants.dependant_id AS DependantID, STRING_AGG(CONCAT(dbo.Dependants.first_name, ' ', dbo.Dependants.last_name), ', ') AS Dependant
FROM        dbo.Dependants FULL JOIN
            dbo.Subscribers ON dbo.Dependants.subscriber_id = dbo.Subscribers.subscriber_id
			GROUP BY dbo.Subscribers.subscriber_id, dbo.Subscribers.first_name, dbo.Subscribers.last_name, dbo.Dependants.dependant_id, dbo.Dependants.first_name, dbo.Dependants.last_name
GO
ALTER TABLE [dbo].[Dependants]  WITH CHECK ADD  CONSTRAINT [FK_Dependants_Subscribers] FOREIGN KEY([subscriber_id])
REFERENCES [dbo].[Subscribers] ([subscriber_id])
GO
ALTER TABLE [dbo].[Dependants] CHECK CONSTRAINT [FK_Dependants_Subscribers]
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoDependent]    Script Date: 12/5/2022 5:34:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertIntoDependent]
	-- Add the parameters for the stored procedure here
	@SubID int,
	@FirstName nvarchar(max),
	@LastName nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO dbo.Dependants ([subscriber_id], [first_name], [last_name])
	VALUES (@SubID, @FirstName, @LastName)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoSubscribers]    Script Date: 12/5/2022 5:34:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertIntoSubscribers]
	-- Add the parameters for the stored procedure here
	@FirstName nvarchar(max),
	@LastName nvarchar(max),
	@Email nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO dbo.Subscribers ([first_name], [last_name], [email])
	VALUES (@FirstName, @LastName, @Email)
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
         Begin Table = "Dependants"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subscribers"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_SubscribersDependants'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_SubscribersDependants'
GO
