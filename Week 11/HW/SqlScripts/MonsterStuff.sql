USE [PROG260FA22]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Chart3'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Chart3'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Chart2'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Chart2'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Chart1'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Chart1'
GO
/****** Object:  StoredProcedure [dbo].[spSelectFromView]    Script Date: 11/20/2022 5:08:02 PM ******/
DROP PROCEDURE [dbo].[spSelectFromView]
GO
/****** Object:  View [dbo].[vw_Chart2]    Script Date: 11/20/2022 5:08:02 PM ******/
DROP VIEW [dbo].[vw_Chart2]
GO
/****** Object:  View [dbo].[vw_Chart3]    Script Date: 11/20/2022 5:08:02 PM ******/
DROP VIEW [dbo].[vw_Chart3]
GO
/****** Object:  View [dbo].[vw_Chart1]    Script Date: 11/20/2022 5:08:02 PM ******/
DROP VIEW [dbo].[vw_Chart1]
GO
/****** Object:  Table [dbo].[Monsters]    Script Date: 11/20/2022 5:08:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Monsters]') AND type in (N'U'))
DROP TABLE [dbo].[Monsters]
GO
/****** Object:  Table [dbo].[Monsters]    Script Date: 11/20/2022 5:08:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monsters](
	[id] [int] NULL,
	[Name] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[HP] [int] NULL,
	[MP] [int] NULL,
	[Location] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Chart1]    Script Date: 11/20/2022 5:08:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_Chart1]
AS
SELECT DISTINCT (Location), COUNT(Location) as 'Monster_Count'
FROM        dbo.Monsters
GROUP BY Location
GO
/****** Object:  View [dbo].[vw_Chart3]    Script Date: 11/20/2022 5:08:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_Chart3]
AS
SELECT TOP 10  HP, MP
FROM        dbo.Monsters
ORDER BY HP DESC, MP DESC
GO
/****** Object:  View [dbo].[vw_Chart2]    Script Date: 11/20/2022 5:08:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_Chart2]
AS
SELECT     DISTINCT(HP), COUNT(HP) as 'Count'
FROM        dbo.Monsters
GROUP BY HP
GO
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (1, N'Bérengère', N'Gnu, brindled', 947, 117, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (2, N'Lucrèce', N'Kelp gull', 659, 6, N'NJ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (3, N'Médiamass', N'Cat, kaffir', 780, 167, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (4, N'Crééz', N'Heron, black-crowned night', 875, 70, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (5, N'Vénus', N'Bushbuck', 429, 68, N'OR')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (6, N'Tú', N'Oystercatcher, blackish', 288, 45, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (7, N'Laurène', N'Jaguar', 484, 81, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (8, N'Eléa', N'White-tailed deer', 516, 43, N'CT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (9, N'Vérane', N'Cormorant (unidentified)', 802, 41, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (10, N'Tán', N'Australian magpie', 72, 108, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (11, N'Eloïse', N'Agouti', 502, 78, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (12, N'Loïc', N'Screamer, southern', 324, 177, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (13, N'Marlène', N'Oriental white-backed vulture', 773, 60, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (14, N'Dafnée', N'Fox, grey', 267, 72, N'CT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (15, N'Angélique', N'Black-footed ferret', 468, 185, N'ID')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (16, N'Eugénie', N'Anteater, giant', 633, 186, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (17, N'Aurélie', N'Aardwolf', 276, 72, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (18, N'Kù', N'Bleu, red-cheeked cordon', 628, 75, N'AK')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (19, N'Lèi', N'Crow, pied', 480, 185, N'AR')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (20, N'Garçon', N'Eurasian hoopoe', 372, 22, N'NV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (21, N'Geneviève', N'Coqui partridge', 768, 68, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (22, N'Mélissandre', N'Spur-winged goose', 118, 140, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (23, N'Uò', N'African elephant', 669, 145, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (24, N'Ophélie', N'Steenbok', 409, 74, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (25, N'Thérèsa', N'Egret, snowy', 320, 165, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (26, N'Marylène', N'Dama wallaby', 152, 20, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (27, N'Dù', N'Marten, american', 318, 99, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (28, N'Maëlyss', N'Pied cormorant', 843, 47, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (29, N'Marie-hélène', N'Booby, blue-footed', 150, 87, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (30, N'Joséphine', N'Collared peccary', 466, 52, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (31, N'Östen', N'Barbet, black-collared', 63, 197, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (32, N'Zhì', N'Brown and yellow marshbird', 221, 60, N'CT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (33, N'Pål', N'Black swan', 523, 129, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (34, N'Régine', N'Black-backed magpie', 847, 79, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (35, N'Geneviève', N'Peacock, indian', 936, 149, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (36, N'Lyséa', N'Northern elephant seal', 546, 186, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (37, N'Loïc', N'Blue shark', 687, 49, N'OR')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (38, N'Renée', N'Cape white-eye', 972, 33, N'NM')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (39, N'Zhì', N'Red-tailed phascogale', 127, 68, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (40, N'Lorène', N'Magistrate black colobus', 982, 148, N'WA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (41, N'Séverine', N'Striated heron', 114, 168, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (42, N'Célia', N'Small Indian mongoose', 332, 44, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (43, N'Eloïse', N'Pygmy possum', 830, 28, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (44, N'Réjane', N'Platypus', 308, 173, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (45, N'Marylène', N'Kookaburra, laughing', 878, 29, N'NV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (46, N'Marie-thérèse', N'Black-eyed bulbul', 858, 17, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (47, N'Nadège', N'Southern black-backed gull', 750, 157, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (48, N'Joséphine', N'Swamp deer', 730, 30, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (49, N'Märta', N'Lion, mountain', 6, 187, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (50, N'Cécile', N'Boa, cook''s tree', 169, 80, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (51, N'Naéva', N'Long-finned pilot whale', 969, 142, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (52, N'Aimée', N'Blue-breasted cordon bleu', 871, 4, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (53, N'Maëly', N'Red-tailed cockatoo', 744, 87, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (54, N'Simplifiés', N'Goldeneye, barrows', 834, 184, N'UT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (55, N'Léandre', N'Vulture, white-headed', 234, 21, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (56, N'Mén', N'Tern, royal', 136, 126, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (57, N'Maëlla', N'Flamingo, chilean', 833, 72, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (58, N'Görel', N'Rhesus monkey', 757, 121, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (59, N'Ruì', N'Arctic ground squirrel', 463, 50, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (60, N'Intéressant', N'Blue waxbill', 896, 72, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (61, N'Régine', N'Vulture, griffon', 853, 81, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (62, N'Marie-noël', N'Sheep, american bighorn', 877, 71, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (63, N'Océane', N'Baboon, yellow', 129, 1, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (64, N'Göran', N'Goose, knob-nosed', 829, 148, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (65, N'Stévina', N'Long-tailed jaeger', 605, 67, N'IA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (66, N'Léa', N'Campo flicker', 681, 198, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (67, N'Anaé', N'Marten, american', 628, 113, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (68, N'Kallisté', N'Crab, sally lightfoot', 778, 10, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (69, N'Adèle', N'Greater flamingo', 972, 144, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (70, N'Lauréna', N'Corella, long-billed', 171, 31, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (71, N'Gaëlle', N'Tortoise, indian star', 346, 49, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (72, N'Séréna', N'Greater blue-eared starling', 461, 93, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (73, N'Laurélie', N'Gemsbok', 874, 194, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (74, N'Mahélie', N'White-necked stork', 88, 53, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (75, N'Marie-josée', N'Wallaby, bennett''s', 108, 27, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (76, N'Ruì', N'Sunbird, lesser double-collared', 568, 74, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (77, N'Ráo', N'Malabar squirrel', 498, 170, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (78, N'Eléa', N'Tapir, brazilian', 750, 198, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (79, N'Yóu', N'Genoveva', 76, 125, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (80, N'Félicie', N'Snowy owl', 704, 111, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (81, N'Personnalisée', N'Greater flamingo', 817, 170, N'KY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (82, N'Loïs', N'Kangaroo, black-faced', 173, 80, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (83, N'Estée', N'Squirrel, eastern fox', 894, 52, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (84, N'Angélique', N'Squirrel, eastern fox', 778, 51, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (85, N'Yóu', N'Gecko, bent-toed', 41, 78, N'NM')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (86, N'Clélia', N'Hartebeest, coke''s', 851, 138, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (87, N'Audréanne', N'Squirrel, golden-mantled ground', 99, 181, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (88, N'Aurélie', N'Black-crowned night heron', 744, 122, N'KY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (89, N'Andrée', N'Heron, green', 264, 17, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (90, N'Pò', N'Black-tailed deer', 91, 5, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (91, N'Stévina', N'Beaver, eurasian', 168, 32, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (92, N'Naéva', N'Tarantula', 967, 117, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (93, N'Clélia', N'Pelican, australian', 185, 102, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (94, N'Danièle', N'Kangaroo, red', 910, 158, N'SC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (95, N'Annotée', N'Eagle, golden', 816, 18, N'OR')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (96, N'Clémentine', N'Shark, blue', 207, 52, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (97, N'Garçon', N'Grouse, greater sage', 766, 25, N'WA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (98, N'Maëlyss', N'Raccoon dog', 333, 96, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (99, N'Mårten', N'Lemur, lesser mouse', 912, 103, N'NV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (100, N'Françoise', N'Capuchin, brown', 183, 186, N'NM')
GO
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (101, N'Yè', N'Stork, yellow-billed', 992, 128, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (102, N'Cécile', N'Raccoon, crab-eating', 189, 68, N'WI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (103, N'Clélia', N'Denham''s bustard', 219, 102, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (104, N'Cloé', N'Spotted-tailed quoll', 462, 167, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (105, N'Styrbjörn', N'Fairy penguin', 56, 120, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (106, N'Bérénice', N'Crested screamer', 886, 7, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (107, N'Åsa', N'Blackish oystercatcher', 95, 5, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (108, N'Bécassine', N'Burrowing owl', 174, 162, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (109, N'Kù', N'White-eye, cape', 329, 56, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (110, N'Mylène', N'Dove, white-winged', 640, 190, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (111, N'Eléonore', N'Cat, tiger', 172, 8, N'ME')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (112, N'Léonie', N'Jaeger, long-tailed', 445, 17, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (113, N'Bénédicte', N'Wombat, common', 913, 86, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (114, N'Solène', N'Armadillo, common long-nosed', 570, 89, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (115, N'Kuí', N'Kiskadee, great', 759, 189, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (116, N'Eléonore', N'Australian brush turkey', 677, 161, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (117, N'Kévina', N'Civet cat', 597, 197, N'KS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (118, N'Mégane', N'Deer, barasingha', 125, 72, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (119, N'Edmée', N'Gulls (unidentified)', 128, 124, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (120, N'Yè', N'Kingfisher, malachite', 548, 98, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (121, N'Åslög', N'Snake, western patch-nosed', 86, 74, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (122, N'Pénélope', N'Squirrel, uinta ground', 962, 4, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (123, N'Angèle', N'Insect, stick', 339, 94, N'MT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (124, N'Lén', N'African polecat', 543, 195, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (125, N'Maëlys', N'Sociable weaver', 795, 16, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (126, N'Pål', N'Lemur, grey mouse', 95, 4, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (127, N'Garçon', N'American bison', 435, 171, N'AK')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (128, N'Illustrée', N'Squirrel glider', 457, 92, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (129, N'Táng', N'Kite, black', 29, 123, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (130, N'Östen', N'Arctic lemming', 557, 70, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (131, N'Gérald', N'Boat-billed heron', 367, 5, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (132, N'Lauréna', N'Squirrel, pine', 809, 166, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (133, N'Yè', N'Rhea, greater', 668, 134, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (134, N'Laurène', N'White-cheeked pintail', 774, 118, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (135, N'Andrée', N'Squirrel, pine', 869, 109, N'ND')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (136, N'André', N'Stork, painted', 31, 185, N'DE')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (137, N'Anaëlle', N'Cockatoo, red-tailed', 129, 79, N'OR')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (138, N'Torbjörn', N'Vulture, bengal', 570, 149, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (139, N'Lóng', N'Magellanic penguin', 454, 127, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (140, N'Clémence', N'Pallas''s fish eagle', 507, 5, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (141, N'Aloïs', N'Chameleon (unidentified)', 425, 80, N'IA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (142, N'Agnès', N'Pelican, australian', 291, 87, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (143, N'Mén', N'White-faced tree rat', 796, 51, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (144, N'Marlène', N'Laughing kookaburra', 603, 58, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (145, N'Yáo', N'Striped hyena', 79, 19, N'KY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (146, N'Laurène', N'Ring-tailed possum', 540, 37, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (147, N'Nuó', N'Bear, sloth', 227, 137, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (148, N'Loïca', N'Black spider monkey', 812, 125, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (149, N'Gaïa', N'Brown capuchin', 615, 151, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (150, N'Dù', N'White-throated robin', 846, 199, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (151, N'Illustrée', N'Stilt, black-winged', 920, 121, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (152, N'Maïté', N'Mountain duck', 195, 161, N'NE')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (153, N'Jú', N'Nile crocodile', 667, 76, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (154, N'Célestine', N'Kangaroo, jungle', 5, 143, N'KY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (155, N'Börje', N'African snake (unidentified)', 614, 69, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (156, N'Sélène', N'Feathertail glider', 918, 94, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (157, N'Mélinda', N'Eagle, tawny', 582, 124, N'ND')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (158, N'Rébecca', N'Cottonmouth', 445, 85, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (159, N'Publicité', N'Eastern grey kangaroo', 11, 104, N'MD')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (160, N'Adélaïde', N'Yellow-bellied marmot', 887, 118, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (161, N'Maïté', N'Otter, canadian river', 27, 169, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (162, N'Méthode', N'Flamingo, chilean', 430, 153, N'NH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (163, N'Zoé', N'Beaver, north american', 996, 72, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (164, N'Célia', N'Tayra', 215, 97, N'OK')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (165, N'Méthode', N'Gaur', 934, 184, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (166, N'Lóng', N'Burchell''s gonolek', 274, 197, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (167, N'Salomé', N'Little grebe', 470, 49, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (168, N'Méghane', N'Black-cheeked waxbill', 98, 144, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (169, N'Gösta', N'Sun gazer', 552, 187, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (170, N'Gaétane', N'Caracara (unidentified)', 229, 192, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (171, N'Josée', N'Peccary, collared', 888, 108, N'MA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (172, N'Séverine', N'Rock dove', 204, 195, N'MA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (173, N'Andrée', N'Reedbuck, bohor', 449, 183, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (174, N'Mà', N'Teal, hottentot', 207, 33, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (175, N'Mà', N'Rhesus monkey', 703, 193, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (176, N'Åsa', N'Long-necked turtle', 878, 179, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (177, N'Méryl', N'Golden-mantled ground squirrel', 288, 107, N'OK')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (178, N'Daphnée', N'Roan antelope', 460, 86, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (179, N'Léana', N'Trumpeter, dark-winged', 33, 195, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (180, N'Mélys', N'Grouse, greater sage', 526, 122, N'HI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (181, N'Clémence', N'Black-capped chickadee', 653, 131, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (182, N'Daphnée', N'Paca', 94, 46, N'WA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (183, N'Alizée', N'Goose, snow', 814, 120, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (184, N'Marie-ève', N'Stork, european', 465, 135, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (185, N'Torbjörn', N'Yellow-headed caracara', 229, 29, N'NM')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (186, N'Wá', N'Steller''s sea lion', 478, 109, N'MA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (187, N'Solène', N'Great egret', 810, 179, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (188, N'Mélys', N'Crab, red lava', 271, 84, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (189, N'Yè', N'Cape cobra', 649, 9, N'IA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (190, N'Mahélie', N'Bird (unidentified)', 819, 184, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (191, N'Göran', N'Hartebeest, coke''s', 90, 150, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (192, N'Clémence', N'Squirrel, richardson''s ground', 797, 45, N'NJ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (193, N'Cléopatre', N'Ring-tailed possum', 681, 138, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (194, N'Maëlla', N'Musk ox', 785, 126, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (195, N'Laurène', N'Brazilian otter', 547, 32, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (196, N'Maëly', N'Rat, desert kangaroo', 273, 144, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (197, N'Táng', N'Stilt, black-winged', 201, 102, N'CT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (198, N'Réjane', N'American black bear', 900, 162, N'NM')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (199, N'Torbjörn', N'Mongoose, banded', 478, 191, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (200, N'Valérie', N'Pintail, white-cheeked', 317, 199, N'OK')
GO
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (201, N'Michèle', N'Dog, black-tailed prairie', 558, 39, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (202, N'Réjane', N'White-faced whistling duck', 436, 36, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (203, N'Naëlle', N'Black spider monkey', 547, 131, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (204, N'Maéna', N'Malachite kingfisher', 765, 58, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (205, N'Naëlle', N'Stork, greater adjutant', 668, 0, N'NJ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (206, N'Maëlys', N'Booby, blue-footed', 78, 72, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (207, N'Anaëlle', N'Swan, black', 125, 55, N'NV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (208, N'Clémentine', N'Heron, black-crowned night', 295, 128, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (209, N'Danièle', N'Wild boar', 764, 198, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (210, N'Aimée', N'Baboon, gelada', 599, 68, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (211, N'Lén', N'Tinamou, elegant crested', 90, 75, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (212, N'Stévina', N'Dragon, frilled', 841, 58, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (213, N'Estée', N'Gemsbok', 595, 142, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (214, N'Annotés', N'Blackbuck', 819, 133, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (215, N'Régine', N'Saddle-billed stork', 377, 3, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (216, N'Andréanne', N'Dove, little brown', 979, 20, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (217, N'Renée', N'Common genet', 369, 6, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (218, N'Léandre', N'South American sea lion', 64, 119, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (219, N'André', N'Meerkat', 875, 78, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (220, N'Lucrèce', N'White-throated robin', 425, 105, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (221, N'Naëlle', N'Squirrel, malabar', 732, 148, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (222, N'Loïc', N'Miner''s cat', 570, 179, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (223, N'Angélique', N'Burchell''s gonolek', 861, 73, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (224, N'Léana', N'Arctic lemming', 879, 103, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (225, N'Léonie', N'Common eland', 144, 62, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (226, N'Mégane', N'Crab, red lava', 188, 108, N'NV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (227, N'Gösta', N'European stork', 273, 31, N'WA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (228, N'Wá', N'Camel, dromedary', 448, 73, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (229, N'Naëlle', N'Otter, brazilian', 831, 162, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (230, N'Magdalène', N'Greater sage grouse', 666, 4, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (231, N'Zoé', N'Eastern indigo snake', 831, 22, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (232, N'Clémence', N'Deer, roe', 203, 5, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (233, N'Hélène', N'Mynah, common', 460, 37, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (234, N'Inès', N'Spotted deer', 996, 67, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (235, N'Bérangère', N'North American porcupine', 420, 77, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (236, N'Alizée', N'Indian jackal', 220, 0, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (237, N'Océane', N'Ornate rock dragon', 515, 57, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (238, N'Hélèna', N'Red lava crab', 497, 139, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (239, N'Amélie', N'Red-legged pademelon', 55, 96, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (240, N'Léonie', N'Sun gazer', 932, 65, N'MS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (241, N'Annotés', N'Comb duck', 593, 192, N'WI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (242, N'Maïlis', N'Knob-nosed goose', 280, 184, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (243, N'Publicité', N'Bleeding heart monkey', 176, 152, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (244, N'Valérie', N'Ring-tailed coatimundi', 769, 154, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (245, N'Cécile', N'Heron, goliath', 735, 134, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (246, N'Léandre', N'Water moccasin', 323, 112, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (247, N'Maëlle', N'Common seal', 737, 135, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (248, N'Salomé', N'Vulture, lappet-faced', 171, 31, N'IA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (249, N'Åslög', N'Turkey, common', 915, 77, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (250, N'Séverine', N'Northern phalarope', 811, 44, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (251, N'Annotés', N'Arboral spiny rat', 257, 128, N'OK')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (252, N'Aí', N'Owl, madagascar hawk', 951, 11, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (253, N'Adélie', N'Malagasy ground boa', 578, 72, N'CT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (254, N'Jú', N'Coot, red-knobbed', 528, 89, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (255, N'Pò', N'Legaan, Monitor (unidentified)', 404, 134, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (256, N'Estée', N'Spotted deer', 801, 36, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (257, N'Pélagie', N'Blue shark', 431, 23, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (258, N'Mélinda', N'Starling, superb', 800, 61, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (259, N'Dorothée', N'Duck, comb', 742, 200, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (260, N'Yú', N'Common green iguana', 689, 129, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (261, N'Marylène', N'Quail, gambel''s', 548, 14, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (262, N'Méline', N'Vulture, king', 916, 10, N'CT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (263, N'Anaëlle', N'Giant heron', 759, 137, N'NM')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (264, N'Yáo', N'Sage grouse', 935, 93, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (265, N'Noëlla', N'Woodcock, american', 636, 47, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (266, N'Dà', N'Mountain goat', 304, 27, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (267, N'Eloïse', N'Lion, steller sea', 876, 160, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (268, N'Anaïs', N'White stork', 76, 185, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (269, N'Adélaïde', N'Field flicker', 460, 13, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (270, N'Lèi', N'Albatross, galapagos', 76, 93, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (271, N'Anaé', N'African red-eyed bulbul', 445, 156, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (272, N'Zoé', N'Hanuman langur', 790, 173, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (273, N'Méghane', N'Bat, madagascar fruit', 97, 75, N'CT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (274, N'Bérénice', N'Emerald green tree boa', 105, 150, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (275, N'Vérane', N'Cape clawless otter', 196, 88, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (276, N'Marlène', N'White-cheeked pintail', 355, 86, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (277, N'Tán', N'Dingo', 727, 189, N'WV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (278, N'Cléopatre', N'Grison', 455, 40, N'SC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (279, N'Béatrice', N'Greater roadrunner', 945, 53, N'HI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (280, N'Alizée', N'Wambenger, red-tailed', 288, 171, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (281, N'Loïca', N'Grey mouse lemur', 194, 88, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (282, N'Publicité', N'Arctic ground squirrel', 345, 104, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (283, N'Personnalisée', N'Lion, south american sea', 391, 103, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (284, N'Yénora', N'Giant girdled lizard', 490, 158, N'KS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (285, N'Réservés', N'King cormorant', 898, 169, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (286, N'Célestine', N'European beaver', 115, 179, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (287, N'Crééz', N'American woodcock', 268, 5, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (288, N'Ráo', N'Caracara, yellow-headed', 159, 125, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (289, N'Lauréna', N'Woylie', 570, 61, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (290, N'Irène', N'Duck, white-faced whistling', 170, 114, N'IA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (291, N'Clélia', N'Mouse, four-striped grass', 473, 9, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (292, N'Ophélie', N'White-necked raven', 901, 168, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (293, N'Salomé', N'Dragon, frilled', 527, 28, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (294, N'Sòng', N'Racer snake', 951, 31, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (295, N'Mélissandre', N'Mongoose, javan gold-spotted', 372, 173, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (296, N'Léa', N'Flamingo, lesser', 198, 146, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (297, N'Maëlla', N'Gull, silver', 192, 170, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (298, N'Laurène', N'North American porcupine', 937, 76, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (299, N'Marylène', N'Woylie', 590, 189, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (300, N'Personnalisée', N'Black-capped capuchin', 45, 115, N'MO')
GO
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (301, N'Adélie', N'Hawk, red-tailed', 390, 126, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (302, N'Maëlla', N'White-lipped peccary', 175, 94, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (303, N'Cinéma', N'Shrike, crimson-breasted', 9, 187, N'ND')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (304, N'Maëlys', N'Legaan, water', 243, 150, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (305, N'Cléopatre', N'Pale-throated three-toed sloth', 776, 154, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (306, N'Pål', N'Yellow-billed hornbill', 309, 176, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (307, N'Hélèna', N'Cape starling', 369, 27, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (308, N'Régine', N'Greater sage grouse', 462, 17, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (309, N'Gérald', N'Elephant, african', 354, 144, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (310, N'Marylène', N'Kingfisher, pied', 85, 172, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (311, N'Pénélope', N'Stork, black-necked', 464, 147, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (312, N'Ophélie', N'Vicuna', 36, 57, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (313, N'Maïlis', N'Little brown bat', 971, 144, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (314, N'Anaïs', N'Potoroo', 273, 15, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (315, N'Marie-ève', N'Swamp deer', 54, 150, N'KS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (316, N'Véronique', N'Coatimundi, white-nosed', 873, 15, N'NV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (317, N'Liè', N'Brazilian otter', 540, 98, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (318, N'Andréanne', N'Badger, american', 88, 138, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (319, N'Desirée', N'Langur, hanuman', 849, 163, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (320, N'Bécassine', N'Finch, common melba', 529, 62, N'MD')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (321, N'Andréa', N'Wallaby, whip-tailed', 745, 107, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (322, N'Marlène', N'Bush dog', 858, 7, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (323, N'Océane', N'Stork, white', 514, 42, N'OK')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (324, N'Magdalène', N'Currasow (unidentified)', 612, 168, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (325, N'Bérengère', N'Civet cat', 516, 156, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (326, N'Océanne', N'Gull, southern black-backed', 456, 64, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (327, N'Publicité', N'Small-spotted genet', 934, 171, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (328, N'Danièle', N'Seal, common', 74, 9, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (329, N'Gisèle', N'Red phalarope', 518, 82, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (330, N'Clémentine', N'Fowl, helmeted guinea', 810, 114, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (331, N'Publicité', N'Australian sea lion', 226, 165, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (332, N'Östen', N'Crab, red lava', 922, 145, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (333, N'Gösta', N'Cottonmouth', 587, 62, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (334, N'Mélinda', N'Goose, snow', 412, 37, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (335, N'Dorothée', N'Lory, rainbow', 821, 181, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (336, N'Anaïs', N'Lynx, african', 936, 191, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (337, N'Mélys', N'White-eye, pale', 754, 198, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (338, N'Alizée', N'Woodpecker, red-headed', 395, 47, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (339, N'Ruì', N'Plover, blacksmith', 44, 13, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (340, N'Réservés', N'Mouse, four-striped grass', 895, 40, N'WA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (341, N'Lén', N'Sifaka, verreaux''s', 48, 184, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (342, N'Bérénice', N'Turtle, snake-necked', 530, 124, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (343, N'Hélène', N'Gull, kelp', 745, 123, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (344, N'Céline', N'Defassa waterbuck', 665, 180, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (345, N'Fèi', N'Otter, brazilian', 821, 113, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (346, N'Maëly', N'Least chipmunk', 315, 97, N'MS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (347, N'André', N'Woodpecker, downy', 299, 49, N'WV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (348, N'Torbjörn', N'Jaguarundi', 895, 188, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (349, N'Kuí', N'Worm snake (unidentified)', 160, 127, N'CT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (350, N'Séverine', N'Yellow-crowned night heron', 680, 163, N'MS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (351, N'Béatrice', N'Black and white colobus', 601, 65, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (352, N'Estève', N'Hyena, striped', 669, 165, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (353, N'Marylène', N'Eagle, long-crested hawk', 411, 24, N'WA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (354, N'Åke', N'Helmeted guinea fowl', 857, 21, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (355, N'Eloïse', N'Eastern grey kangaroo', 831, 194, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (356, N'Agnès', N'Common boubou shrike', 507, 107, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (357, N'Märta', N'Vulture, white-headed', 160, 121, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (358, N'Daphnée', N'Sugar glider', 858, 35, N'NM')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (359, N'Edmée', N'Red lava crab', 280, 7, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (360, N'Nélie', N'Heron, boat-billed', 907, 52, N'KY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (361, N'Clémentine', N'Australian spiny anteater', 805, 99, N'UT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (362, N'Véronique', N'Pocket gopher (unidentified)', 410, 49, N'SC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (363, N'Eléa', N'Swan, black', 349, 65, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (364, N'Maïlis', N'Red-breasted cockatoo', 109, 102, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (365, N'Joséphine', N'Yellow-rumped siskin', 70, 170, N'IA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (366, N'Marlène', N'Worm snake (unidentified)', 531, 28, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (367, N'Clémentine', N'Black kite', 989, 145, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (368, N'Lén', N'Land iguana', 286, 94, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (369, N'Mélanie', N'Red-legged pademelon', 976, 79, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (370, N'Méghane', N'Long-finned pilot whale', 67, 42, N'KY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (371, N'Bérénice', N'Wild boar', 435, 64, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (372, N'Loïca', N'Possum, western pygmy', 470, 16, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (373, N'Rébecca', N'Tern, white-winged', 435, 66, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (374, N'Cloé', N'Kelp gull', 650, 191, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (375, N'Rachèle', N'Lesser double-collared sunbird', 280, 75, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (376, N'Pò', N'Lion, african', 351, 167, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (377, N'Léone', N'Indian porcupine', 555, 161, N'KY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (378, N'Cécile', N'Kangaroo, red', 843, 101, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (379, N'Andrée', N'Camel, dromedary', 214, 150, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (380, N'Mélia', N'Nutcracker, clark''s', 761, 89, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (381, N'Pål', N'Little brown dove', 484, 97, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (382, N'Marie-thérèse', N'Glossy ibis', 803, 62, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (383, N'Ruì', N'Wolf, mexican', 116, 4, N'CT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (384, N'Björn', N'Pied kingfisher', 790, 192, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (385, N'Michèle', N'Albatross, galapagos', 18, 78, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (386, N'Zhì', N'Vulture, king', 390, 15, N'OR')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (387, N'Françoise', N'Great skua', 8, 125, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (388, N'Méthode', N'Blue-breasted cordon bleu', 187, 152, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (389, N'Rébecca', N'Green vine snake', 830, 2, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (390, N'Clémence', N'Australian magpie', 632, 156, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (391, N'Aí', N'Blue peacock', 766, 117, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (392, N'Göran', N'Arboral spiny rat', 189, 66, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (393, N'Wá', N'Lily trotter', 546, 109, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (394, N'Edmée', N'Black-backed jackal', 715, 80, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (395, N'Publicité', N'Blacksmith plover', 735, 156, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (396, N'Méthode', N'Bahama pintail', 997, 83, N'NJ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (397, N'Almérinda', N'White-lipped peccary', 843, 83, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (398, N'Mahélie', N'Capybara', 667, 28, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (399, N'Uò', N'Siskin, yellow-rumped', 849, 33, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (400, N'Salomé', N'Red and blue macaw', 613, 153, N'TN')
GO
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (401, N'Gérald', N'Egyptian goose', 245, 6, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (402, N'Maëlyss', N'Red-necked phalarope', 476, 5, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (403, N'Sélène', N'King cormorant', 348, 83, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (404, N'Réservés', N'Beaver, american', 395, 141, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (405, N'Danièle', N'Vulture, king', 77, 70, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (406, N'Mylène', N'Dove, ring', 51, 52, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (407, N'Åslög', N'Whale, southern right', 214, 66, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (408, N'Magdalène', N'Cape clawless otter', 895, 118, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (409, N'Mélina', N'North American beaver', 328, 6, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (410, N'Mårten', N'Bulbul, black-eyed', 345, 38, N'MD')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (411, N'Marie-françoise', N'Owl, madagascar hawk', 367, 79, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (412, N'Amélie', N'Fox, asian red', 721, 95, N'NJ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (413, N'Athéna', N'Blue catfish', 199, 31, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (414, N'Laïla', N'Western palm tanager (unidentified)', 535, 38, N'WI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (415, N'Maïlys', N'Tenrec, tailless', 593, 109, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (416, N'Jú', N'Galapagos hawk', 394, 46, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (417, N'Maëlann', N'Tortoise, desert', 300, 72, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (418, N'Noémie', N'Eleven-banded armadillo (unidentified)', 120, 153, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (419, N'Solène', N'Ibis, puna', 841, 107, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (420, N'Laïla', N'Vulture, black', 82, 143, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (421, N'Mén', N'Red-billed toucan', 257, 109, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (422, N'Loïc', N'Barbet, crested', 931, 146, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (423, N'Adélaïde', N'Raccoon, common', 82, 178, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (424, N'Simplifiés', N'Racer, american', 607, 7, N'OR')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (425, N'Maïté', N'Coke''s hartebeest', 444, 136, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (426, N'Gérald', N'Penguin, fairy', 827, 77, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (427, N'Marie-noël', N'Kite, black', 717, 48, N'IA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (428, N'Léandre', N'Loris, slender', 668, 94, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (429, N'Styrbjörn', N'Crab-eating fox', 228, 129, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (430, N'Personnalisée', N'Hornbill, southern ground', 329, 178, N'SC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (431, N'Réjane', N'Squirrel, smith''s bush', 330, 163, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (432, N'Angèle', N'Red lava crab', 930, 74, N'OK')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (433, N'Simplifiés', N'Snake, green vine', 806, 156, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (434, N'Zhì', N'Chestnut weaver', 183, 85, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (435, N'Régine', N'Grouse, sage', 574, 13, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (436, N'Gérald', N'Puffin, horned', 517, 82, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (437, N'Léonie', N'Crocodile, nile', 988, 4, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (438, N'Judicaël', N'Mexican beaded lizard', 663, 171, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (439, N'Kuí', N'Stork, white-necked', 344, 134, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (440, N'Eloïse', N'Worm snake (unidentified)', 952, 155, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (441, N'Maëlyss', N'Bat, little brown', 226, 42, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (442, N'Thérèsa', N'Yellow-bellied marmot', 531, 109, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (443, N'Zoé', N'Saddle-billed stork', 675, 192, N'KS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (444, N'Valérie', N'Lemming, arctic', 588, 119, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (445, N'Géraldine', N'Boa, columbian rainbow', 786, 188, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (446, N'Céline', N'Hartebeest, coke''s', 63, 106, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (447, N'Lén', N'Baboon, savanna', 352, 131, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (448, N'Miléna', N'Galapagos mockingbird', 741, 19, N'NE')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (449, N'Kévina', N'Spotted-tailed quoll', 549, 0, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (450, N'Marylène', N'Hare, arctic', 932, 95, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (451, N'Cléa', N'Monkey, red howler', 807, 33, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (452, N'Loïc', N'Sloth, pale-throated three-toed', 722, 198, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (453, N'Yáo', N'Eastern boa constrictor', 698, 97, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (454, N'Sòng', N'Coqui partridge', 417, 122, N'WI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (455, N'Athéna', N'Marmot, hoary', 716, 174, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (456, N'Aí', N'Hawk, red-tailed', 372, 74, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (457, N'Annotés', N'Skua, long-tailed', 497, 71, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (458, N'Athéna', N'Kingfisher, malachite', 850, 137, N'MS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (459, N'Yénora', N'Finch, common melba', 351, 74, N'IA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (460, N'Maëlann', N'Spectacled caiman', 220, 181, N'NV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (461, N'Amélie', N'Elephant, african', 928, 41, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (462, N'Torbjörn', N'Plover, three-banded', 351, 144, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (463, N'Lèi', N'Squirrel, antelope ground', 207, 138, N'MT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (464, N'Illustrée', N'Common seal', 719, 132, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (465, N'Illustrée', N'Ferret, black-footed', 572, 174, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (466, N'Thérèsa', N'Racer, american', 653, 55, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (467, N'Edmée', N'Glider, feathertail', 594, 139, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (468, N'Hélèna', N'Rat, desert kangaroo', 416, 103, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (469, N'Marie-hélène', N'Egret, great', 786, 106, N'WA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (470, N'Noëlla', N'Royal tern', 800, 15, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (471, N'Océane', N'Beaver, american', 476, 72, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (472, N'Dù', N'Glossy starling (unidentified)', 560, 6, N'KS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (473, N'Mélanie', N'Whip-tailed wallaby', 48, 193, N'NJ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (474, N'Märta', N'Dog, raccoon', 688, 126, N'OK')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (475, N'Solène', N'Egyptian vulture', 224, 97, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (476, N'Crééz', N'Snake, western patch-nosed', 697, 106, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (477, N'Angélique', N'Yellow-billed stork', 187, 4, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (478, N'Mà', N'Curve-billed thrasher', 507, 100, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (479, N'Séréna', N'Goat, mountain', 130, 156, N'WI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (480, N'Esbjörn', N'Black-winged stilt', 995, 1, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (481, N'Jú', N'Horned rattlesnake', 566, 189, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (482, N'Gisèle', N'Red-legged pademelon', 324, 200, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (483, N'Marlène', N'Coqui partridge', 29, 112, N'UT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (484, N'Faîtes', N'Kangaroo, brush-tailed rat', 937, 152, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (485, N'Maïly', N'Wallaby, bennett''s', 941, 61, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (486, N'Mårten', N'Crab, sally lightfoot', 614, 159, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (487, N'Sélène', N'Galapagos mockingbird', 478, 10, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (488, N'Mélia', N'Hummingbird (unidentified)', 232, 41, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (489, N'Laurène', N'Crested barbet', 419, 107, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (490, N'Solène', N'Pie, indian tree', 599, 143, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (491, N'Agnès', N'Lark, horned', 251, 83, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (492, N'Mylène', N'Masked booby', 539, 184, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (493, N'Anaïs', N'Tinamou, elegant crested', 683, 48, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (494, N'Anaïs', N'Harbor seal', 353, 11, N'CT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (495, N'Méryl', N'Four-striped grass mouse', 968, 95, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (496, N'Frédérique', N'Gecko, ring-tailed', 961, 181, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (497, N'Desirée', N'American alligator', 368, 29, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (498, N'Eléonore', N'Armadillo, nine-banded', 16, 194, N'IA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (499, N'Annotés', N'Bunting, crested', 944, 143, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (501, N'Märta', N'Squirrel, nelson ground', 157, 113, N'IL')
GO
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (502, N'Geneviève', N'Galapagos dove', 43, 123, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (503, N'Kévina', N'European spoonbill', 294, 18, N'OR')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (504, N'Tú', N'Hawk, ferruginous', 655, 112, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (505, N'Maïwenn', N'African wild dog', 566, 6, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (506, N'Åsa', N'Cardinal, red-capped', 264, 112, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (507, N'Simplifiés', N'Lily trotter', 669, 18, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (508, N'Réservés', N'Arctic lemming', 229, 118, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (509, N'Mélinda', N'Dassie', 314, 117, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (510, N'Chloé', N'Turaco, violet-crested', 376, 192, N'NM')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (511, N'Vérane', N'Meerkat, red', 238, 54, N'OK')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (512, N'Laïla', N'Crow, american', 687, 47, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (513, N'Mélodie', N'Ground monitor (unidentified)', 662, 87, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (514, N'Médiamass', N'Pied butcher bird', 642, 156, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (515, N'Félicie', N'Owl, burrowing', 367, 199, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (516, N'Thérèsa', N'Silver gull', 476, 124, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (517, N'Vérane', N'Secretary bird', 350, 148, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (518, N'Lén', N'Dama wallaby', 839, 33, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (519, N'Esbjörn', N'Rufous-collared sparrow', 313, 56, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (520, N'Simplifiés', N'Toucan, white-throated', 491, 111, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (521, N'Félicie', N'African black crake', 616, 174, N'MS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (522, N'Gwenaëlle', N'Dassie', 355, 56, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (523, N'Noëlla', N'Frogmouth, tawny', 802, 52, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (524, N'Pål', N'Black-capped chickadee', 750, 176, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (525, N'Cécilia', N'Impala', 504, 146, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (526, N'Björn', N'Mississippi alligator', 582, 159, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (527, N'Lyséa', N'Kaffir cat', 179, 149, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (528, N'Eléonore', N'Pygmy possum', 687, 179, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (529, N'Clélia', N'Golden eagle', 649, 127, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (530, N'Fèi', N'Pale-throated three-toed sloth', 833, 79, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (531, N'Annotés', N'Amazon parrot (unidentified)', 400, 91, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (532, N'Régine', N'Black spider monkey', 597, 94, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (533, N'Kévina', N'Savanna fox', 635, 65, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (534, N'Märta', N'Common raccoon', 400, 5, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (535, N'Léonie', N'Shelduck, european', 271, 25, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (536, N'Léone', N'Bent-toed gecko', 290, 193, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (537, N'Cinéma', N'Falcon, prairie', 674, 84, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (538, N'Marie-thérèse', N'Sheep, red', 529, 152, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (539, N'Görel', N'Rabbit, eastern cottontail', 286, 11, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (540, N'Célia', N'Cat, african wild', 30, 27, N'AK')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (541, N'Mélina', N'Crow, house', 305, 52, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (542, N'Mylène', N'Madagascar fruit bat', 985, 64, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (543, N'Mélina', N'Plover, three-banded', 430, 10, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (544, N'Solène', N'Sandgrouse, yellow-throated', 349, 77, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (545, N'Angélique', N'Glossy starling (unidentified)', 163, 187, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (546, N'Régine', N'Pygmy possum', 930, 143, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (547, N'Lóng', N'Gonolek, burchell''s', 979, 87, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (548, N'Stévina', N'Otter, giant', 626, 52, N'MT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (549, N'Aimée', N'Boa, columbian rainbow', 475, 61, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (550, N'Yáo', N'Common dolphin', 868, 59, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (551, N'Bérengère', N'Gull, lava', 28, 187, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (552, N'Annotés', N'Potoroo', 880, 136, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (553, N'Personnalisée', N'Small Indian mongoose', 474, 132, N'KY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (554, N'Aloïs', N'Hoary marmot', 124, 56, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (555, N'Maïwenn', N'Leopard, indian', 892, 11, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (556, N'Céline', N'Grey phalarope', 355, 70, N'MS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (557, N'Tán', N'Hippopotamus', 530, 98, N'HI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (558, N'Anaël', N'Eastern quoll', 610, 129, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (559, N'Maëlla', N'Tortoise, burmese brown mountain', 611, 25, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (560, N'Lucrèce', N'Wallaby, whip-tailed', 802, 107, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (561, N'Cécilia', N'Mouflon', 197, 105, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (562, N'Maïwenn', N'Butterfly (unidentified)', 811, 11, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (563, N'Cunégonde', N'Mountain goat', 439, 54, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (564, N'Kallisté', N'Bird, magnificent frigate', 6, 169, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (565, N'Frédérique', N'Lemur, grey mouse', 307, 168, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (566, N'Zoé', N'Sea birds (unidentified)', 408, 180, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (567, N'Uò', N'Giant armadillo', 399, 157, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (568, N'Rébecca', N'Viper, egyptian', 256, 24, N'NJ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (569, N'Cléa', N'Gull, pacific', 993, 151, N'CT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (570, N'Mårten', N'Palm squirrel', 194, 183, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (571, N'Torbjörn', N'Hyena, brown', 341, 129, N'WI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (572, N'Mélodie', N'Lemur, ring-tailed', 819, 122, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (573, N'Clémentine', N'Brazilian tapir', 250, 155, N'OK')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (574, N'Marie-thérèse', N'Waterbuck, defassa', 405, 17, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (575, N'Liè', N'North American river otter', 427, 43, N'MA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (576, N'Lài', N'Lory, rainbow', 19, 127, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (577, N'Océane', N'Booby, blue-faced', 273, 20, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (578, N'Adélaïde', N'Bushpig', 688, 42, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (579, N'Miléna', N'Fox, cape', 939, 20, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (580, N'Miléna', N'Shrike, southern white-crowned', 749, 114, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (581, N'Frédérique', N'Francolin, swainson''s', 972, 64, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (582, N'Gösta', N'African polecat', 845, 41, N'OK')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (583, N'Irène', N'Coyote', 580, 37, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (584, N'Rébecca', N'Common zebra', 963, 50, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (585, N'Mén', N'Brocket, red', 971, 39, N'OK')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (586, N'Lén', N'Red howler monkey', 370, 193, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (587, N'Marie-noël', N'White-lipped peccary', 375, 150, N'NM')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (588, N'Gisèle', N'Savannah deer (unidentified)', 671, 165, N'SD')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (589, N'Néhémie', N'Sungazer, yellow-brown', 327, 1, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (590, N'Stéphanie', N'Scottish highland cow', 615, 135, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (591, N'Réservés', N'Coke''s hartebeest', 551, 170, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (592, N'Cécile', N'Civet, small-toothed palm', 462, 125, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (593, N'Gaïa', N'Bulbul, african red-eyed', 199, 181, N'DE')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (594, N'Daphnée', N'Tern, royal', 312, 124, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (595, N'Yáo', N'Bare-faced go away bird', 755, 68, N'WV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (596, N'Océanne', N'Black-tailed tree creeper', 229, 95, N'MD')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (597, N'Stéphanie', N'Duck, blue', 804, 48, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (598, N'Anaïs', N'Cuis', 40, 182, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (599, N'Chloé', N'Bird, red-billed tropic', 923, 77, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (600, N'Faîtes', N'Turtle, long-necked', 931, 122, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (601, N'Kévina', N'African lynx', 265, 199, N'TX')
GO
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (602, N'Bérénice', N'Yak', 818, 151, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (603, N'Måns', N'Catfish, blue', 850, 73, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (604, N'Maëlle', N'Fox, asian red', 816, 87, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (605, N'Personnalisée', N'Heron, boat-billed', 717, 57, N'AK')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (606, N'Valérie', N'Ring-tailed possum', 899, 174, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (607, N'Cloé', N'Brocket, red', 82, 85, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (608, N'Adélie', N'Lilac-breasted roller', 793, 195, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (609, N'Märta', N'Superb starling', 931, 134, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (610, N'Séréna', N'White-necked raven', 24, 200, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (611, N'Zhì', N'Deer, white-tailed', 407, 127, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (612, N'Léa', N'Hanuman langur', 204, 115, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (613, N'Personnalisée', N'Sportive lemur', 444, 31, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (614, N'Ruò', N'Crab (unidentified)', 144, 142, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (615, N'Yóu', N'Campo flicker', 348, 125, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (616, N'Maëlyss', N'Robin, kalahari scrub', 110, 43, N'NJ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (617, N'Stéphanie', N'Wild boar', 289, 186, N'SC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (618, N'Adèle', N'Woylie', 700, 48, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (619, N'Kuí', N'Bontebok', 110, 112, N'OR')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (620, N'Maëlyss', N'Egyptian goose', 125, 181, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (621, N'Örjan', N'Lilac-breasted roller', 918, 200, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (622, N'Maïwenn', N'Wolf, mexican', 174, 35, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (623, N'Océanne', N'Red meerkat', 522, 30, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (624, N'Ruò', N'Nyala', 553, 11, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (625, N'Hélène', N'Pronghorn', 85, 100, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (626, N'Clémentine', N'Waterbuck, common', 648, 153, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (627, N'Loïca', N'Gazelle, thomson''s', 369, 172, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (628, N'Kù', N'Flicker, campo', 265, 139, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (629, N'Mélina', N'Slender loris', 472, 100, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (630, N'Ráo', N'Hottentot teal', 382, 115, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (631, N'Ophélie', N'Crown of thorns starfish', 973, 29, N'KS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (632, N'Josée', N'Quail, gambel''s', 186, 132, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (633, N'Crééz', N'Jackal, silver-backed', 827, 53, N'HI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (634, N'Andréanne', N'Bear, polar', 193, 128, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (635, N'Lèi', N'Long-tailed skua', 923, 128, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (636, N'Laïla', N'Hottentot teal', 732, 187, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (637, N'Eléonore', N'Dog, bush', 546, 153, N'WA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (638, N'Mélina', N'Squirrel, eurasian red', 908, 46, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (639, N'Eléa', N'Chacma baboon', 701, 162, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (640, N'Bérengère', N'Banded mongoose', 305, 34, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (641, N'Chloé', N'Woodpecker, red-headed', 341, 9, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (642, N'Réservés', N'Cat, ringtail', 377, 179, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (643, N'Illustrée', N'Sparrow, rufous-collared', 824, 66, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (644, N'Léa', N'Flicker, campo', 899, 99, N'SC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (645, N'Léonore', N'Deer, red', 497, 196, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (646, N'Aí', N'Kingfisher, pied', 335, 86, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (647, N'Félicie', N'White-tailed deer', 9, 1, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (648, N'Andréa', N'Kaffir cat', 747, 61, N'NE')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (649, N'Mélina', N'Black bear', 225, 55, N'WA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (650, N'Françoise', N'Painted stork', 951, 126, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (651, N'Béatrice', N'Gila monster', 24, 145, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (652, N'Bénédicte', N'Civet cat', 981, 180, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (653, N'Noémie', N'Kingfisher, malachite', 248, 189, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (654, N'Célia', N'Brown and yellow marshbird', 934, 55, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (655, N'Maïlys', N'Lava gull', 931, 11, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (656, N'Ruì', N'Australian brush turkey', 336, 91, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (657, N'Zhì', N'Indian jackal', 782, 199, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (658, N'Joséphine', N'Dove, laughing', 11, 52, N'KS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (659, N'Fèi', N'White stork', 890, 176, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (660, N'Yénora', N'Wolf, timber', 144, 75, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (661, N'Inès', N'Nilgai', 982, 39, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (662, N'Yáo', N'Gull, silver', 618, 41, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (663, N'Alizée', N'Starling, red-shouldered glossy', 802, 51, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (664, N'Léone', N'Gull, kelp', 999, 83, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (665, N'Esbjörn', N'Eurasian beaver', 827, 144, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (666, N'Mélinda', N'Loris, slender', 357, 141, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (667, N'Dù', N'Brazilian otter', 440, 154, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (668, N'Örjan', N'Red-billed tropic bird', 977, 142, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (669, N'Fèi', N'Egyptian vulture', 470, 175, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (670, N'Yè', N'Amazon parrot (unidentified)', 728, 62, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (671, N'Michèle', N'Genet, common', 143, 76, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (672, N'Nuó', N'Peccary, collared', 924, 134, N'HI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (673, N'Alizée', N'Southern hairy-nosed wombat', 664, 31, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (674, N'Hélène', N'Egyptian goose', 92, 123, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (675, N'Yénora', N'Blackbird, red-winged', 191, 104, N'NJ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (676, N'Tán', N'Pallas''s fish eagle', 482, 128, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (677, N'Thérèse', N'Grouse, greater sage', 123, 38, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (678, N'Réjane', N'Grison', 654, 174, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (679, N'Lauréna', N'Galapagos mockingbird', 201, 72, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (680, N'Cléopatre', N'Wallaby, red-necked', 56, 147, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (681, N'Géraldine', N'Eastern box turtle', 765, 157, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (682, N'Andréanne', N'Lesser masked weaver', 359, 46, N'KY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (683, N'Östen', N'Crane, stanley', 935, 145, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (684, N'Camélia', N'Hen, sage', 27, 82, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (685, N'Kallisté', N'Beaver, eurasian', 383, 142, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (686, N'Noëlla', N'Horned rattlesnake', 142, 139, N'OR')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (687, N'Océane', N'Sandgrouse, yellow-throated', 586, 35, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (688, N'Aurélie', N'Monkey, rhesus', 273, 1, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (689, N'Dorothée', N'Laughing kookaburra', 961, 61, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (690, N'Réservés', N'Vulture, king', 382, 177, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (691, N'Frédérique', N'Porcupine, north american', 369, 198, N'KY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (692, N'Marylène', N'Dragon, ornate rock', 667, 29, N'MS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (693, N'Ruì', N'Sulfur-crested cockatoo', 410, 157, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (694, N'Régine', N'White-throated toucan', 249, 161, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (695, N'Danièle', N'Black-necked stork', 790, 81, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (696, N'Yóu', N'Crowned hawk-eagle', 417, 159, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (697, N'Céline', N'Wild water buffalo', 628, 128, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (698, N'Léa', N'Langur, gray', 964, 128, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (699, N'Mylène', N'Cormorant (unidentified)', 177, 159, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (700, N'Andréanne', N'Lizard (unidentified)', 511, 7, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (701, N'Léandre', N'Hippopotamus', 772, 88, N'OH')
GO
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (702, N'Mélanie', N'Brush-tailed phascogale', 187, 165, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (703, N'Gaëlle', N'Mourning collared dove', 527, 97, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (704, N'Táng', N'Wombat, southern hairy-nosed', 561, 22, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (705, N'Yóu', N'Roan antelope', 904, 120, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (706, N'Loïca', N'Common zebra', 966, 33, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (707, N'Maïté', N'Bateleur eagle', 983, 35, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (708, N'Pélagie', N'Crab-eating fox', 840, 137, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (709, N'Clémentine', N'Turkey, wild', 750, 80, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (710, N'Sélène', N'Ostrich', 780, 87, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (711, N'Léonie', N'Great cormorant', 96, 71, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (712, N'Mà', N'Crested barbet', 656, 60, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (713, N'Naëlle', N'Curlew, black', 321, 121, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (714, N'Åke', N'Skua, great', 155, 101, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (715, N'Réservés', N'Hawk, red-tailed', 256, 17, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (716, N'Fèi', N'Fox, asian red', 516, 121, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (717, N'Marie-josée', N'Lion, galapagos sea', 343, 102, N'NM')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (718, N'Méryl', N'Wagtail, african pied', 319, 87, N'KY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (719, N'Åke', N'Bird, black-throated butcher', 868, 91, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (720, N'Océane', N'Snow goose', 638, 76, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (721, N'Mégane', N'Blacksmith plover', 605, 56, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (722, N'Styrbjörn', N'Nighthawk, common', 298, 69, N'CT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (723, N'Maïlys', N'Topi', 907, 96, N'SD')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (724, N'Maïlis', N'Chital', 599, 33, N'AR')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (725, N'Eugénie', N'Tapir, brazilian', 648, 191, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (726, N'Maïlis', N'Pale-throated three-toed sloth', 237, 48, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (727, N'Bérénice', N'Arctic fox', 122, 118, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (728, N'Håkan', N'Canada goose', 5, 188, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (729, N'Audréanne', N'Common melba finch', 604, 96, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (730, N'Judicaël', N'Indian giant squirrel', 680, 56, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (731, N'Dafnée', N'Snowy egret', 410, 99, N'AR')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (732, N'Méline', N'Leopard, indian', 29, 193, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (733, N'Bécassine', N'Cape clawless otter', 700, 70, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (734, N'Séverine', N'Pig-tailed macaque', 17, 124, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (735, N'Dafnée', N'Monitor, two-banded', 92, 139, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (736, N'Eléa', N'Heron, green', 97, 79, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (737, N'André', N'Monkey, rhesus', 870, 166, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (738, N'Réjane', N'Wombat, southern hairy-nosed', 669, 200, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (739, N'Mylène', N'Blue crane', 625, 176, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (740, N'Personnalisée', N'Thomson''s gazelle', 907, 104, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (741, N'Dù', N'Grey lourie', 613, 77, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (742, N'Eléa', N'Jungle kangaroo', 760, 156, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (743, N'Faîtes', N'Dragon, frilled', 492, 109, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (744, N'Esbjörn', N'Squirrel, arctic ground', 375, 56, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (745, N'Illustrée', N'Flicker, campo', 242, 180, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (746, N'Irène', N'Crane, stanley', 85, 95, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (747, N'Inès', N'Trumpeter, green-winged', 755, 136, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (748, N'Naéva', N'Serval', 249, 62, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (749, N'Gaétane', N'Cat, tiger', 674, 121, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (750, N'Loïc', N'Woolly-necked stork', 524, 149, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (751, N'Ruò', N'Nutcracker, clark''s', 99, 43, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (752, N'Tú', N'Grey heron', 277, 59, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (753, N'Dafnée', N'Bahama pintail', 707, 169, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (754, N'Ruò', N'Malagasy ground boa', 539, 88, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (755, N'Andréa', N'Deer, mule', 106, 91, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (756, N'Félicie', N'Hottentot teal', 73, 193, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (757, N'Thérèse', N'Gila monster', 520, 47, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (758, N'Réservés', N'Kalahari scrub robin', 717, 181, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (759, N'Adélaïde', N'Indian peacock', 20, 191, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (760, N'Maëlann', N'Gulls (unidentified)', 90, 9, N'NM')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (761, N'Adèle', N'Snake, eastern indigo', 651, 180, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (762, N'Valérie', N'White-mantled colobus', 906, 141, N'WA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (763, N'Crééz', N'Gecko, ring-tailed', 552, 97, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (764, N'Séverine', N'Ringtail, common', 844, 186, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (765, N'Méline', N'Heron, green-backed', 986, 117, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (766, N'Esbjörn', N'Lizard, collared', 722, 170, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (767, N'Athéna', N'Nilgai', 100, 161, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (768, N'Edmée', N'Magpie, black-backed', 228, 137, N'WV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (769, N'Marie-hélène', N'Pine snake (unidentified)', 903, 174, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (770, N'Gisèle', N'Swainson''s francolin', 227, 191, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (771, N'Geneviève', N'Cattle egret', 414, 89, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (772, N'Clélia', N'Common wolf', 654, 64, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (773, N'Pélagie', N'American marten', 781, 30, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (774, N'Loïca', N'Two-banded monitor', 450, 95, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (775, N'Måns', N'Great white pelican', 427, 172, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (776, N'Séverine', N'Legaan, water', 491, 101, N'KY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (777, N'Anaëlle', N'Gull, silver', 178, 65, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (778, N'Mélia', N'North American river otter', 964, 46, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (779, N'Maïly', N'Blue catfish', 825, 173, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (780, N'Cléa', N'Ground monitor (unidentified)', 7, 103, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (781, N'Stéphanie', N'Green-winged macaw', 770, 36, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (782, N'Clémentine', N'Flamingo, roseat', 366, 135, N'KS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (783, N'Publicité', N'Turtle, long-necked', 652, 107, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (784, N'Néhémie', N'Paradoxure', 129, 92, N'NV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (785, N'Yóu', N'Striped hyena', 7, 17, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (786, N'Léonore', N'Springbok', 963, 93, N'OR')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (787, N'Hélène', N'Red-tailed phascogale', 834, 30, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (788, N'Lyséa', N'Kingfisher, white-throated', 849, 0, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (789, N'Stéphanie', N'Puffin, horned', 440, 134, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (790, N'Amélie', N'Monitor, water', 670, 133, N'MS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (791, N'Nuó', N'Long-tailed skua', 766, 38, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (792, N'Mélinda', N'Jaguar', 884, 161, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (793, N'Méng', N'Colobus, black and white', 527, 177, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (794, N'Bérénice', N'Mynah, common', 980, 91, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (795, N'Estée', N'Crake, african black', 701, 149, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (796, N'Tán', N'Western lowland gorilla', 525, 153, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (797, N'Almérinda', N'Rattlesnake, dusky', 718, 84, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (798, N'Renée', N'Goose, greylag', 323, 75, N'MS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (799, N'Léandre', N'Indian porcupine', 823, 0, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (800, N'Pò', N'Golden-mantled ground squirrel', 185, 185, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (801, N'Gaïa', N'White-throated toucan', 516, 107, N'OH')
GO
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (802, N'Publicité', N'Hyena, striped', 257, 46, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (803, N'Méng', N'Hanuman langur', 325, 7, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (804, N'Marie-ève', N'Groundhog', 759, 46, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (805, N'Mélodie', N'American bighorn sheep', 871, 53, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (806, N'Daphnée', N'Spurfowl, yellow-necked', 640, 82, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (807, N'Mélina', N'Gaur', 97, 117, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (808, N'Styrbjörn', N'Antelope, four-horned', 149, 167, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (809, N'Amélie', N'Kangaroo, western grey', 215, 194, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (810, N'Maï', N'Snake-necked turtle', 1, 173, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (811, N'Estève', N'Fox, savanna', 79, 134, N'MS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (812, N'Valérie', N'Eagle, african fish', 110, 164, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (813, N'Séverine', N'Squirrel, uinta ground', 988, 101, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (814, N'Judicaël', N'Chimpanzee', 768, 21, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (815, N'Marie-thérèse', N'Clark''s nutcracker', 120, 184, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (816, N'Eliès', N'Neotropic cormorant', 765, 75, N'ID')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (817, N'Björn', N'Lizard, collared', 584, 47, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (818, N'Liè', N'Monitor, white-throated', 366, 136, N'IA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (819, N'Garçon', N'Iguana, common green', 562, 88, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (820, N'Börje', N'South American puma', 106, 16, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (821, N'Agnès', N'California sea lion', 614, 86, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (822, N'Nuó', N'Common wallaroo', 995, 47, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (823, N'Eléonore', N'South African hedgehog', 700, 59, N'WV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (824, N'Cécilia', N'Bird, bare-faced go away', 634, 171, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (825, N'Laïla', N'Plover, blacksmith', 120, 172, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (826, N'Uò', N'Blue-faced booby', 438, 117, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (827, N'Méline', N'Hudsonian godwit', 287, 66, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (828, N'Clémence', N'Gecko (unidentified)', 158, 61, N'SC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (829, N'Nuó', N'Goose, egyptian', 283, 59, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (830, N'Maëline', N'Egret, snowy', 666, 193, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (831, N'Maïly', N'Bird, pied butcher', 360, 82, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (832, N'Laurène', N'Squirrel, antelope ground', 563, 154, N'CT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (833, N'Adélie', N'Great kiskadee', 577, 147, N'WV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (834, N'Séréna', N'Eastern grey kangaroo', 896, 38, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (835, N'Yáo', N'Kiskadee, great', 884, 92, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (836, N'Mélina', N'Wallaby, red-necked', 724, 128, N'MD')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (837, N'Marie-josée', N'African polecat', 850, 18, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (838, N'Dorothée', N'Gazelle, thomson''s', 805, 168, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (839, N'Kuí', N'Pigeon, feral rock', 893, 54, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (840, N'Örjan', N'Puma', 155, 131, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (841, N'Stéphanie', N'Oriental white-backed vulture', 74, 14, N'WI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (842, N'Hélèna', N'Kelp gull', 846, 28, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (843, N'Noémie', N'Western lowland gorilla', 390, 32, N'NV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (844, N'Eloïse', N'Sally lightfoot crab', 793, 62, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (845, N'Réjane', N'Greater rhea', 768, 161, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (846, N'Anaëlle', N'Red-capped cardinal', 238, 58, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (847, N'Bérengère', N'American crow', 25, 7, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (848, N'Nélie', N'Constrictor, eastern boa', 537, 179, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (849, N'Liè', N'White-nosed coatimundi', 720, 31, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (850, N'Mélanie', N'Seal, southern elephant', 113, 71, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (851, N'Ráo', N'Large-eared bushbaby', 690, 83, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (852, N'Vérane', N'Galapagos dove', 79, 55, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (853, N'Géraldine', N'Mongoose, eastern dwarf', 666, 170, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (854, N'Françoise', N'Stilt, black-winged', 825, 114, N'ND')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (855, N'Cunégonde', N'Oystercatcher, blackish', 543, 41, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (856, N'Yè', N'Hyena, brown', 532, 93, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (857, N'Ruì', N'Lion, australian sea', 105, 40, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (858, N'Méghane', N'Bear, grizzly', 553, 172, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (859, N'Mà', N'Trumpeter swan', 865, 101, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (860, N'Marlène', N'Richardson''s ground squirrel', 705, 197, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (861, N'Aloïs', N'Paddy heron (unidentified)', 424, 31, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (862, N'Clélia', N'Flicker, field', 888, 198, N'KY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (863, N'Maï', N'Parrot, hawk-headed', 54, 24, N'MD')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (864, N'Publicité', N'Raccoon, common', 9, 60, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (865, N'Yú', N'Red-legged pademelon', 998, 81, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (866, N'Cléa', N'Common waterbuck', 591, 104, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (867, N'Daphnée', N'Herring gull', 137, 186, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (868, N'Gösta', N'Bison, american', 944, 18, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (869, N'Aloïs', N'Purple moorhen', 870, 99, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (870, N'Laurène', N'Penguin, magellanic', 596, 9, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (871, N'Inès', N'Square-lipped rhinoceros', 901, 81, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (872, N'Réservés', N'Eagle owl (unidentified)', 293, 139, N'SC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (873, N'Léane', N'Fat-tailed dunnart', 588, 152, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (874, N'Andréanne', N'White-lipped peccary', 695, 107, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (875, N'Stévina', N'Tsessebe', 125, 106, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (876, N'Annotée', N'Black-backed magpie', 569, 172, N'MD')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (877, N'Lén', N'Australian pelican', 62, 155, N'CT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (878, N'Yú', N'Squirrel, pine', 332, 36, N'MD')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (879, N'Océane', N'Buffalo, wild water', 437, 94, N'MA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (880, N'Björn', N'Common duiker', 658, 113, N'KY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (881, N'Märta', N'Lemming, collared', 140, 101, N'LA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (882, N'Erwéi', N'Cape Barren goose', 398, 56, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (883, N'Méng', N'Dolphin, striped', 294, 157, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (884, N'Göran', N'Cat, native', 601, 34, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (885, N'Maëlyss', N'Indian tree pie', 654, 96, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (886, N'Marie-thérèse', N'Pelican, great white', 900, 159, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (887, N'Björn', N'Northern fur seal', 271, 125, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (888, N'Léa', N'Waved albatross', 934, 95, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (889, N'Léana', N'Macaque, pig-tailed', 553, 190, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (890, N'Cunégonde', N'Brocket, red', 946, 73, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (891, N'Andréa', N'Common waterbuck', 2, 57, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (892, N'Méline', N'Hoopoe, eurasian', 868, 112, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (893, N'Solène', N'Malleefowl', 187, 25, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (894, N'Dù', N'Yellow-headed caracara', 129, 140, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (895, N'Maëlann', N'Jabiru stork', 445, 31, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (896, N'Néhémie', N'Godwit, hudsonian', 864, 24, N'WA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (897, N'Cléa', N'Honey badger', 282, 113, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (898, N'Estée', N'Huron', 140, 147, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (899, N'Stévina', N'Otter, north american river', 81, 122, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (900, N'Wá', N'Eagle, white-bellied sea', 433, 22, N'IA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (901, N'Judicaël', N'Gray duiker', 296, 167, N'GA')
GO
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (902, N'Cécilia', N'Oryx, fringe-eared', 785, 54, N'MD')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (903, N'Esbjörn', N'Yellow-crowned night heron', 579, 97, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (904, N'Eugénie', N'Griffon vulture', 78, 114, N'OR')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (905, N'Eugénie', N'Sockeye salmon', 941, 46, N'MI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (906, N'Mélissandre', N'Least chipmunk', 489, 77, N'OK')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (907, N'Cléopatre', N'Nelson ground squirrel', 651, 84, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (908, N'Publicité', N'Emerald green tree boa', 684, 157, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (909, N'Miléna', N'Turtle, eastern box', 764, 132, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (910, N'Léonie', N'Puku', 951, 18, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (911, N'Mélissandre', N'Red sheep', 510, 182, N'AZ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (912, N'Estée', N'Cattle egret', 25, 70, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (913, N'Léone', N'Gelada baboon', 874, 162, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (914, N'Åslög', N'Tenrec, tailless', 411, 68, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (915, N'Maï', N'Jabiru stork', 423, 6, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (916, N'Bérengère', N'Mourning collared dove', 418, 48, N'WA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (917, N'Åslög', N'Cormorant, javanese', 259, 76, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (918, N'Zoé', N'Possum, western pygmy', 702, 194, N'MA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (919, N'Mahélie', N'Barbet, crested', 878, 62, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (920, N'Bérangère', N'Asian red fox', 708, 192, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (921, N'Lyséa', N'American badger', 568, 11, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (922, N'Kallisté', N'Southern hairy-nosed wombat', 835, 60, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (923, N'Maïly', N'Pied butcher bird', 404, 17, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (924, N'Maëline', N'Blue-faced booby', 570, 111, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (925, N'Björn', N'Dusky rattlesnake', 9, 163, N'UT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (926, N'Göran', N'Water monitor', 186, 24, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (927, N'Jú', N'Common wolf', 749, 52, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (928, N'Anaëlle', N'Mountain goat', 182, 4, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (929, N'Irène', N'Antelope, sable', 777, 159, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (930, N'Alizée', N'Eastern cottontail rabbit', 94, 155, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (931, N'Marie-hélène', N'Boa, emerald green tree', 514, 18, N'MD')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (932, N'Méthode', N'Reedbuck, bohor', 374, 2, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (933, N'Athéna', N'Goose, spur-winged', 235, 127, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (934, N'Aloïs', N'Spotted deer', 264, 152, N'NC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (935, N'Mélodie', N'Whale, baleen', 959, 106, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (936, N'Cloé', N'Ass, asiatic wild', 126, 53, N'NE')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (937, N'Géraldine', N'Sungazer, yellow-brown', 448, 116, N'NY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (938, N'Mélina', N'Long-nosed bandicoot', 11, 107, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (939, N'Dù', N'Monitor, two-banded', 394, 94, N'KS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (940, N'Cécilia', N'Trumpeter, green-winged', 15, 104, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (941, N'Solène', N'Eastern cottontail rabbit', 755, 40, N'MS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (942, N'Rébecca', N'Dove, ring', 980, 52, N'NJ')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (943, N'Mélinda', N'Southern hairy-nosed wombat', 516, 117, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (944, N'Josée', N'Red brocket', 265, 151, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (945, N'Nuó', N'Sandpiper, spotted wood', 186, 45, N'GA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (946, N'Andrée', N'Lizard, blue-tongued', 339, 178, N'MD')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (947, N'Maïly', N'Common zorro', 582, 22, N'IL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (948, N'Marie-noël', N'Quail, gambel''s', 775, 34, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (949, N'Loïc', N'Devil, tasmanian', 702, 179, N'MA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (950, N'Annotée', N'Caracara, yellow-headed', 15, 57, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (951, N'Léana', N'Pine squirrel', 866, 119, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (952, N'Åsa', N'Southern boubou', 751, 87, N'WV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (953, N'Maïly', N'Square-lipped rhinoceros', 802, 105, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (954, N'Marie-ève', N'Black-tailed deer', 241, 189, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (955, N'Daphnée', N'Common melba finch', 561, 174, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (956, N'Magdalène', N'Owl, white-browed', 770, 152, N'MA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (957, N'Annotés', N'Toucan, red-billed', 689, 20, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (958, N'Léana', N'Mule deer', 669, 61, N'CO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (959, N'Lauréna', N'Sloth, two-toed tree', 681, 141, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (960, N'Maëlann', N'Buffalo, american', 280, 60, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (961, N'Naéva', N'Yellow-throated sandgrouse', 501, 47, N'AL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (962, N'Pénélope', N'Agama lizard (unidentified)', 161, 177, N'WA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (963, N'Méthode', N'European shelduck', 928, 93, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (964, N'Styrbjörn', N'Large-eared bushbaby', 74, 50, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (965, N'Réservés', N'Common ringtail', 755, 175, N'KY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (966, N'Estée', N'Hoary marmot', 839, 50, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (967, N'Åsa', N'Red-tailed cockatoo', 255, 58, N'MD')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (968, N'Tán', N'Four-horned antelope', 663, 138, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (969, N'Maëlle', N'Margay', 91, 64, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (970, N'Mà', N'Viper, egyptian', 936, 116, N'RI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (971, N'Bécassine', N'Potoroo', 271, 188, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (972, N'Marie-noël', N'Lion, california sea', 253, 142, N'DC')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (973, N'Joséphine', N'Pig-tailed macaque', 875, 143, N'MN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (974, N'Séréna', N'Moose', 109, 7, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (975, N'Mélodie', N'Peccary, collared', 333, 186, N'MO')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (976, N'Françoise', N'Whip-tailed wallaby', 142, 186, N'SD')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (977, N'Eléa', N'Racer, american', 611, 187, N'WI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (978, N'Fèi', N'European red squirrel', 753, 64, N'NM')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (979, N'Vénus', N'Arctic fox', 656, 185, N'OH')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (980, N'Cécile', N'Fox, north american red', 855, 18, N'HI')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (981, N'Göran', N'European badger', 872, 145, N'PA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (982, N'Françoise', N'Hyena, brown', 253, 170, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (983, N'Cléopatre', N'Blue-faced booby', 329, 87, N'VT')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (984, N'Maëlyss', N'Coke''s hartebeest', 834, 19, N'KS')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (985, N'Annotée', N'Arctic tern', 341, 14, N'WV')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (986, N'Sòng', N'Sloth, hoffman''s', 638, 110, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (987, N'Clémentine', N'Bulbul, black-fronted', 172, 171, N'FL')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (988, N'Erwéi', N'White-tailed jackrabbit', 975, 124, N'OK')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (989, N'Jú', N'Capuchin, black-capped', 298, 84, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (990, N'Léa', N'Kinkajou', 893, 136, N'CA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (991, N'Uò', N'Andean goose', 508, 25, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (992, N'Méryl', N'Sheep, stone', 584, 41, N'VA')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (993, N'Åke', N'Desert kangaroo rat', 905, 174, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (994, N'Sòng', N'Falcon, peregrine', 862, 22, N'NM')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (995, N'Mélanie', N'Eagle, white-bellied sea', 329, 51, N'KY')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (996, N'Bérangère', N'Chimpanzee', 504, 16, N'TN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (997, N'Anaïs', N'Common zebra', 622, 167, N'IN')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (998, N'Maëly', N'Horned puffin', 631, 81, N'DE')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (999, N'Léonore', N'Kirk''s dik dik', 332, 172, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (1000, N'Daphnée', N'Four-spotted skimmer', 784, 181, N'TX')
INSERT [dbo].[Monsters] ([id], [Name], [Type], [HP], [MP], [Location]) VALUES (500, N'Fèi', N'Great horned owl', 512, 58, N'PA')
GO
/****** Object:  StoredProcedure [dbo].[spSelectFromView]    Script Date: 11/20/2022 5:08:02 PM ******/
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
         Begin Table = "Monsters"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 2
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Chart1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Chart1'
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
         Begin Table = "Monsters"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 2
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Chart2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Chart2'
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
         Begin Table = "Monsters"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Chart3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Chart3'
GO
