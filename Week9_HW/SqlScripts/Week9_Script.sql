USE [PROG260FA22]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Report4'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Report4'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Report3'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Report3'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Report2'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Report2'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Report1'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Report1'
GO
/****** Object:  StoredProcedure [dbo].[spSelectFromView]    Script Date: 11/6/2022 8:30:41 PM ******/
DROP PROCEDURE [dbo].[spSelectFromView]
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoReportTwo]    Script Date: 11/6/2022 8:30:41 PM ******/
DROP PROCEDURE [dbo].[spInsertIntoReportTwo]
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoReportThree]    Script Date: 11/6/2022 8:30:41 PM ******/
DROP PROCEDURE [dbo].[spInsertIntoReportThree]
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoReportOne]    Script Date: 11/6/2022 8:30:41 PM ******/
DROP PROCEDURE [dbo].[spInsertIntoReportOne]
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoReportFour]    Script Date: 11/6/2022 8:30:41 PM ******/
DROP PROCEDURE [dbo].[spInsertIntoReportFour]
GO
/****** Object:  Table [dbo].[Report_4]    Script Date: 11/6/2022 8:30:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Report_4]') AND type in (N'U'))
DROP TABLE [dbo].[Report_4]
GO
/****** Object:  Table [dbo].[Report_3]    Script Date: 11/6/2022 8:30:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Report_3]') AND type in (N'U'))
DROP TABLE [dbo].[Report_3]
GO
/****** Object:  Table [dbo].[Report_2]    Script Date: 11/6/2022 8:30:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Report_2]') AND type in (N'U'))
DROP TABLE [dbo].[Report_2]
GO
/****** Object:  Table [dbo].[Report_1]    Script Date: 11/6/2022 8:30:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Report_1]') AND type in (N'U'))
DROP TABLE [dbo].[Report_1]
GO
/****** Object:  View [dbo].[vw_Report4]    Script Date: 11/6/2022 8:30:41 PM ******/
DROP VIEW [dbo].[vw_Report4]
GO
/****** Object:  View [dbo].[vw_Report1]    Script Date: 11/6/2022 8:30:41 PM ******/
DROP VIEW [dbo].[vw_Report1]
GO
/****** Object:  Table [dbo].[Student_Info]    Script Date: 11/6/2022 8:30:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student_Info]') AND type in (N'U'))
DROP TABLE [dbo].[Student_Info]
GO
/****** Object:  View [dbo].[vw_Report3]    Script Date: 11/6/2022 8:30:41 PM ******/
DROP VIEW [dbo].[vw_Report3]
GO
/****** Object:  View [dbo].[vw_Report2]    Script Date: 11/6/2022 8:30:41 PM ******/
DROP VIEW [dbo].[vw_Report2]
GO
/****** Object:  Table [dbo].[Student_Enrollment]    Script Date: 11/6/2022 8:30:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student_Enrollment]') AND type in (N'U'))
DROP TABLE [dbo].[Student_Enrollment]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/6/2022 8:30:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
DROP TABLE [dbo].[Student]
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatSSN]    Script Date: 11/6/2022 8:30:41 PM ******/
DROP FUNCTION [dbo].[fnFormatSSN]
GO
/****** Object:  UserDefinedFunction [dbo].[fnAbbreviateState]    Script Date: 11/6/2022 8:30:41 PM ******/
DROP FUNCTION [dbo].[fnAbbreviateState]
GO
/****** Object:  UserDefinedFunction [dbo].[fnAbbreviateState]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fnAbbreviateState]
(
	-- Add the parameters for the function here
	@StateInput nvarchar(max)
)
RETURNS nvarchar(2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Return nvarchar(2)

	-- Add the T-SQL statements to compute the return value here
	SET @Return = CASE @StateInput
					WHEN 'Alabama' THEN 'AL' 
					WHEN 'Alaska' THEN 'AK' 
					WHEN 'Arizona' THEN 'AZ' 
					WHEN 'Arkansas' THEN 'AR' 
					WHEN 'California' THEN 'CA' 
					WHEN 'Colorado' THEN 'CO' 
					WHEN 'Connecticut' THEN 'CT' 
					WHEN 'Delaware' THEN 'DE' 
					WHEN 'District of Columbia' THEN 'DC' 
					WHEN 'Florida' THEN 'FL' 
					WHEN 'Georgia' THEN 'GA' 
					WHEN 'Hawaii' THEN 'HI' 
					WHEN 'Idaho' THEN 'ID' 
					WHEN 'Illinois' THEN 'IL' 
					WHEN 'Indiana' THEN 'IN' 
					WHEN 'Iowa' THEN 'IA' 
					WHEN 'Kansas' THEN 'KS' 
					WHEN 'Kentucky' THEN 'KY' 
					WHEN 'Louisiana' THEN 'LA' 
					WHEN 'Maine' THEN 'ME' 
					WHEN 'Maryland' THEN 'MD' 
					WHEN 'Massachusetts' THEN 'MA' 
					WHEN 'Michigan' THEN 'MI' 
					WHEN 'Minnesota' THEN 'MN' 
					WHEN 'Mississippi' THEN 'MS' 
					WHEN 'Missouri' THEN 'MO' 
					WHEN 'Montana' THEN 'MT' 
					WHEN 'Nebraska' THEN 'NE' 
					WHEN 'Nevada' THEN 'NV' 
					WHEN 'New Hampshire' THEN 'NH' 
					WHEN 'New Jersey' THEN 'NJ' 
					WHEN 'New Mexico' THEN 'NM' 
					WHEN 'New York' THEN 'NY' 
					WHEN 'North Carolina' THEN 'NC' 
					WHEN 'North Dakota' THEN 'ND' 
					WHEN 'Ohio' THEN 'OH' 
					WHEN 'Oklahoma' THEN 'OK' 
					WHEN 'Oregon' THEN 'OR' 
					WHEN 'Pennsylvania' THEN 'PA' 
					WHEN 'Rhode Island' THEN 'RI' 
					WHEN 'South Carolina' THEN 'SC' 
					WHEN 'South Dakota' THEN 'SD' 
					WHEN 'Tennessee' THEN 'TN' 
					WHEN 'Texas' THEN 'TX' 
					WHEN 'Utah' THEN 'UT' 
					WHEN 'Vermont' THEN 'VT' 
					WHEN 'Virginia' THEN 'VA' 
					WHEN 'Washington' THEN 'WA' 
					WHEN 'West Virginia' THEN 'WV' 
					WHEN 'Wisconsin' THEN 'WI' 
					WHEN 'Wyoming' THEN 'WY'
					END

	-- Return the result of the function
	RETURN @Return

END
GO
/****** Object:  UserDefinedFunction [dbo].[fnFormatSSN]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fnFormatSSN]
(
	-- Add the parameters for the function here
	@SSN nvarchar(max)
)
RETURNS nvarchar(4)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Return nvarchar(4)

	-- Add the T-SQL statements to compute the return value here
	SET @Return = CASE WHEN @SSN is not null THEN SUBSTRING(@SSN, 8, 4) ELSE 'N/A' END

	-- Return the result of the function
	RETURN @Return

END
GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[id] [int] NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[email] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Enrollment]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Enrollment](
	[id] [int] NULL,
	[student_id] [int] NULL,
	[course_code] [varchar](50) NULL,
	[completed] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Report2]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_Report2]
AS
SELECT dbo.Student.id, CONCAT(dbo.Student.first_name, ' ',dbo.Student.last_name) AS Full_Name, COUNT(dbo.Student_Enrollment.student_id) AS Courses_Total, 
                  COUNT(CASE WHEN dbo.Student_Enrollment.completed = 1 THEN dbo.Student_Enrollment.student_id END) AS Courses_Completed, COUNT(CASE WHEN dbo.Student_Enrollment.completed = 0 OR
                  dbo.Student_Enrollment.completed IS NULL THEN dbo.Student_Enrollment.student_id END) AS Courses_Incomplete, COUNT(CASE WHEN dbo.Student_Enrollment.completed = 0 THEN dbo.Student_Enrollment.student_id END) 
                  AS Courses_InProgress
FROM     dbo.Student LEFT OUTER JOIN
                  dbo.Student_Enrollment ON dbo.Student.id = dbo.Student_Enrollment.student_id
GROUP BY dbo.Student.id, dbo.Student.first_name, dbo.Student.last_name
GO
/****** Object:  View [dbo].[vw_Report3]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Report3]
AS
SELECT DISTINCT 
                  course_code AS Course_Code, COUNT(course_code) AS Students_Enrolled, COUNT(CASE WHEN dbo.Student_Enrollment.completed = 1 THEN dbo.Student_Enrollment.course_code END) AS Students_Completed, 
                  COUNT(CASE WHEN dbo.Student_Enrollment.completed IS NULL THEN dbo.Student_Enrollment.course_code END) AS Students_Failed_Dropped
FROM     dbo.Student_Enrollment
GROUP BY course_code
GO
/****** Object:  Table [dbo].[Student_Info]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Info](
	[id] [int] NULL,
	[student_id] [int] NULL,
	[phone] [varchar](50) NULL,
	[ssn] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[zip] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Report1]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_Report1]
AS
SELECT     dbo.Student.id, CONCAT(dbo.Student.first_name, ' ', dbo.Student.last_name) AS Full_Name, 
			dbo.fnFormatSSN(dbo.Student_Info.ssn) AS SSN, 
			CONCAT(dbo.Student_Info.address, ',', ' ', dbo.Student_Info.city, ',', ' ', dbo.fnAbbreviateState(dbo.Student_Info.state), '.', ' ', dbo.Student_Info.zip) AS Full_Address, 
			COALESCE(dbo.Student_Info.phone, '000-000-0000') AS Phone
FROM        dbo.Student LEFT OUTER JOIN
                  dbo.Student_Info ON dbo.Student.id = dbo.Student_Info.student_id
GO
/****** Object:  View [dbo].[vw_Report4]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_Report4]
AS
SELECT DISTINCT    dbo.Student_Enrollment.course_code AS Course_Code, STRING_AGG(dbo.Student_Enrollment.student_id, ',') AS Student_IDs, STRING_AGG(dbo.Student_Info.state, ',') AS Most_Students_State
FROM        dbo.Student_Enrollment LEFT OUTER JOIN
                  dbo.Student_Info ON dbo.Student_Enrollment.student_id = dbo.Student_Info.student_id
				  GROUP BY dbo.Student_Enrollment.course_code
GO
/****** Object:  Table [dbo].[Report_1]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_1](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Full_Name] [nvarchar](max) NOT NULL,
	[SSN] [nvarchar](4) NOT NULL,
	[Full_Address] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Report_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report_2]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_2](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Full_Name] [nvarchar](max) NOT NULL,
	[Courses_Total] [int] NOT NULL,
	[Courses_Completed] [int] NOT NULL,
	[Courses_Incomplete] [int] NOT NULL,
	[Courses_InProgress] [int] NOT NULL,
 CONSTRAINT [PK_Report_2] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report_3]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_3](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Course_Code] [nvarchar](50) NOT NULL,
	[Students_Enrolled] [int] NOT NULL,
	[Students_Completed] [int] NOT NULL,
	[Students_Failed_Dropped] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report_4]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_4](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Course_Code] [nvarchar](50) NOT NULL,
	[Student_IDs] [nvarchar](max) NOT NULL,
	[Most_Students_State] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Report_4] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (1, N'Binnie', N'Youll', N'byoull0@alibaba.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (2, N'Trescha', N'Thebe', N'tthebe1@paypal.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (3, N'Rose', N'Sagar', N'rsagar2@etsy.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (4, N'Layton', N'Prestedge', N'lprestedge3@toplist.cz')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (5, N'Markos', N'Gainsborough', N'mgainsborough4@apache.org')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (6, N'Putnam', N'Cordero', N'pcordero5@istockphoto.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (7, N'Robers', N'Bendin', N'rbendin6@huffingtonpost.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (8, N'Gearalt', N'Mattiello', N'gmattiello7@sina.com.cn')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (9, N'Jesse', N'Ace', N'jace8@google.fr')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (10, N'Frasier', N'Pothbury', N'fpothbury9@berkeley.edu')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (11, N'Claretta', N'Klas', N'cklasa@who.int')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (12, N'Becky', N'Gudgeon', N'bgudgeonb@ow.ly')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (13, N'Adiana', N'Fawdry', N'afawdryc@newsvine.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (14, N'Renelle', N'Moult', N'rmoultd@tmall.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (15, N'Alexa', N'Sewart', N'asewarte@imgur.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (16, N'Aron', N'Talloe', N'atalloef@simplemachines.org')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (17, N'Augusto', N'Pennazzi', N'apennazzig@omniture.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (18, N'Diego', N'Itzhaki', N'ditzhakih@elegantthemes.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (19, N'Sawyer', N'Ingreda', N'singredai@mayoclinic.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (20, N'Isa', N'Pealing', N'ipealingj@youtube.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (21, N'Jennine', N'Bulle', N'jbullek@sourceforge.net')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (22, N'Darryl', N'Osborne', N'dosbornel@amazon.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (23, N'Salvador', N'Billitteri', N'sbillitterim@delicious.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (24, N'Dallon', N'Johanchon', N'djohanchonn@jugem.jp')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (25, N'Ambrosius', N'Guisby', N'aguisbyo@acquirethisname.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (26, N'Alonzo', N'O''Ferris', N'aoferrisp@time.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (27, N'Clyve', N'McCaughran', N'cmccaughranq@deliciousdays.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (28, N'Curcio', N'Gocher', N'cgocherr@smh.com.au')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (29, N'Lorne', N'Iacobucci', N'liacobuccis@dailymotion.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (30, N'Fanechka', N'Heaysman', N'fheaysmant@google.es')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (31, N'Annabelle', N'Matthias', N'amatthiasu@bravesites.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (32, N'Sigfrid', N'Levine', N'slevinev@i2i.jp')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (33, N'Wynn', N'Cescotti', N'wcescottiw@jiathis.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (34, N'Reine', N'Dumingo', N'rdumingox@google.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (35, N'Kelby', N'Dineges', N'kdinegesy@unesco.org')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (36, N'Katine', N'Newnham', N'knewnhamz@netvibes.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (37, N'Darell', N'Endon', N'dendon10@sfgate.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (38, N'Prentiss', N'Oldale', N'poldale11@youtube.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (39, N'Robin', N'Brockman', N'rbrockman12@walmart.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (40, N'Emerson', N'Labrow', N'elabrow13@blogspot.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (41, N'Shandie', N'Mitcheson', N'smitcheson14@arstechnica.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (42, N'Duff', N'Ferenczy', N'dferenczy15@youku.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (43, N'Bastian', N'Gaythorpe', N'bgaythorpe16@buzzfeed.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (44, N'Arlie', N'Smitton', N'asmitton17@google.com.hk')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (45, N'Katharina', N'Yuryshev', N'kyuryshev18@wix.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (46, N'Sascha', N'MacDonagh', N'smacdonagh19@blogs.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (47, N'Hana', N'Anstee', N'hanstee1a@feedburner.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (48, N'Hillary', N'Smallacombe', N'hsmallacombe1b@phpbb.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (49, N'Zitella', N'Largen', N'zlargen1c@list-manage.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (50, N'Bethany', N'Cantillion', N'bcantillion1d@eepurl.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (51, N'Leda', N'Lamkin', N'llamkin1e@ezinearticles.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (52, N'Mirella', N'Betjes', N'mbetjes1f@va.gov')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (53, N'Lisbeth', N'Alvin', N'lalvin1g@about.me')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (54, N'Adi', N'MacKomb', N'amackomb1h@smh.com.au')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (55, N'Bartolomeo', N'Benzie', N'bbenzie1i@hp.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (56, N'Arluene', N'Stegers', N'astegers1j@bravesites.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (57, N'Thain', N'Flaunier', N'tflaunier1k@hibu.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (58, N'Rodge', N'Bigmore', N'rbigmore1l@netscape.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (59, N'Gisela', N'Brockwell', N'gbrockwell1m@vistaprint.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (60, N'Lester', N'Skillman', N'lskillman1n@yellowpages.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (61, N'Davon', N'Jantzen', N'djantzen1o@whitehouse.gov')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (62, N'Nevsa', N'Torbet', N'ntorbet1p@nbcnews.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (63, N'Cassey', N'Kift', N'ckift1q@sfgate.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (64, N'Skyler', N'Collier', N'scollier1r@biblegateway.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (65, N'Eleanore', N'Stanyan', N'estanyan1s@mapquest.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (66, N'Drusie', N'Vorley', N'dvorley1t@smugmug.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (67, N'Germain', N'Stenton', N'gstenton1u@constantcontact.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (68, N'Ben', N'Mizzi', N'bmizzi1v@dailymail.co.uk')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (69, N'Rozelle', N'Worden', N'rworden1w@miitbeian.gov.cn')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (70, N'Wilie', N'Wakeley', N'wwakeley1x@epa.gov')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (71, N'Irina', N'Loiterton', N'iloiterton1y@yellowbook.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (72, N'Elizabet', N'Lauks', N'elauks1z@scientificamerican.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (73, N'Polly', N'Myerscough', N'pmyerscough20@wix.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (74, N'Deeyn', N'Langthorne', N'dlangthorne21@marketwatch.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (75, N'Maighdiln', N'Frisel', N'mfrisel22@typepad.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (76, N'Row', N'Lucken', N'rlucken23@psu.edu')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (77, N'Emylee', N'Woolnough', N'ewoolnough24@nih.gov')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (78, N'Caren', N'Ballintyne', N'cballintyne25@liveinternet.ru')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (79, N'Sibley', N'Cudiff', N'scudiff26@va.gov')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (80, N'Leyla', N'Landre', N'llandre27@sphinn.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (81, N'Derrick', N'Raggett', N'draggett28@unc.edu')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (82, N'Toddie', N'Eldershaw', N'teldershaw29@1688.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (83, N'Krispin', N'Dunstone', N'kdunstone2a@w3.org')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (84, N'Trevor', N'Teaz', N'tteaz2b@admin.ch')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (85, N'Nickola', N'Lander', N'nlander2c@newsvine.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (86, N'Elsi', N'Breffit', N'ebreffit2d@soundcloud.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (87, N'Lincoln', N'Brooksbank', N'lbrooksbank2e@ihg.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (88, N'Helyn', N'Corson', N'hcorson2f@google.de')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (89, N'Willi', N'Piggot', N'wpiggot2g@engadget.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (90, N'Luigi', N'Geerling', N'lgeerling2h@seesaa.net')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (91, N'Lotte', N'Ciobotaro', N'lciobotaro2i@paginegialle.it')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (92, N'Barn', N'Bedle', N'bbedle2j@unc.edu')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (93, N'Jeffy', N'Brooke', N'jbrooke2k@cam.ac.uk')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (94, N'Louella', N'Iapico', N'liapico2l@meetup.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (95, N'Ilise', N'Dunhill', N'idunhill2m@cbc.ca')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (96, N'Mitzi', N'Yate', N'myate2n@howstuffworks.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (97, N'Normand', N'Gimber', N'ngimber2o@toplist.cz')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (98, N'Hinda', N'Rosedale', N'hrosedale2p@fc2.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (99, N'Gregoire', N'Eason', N'geason2q@about.com')
INSERT [dbo].[Student] ([id], [first_name], [last_name], [email]) VALUES (100, N'Rhody', N'Yushin', N'ryushin2r@springer.com')
GO
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (1, 5, N'PROG27', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (2, 17, N'PROG74', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (3, 21, N'PROG27', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (4, 37, N'PROG24', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (5, 77, N'PROG73', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (6, 97, N'PROG53', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (7, 35, N'PROG01', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (8, 38, N'PROG27', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (9, 30, N'PROG01', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (10, 64, N'PROG08', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (11, 15, N'PROG76', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (12, 39, N'PROG93', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (13, 63, N'PROG42', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (14, 48, N'PROG67', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (15, 62, N'PROG31', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (16, 17, N'PROG33', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (17, 25, N'PROG51', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (18, 59, N'PROG25', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (19, 56, N'PROG44', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (20, 70, N'PROG02', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (21, 95, N'PROG45', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (22, 24, N'PROG16', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (23, 84, N'PROG42', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (24, 97, N'PROG37', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (25, 12, N'PROG67', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (26, 36, N'PROG06', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (27, 10, N'PROG92', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (28, 78, N'PROG95', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (29, 63, N'PROG72', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (30, 49, N'PROG86', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (31, 77, N'PROG51', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (32, 50, N'PROG49', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (33, 31, N'PROG48', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (34, 65, N'PROG50', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (35, 99, N'PROG31', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (36, 22, N'PROG11', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (37, 24, N'PROG28', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (38, 87, N'PROG77', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (39, 69, N'PROG24', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (40, 17, N'PROG59', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (41, 22, N'PROG08', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (42, 63, N'PROG75', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (43, 43, N'PROG06', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (44, 14, N'PROG74', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (45, 44, N'PROG96', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (46, 36, N'PROG93', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (47, 15, N'PROG02', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (48, 8, N'PROG11', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (49, 5, N'PROG99', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (50, 2, N'PROG30', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (51, 85, N'PROG20', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (52, 57, N'PROG29', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (53, 13, N'PROG71', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (54, 64, N'PROG39', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (55, 90, N'PROG87', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (56, 88, N'PROG86', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (57, 7, N'PROG88', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (58, 54, N'PROG51', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (59, 46, N'PROG51', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (60, 15, N'PROG53', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (61, 15, N'PROG08', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (62, 75, N'PROG17', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (63, 92, N'PROG65', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (64, 16, N'PROG03', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (65, 57, N'PROG52', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (66, 19, N'PROG70', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (67, 75, N'PROG91', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (68, 28, N'PROG34', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (69, 10, N'PROG24', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (70, 23, N'PROG98', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (71, 29, N'PROG70', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (72, 24, N'PROG24', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (73, 77, N'PROG72', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (74, 94, N'PROG74', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (75, 21, N'PROG86', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (76, 25, N'PROG44', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (77, 56, N'PROG27', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (78, 99, N'PROG94', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (79, 46, N'PROG29', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (80, 90, N'PROG09', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (81, 32, N'PROG12', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (82, 26, N'PROG52', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (83, 14, N'PROG19', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (84, 72, N'PROG63', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (85, 23, N'PROG60', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (86, 7, N'PROG85', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (87, 39, N'PROG15', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (88, 86, N'PROG68', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (89, 55, N'PROG39', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (90, 5, N'PROG93', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (91, 45, N'PROG98', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (92, 9, N'PROG83', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (93, 10, N'PROG20', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (94, 29, N'PROG18', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (95, 100, N'PROG91', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (96, 5, N'PROG47', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (97, 42, N'PROG22', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (98, 31, N'PROG32', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (99, 81, N'PROG15', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (100, 63, N'PROG69', 1)
GO
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (101, 100, N'PROG84', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (102, 27, N'PROG93', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (103, 86, N'PROG07', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (104, 81, N'PROG69', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (105, 100, N'PROG67', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (106, 50, N'PROG84', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (107, 84, N'PROG16', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (108, 88, N'PROG97', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (109, 41, N'PROG99', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (110, 53, N'PROG46', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (111, 51, N'PROG27', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (112, 24, N'PROG84', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (113, 10, N'PROG37', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (114, 74, N'PROG91', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (115, 93, N'PROG27', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (116, 22, N'PROG73', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (117, 87, N'PROG11', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (118, 93, N'PROG58', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (119, 76, N'PROG20', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (120, 80, N'PROG00', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (121, 40, N'PROG83', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (122, 39, N'PROG42', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (123, 30, N'PROG34', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (124, 64, N'PROG13', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (125, 18, N'PROG65', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (126, 53, N'PROG81', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (127, 84, N'PROG50', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (128, 92, N'PROG51', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (129, 81, N'PROG42', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (130, 20, N'PROG68', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (131, 4, N'PROG12', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (132, 51, N'PROG29', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (133, 66, N'PROG90', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (134, 3, N'PROG28', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (135, 88, N'PROG83', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (136, 50, N'PROG36', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (137, 15, N'PROG24', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (138, 50, N'PROG45', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (139, 73, N'PROG92', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (140, 33, N'PROG79', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (141, 66, N'PROG32', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (142, 51, N'PROG16', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (143, 29, N'PROG54', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (144, 15, N'PROG24', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (145, 94, N'PROG86', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (146, 68, N'PROG84', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (147, 18, N'PROG49', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (148, 34, N'PROG77', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (149, 57, N'PROG47', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (150, 75, N'PROG99', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (151, 18, N'PROG90', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (152, 87, N'PROG00', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (153, 28, N'PROG45', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (154, 63, N'PROG71', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (155, 45, N'PROG39', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (156, 18, N'PROG98', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (157, 48, N'PROG32', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (158, 66, N'PROG36', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (159, 56, N'PROG65', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (160, 84, N'PROG21', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (161, 24, N'PROG22', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (162, 78, N'PROG64', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (163, 22, N'PROG06', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (164, 23, N'PROG08', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (165, 64, N'PROG84', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (166, 46, N'PROG09', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (167, 82, N'PROG59', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (168, 100, N'PROG37', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (169, 98, N'PROG97', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (170, 15, N'PROG91', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (171, 100, N'PROG31', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (172, 74, N'PROG23', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (173, 18, N'PROG95', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (174, 82, N'PROG21', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (175, 63, N'PROG92', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (176, 15, N'PROG59', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (177, 87, N'PROG13', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (178, 11, N'PROG64', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (179, 99, N'PROG79', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (180, 34, N'PROG53', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (181, 17, N'PROG21', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (182, 10, N'PROG89', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (183, 30, N'PROG54', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (184, 21, N'PROG30', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (185, 83, N'PROG37', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (186, 84, N'PROG44', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (187, 47, N'PROG90', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (188, 14, N'PROG78', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (189, 95, N'PROG48', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (190, 86, N'PROG14', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (191, 17, N'PROG00', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (192, 91, N'PROG40', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (193, 39, N'PROG11', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (194, 63, N'PROG58', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (195, 53, N'PROG69', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (196, 27, N'PROG71', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (197, 1, N'PROG72', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (198, 78, N'PROG04', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (199, 67, N'PROG84', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (200, 89, N'PROG69', NULL)
GO
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (201, 1, N'PROG20', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (202, 43, N'PROG84', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (203, 55, N'PROG21', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (204, 13, N'PROG65', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (205, 23, N'PROG03', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (206, 2, N'PROG61', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (207, 11, N'PROG14', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (208, 51, N'PROG22', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (209, 46, N'PROG06', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (210, 63, N'PROG59', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (211, 78, N'PROG55', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (212, 79, N'PROG89', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (213, 15, N'PROG43', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (214, 45, N'PROG34', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (215, 7, N'PROG98', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (216, 50, N'PROG73', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (217, 3, N'PROG06', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (218, 45, N'PROG66', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (219, 86, N'PROG34', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (220, 38, N'PROG52', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (221, 77, N'PROG15', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (222, 33, N'PROG36', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (223, 17, N'PROG02', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (224, 95, N'PROG10', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (225, 20, N'PROG76', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (226, 24, N'PROG89', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (227, 30, N'PROG89', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (228, 3, N'PROG43', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (229, 16, N'PROG79', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (230, 84, N'PROG26', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (231, 24, N'PROG31', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (232, 35, N'PROG69', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (233, 99, N'PROG92', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (234, 67, N'PROG22', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (235, 34, N'PROG52', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (236, 29, N'PROG84', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (237, 50, N'PROG72', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (238, 98, N'PROG77', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (239, 19, N'PROG97', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (240, 22, N'PROG36', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (241, 12, N'PROG26', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (242, 34, N'PROG12', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (243, 89, N'PROG34', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (244, 68, N'PROG86', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (245, 38, N'PROG48', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (246, 100, N'PROG84', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (247, 60, N'PROG75', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (248, 45, N'PROG58', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (249, 48, N'PROG72', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (250, 20, N'PROG29', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (251, 24, N'PROG35', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (252, 11, N'PROG14', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (253, 96, N'PROG17', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (254, 70, N'PROG89', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (255, 7, N'PROG93', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (256, 44, N'PROG50', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (257, 23, N'PROG57', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (258, 80, N'PROG72', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (259, 37, N'PROG44', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (260, 27, N'PROG61', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (261, 15, N'PROG08', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (262, 22, N'PROG38', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (263, 26, N'PROG11', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (264, 85, N'PROG48', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (265, 1, N'PROG93', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (266, 23, N'PROG92', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (267, 5, N'PROG97', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (268, 97, N'PROG48', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (269, 61, N'PROG77', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (270, 43, N'PROG68', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (271, 22, N'PROG82', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (272, 34, N'PROG41', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (273, 21, N'PROG27', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (274, 58, N'PROG86', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (275, 14, N'PROG96', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (276, 90, N'PROG68', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (277, 58, N'PROG33', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (278, 39, N'PROG52', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (279, 38, N'PROG18', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (280, 40, N'PROG34', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (281, 49, N'PROG86', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (282, 85, N'PROG19', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (283, 24, N'PROG67', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (284, 64, N'PROG54', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (285, 16, N'PROG07', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (286, 81, N'PROG24', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (287, 17, N'PROG93', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (288, 21, N'PROG51', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (289, 33, N'PROG90', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (290, 54, N'PROG00', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (291, 13, N'PROG37', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (292, 18, N'PROG98', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (293, 84, N'PROG62', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (294, 28, N'PROG34', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (295, 8, N'PROG26', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (296, 26, N'PROG95', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (297, 52, N'PROG33', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (298, 63, N'PROG83', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (299, 79, N'PROG16', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (300, 31, N'PROG20', 0)
GO
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (301, 92, N'PROG09', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (302, 98, N'PROG62', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (303, 39, N'PROG75', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (304, 49, N'PROG39', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (305, 24, N'PROG03', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (306, 60, N'PROG11', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (307, 48, N'PROG93', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (308, 81, N'PROG48', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (309, 31, N'PROG40', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (310, 78, N'PROG55', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (311, 52, N'PROG35', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (312, 4, N'PROG77', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (313, 76, N'PROG60', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (314, 80, N'PROG93', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (315, 97, N'PROG59', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (316, 27, N'PROG73', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (317, 86, N'PROG99', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (318, 16, N'PROG21', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (319, 27, N'PROG21', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (320, 100, N'PROG26', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (321, 79, N'PROG80', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (322, 65, N'PROG14', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (323, 17, N'PROG32', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (324, 44, N'PROG33', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (325, 42, N'PROG27', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (326, 50, N'PROG68', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (327, 87, N'PROG00', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (328, 97, N'PROG73', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (329, 16, N'PROG79', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (330, 36, N'PROG54', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (331, 27, N'PROG70', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (332, 61, N'PROG54', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (333, 27, N'PROG16', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (334, 55, N'PROG23', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (335, 6, N'PROG59', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (336, 56, N'PROG73', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (337, 17, N'PROG48', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (338, 55, N'PROG69', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (339, 13, N'PROG90', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (340, 91, N'PROG01', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (341, 6, N'PROG12', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (342, 38, N'PROG86', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (343, 83, N'PROG90', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (344, 71, N'PROG75', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (345, 89, N'PROG34', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (346, 74, N'PROG61', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (347, 48, N'PROG60', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (348, 74, N'PROG63', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (349, 56, N'PROG60', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (350, 86, N'PROG28', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (351, 69, N'PROG54', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (352, 34, N'PROG21', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (353, 41, N'PROG21', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (354, 9, N'PROG43', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (355, 97, N'PROG52', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (356, 82, N'PROG96', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (357, 95, N'PROG74', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (358, 4, N'PROG92', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (359, 89, N'PROG83', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (360, 8, N'PROG10', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (361, 58, N'PROG15', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (362, 82, N'PROG66', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (363, 73, N'PROG13', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (364, 4, N'PROG01', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (365, 47, N'PROG91', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (366, 6, N'PROG40', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (367, 39, N'PROG17', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (368, 74, N'PROG68', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (369, 15, N'PROG31', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (370, 33, N'PROG98', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (371, 27, N'PROG54', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (372, 80, N'PROG89', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (373, 43, N'PROG81', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (374, 13, N'PROG49', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (375, 40, N'PROG32', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (376, 6, N'PROG69', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (377, 67, N'PROG05', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (378, 81, N'PROG28', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (379, 41, N'PROG01', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (380, 60, N'PROG98', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (381, 10, N'PROG15', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (382, 20, N'PROG92', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (383, 31, N'PROG58', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (384, 29, N'PROG18', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (385, 51, N'PROG28', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (386, 99, N'PROG27', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (387, 59, N'PROG97', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (388, 26, N'PROG49', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (389, 22, N'PROG20', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (390, 43, N'PROG54', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (391, 62, N'PROG58', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (392, 33, N'PROG80', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (393, 4, N'PROG71', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (394, 77, N'PROG59', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (395, 58, N'PROG84', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (396, 10, N'PROG89', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (397, 75, N'PROG83', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (398, 32, N'PROG30', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (399, 6, N'PROG57', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (400, 18, N'PROG03', NULL)
GO
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (401, 20, N'PROG46', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (402, 42, N'PROG25', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (403, 28, N'PROG46', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (404, 7, N'PROG88', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (405, 38, N'PROG94', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (406, 60, N'PROG48', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (407, 100, N'PROG25', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (408, 88, N'PROG14', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (409, 44, N'PROG30', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (410, 71, N'PROG60', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (411, 41, N'PROG00', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (412, 28, N'PROG90', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (413, 43, N'PROG41', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (414, 19, N'PROG64', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (415, 53, N'PROG53', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (416, 33, N'PROG33', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (417, 13, N'PROG64', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (418, 67, N'PROG11', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (419, 15, N'PROG53', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (420, 77, N'PROG00', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (421, 93, N'PROG87', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (422, 87, N'PROG89', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (423, 2, N'PROG92', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (424, 30, N'PROG24', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (425, 28, N'PROG45', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (426, 44, N'PROG89', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (427, 17, N'PROG83', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (428, 87, N'PROG41', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (429, 17, N'PROG60', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (430, 67, N'PROG70', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (431, 33, N'PROG05', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (432, 24, N'PROG86', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (433, 16, N'PROG65', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (434, 79, N'PROG47', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (435, 71, N'PROG51', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (436, 70, N'PROG42', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (437, 13, N'PROG64', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (438, 82, N'PROG85', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (439, 30, N'PROG95', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (440, 98, N'PROG69', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (441, 66, N'PROG09', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (442, 51, N'PROG59', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (443, 86, N'PROG46', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (444, 58, N'PROG11', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (445, 13, N'PROG15', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (446, 6, N'PROG92', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (447, 87, N'PROG88', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (448, 99, N'PROG27', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (449, 15, N'PROG84', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (450, 30, N'PROG03', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (451, 43, N'PROG53', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (452, 99, N'PROG68', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (453, 71, N'PROG72', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (454, 97, N'PROG66', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (455, 2, N'PROG56', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (456, 65, N'PROG60', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (457, 35, N'PROG89', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (458, 6, N'PROG19', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (459, 39, N'PROG65', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (460, 36, N'PROG83', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (461, 44, N'PROG12', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (462, 48, N'PROG56', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (463, 60, N'PROG10', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (464, 93, N'PROG17', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (465, 31, N'PROG09', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (466, 38, N'PROG33', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (467, 5, N'PROG62', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (468, 87, N'PROG94', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (469, 45, N'PROG93', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (470, 83, N'PROG22', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (471, 95, N'PROG11', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (472, 34, N'PROG11', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (473, 26, N'PROG62', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (474, 10, N'PROG33', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (475, 30, N'PROG53', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (476, 5, N'PROG04', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (477, 15, N'PROG68', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (478, 16, N'PROG49', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (479, 36, N'PROG94', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (480, 47, N'PROG92', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (481, 63, N'PROG68', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (482, 37, N'PROG32', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (483, 79, N'PROG33', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (484, 3, N'PROG08', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (485, 99, N'PROG04', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (486, 4, N'PROG54', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (487, 59, N'PROG83', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (488, 42, N'PROG03', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (489, 65, N'PROG43', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (490, 25, N'PROG08', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (491, 46, N'PROG63', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (492, 47, N'PROG31', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (493, 53, N'PROG10', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (494, 91, N'PROG72', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (495, 97, N'PROG95', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (496, 8, N'PROG10', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (497, 94, N'PROG28', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (498, 53, N'PROG97', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (499, 20, N'PROG17', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (500, 67, N'PROG97', 0)
GO
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (501, 44, N'PROG87', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (502, 87, N'PROG58', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (503, 58, N'PROG61', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (504, 98, N'PROG66', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (505, 62, N'PROG79', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (506, 76, N'PROG59', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (507, 38, N'PROG36', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (508, 97, N'PROG95', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (509, 97, N'PROG55', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (510, 6, N'PROG57', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (511, 65, N'PROG11', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (512, 83, N'PROG21', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (513, 47, N'PROG40', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (514, 97, N'PROG68', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (515, 9, N'PROG78', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (516, 87, N'PROG72', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (517, 22, N'PROG34', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (518, 54, N'PROG27', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (519, 1, N'PROG94', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (520, 35, N'PROG34', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (521, 85, N'PROG54', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (522, 83, N'PROG37', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (523, 45, N'PROG91', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (524, 21, N'PROG73', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (525, 64, N'PROG43', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (526, 55, N'PROG90', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (527, 75, N'PROG93', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (528, 82, N'PROG08', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (529, 60, N'PROG21', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (530, 66, N'PROG75', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (531, 18, N'PROG11', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (532, 45, N'PROG81', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (533, 63, N'PROG67', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (534, 10, N'PROG33', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (535, 87, N'PROG51', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (536, 60, N'PROG20', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (537, 12, N'PROG94', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (538, 43, N'PROG40', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (539, 11, N'PROG19', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (540, 87, N'PROG69', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (541, 96, N'PROG18', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (542, 39, N'PROG18', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (543, 31, N'PROG52', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (544, 54, N'PROG86', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (545, 6, N'PROG77', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (546, 90, N'PROG58', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (547, 86, N'PROG98', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (548, 63, N'PROG39', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (549, 99, N'PROG34', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (550, 57, N'PROG54', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (551, 6, N'PROG49', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (552, 22, N'PROG46', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (553, 62, N'PROG86', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (554, 34, N'PROG33', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (555, 32, N'PROG58', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (556, 79, N'PROG16', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (557, 67, N'PROG98', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (558, 83, N'PROG75', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (559, 67, N'PROG23', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (560, 77, N'PROG41', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (561, 83, N'PROG57', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (562, 38, N'PROG86', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (563, 48, N'PROG14', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (564, 91, N'PROG79', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (565, 54, N'PROG03', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (566, 93, N'PROG43', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (567, 87, N'PROG76', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (568, 52, N'PROG43', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (569, 2, N'PROG65', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (570, 54, N'PROG03', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (571, 72, N'PROG16', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (572, 41, N'PROG97', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (573, 5, N'PROG54', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (574, 58, N'PROG62', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (575, 87, N'PROG05', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (576, 48, N'PROG22', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (577, 56, N'PROG77', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (578, 85, N'PROG83', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (579, 77, N'PROG71', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (580, 79, N'PROG43', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (581, 61, N'PROG08', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (582, 98, N'PROG85', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (583, 24, N'PROG13', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (584, 86, N'PROG17', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (585, 82, N'PROG05', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (586, 32, N'PROG11', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (587, 68, N'PROG56', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (588, 54, N'PROG09', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (589, 10, N'PROG33', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (590, 74, N'PROG36', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (591, 12, N'PROG23', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (592, 37, N'PROG51', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (593, 31, N'PROG21', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (594, 13, N'PROG56', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (595, 75, N'PROG03', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (596, 72, N'PROG27', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (597, 29, N'PROG44', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (598, 59, N'PROG29', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (599, 27, N'PROG61', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (600, 99, N'PROG22', 0)
GO
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (601, 17, N'PROG99', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (602, 48, N'PROG17', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (603, 21, N'PROG12', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (604, 26, N'PROG24', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (605, 97, N'PROG63', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (606, 50, N'PROG32', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (607, 96, N'PROG51', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (608, 56, N'PROG41', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (609, 48, N'PROG62', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (610, 67, N'PROG37', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (611, 20, N'PROG60', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (612, 30, N'PROG00', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (613, 83, N'PROG64', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (614, 52, N'PROG66', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (615, 4, N'PROG59', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (616, 94, N'PROG17', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (617, 5, N'PROG65', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (618, 33, N'PROG31', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (619, 48, N'PROG17', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (620, 88, N'PROG27', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (621, 41, N'PROG67', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (622, 90, N'PROG47', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (623, 51, N'PROG15', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (624, 75, N'PROG03', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (625, 44, N'PROG58', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (626, 30, N'PROG32', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (627, 34, N'PROG75', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (628, 95, N'PROG17', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (629, 70, N'PROG56', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (630, 69, N'PROG00', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (631, 92, N'PROG66', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (632, 69, N'PROG38', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (633, 10, N'PROG13', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (634, 41, N'PROG62', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (635, 90, N'PROG78', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (636, 51, N'PROG88', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (637, 63, N'PROG97', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (638, 90, N'PROG99', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (639, 11, N'PROG74', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (640, 48, N'PROG66', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (641, 68, N'PROG93', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (642, 31, N'PROG51', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (643, 31, N'PROG68', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (644, 78, N'PROG57', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (645, 44, N'PROG42', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (646, 64, N'PROG09', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (647, 98, N'PROG63', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (648, 77, N'PROG93', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (649, 67, N'PROG42', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (650, 44, N'PROG66', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (651, 78, N'PROG82', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (652, 34, N'PROG06', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (653, 9, N'PROG34', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (654, 75, N'PROG96', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (655, 83, N'PROG03', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (656, 49, N'PROG23', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (657, 46, N'PROG87', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (658, 46, N'PROG73', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (659, 15, N'PROG83', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (660, 97, N'PROG43', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (661, 58, N'PROG69', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (662, 19, N'PROG94', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (663, 17, N'PROG68', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (664, 76, N'PROG39', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (665, 15, N'PROG33', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (666, 98, N'PROG16', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (667, 42, N'PROG19', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (668, 3, N'PROG06', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (669, 73, N'PROG55', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (670, 76, N'PROG27', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (671, 69, N'PROG07', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (672, 29, N'PROG60', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (673, 51, N'PROG06', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (674, 36, N'PROG57', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (675, 10, N'PROG46', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (676, 86, N'PROG68', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (677, 30, N'PROG52', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (678, 99, N'PROG27', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (679, 99, N'PROG20', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (680, 10, N'PROG06', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (681, 48, N'PROG40', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (682, 14, N'PROG33', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (683, 4, N'PROG67', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (684, 56, N'PROG65', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (685, 84, N'PROG25', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (686, 77, N'PROG54', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (687, 34, N'PROG47', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (688, 12, N'PROG50', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (689, 40, N'PROG60', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (690, 66, N'PROG30', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (691, 27, N'PROG18', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (692, 45, N'PROG30', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (693, 56, N'PROG08', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (694, 58, N'PROG84', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (695, 25, N'PROG03', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (696, 74, N'PROG86', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (697, 48, N'PROG94', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (698, 71, N'PROG77', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (699, 94, N'PROG32', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (700, 14, N'PROG27', NULL)
GO
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (701, 36, N'PROG77', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (702, 28, N'PROG08', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (703, 12, N'PROG35', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (704, 71, N'PROG48', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (705, 45, N'PROG04', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (706, 95, N'PROG36', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (707, 12, N'PROG62', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (708, 99, N'PROG22', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (709, 82, N'PROG27', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (710, 64, N'PROG93', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (711, 86, N'PROG95', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (712, 27, N'PROG24', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (713, 90, N'PROG30', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (714, 5, N'PROG61', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (715, 11, N'PROG44', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (716, 9, N'PROG92', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (717, 57, N'PROG79', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (718, 5, N'PROG47', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (719, 15, N'PROG08', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (720, 60, N'PROG40', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (721, 67, N'PROG82', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (722, 17, N'PROG31', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (723, 94, N'PROG54', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (724, 3, N'PROG72', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (725, 16, N'PROG04', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (726, 93, N'PROG90', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (727, 24, N'PROG55', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (728, 34, N'PROG68', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (729, 55, N'PROG60', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (730, 32, N'PROG45', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (731, 25, N'PROG78', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (732, 44, N'PROG58', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (733, 98, N'PROG88', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (734, 39, N'PROG08', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (735, 96, N'PROG28', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (736, 66, N'PROG90', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (737, 99, N'PROG82', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (738, 58, N'PROG71', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (739, 84, N'PROG57', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (740, 77, N'PROG78', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (741, 42, N'PROG70', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (742, 76, N'PROG81', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (743, 54, N'PROG53', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (744, 66, N'PROG73', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (745, 97, N'PROG96', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (746, 54, N'PROG85', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (747, 13, N'PROG21', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (748, 47, N'PROG99', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (749, 77, N'PROG06', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (750, 35, N'PROG19', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (751, 17, N'PROG49', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (752, 45, N'PROG54', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (753, 28, N'PROG39', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (754, 61, N'PROG18', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (755, 7, N'PROG44', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (756, 71, N'PROG54', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (757, 31, N'PROG31', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (758, 86, N'PROG41', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (759, 10, N'PROG71', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (760, 34, N'PROG73', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (761, 83, N'PROG36', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (762, 43, N'PROG51', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (763, 11, N'PROG53', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (764, 38, N'PROG80', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (765, 91, N'PROG66', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (766, 58, N'PROG40', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (767, 81, N'PROG08', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (768, 79, N'PROG40', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (769, 52, N'PROG30', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (770, 73, N'PROG85', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (771, 3, N'PROG85', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (772, 19, N'PROG01', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (773, 11, N'PROG82', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (774, 39, N'PROG86', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (775, 51, N'PROG39', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (776, 61, N'PROG83', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (777, 92, N'PROG74', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (778, 42, N'PROG57', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (779, 8, N'PROG53', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (780, 45, N'PROG40', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (781, 2, N'PROG21', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (782, 77, N'PROG02', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (783, 63, N'PROG90', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (784, 4, N'PROG66', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (785, 97, N'PROG37', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (786, 22, N'PROG53', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (787, 96, N'PROG16', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (788, 23, N'PROG57', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (789, 50, N'PROG77', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (790, 68, N'PROG62', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (791, 24, N'PROG03', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (792, 63, N'PROG70', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (793, 12, N'PROG04', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (794, 23, N'PROG93', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (795, 58, N'PROG44', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (796, 62, N'PROG65', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (797, 91, N'PROG01', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (798, 80, N'PROG40', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (799, 20, N'PROG26', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (800, 5, N'PROG61', 1)
GO
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (801, 43, N'PROG09', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (802, 10, N'PROG36', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (803, 82, N'PROG12', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (804, 73, N'PROG10', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (805, 55, N'PROG80', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (806, 65, N'PROG82', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (807, 1, N'PROG72', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (808, 98, N'PROG38', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (809, 8, N'PROG75', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (810, 48, N'PROG30', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (811, 33, N'PROG29', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (812, 16, N'PROG11', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (813, 5, N'PROG87', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (814, 26, N'PROG27', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (815, 29, N'PROG21', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (816, 74, N'PROG80', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (817, 83, N'PROG16', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (818, 54, N'PROG98', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (819, 59, N'PROG18', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (820, 99, N'PROG95', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (821, 24, N'PROG80', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (822, 88, N'PROG99', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (823, 7, N'PROG31', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (824, 100, N'PROG58', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (825, 33, N'PROG51', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (826, 73, N'PROG79', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (827, 87, N'PROG72', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (828, 5, N'PROG67', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (829, 99, N'PROG65', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (830, 71, N'PROG89', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (831, 38, N'PROG10', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (832, 88, N'PROG29', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (833, 38, N'PROG95', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (834, 46, N'PROG68', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (835, 99, N'PROG64', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (836, 60, N'PROG78', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (837, 26, N'PROG84', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (838, 63, N'PROG28', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (839, 64, N'PROG40', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (840, 25, N'PROG54', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (841, 13, N'PROG04', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (842, 21, N'PROG94', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (843, 21, N'PROG26', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (844, 87, N'PROG18', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (845, 20, N'PROG64', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (846, 9, N'PROG47', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (847, 97, N'PROG89', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (848, 28, N'PROG89', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (849, 48, N'PROG46', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (850, 8, N'PROG48', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (851, 1, N'PROG32', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (852, 18, N'PROG98', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (853, 20, N'PROG49', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (854, 78, N'PROG35', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (855, 8, N'PROG04', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (856, 54, N'PROG39', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (857, 37, N'PROG75', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (858, 33, N'PROG36', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (859, 37, N'PROG00', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (860, 10, N'PROG04', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (861, 75, N'PROG12', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (862, 4, N'PROG44', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (863, 46, N'PROG51', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (864, 82, N'PROG49', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (865, 33, N'PROG94', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (866, 91, N'PROG64', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (867, 12, N'PROG11', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (868, 50, N'PROG65', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (869, 52, N'PROG32', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (870, 88, N'PROG95', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (871, 11, N'PROG32', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (872, 86, N'PROG34', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (873, 64, N'PROG30', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (874, 78, N'PROG20', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (875, 22, N'PROG44', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (876, 57, N'PROG23', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (877, 47, N'PROG88', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (878, 78, N'PROG67', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (879, 7, N'PROG50', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (880, 39, N'PROG98', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (881, 17, N'PROG80', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (882, 34, N'PROG10', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (883, 42, N'PROG99', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (884, 67, N'PROG12', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (885, 76, N'PROG65', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (886, 72, N'PROG92', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (887, 90, N'PROG33', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (888, 97, N'PROG41', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (889, 87, N'PROG37', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (890, 2, N'PROG98', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (891, 29, N'PROG61', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (892, 79, N'PROG10', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (893, 19, N'PROG15', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (894, 20, N'PROG17', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (895, 43, N'PROG03', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (896, 87, N'PROG40', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (897, 7, N'PROG40', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (898, 72, N'PROG80', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (899, 35, N'PROG59', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (900, 3, N'PROG28', 1)
GO
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (901, 22, N'PROG13', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (902, 46, N'PROG09', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (903, 45, N'PROG84', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (904, 83, N'PROG34', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (905, 14, N'PROG73', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (906, 100, N'PROG13', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (907, 18, N'PROG08', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (908, 14, N'PROG65', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (909, 48, N'PROG29', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (910, 92, N'PROG21', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (911, 67, N'PROG38', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (912, 27, N'PROG42', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (913, 12, N'PROG66', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (914, 53, N'PROG67', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (915, 67, N'PROG03', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (916, 98, N'PROG08', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (917, 30, N'PROG72', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (918, 50, N'PROG00', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (919, 40, N'PROG27', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (920, 33, N'PROG76', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (921, 13, N'PROG14', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (922, 33, N'PROG02', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (923, 42, N'PROG88', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (924, 62, N'PROG54', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (925, 82, N'PROG13', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (926, 28, N'PROG23', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (927, 20, N'PROG48', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (928, 24, N'PROG53', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (929, 42, N'PROG20', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (930, 47, N'PROG77', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (931, 74, N'PROG82', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (932, 79, N'PROG32', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (933, 40, N'PROG67', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (934, 48, N'PROG44', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (935, 55, N'PROG22', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (936, 20, N'PROG90', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (937, 2, N'PROG57', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (938, 6, N'PROG94', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (939, 67, N'PROG41', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (940, 76, N'PROG79', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (941, 42, N'PROG85', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (942, 71, N'PROG99', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (943, 14, N'PROG95', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (944, 42, N'PROG89', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (945, 16, N'PROG85', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (946, 75, N'PROG14', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (947, 71, N'PROG51', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (948, 9, N'PROG98', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (949, 97, N'PROG26', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (950, 82, N'PROG10', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (951, 36, N'PROG78', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (952, 81, N'PROG29', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (953, 11, N'PROG11', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (954, 7, N'PROG93', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (955, 37, N'PROG01', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (956, 50, N'PROG31', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (957, 26, N'PROG86', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (958, 76, N'PROG78', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (959, 19, N'PROG60', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (960, 39, N'PROG13', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (961, 88, N'PROG11', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (962, 81, N'PROG28', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (963, 6, N'PROG06', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (964, 83, N'PROG63', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (965, 69, N'PROG83', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (966, 27, N'PROG41', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (967, 48, N'PROG16', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (968, 97, N'PROG56', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (969, 6, N'PROG14', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (970, 75, N'PROG42', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (971, 40, N'PROG80', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (972, 17, N'PROG64', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (973, 46, N'PROG02', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (974, 4, N'PROG10', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (975, 67, N'PROG36', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (976, 44, N'PROG61', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (977, 75, N'PROG76', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (978, 59, N'PROG17', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (979, 5, N'PROG53', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (980, 88, N'PROG82', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (981, 79, N'PROG13', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (982, 32, N'PROG71', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (983, 74, N'PROG05', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (984, 38, N'PROG30', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (985, 21, N'PROG71', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (986, 91, N'PROG54', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (987, 8, N'PROG00', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (988, 35, N'PROG50', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (989, 25, N'PROG12', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (990, 8, N'PROG29', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (991, 50, N'PROG65', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (992, 99, N'PROG24', NULL)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (993, 100, N'PROG14', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (994, 8, N'PROG00', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (995, 1, N'PROG79', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (996, 8, N'PROG87', 0)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (997, 8, N'PROG63', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (998, 82, N'PROG46', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (999, 96, N'PROG51', 1)
INSERT [dbo].[Student_Enrollment] ([id], [student_id], [course_code], [completed]) VALUES (1000, 25, N'PROG81', 0)
GO
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (1, 1, NULL, N'531-95-1379', N'6 Canary Center', N'Sioux Falls', N'South Dakota', N'57193')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (2, 2, N'609-131-7003', N'423-08-0236', N'2 Schmedeman Trail', N'Trenton', N'New Jersey', N'08608')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (3, 3, N'614-367-9085', NULL, N'53 Brentwood Drive', N'Columbus', N'Ohio', N'43231')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (4, 4, NULL, N'275-52-3652', N'534 Independence Circle', N'Dearborn', N'Michigan', N'48126')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (5, 5, N'504-892-6086', N'124-70-1264', N'9740 Sherman Avenue', N'New Orleans', N'Louisiana', N'70142')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (6, 6, N'360-945-0056', N'848-70-0442', N'027 Sommers Court', N'Kent', N'Washington', N'98042')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (7, 7, N'202-858-2612', N'712-08-2538', N'191 Thierer Point', N'Washington', N'District of Columbia', N'20503')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (8, 8, NULL, NULL, N'12 Homewood Street', N'Des Moines', N'Iowa', N'50393')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (9, 9, N'615-610-8882', NULL, N'1637 Cascade Park', N'Memphis', N'Tennessee', N'38104')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (10, 10, N'408-232-4728', N'167-78-2705', N'4 Swallow Street', N'Sunnyvale', N'California', N'94089')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (11, 11, N'334-473-4747', N'795-60-5386', N'98032 Killdeer Parkway', N'Montgomery', N'Alabama', N'36104')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (12, 12, N'316-605-3390', N'876-49-0178', N'78 Eagan Center', N'Wichita', N'Kansas', N'67260')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (13, 13, NULL, N'799-89-5125', N'1343 Hauk Center', N'Charleston', N'South Carolina', N'29411')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (14, 14, NULL, N'456-73-2185', N'6 Anthes Hill', N'Annapolis', N'Maryland', N'21405')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (15, 15, N'727-641-3300', N'794-10-6247', N'1 Sherman Pass', N'Clearwater', N'Florida', N'34620')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (16, 16, N'571-912-0375', N'820-42-5283', N'58 Pearson Terrace', N'Falls Church', N'Virginia', N'22047')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (17, 17, NULL, NULL, N'511 Thierer Street', N'Charlottesville', N'Virginia', N'22908')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (18, 18, N'713-806-7852', N'494-15-9489', N'30310 Anthes Pass', N'Houston', N'Texas', N'77085')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (19, 19, N'918-345-7173', N'876-85-9089', N'8331 Hovde Lane', N'Tulsa', N'Oklahoma', N'74193')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (20, 20, N'678-543-0272', NULL, N'4123 Mitchell Junction', N'Marietta', N'Georgia', N'30066')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (21, 21, N'502-241-3333', N'584-37-4551', N'232 2nd Trail', N'Louisville', N'Kentucky', N'40225')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (22, 22, NULL, N'602-01-0448', N'5852 Vera Court', N'Bakersfield', N'California', N'93305')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (23, 23, NULL, N'870-14-5599', N'11749 Warbler Pass', N'Greensboro', N'North Carolina', N'27425')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (24, 24, N'518-441-3411', N'695-11-9181', N'35 Ridge Oak Way', N'Albany', N'New York', N'12255')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (25, 25, N'317-324-2450', N'897-82-2774', N'08848 Northland Hill', N'Indianapolis', N'Indiana', N'46207')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (26, 26, NULL, N'140-68-8673', N'1232 Superior Alley', N'Dallas', N'Texas', N'75205')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (27, 27, NULL, N'559-02-8736', N'1 Truax Plaza', N'Plano', N'Texas', N'75074')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (28, 28, NULL, N'577-12-4234', N'9 Gerald Circle', N'Santa Ana', N'California', N'92725')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (29, 29, NULL, N'880-60-6708', N'30 Burrows Terrace', N'Pittsburgh', N'Pennsylvania', N'15220')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (30, 30, N'804-703-6211', N'331-56-0311', N'97 Grover Junction', N'Richmond', N'Virginia', N'23237')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (31, 31, NULL, N'632-11-6480', N'33 Shoshone Hill', N'Virginia Beach', N'Virginia', N'23454')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (32, 32, N'952-930-1277', N'410-34-3703', N'6 Waxwing Court', N'Young America', N'Minnesota', N'55557')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (33, 33, NULL, N'290-59-3944', N'6 Eliot Junction', N'Davenport', N'Iowa', N'52804')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (34, 34, N'412-501-8336', N'836-48-0819', N'78 Thackeray Road', N'Pittsburgh', N'Pennsylvania', N'15286')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (35, 35, N'203-413-6760', N'348-82-3844', N'82571 Ridgeview Avenue', N'Hartford', N'Connecticut', N'06105')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (36, 36, N'913-220-0525', N'773-94-1859', N'89709 Everett Point', N'Shawnee Mission', N'Kansas', N'66276')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (37, 37, NULL, N'792-47-9257', N'23 Packers Parkway', N'El Paso', N'Texas', N'88558')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (38, 38, NULL, N'335-74-2768', N'9 Karstens Junction', N'Boston', N'Massachusetts', N'02216')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (39, 39, N'860-151-3867', N'414-81-1714', N'19 Pleasure Avenue', N'Hartford', N'Connecticut', N'06120')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (40, 40, NULL, N'651-24-0856', N'2 Manitowish Drive', N'Houston', N'Texas', N'77288')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (41, 41, N'406-249-5383', N'862-95-1709', N'4 Park Meadow Parkway', N'Missoula', N'Montana', N'59806')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (42, 42, N'608-652-1497', N'554-61-3763', N'01 Blaine Plaza', N'Madison', N'Wisconsin', N'53705')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (43, 43, NULL, N'587-94-6527', N'9611 Bultman Park', N'Washington', N'District of Columbia', N'20551')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (44, 44, N'915-791-9360', NULL, N'9 Forest Crossing', N'El Paso', N'Texas', N'88579')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (45, 45, NULL, N'341-30-1189', N'54 Merry Road', N'Washington', N'District of Columbia', N'20215')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (46, 46, N'203-575-6413', N'349-57-1085', N'471 Knutson Court', N'Norwalk', N'Connecticut', N'06854')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (47, 47, N'407-174-6241', N'857-29-1546', N'8 Merchant Way', N'Orlando', N'Florida', N'32885')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (48, 48, NULL, N'455-24-3072', N'70 Anzinger Circle', N'Alpharetta', N'Georgia', N'30022')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (49, 49, NULL, N'443-61-6081', N'1 Spaight Trail', N'Houston', N'Texas', N'77060')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (50, 50, NULL, N'730-33-1850', N'905 Raven Lane', N'Sacramento', N'California', N'95833')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (51, 51, NULL, N'627-19-9849', N'00 Macpherson Drive', N'Topeka', N'Kansas', N'66667')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (52, 52, NULL, N'648-26-1137', N'62285 Sutteridge Hill', N'El Paso', N'Texas', N'79928')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (53, 53, N'845-470-2456', N'547-60-7861', N'21 Laurel Crossing', N'White Plains', N'New York', N'10633')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (54, 54, NULL, N'348-58-7154', N'32 High Crossing Road', N'Wilkes Barre', N'Pennsylvania', N'18706')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (55, 55, N'610-673-6571', N'743-37-1388', N'096 Pleasure Hill', N'Reading', N'Pennsylvania', N'19605')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (56, 56, N'512-228-9000', NULL, N'2 Packers Trail', N'Austin', N'Texas', N'78710')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (57, 57, N'240-578-8824', N'448-59-4359', N'50 Memorial Avenue', N'Bethesda', N'Maryland', N'20816')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (58, 58, NULL, N'216-80-8826', N'79197 Coleman Place', N'Pomona', N'California', N'91797')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (59, 59, N'336-575-8631', N'494-04-2657', N'089 Nancy Place', N'Winston Salem', N'North Carolina', N'27105')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (60, 60, N'903-899-1102', N'143-34-5583', N'0448 Ohio Hill', N'Tyler', N'Texas', N'75705')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (61, 61, NULL, N'766-74-8931', N'7 Kim Circle', N'Pittsburgh', N'Pennsylvania', N'15261')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (62, 62, N'413-752-8736', N'843-76-1334', N'993 Ludington Drive', N'Springfield', N'Massachusetts', N'01114')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (63, 63, NULL, N'677-35-3549', N'6231 Twin Pines Drive', N'Detroit', N'Michigan', N'48295')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (64, 64, N'214-914-8281', N'269-38-7433', N'1 Duke Avenue', N'Dallas', N'Texas', N'75205')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (65, 65, NULL, N'792-38-1730', N'676 Pine View Junction', N'Saint Louis', N'Missouri', N'63121')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (66, 66, N'305-341-3558', N'890-62-4060', N'68 Oakridge Trail', N'Naples', N'Florida', N'33961')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (67, 67, NULL, N'447-92-9849', N'957 Reinke Place', N'Englewood', N'Colorado', N'80150')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (68, 68, NULL, N'879-37-2277', N'949 Blue Bill Park Drive', N'Peoria', N'Illinois', N'61614')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (69, 69, N'563-604-5927', N'689-03-9237', N'3 Eagan Park', N'Davenport', N'Iowa', N'52809')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (70, 70, N'334-478-8339', N'728-16-3918', N'2 Alpine Way', N'Montgomery', N'Alabama', N'36134')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (71, 71, NULL, N'520-33-8545', N'865 Evergreen Hill', N'Des Moines', N'Iowa', N'50315')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (72, 72, N'989-640-0251', NULL, N'04 Cottonwood Terrace', N'Midland', N'Michigan', N'48670')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (73, 73, N'770-469-2847', N'696-90-5522', N'1 Stephen Junction', N'Marietta', N'Georgia', N'30061')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (74, 74, N'702-407-9040', N'558-15-0727', N'35 Acker Park', N'Las Vegas', N'Nevada', N'89140')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (75, 75, NULL, N'124-28-3951', N'07491 Burning Wood Circle', N'Denver', N'Colorado', N'80209')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (76, 76, N'718-915-9332', NULL, N'5811 Memorial Avenue', N'Jamaica', N'New York', N'11436')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (77, 77, N'919-671-9643', N'594-29-7667', N'7 Lien Parkway', N'Raleigh', N'North Carolina', N'27605')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (78, 78, N'650-625-5250', N'787-18-9312', N'9 Fairview Street', N'Redwood City', N'California', N'94064')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (79, 79, NULL, N'159-71-4572', N'5 David Terrace', N'Lexington', N'Kentucky', N'40581')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (80, 80, N'202-656-3878', N'738-60-5529', N'0 Alpine Street', N'Alexandria', N'Virginia', N'22309')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (81, 81, N'414-283-8683', N'543-76-5728', N'48 Bay Drive', N'Milwaukee', N'Wisconsin', N'53210')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (82, 82, N'727-570-5253', N'480-62-2871', N'330 Harper Lane', N'Saint Petersburg', N'Florida', N'33731')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (83, 83, N'205-991-3474', N'574-62-6073', N'82 David Hill', N'Tuscaloosa', N'Alabama', N'35487')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (84, 84, NULL, N'393-84-3860', N'4 Westerfield Court', N'Tulsa', N'Oklahoma', N'74108')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (85, 85, N'202-425-0469', N'173-69-4195', N'6 Spaight Court', N'Washington', N'District of Columbia', N'20425')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (86, 86, N'405-859-4772', N'742-17-9273', N'34 Sachs Pass', N'Oklahoma City', N'Oklahoma', N'73119')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (87, 87, N'952-876-6416', N'463-57-7832', N'05775 Division Plaza', N'Minneapolis', N'Minnesota', N'55436')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (88, 88, N'202-289-3164', N'502-74-5426', N'54089 Lyons Pass', N'Washington', N'District of Columbia', N'20231')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (89, 89, N'617-926-8763', NULL, N'94 Vermont Center', N'Boston', N'Massachusetts', N'02109')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (90, 90, NULL, N'764-56-3533', N'3 Red Cloud Street', N'Chattanooga', N'Tennessee', N'37410')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (91, 91, NULL, N'801-71-2405', N'144 International Plaza', N'Huntsville', N'Alabama', N'35810')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (92, 92, NULL, N'693-46-1941', N'38 Brickson Park Place', N'Louisville', N'Kentucky', N'40250')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (93, 93, N'850-886-2063', N'365-21-8591', N'84244 Hanson Avenue', N'Tallahassee', N'Florida', N'32399')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (94, 94, N'915-708-1318', NULL, N'5 Scoville Trail', N'El Paso', N'Texas', N'79940')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (95, 95, NULL, N'105-36-6731', N'709 Nova Point', N'Shawnee Mission', N'Kansas', N'66215')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (96, 96, NULL, N'297-79-5568', N'7808 Veith Hill', N'Boise', N'Idaho', N'83757')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (97, 97, N'650-541-7338', N'185-76-9962', N'8 Tennessee Street', N'Redwood City', N'California', N'94064')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (98, 98, N'562-442-4900', N'296-50-0813', N'900 Basil Pass', N'Whittier', N'California', N'90610')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (99, 99, N'719-136-3260', N'357-33-2485', N'01 Bowman Alley', N'Colorado Springs', N'Colorado', N'80940')
INSERT [dbo].[Student_Info] ([id], [student_id], [phone], [ssn], [address], [city], [state], [zip]) VALUES (100, 100, N'860-725-9468', N'312-09-4343', N'2 Calypso Center', N'Hartford', N'Connecticut', N'06152')
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoReportFour]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertIntoReportFour]
	-- Add the parameters for the stored procedure here
	@CourseCode nvarchar(50),
	@StudentIDs nvarchar(max),
	@MostStudentsState nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Report_4] ([Course_Code], [Student_IDs], [Most_Students_State])
	VALUES (@CourseCode, @StudentIDs, @MostStudentsState)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoReportOne]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertIntoReportOne]
	-- Add the parameters for the stored procedure here
	@FullName nvarchar(max),
	@SSN nvarchar(4),
	@FullAddress nvarchar(max),
	@Phone nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Report_1] ([Full_Name], [SSN], [Full_Address], [Phone])
	VALUES (@FullName, @SSN, @FullAddress, @Phone)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoReportThree]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertIntoReportThree] 
	-- Add the parameters for the stored procedure here
	@Course_Code nvarchar(50),
	@Students_Enrolled int,
	@Students_Completed int,
	@Students_Failed_Dropped int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Report_3] ([Course_Code], [Students_Enrolled], [Students_Completed], [Students_Failed_Dropped])
	VALUES (@Course_Code, @Students_Enrolled, @Students_Completed, @Students_Failed_Dropped)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoReportTwo]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertIntoReportTwo] 
	-- Add the parameters for the stored procedure here
	@FullName nvarchar(max),
	@CoursesTotal int,
	@CoursesCompleted int,
	@CoursesIncomplete int,
	@CoursesInProgress int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Report_2] ([Full_Name], [Courses_Total], [Courses_Completed], [Courses_Incomplete], [Courses_InProgress])
	VALUES (@FullName, @CoursesTotal, @CoursesCompleted, @CoursesIncomplete, @CoursesInProgress)
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectFromView]    Script Date: 11/6/2022 8:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSelectFromView]
	-- Add the parameters for the stored procedure here
	@ViewName nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @SQL nvarchar(max)

    -- Insert statements for procedure here
	SET @SQL = 'SELECT * FROM ' + @ViewName

	EXEC sys.sp_executesql @SQL
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
         Begin Table = "Student"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Student_Info"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 1
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Report1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Report1'
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
         Begin Table = "Student"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Student_Enrollment"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Report2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Report2'
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
         Begin Table = "Student_Enrollment"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Report3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Report3'
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
         Begin Table = "Student_Enrollment"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Student_Info"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 4
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Report4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Report4'
GO
