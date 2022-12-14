USE [PROG260FA22]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_SupplierFoods'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_SupplierFoods'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_FoodSuppliers'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_FoodSuppliers'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_EmployeePin'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_EmployeePin'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_EmployeeManager'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_EmployeeManager'
GO
ALTER TABLE [dbo].[Supplier_Foods] DROP CONSTRAINT [FK_Supplier_Foods_Suppliers]
GO
ALTER TABLE [dbo].[Supplier_Foods] DROP CONSTRAINT [FK_Supplier_Foods_PetFoods]
GO
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[EmployeePins] DROP CONSTRAINT [FK_EmployeePins_Employees]
GO
ALTER TABLE [dbo].[EmployeePins] DROP CONSTRAINT [FK_EmployeePins_EmployeePins]
GO
/****** Object:  View [dbo].[vw_EmployeePin]    Script Date: 12/4/2022 10:48:28 PM ******/
DROP VIEW [dbo].[vw_EmployeePin]
GO
/****** Object:  Table [dbo].[EmployeePins]    Script Date: 12/4/2022 10:48:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeePins]') AND type in (N'U'))
DROP TABLE [dbo].[EmployeePins]
GO
/****** Object:  View [dbo].[vw_EmployeeManager]    Script Date: 12/4/2022 10:48:28 PM ******/
DROP VIEW [dbo].[vw_EmployeeManager]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12/4/2022 10:48:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
DROP TABLE [dbo].[Employees]
GO
/****** Object:  View [dbo].[vw_FoodSuppliers]    Script Date: 12/4/2022 10:48:28 PM ******/
DROP VIEW [dbo].[vw_FoodSuppliers]
GO
/****** Object:  View [dbo].[vw_SupplierFoods]    Script Date: 12/4/2022 10:48:28 PM ******/
DROP VIEW [dbo].[vw_SupplierFoods]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 12/4/2022 10:48:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suppliers]') AND type in (N'U'))
DROP TABLE [dbo].[Suppliers]
GO
/****** Object:  Table [dbo].[Supplier_Foods]    Script Date: 12/4/2022 10:48:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Supplier_Foods]') AND type in (N'U'))
DROP TABLE [dbo].[Supplier_Foods]
GO
/****** Object:  Table [dbo].[PetFoods]    Script Date: 12/4/2022 10:48:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PetFoods]') AND type in (N'U'))
DROP TABLE [dbo].[PetFoods]
GO
/****** Object:  Table [dbo].[PetFoods]    Script Date: 12/4/2022 10:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetFoods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[food_name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PetFoods] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier_Foods]    Script Date: 12/4/2022 10:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier_Foods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[supplier_id] [int] NOT NULL,
	[food_id] [int] NOT NULL,
 CONSTRAINT [PK_Supplier_Foods] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 12/4/2022 10:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[supplier_name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_SupplierFoods]    Script Date: 12/4/2022 10:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_SupplierFoods]
AS
SELECT     dbo.Suppliers.supplier_name AS Suppliers, STRING_AGG(dbo.PetFoods.food_name, ', ') AS Foods
FROM        dbo.Supplier_Foods INNER JOIN
                  dbo.Suppliers ON dbo.Suppliers.id = dbo.Supplier_Foods.supplier_id INNER JOIN
                  dbo.PetFoods ON dbo.PetFoods.id = dbo.Supplier_Foods.food_id
GROUP BY dbo.Suppliers.supplier_name
GO
/****** Object:  View [dbo].[vw_FoodSuppliers]    Script Date: 12/4/2022 10:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_FoodSuppliers]
AS
SELECT     dbo.PetFoods.food_name AS Foods, STRING_AGG(dbo.Suppliers.supplier_name, ', ') AS Suppliers
FROM        dbo.Supplier_Foods INNER JOIN
                  dbo.PetFoods ON dbo.PetFoods.id = dbo.Supplier_Foods.food_id INNER JOIN
                  dbo.Suppliers ON dbo.Suppliers.id = dbo.Supplier_Foods.supplier_id
GROUP BY dbo.PetFoods.food_name
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 12/4/2022 10:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[employee_id] [int] NOT NULL,
	[employee_name] [nvarchar](50) NOT NULL,
	[manager_id] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_EmployeeManager]    Script Date: 12/4/2022 10:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_EmployeeManager]
AS
SELECT     TOP (100) PERCENT t1.employee_id, t1.employee_name, t2.employee_name AS manager_name
FROM        dbo.Employees AS t1 FULL OUTER JOIN
                  dbo.Employees AS t2 ON t1.manager_id = t2.employee_id
WHERE     (t1.employee_id IS NOT NULL)
ORDER BY t1.employee_id
GO
/****** Object:  Table [dbo].[EmployeePins]    Script Date: 12/4/2022 10:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeePins](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NOT NULL,
	[employee_pin] [int] NOT NULL,
 CONSTRAINT [PK_EmployeePins] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_EmployeePin]    Script Date: 12/4/2022 10:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_EmployeePin]
AS
SELECT     dbo.Employees.employee_name, dbo.EmployeePins.employee_pin
FROM        dbo.EmployeePins INNER JOIN
                  dbo.Employees ON dbo.EmployeePins.employee_id = dbo.Employees.employee_id
GO
SET IDENTITY_INSERT [dbo].[EmployeePins] ON 

INSERT [dbo].[EmployeePins] ([id], [employee_id], [employee_pin]) VALUES (1, 1, 1111)
INSERT [dbo].[EmployeePins] ([id], [employee_id], [employee_pin]) VALUES (2, 2, 2222)
INSERT [dbo].[EmployeePins] ([id], [employee_id], [employee_pin]) VALUES (3, 3, 3333)
INSERT [dbo].[EmployeePins] ([id], [employee_id], [employee_pin]) VALUES (4, 4, 4444)
INSERT [dbo].[EmployeePins] ([id], [employee_id], [employee_pin]) VALUES (5, 5, 5555)
INSERT [dbo].[EmployeePins] ([id], [employee_id], [employee_pin]) VALUES (6, 6, 6666)
SET IDENTITY_INSERT [dbo].[EmployeePins] OFF
GO
INSERT [dbo].[Employees] ([employee_id], [employee_name], [manager_id]) VALUES (1, N'joe', NULL)
INSERT [dbo].[Employees] ([employee_id], [employee_name], [manager_id]) VALUES (2, N'James', 1)
INSERT [dbo].[Employees] ([employee_id], [employee_name], [manager_id]) VALUES (3, N'Alyx', 1)
INSERT [dbo].[Employees] ([employee_id], [employee_name], [manager_id]) VALUES (4, N'Jenn', NULL)
INSERT [dbo].[Employees] ([employee_id], [employee_name], [manager_id]) VALUES (5, N'john', 3)
INSERT [dbo].[Employees] ([employee_id], [employee_name], [manager_id]) VALUES (6, N'Sandy', 4)
GO
SET IDENTITY_INSERT [dbo].[PetFoods] ON 

INSERT [dbo].[PetFoods] ([id], [food_name]) VALUES (1, N'Best Dog Food')
INSERT [dbo].[PetFoods] ([id], [food_name]) VALUES (2, N'Best Cat Food')
INSERT [dbo].[PetFoods] ([id], [food_name]) VALUES (3, N'Best Fish Food')
INSERT [dbo].[PetFoods] ([id], [food_name]) VALUES (4, N'Salty Meat')
INSERT [dbo].[PetFoods] ([id], [food_name]) VALUES (5, N'Fresh Greens')
SET IDENTITY_INSERT [dbo].[PetFoods] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier_Foods] ON 

INSERT [dbo].[Supplier_Foods] ([id], [supplier_id], [food_id]) VALUES (1, 1, 2)
INSERT [dbo].[Supplier_Foods] ([id], [supplier_id], [food_id]) VALUES (2, 1, 1)
INSERT [dbo].[Supplier_Foods] ([id], [supplier_id], [food_id]) VALUES (3, 1, 3)
INSERT [dbo].[Supplier_Foods] ([id], [supplier_id], [food_id]) VALUES (4, 2, 4)
INSERT [dbo].[Supplier_Foods] ([id], [supplier_id], [food_id]) VALUES (5, 2, 5)
INSERT [dbo].[Supplier_Foods] ([id], [supplier_id], [food_id]) VALUES (6, 3, 3)
INSERT [dbo].[Supplier_Foods] ([id], [supplier_id], [food_id]) VALUES (7, 3, 1)
INSERT [dbo].[Supplier_Foods] ([id], [supplier_id], [food_id]) VALUES (8, 3, 4)
INSERT [dbo].[Supplier_Foods] ([id], [supplier_id], [food_id]) VALUES (9, 4, 5)
INSERT [dbo].[Supplier_Foods] ([id], [supplier_id], [food_id]) VALUES (10, 4, 1)
INSERT [dbo].[Supplier_Foods] ([id], [supplier_id], [food_id]) VALUES (11, 4, 2)
INSERT [dbo].[Supplier_Foods] ([id], [supplier_id], [food_id]) VALUES (12, 5, 2)
INSERT [dbo].[Supplier_Foods] ([id], [supplier_id], [food_id]) VALUES (13, 5, 1)
INSERT [dbo].[Supplier_Foods] ([id], [supplier_id], [food_id]) VALUES (14, 5, 5)
INSERT [dbo].[Supplier_Foods] ([id], [supplier_id], [food_id]) VALUES (15, 5, 4)
SET IDENTITY_INSERT [dbo].[Supplier_Foods] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([id], [supplier_name]) VALUES (1, N'Petco')
INSERT [dbo].[Suppliers] ([id], [supplier_name]) VALUES (2, N'PetSmart')
INSERT [dbo].[Suppliers] ([id], [supplier_name]) VALUES (3, N'Petmart')
INSERT [dbo].[Suppliers] ([id], [supplier_name]) VALUES (4, N'Animal Central')
INSERT [dbo].[Suppliers] ([id], [supplier_name]) VALUES (5, N'Generic Animal Store')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
ALTER TABLE [dbo].[EmployeePins]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePins_EmployeePins] FOREIGN KEY([id])
REFERENCES [dbo].[EmployeePins] ([id])
GO
ALTER TABLE [dbo].[EmployeePins] CHECK CONSTRAINT [FK_EmployeePins_EmployeePins]
GO
ALTER TABLE [dbo].[EmployeePins]  WITH CHECK ADD  CONSTRAINT [FK_EmployeePins_Employees] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employees] ([employee_id])
GO
ALTER TABLE [dbo].[EmployeePins] CHECK CONSTRAINT [FK_EmployeePins_Employees]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([manager_id])
REFERENCES [dbo].[Employees] ([employee_id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[Supplier_Foods]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Foods_PetFoods] FOREIGN KEY([food_id])
REFERENCES [dbo].[PetFoods] ([id])
GO
ALTER TABLE [dbo].[Supplier_Foods] CHECK CONSTRAINT [FK_Supplier_Foods_PetFoods]
GO
ALTER TABLE [dbo].[Supplier_Foods]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Foods_Suppliers] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Suppliers] ([id])
GO
ALTER TABLE [dbo].[Supplier_Foods] CHECK CONSTRAINT [FK_Supplier_Foods_Suppliers]
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
         Begin Table = "t1"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t2"
            Begin Extent = 
               Top = 7
               Left = 300
               Bottom = 148
               Right = 504
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_EmployeeManager'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_EmployeeManager'
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
         Begin Table = "EmployeePins"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employees"
            Begin Extent = 
               Top = 20
               Left = 454
               Bottom = 161
               Right = 658
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_EmployeePin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_EmployeePin'
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
         Begin Table = "Supplier_Foods"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PetFoods"
            Begin Extent = 
               Top = 7
               Left = 306
               Bottom = 126
               Right = 516
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Suppliers"
            Begin Extent = 
               Top = 7
               Left = 564
               Bottom = 126
               Right = 774
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
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_FoodSuppliers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_FoodSuppliers'
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
         Begin Table = "Suppliers"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 242
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
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1356
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_SupplierFoods'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_SupplierFoods'
GO
