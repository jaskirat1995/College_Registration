
/****** Object:  Table [dbo].[tblCourse]    Script Date: 04-11-2019 22:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStudentRecords]    Script Date: 04-11-2019 22:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudentRecords](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[FatherName] [nvarchar](50) NULL,
	[MotherName] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Pincode] [nvarchar](10) NULL,
	[CourseId] [int] NULL,
	[YearId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[LastUpdatedDate] [datetime] NULL,
	[Batch] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[EmailId] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblStudentRecords] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblYear]    Script Date: 04-11-2019 22:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblYear](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblYear] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCourse] ON 
GO
INSERT [dbo].[tblCourse] ([Id], [CourseName]) VALUES (1, N'Computer Science')
GO
INSERT [dbo].[tblCourse] ([Id], [CourseName]) VALUES (2, N'Mechanical')
GO
INSERT [dbo].[tblCourse] ([Id], [CourseName]) VALUES (3, N'Information Technology')
GO
INSERT [dbo].[tblCourse] ([Id], [CourseName]) VALUES (4, N'Chemical')
GO
INSERT [dbo].[tblCourse] ([Id], [CourseName]) VALUES (5, N'Biotech')
GO
INSERT [dbo].[tblCourse] ([Id], [CourseName]) VALUES (6, N'Electrical')
GO
INSERT [dbo].[tblCourse] ([Id], [CourseName]) VALUES (7, N'Electronics and Communication')
GO
SET IDENTITY_INSERT [dbo].[tblCourse] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStudentRecords] ON 
GO
INSERT [dbo].[tblStudentRecords] ([Id], [Name], [FatherName], [MotherName], [Address], [City], [State], [Pincode], [CourseId], [YearId], [CreatedDate], [LastUpdatedDate], [Batch], [PhoneNumber], [EmailId]) VALUES (1, N'Nishant sharma', N'Amit sharma', N'Renu Sharma', N'3 Laurel Sreet, Mount Albert, Auckland 1025, NEW ZEALAND', N'Auckland', N'Auckland', N'1025', 1, 1, CAST(N'2019-11-04T07:14:25.800' AS DateTime), CAST(N'2019-11-04T07:14:25.800' AS DateTime), N'2019-2022', N'9898989898', N'nishant@gmail.com')
GO
INSERT [dbo].[tblStudentRecords] ([Id], [Name], [FatherName], [MotherName], [Address], [City], [State], [Pincode], [CourseId], [YearId], [CreatedDate], [LastUpdatedDate], [Batch], [PhoneNumber], [EmailId]) VALUES (2, N'Paramjit Singh', N'Vikaram Singh', N'Gurpreet Kaur', N'3 Laurel Sreet, Mount Albert, Auckland 1025, NEW ZEALAND', N'Auckland', N'Auckland', N'1025', 3, 2, CAST(N'2019-11-04T07:50:21.553' AS DateTime), CAST(N'2019-11-04T16:57:38.213' AS DateTime), N'2019-2022', N'9876567888', N'Paramjit@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[tblStudentRecords] OFF
GO
SET IDENTITY_INSERT [dbo].[tblYear] ON 
GO
INSERT [dbo].[tblYear] ([Id], [Year]) VALUES (1, N'First')
GO
INSERT [dbo].[tblYear] ([Id], [Year]) VALUES (2, N'Second')
GO
INSERT [dbo].[tblYear] ([Id], [Year]) VALUES (3, N'Third')
GO
INSERT [dbo].[tblYear] ([Id], [Year]) VALUES (4, N'Fourth')
GO
SET IDENTITY_INSERT [dbo].[tblYear] OFF
GO
ALTER TABLE [dbo].[tblStudentRecords]  WITH CHECK ADD  CONSTRAINT [FK_tblStudentRecords_tblCourse] FOREIGN KEY([CourseId])
REFERENCES [dbo].[tblCourse] ([Id])
GO
ALTER TABLE [dbo].[tblStudentRecords] CHECK CONSTRAINT [FK_tblStudentRecords_tblCourse]
GO
ALTER TABLE [dbo].[tblStudentRecords]  WITH CHECK ADD  CONSTRAINT [FK_tblStudentRecords_tblYear] FOREIGN KEY([YearId])
REFERENCES [dbo].[tblYear] ([Id])
GO
ALTER TABLE [dbo].[tblStudentRecords] CHECK CONSTRAINT [FK_tblStudentRecords_tblYear]
GO
