USE [PROG260FA22]
GO
ALTER TABLE [dbo].[Character] DROP CONSTRAINT [FK_Character_Character_Types]
GO
ALTER TABLE [dbo].[Character] DROP CONSTRAINT [FK_Character_Character_Maps]
GO
ALTER TABLE [dbo].[Character] DROP CONSTRAINT [FK_Character_Characte_Info]
GO
/****** Object:  Table [dbo].[Character_Types]    Script Date: 10/25/2022 5:44:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Character_Types]') AND type in (N'U'))
DROP TABLE [dbo].[Character_Types]
GO
/****** Object:  Table [dbo].[Character_Maps]    Script Date: 10/25/2022 5:44:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Character_Maps]') AND type in (N'U'))
DROP TABLE [dbo].[Character_Maps]
GO
/****** Object:  Table [dbo].[Character_Info]    Script Date: 10/25/2022 5:44:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Character_Info]') AND type in (N'U'))
DROP TABLE [dbo].[Character_Info]
GO
/****** Object:  Table [dbo].[Character]    Script Date: 10/25/2022 5:44:51 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Character]') AND type in (N'U'))
DROP TABLE [dbo].[Character]
GO
/****** Object:  Table [dbo].[Character]    Script Date: 10/25/2022 5:44:51 PM ******/
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
/****** Object:  Table [dbo].[Character_Info]    Script Date: 10/25/2022 5:44:51 PM ******/
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
/****** Object:  Table [dbo].[Character_Maps]    Script Date: 10/25/2022 5:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character_Maps](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Map_Location] [nvarchar](50) NULL,
 CONSTRAINT [PK_Character_Maps] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Character_Types]    Script Date: 10/25/2022 5:44:51 PM ******/
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
