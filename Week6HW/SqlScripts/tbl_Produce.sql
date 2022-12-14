USE [PROG260FA22]
GO
/****** Object:  Table [dbo].[Produce-Table]    Script Date: 10/16/2022 1:22:08 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Produce-Table]') AND type in (N'U'))
DROP TABLE [dbo].[Produce-Table]
GO
/****** Object:  Table [dbo].[Produce-Table]    Script Date: 10/16/2022 1:22:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produce-Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Price] [money] NULL,
	[UoM] [nvarchar](50) NOT NULL,
	[SellBy] [datetime2](7) NULL,
 CONSTRAINT [PK_Produce-Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Produce-Table] ON 

INSERT [dbo].[Produce-Table] ([ID], [Name], [Location], [Price], [UoM], [SellBy]) VALUES (141, N'Red Apples', N'12Z', 3.9900, N'Bag', CAST(N'2022-10-31T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Produce-Table] ([ID], [Name], [Location], [Price], [UoM], [SellBy]) VALUES (144, N'Watermelon', N'6B', 7.9900, N'Each', CAST(N'2022-12-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Produce-Table] ([ID], [Name], [Location], [Price], [UoM], [SellBy]) VALUES (145, N'Yellow Apples', N'12A', 5.1900, N'Bag', CAST(N'2022-10-29T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Produce-Table] OFF
GO
