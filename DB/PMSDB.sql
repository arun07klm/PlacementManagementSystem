USE [PMSDB]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlacementAllocation', @level2type=N'COLUMN',@level2name=N'PlacementStatus'
GO
ALTER TABLE [dbo].[Students] DROP CONSTRAINT [FK_Students_Users]
GO
ALTER TABLE [dbo].[Students] DROP CONSTRAINT [FK_Students_Department]
GO
ALTER TABLE [dbo].[Students] DROP CONSTRAINT [FK_Students_AcademicDetails]
GO
ALTER TABLE [dbo].[PlacementDrive] DROP CONSTRAINT [FK_PlacementDrive_Companies]
GO
ALTER TABLE [dbo].[PlacementDrive] DROP CONSTRAINT [FK_PlacementDrive_College]
GO
ALTER TABLE [dbo].[PlacementAllocation] DROP CONSTRAINT [FK_PlacementAllocation_Students]
GO
ALTER TABLE [dbo].[PlacementAllocation] DROP CONSTRAINT [FK_PlacementAllocation_PlacementDrive]
GO
ALTER TABLE [dbo].[PlacementAllocation] DROP CONSTRAINT [FK_PlacementAllocation_Comments]
GO
ALTER TABLE [dbo].[Department] DROP CONSTRAINT [FK_Department_College]
GO
ALTER TABLE [dbo].[Companies] DROP CONSTRAINT [FK_Companies_Users]
GO
ALTER TABLE [dbo].[College] DROP CONSTRAINT [FK_College_Users]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/15/2023 12:01:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 6/15/2023 12:01:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
DROP TABLE [dbo].[Students]
GO
/****** Object:  Table [dbo].[PlacementDrive]    Script Date: 6/15/2023 12:01:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PlacementDrive]') AND type in (N'U'))
DROP TABLE [dbo].[PlacementDrive]
GO
/****** Object:  Table [dbo].[PlacementAllocation]    Script Date: 6/15/2023 12:01:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PlacementAllocation]') AND type in (N'U'))
DROP TABLE [dbo].[PlacementAllocation]
GO
/****** Object:  Table [dbo].[Mail]    Script Date: 6/15/2023 12:01:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mail]') AND type in (N'U'))
DROP TABLE [dbo].[Mail]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 6/15/2023 12:01:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
DROP TABLE [dbo].[Department]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 6/15/2023 12:01:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Companies]') AND type in (N'U'))
DROP TABLE [dbo].[Companies]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/15/2023 12:01:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comments]') AND type in (N'U'))
DROP TABLE [dbo].[Comments]
GO
/****** Object:  Table [dbo].[College]    Script Date: 6/15/2023 12:01:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[College]') AND type in (N'U'))
DROP TABLE [dbo].[College]
GO
/****** Object:  Table [dbo].[AcademicDetails]    Script Date: 6/15/2023 12:01:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AcademicDetails]') AND type in (N'U'))
DROP TABLE [dbo].[AcademicDetails]
GO
/****** Object:  Table [dbo].[AcademicDetails]    Script Date: 6/15/2023 12:01:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicDetails](
	[AcademicDetailID] [int] IDENTITY(1,1) NOT NULL,
	[Percentage10th] [int] NOT NULL,
	[Pass_out_year_10th] [datetime] NOT NULL,
	[School_10th] [nvarchar](50) NOT NULL,
	[Percentage_12th] [int] NULL,
	[Pass_out_year_12th] [datetime] NULL,
	[School_12th] [nvarchar](50) NULL,
	[Degree_percentage] [int] NULL,
	[Pass_out_year_Degree] [datetime] NULL,
	[College_degree] [nvarchar](50) NULL,
	[PG_percentage] [int] NULL,
	[Pass_out_year_PG] [datetime] NULL,
	[college_pg] [nvarchar](50) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_AcademicDetails] PRIMARY KEY CLUSTERED 
(
	[AcademicDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[College]    Script Date: 6/15/2023 12:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[College](
	[CollegeID] [int] IDENTITY(1,1) NOT NULL,
	[CollegeName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[Location] [nvarchar](50) NULL,
	[UserID] [int] NOT NULL,
	[CreatedOn] [date] NOT NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_College] PRIMARY KEY CLUSTERED 
(
	[CollegeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/15/2023 12:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[CommentForOrg] [nvarchar](500) NOT NULL,
	[CommentForStudent] [nvarchar](500) NOT NULL,
	[CreatedOn] [date] NOT NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 6/15/2023 12:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Branches] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Website] [nvarchar](50) NOT NULL,
	[contact_no] [nvarchar](50) NOT NULL,
	[emailID] [nvarchar](50) NOT NULL,
	[CreatedOn] [date] NOT NULL,
	[Remarks] [nvarchar](50) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 6/15/2023 12:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[CollegeID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedOn] [date] NOT NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mail]    Script Date: 6/15/2023 12:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mail](
	[Mail_id] [nvarchar](50) NOT NULL,
	[to_id] [nvarchar](50) NULL,
	[from_id] [nvarchar](50) NULL,
	[Subject] [nvarchar](50) NULL,
	[Message] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[Flag] [nvarchar](50) NULL,
 CONSTRAINT [PK_Mail] PRIMARY KEY CLUSTERED 
(
	[Mail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlacementAllocation]    Script Date: 6/15/2023 12:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlacementAllocation](
	[PlacementAllocationID] [int] IDENTITY(1,1) NOT NULL,
	[PlacementDriveID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[CommentID] [int] NULL,
	[Rating] [nvarchar](50) NULL,
	[PlacementStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_JobApplications] PRIMARY KEY CLUSTERED 
(
	[PlacementAllocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlacementDrive]    Script Date: 6/15/2023 12:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlacementDrive](
	[PlacementDriveID] [int] IDENTITY(1,1) NOT NULL,
	[CollegeID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[InterviewDate] [date] NOT NULL,
	[NoOfVacancies] [int] NOT NULL,
	[Package] [nvarchar](50) NULL,
	[Place] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Details] [nvarchar](500) NOT NULL,
	[CreatedOn] [date] NOT NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_InterviewDetails] PRIMARY KEY CLUSTERED 
(
	[PlacementDriveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 6/15/2023 12:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[RegisterNo] [nvarchar](10) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](10) NULL,
	[DOB] [datetime] NULL,
	[MobileNo] [nvarchar](50) NULL,
	[EmailID] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[District] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Pin] [numeric](18, 0) NULL,
	[NameOfGuardian] [nvarchar](50) NULL,
	[Occupation] [nvarchar](50) NULL,
	[MaritalStatus] [nvarchar](20) NULL,
	[Mothertongue] [nvarchar](50) NULL,
	[UserID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[AcademicDetailID] [int] NULL,
	[AcademicYear] [nvarchar](30) NULL,
	[Remarks] [nvarchar](50) NULL,
	[CreatedOn] [date] NOT NULL,
	[Hobbies] [nvarchar](50) NULL,
	[Skills] [nvarchar](50) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Students_1] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/15/2023 12:01:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Usertype] [tinyint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[College] ON 

INSERT [dbo].[College] ([CollegeID], [CollegeName], [Address], [Location], [UserID], [CreatedOn], [Status]) VALUES (9, N'CET', N'CET', N'Trivandrum', 2, CAST(N'2023-05-19' AS Date), 1)
INSERT [dbo].[College] ([CollegeID], [CollegeName], [Address], [Location], [UserID], [CreatedOn], [Status]) VALUES (10, N'New College', N'Add', N'Kollam', 6, CAST(N'2023-05-19' AS Date), 1)
INSERT [dbo].[College] ([CollegeID], [CollegeName], [Address], [Location], [UserID], [CreatedOn], [Status]) VALUES (11, N'Samp', N'sam', N'Kollam', 7, CAST(N'2023-05-19' AS Date), 2)
SET IDENTITY_INSERT [dbo].[College] OFF
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([CompanyID], [UserID], [Name], [Branches], [Location], [Address], [Website], [contact_no], [emailID], [CreatedOn], [Remarks], [Status]) VALUES (1, 8, N'HRB', NULL, N'Trivandrum', N'HRB, TVM', N'hrblock.com', N'256666', N'abc@hrblock.com', CAST(N'2023-01-01' AS Date), NULL, 1)
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentID], [CollegeID], [Name], [Description], [CreatedOn], [Status]) VALUES (1, 10, N'Electrical', N'elec', CAST(N'2022-01-01' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[PlacementAllocation] ON 

INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (1, 4, 1, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[PlacementAllocation] OFF
GO
SET IDENTITY_INSERT [dbo].[PlacementDrive] ON 

INSERT [dbo].[PlacementDrive] ([PlacementDriveID], [CollegeID], [CompanyID], [InterviewDate], [NoOfVacancies], [Package], [Place], [Title], [Details], [CreatedOn], [Status]) VALUES (4, 10, 1, CAST(N'2023-01-01' AS Date), 20, N'50000-80000', N'Trivandrum', N'Placement drive in New college', N'details', CAST(N'2023-05-25' AS Date), 1)
SET IDENTITY_INSERT [dbo].[PlacementDrive] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentID], [RegisterNo], [Name], [Gender], [DOB], [MobileNo], [EmailID], [Address], [District], [State], [Pin], [NameOfGuardian], [Occupation], [MaritalStatus], [Mothertongue], [UserID], [DepartmentID], [AcademicDetailID], [AcademicYear], [Remarks], [CreatedOn], [Hobbies], [Skills], [Status]) VALUES (1, N'1234', N'Manu', N'M', CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'9888888888', N'sas@sadfas.cdaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, NULL, N'2022', NULL, CAST(N'2022-01-01' AS Date), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (1, N'Admin', N'Admin', 0, CAST(N'2023-05-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (2, N'CET', N'CET1', 2, CAST(N'2023-05-19T21:40:05.390' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (6, N'new', N'new', 2, CAST(N'2023-05-19T22:05:37.547' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (7, N'Samp', N'Samp', 2, CAST(N'2023-05-19T22:17:55.160' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (8, N'HRB', N'HRB', 3, CAST(N'2023-01-01T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[College]  WITH CHECK ADD  CONSTRAINT [FK_College_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[College] CHECK CONSTRAINT [FK_College_Users]
GO
ALTER TABLE [dbo].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Companies] CHECK CONSTRAINT [FK_Companies_Users]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_College] FOREIGN KEY([CollegeID])
REFERENCES [dbo].[College] ([CollegeID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_College]
GO
ALTER TABLE [dbo].[PlacementAllocation]  WITH CHECK ADD  CONSTRAINT [FK_PlacementAllocation_Comments] FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comments] ([CommentID])
GO
ALTER TABLE [dbo].[PlacementAllocation] CHECK CONSTRAINT [FK_PlacementAllocation_Comments]
GO
ALTER TABLE [dbo].[PlacementAllocation]  WITH CHECK ADD  CONSTRAINT [FK_PlacementAllocation_PlacementDrive] FOREIGN KEY([PlacementDriveID])
REFERENCES [dbo].[PlacementDrive] ([PlacementDriveID])
GO
ALTER TABLE [dbo].[PlacementAllocation] CHECK CONSTRAINT [FK_PlacementAllocation_PlacementDrive]
GO
ALTER TABLE [dbo].[PlacementAllocation]  WITH CHECK ADD  CONSTRAINT [FK_PlacementAllocation_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[PlacementAllocation] CHECK CONSTRAINT [FK_PlacementAllocation_Students]
GO
ALTER TABLE [dbo].[PlacementDrive]  WITH CHECK ADD  CONSTRAINT [FK_PlacementDrive_College] FOREIGN KEY([CollegeID])
REFERENCES [dbo].[College] ([CollegeID])
GO
ALTER TABLE [dbo].[PlacementDrive] CHECK CONSTRAINT [FK_PlacementDrive_College]
GO
ALTER TABLE [dbo].[PlacementDrive]  WITH CHECK ADD  CONSTRAINT [FK_PlacementDrive_Companies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Companies] ([CompanyID])
GO
ALTER TABLE [dbo].[PlacementDrive] CHECK CONSTRAINT [FK_PlacementDrive_Companies]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_AcademicDetails] FOREIGN KEY([AcademicDetailID])
REFERENCES [dbo].[AcademicDetails] ([AcademicDetailID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_AcademicDetails]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Department]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Users]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Scheduled, Passed , Failed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlacementAllocation', @level2type=N'COLUMN',@level2name=N'PlacementStatus'
GO
