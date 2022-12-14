USE [PROG260FA22]
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoCharTypes]    Script Date: 11/21/2022 5:24:10 PM ******/
DROP PROCEDURE [dbo].[spInsertIntoCharTypes]
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoCharMaps]    Script Date: 11/21/2022 5:24:10 PM ******/
DROP PROCEDURE [dbo].[spInsertIntoCharMaps]
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoCharInfo]    Script Date: 11/21/2022 5:24:10 PM ******/
DROP PROCEDURE [dbo].[spInsertIntoCharInfo]
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoChar]    Script Date: 11/21/2022 5:24:10 PM ******/
DROP PROCEDURE [dbo].[spInsertIntoChar]
GO
/****** Object:  StoredProcedure [dbo].[spGetSwordNonHuman]    Script Date: 11/21/2022 5:24:10 PM ******/
DROP PROCEDURE [dbo].[spGetSwordNonHuman]
GO
/****** Object:  StoredProcedure [dbo].[spGetFullCharReport]    Script Date: 11/21/2022 5:24:10 PM ******/
DROP PROCEDURE [dbo].[spGetFullCharReport]
GO
/****** Object:  StoredProcedure [dbo].[spGetCharNoMap]    Script Date: 11/21/2022 5:24:10 PM ******/
DROP PROCEDURE [dbo].[spGetCharNoMap]
GO
ALTER TABLE [dbo].[Character] DROP CONSTRAINT [FK_Character_Character_Types]
GO
ALTER TABLE [dbo].[Character] DROP CONSTRAINT [FK_Character_Character_Maps]
GO
ALTER TABLE [dbo].[Character] DROP CONSTRAINT [FK_Character_Characte_Info]
GO
/****** Object:  Table [dbo].[Character_Types]    Script Date: 11/21/2022 5:24:10 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Character_Types]') AND type in (N'U'))
DROP TABLE [dbo].[Character_Types]
GO
/****** Object:  Table [dbo].[Character_Maps]    Script Date: 11/21/2022 5:24:10 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Character_Maps]') AND type in (N'U'))
DROP TABLE [dbo].[Character_Maps]
GO
/****** Object:  Table [dbo].[Character_Info]    Script Date: 11/21/2022 5:24:10 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Character_Info]') AND type in (N'U'))
DROP TABLE [dbo].[Character_Info]
GO
/****** Object:  Table [dbo].[Character]    Script Date: 11/21/2022 5:24:10 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Character]') AND type in (N'U'))
DROP TABLE [dbo].[Character]
GO
/****** Object:  Table [dbo].[Character]    Script Date: 11/21/2022 5:24:10 PM ******/
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
/****** Object:  Table [dbo].[Character_Info]    Script Date: 11/21/2022 5:24:10 PM ******/
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
/****** Object:  Table [dbo].[Character_Maps]    Script Date: 11/21/2022 5:24:10 PM ******/
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
/****** Object:  Table [dbo].[Character_Types]    Script Date: 11/21/2022 5:24:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spGetCharNoMap]    Script Date: 11/21/2022 5:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetCharNoMap] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [dbo].[Character].ID, [dbo].[Character].Character
	FROM [dbo].[Character]
	LEFT JOIN [dbo].[Character_Maps]
	ON [dbo].[Character_Maps].ID = [dbo].[Character].MapID
	WHERE [dbo].[Character_Maps].Map_Location is NULL
END
GO
/****** Object:  StoredProcedure [dbo].[spGetFullCharReport]    Script Date: 11/21/2022 5:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetFullCharReport]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [dbo].[Character].ID, [dbo].[Character].Character, 
           [dbo].[Character_Types].Type, [dbo].[Character_Maps].Map_Location, 
           [dbo].[Character_Info].Original_Character, [dbo].[Character_Info].Sword_Fighter, [dbo].[Character_Info].Magic_User
		   FROM [dbo].[Character]
		   Left JOIN [dbo].[Character_Types] ON [dbo].[Character_Types].ID = [dbo].[Character].TypeID
		   Left JOIN [dbo].[Character_Maps] ON [dbo].[Character_Maps].ID = [dbo].[Character].MapID
		   INNER JOIN [dbo].[Character_Info] ON [dbo].[Character_Info].ID = [dbo].[Character].InfoID 
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSwordNonHuman]    Script Date: 11/21/2022 5:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetSwordNonHuman]
	-- Add the parameters for the stored procedure here
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
	WHERE [dbo].[Character_Types].Type != 'Human' AND [dbo].[Character_Info].Sword_Fighter = 'TRUE'
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoChar]    Script Date: 11/21/2022 5:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertIntoChar]
	-- Add the parameters for the stored procedure here
	@Char nvarchar(50),
	@TypeID int,
	@MapID int,
	@InfoID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Character] ([Character], [TypeID], [MapID], [InfoID])
	VALUES (@Char, @TypeID, @MapID, @InfoID)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoCharInfo]    Script Date: 11/21/2022 5:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertIntoCharInfo]
	-- Add the parameters for the stored procedure here
	@OriginalChar nvarchar(50),
	@SwordFighter nvarchar(50),
	@MagicUser nvarchar(50),
	@Return int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].Character_Info ([Original_Character], [Sword_Fighter], [Magic_User])
	VALUES (@OriginalChar, @SwordFighter, @MagicUser)

	SELECT TOP 1 @Return = ID FROM [dbo].Character_Info ORDER BY ID DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoCharMaps]    Script Date: 11/21/2022 5:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertIntoCharMaps]
	-- Add the parameters for the stored procedure here
	@Map nvarchar(max),
	@Return int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM [dbo].Character_Maps WHERE Map_Location = @Map)
	BEGIN
		SELECT @Return = ID FROM [dbo].Character_Maps WHERE Map_Location = @Map
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[Character_Maps] (Map_Location)
		VALUES (@Map)
		SELECT @Return = ID FROM [dbo].Character_Maps WHERE Map_Location = @Map
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoCharTypes]    Script Date: 11/21/2022 5:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertIntoCharTypes]
	-- Add the parameters for the stored procedure here
	@Type nvarchar(max),
	@Return int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM [dbo].Character_Types WHERE Type = @Type)
	BEGIN
		SELECT @Return = ID FROM [dbo].Character_Types WHERE Type = @Type
	END
	ELSE
	BEGIN
		INSERT INTO [dbo].[Character_Types] (Type)
		VALUES (@Type)
		SELECT @Return = ID FROM [dbo].Character_Types WHERE Type = @Type
	END
END
GO
