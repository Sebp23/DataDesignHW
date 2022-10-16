USE [PROG260FA22]
GO
/****** Object:  Table [dbo].[Produce-Table]    Script Date: 10/15/2022 8:40:30 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Produce-Table]') AND type in (N'U'))
DROP TABLE [dbo].[Produce-Table]
GO
/****** Object:  Table [dbo].[Produce-Table]    Script Date: 10/15/2022 8:40:30 PM ******/
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
	[SellBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Produce-Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
