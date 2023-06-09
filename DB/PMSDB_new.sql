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
/****** Object:  Table [dbo].[Users]    Script Date: 6/23/2023 4:09:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 6/23/2023 4:09:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
DROP TABLE [dbo].[Students]
GO
/****** Object:  Table [dbo].[PlacementDrive]    Script Date: 6/23/2023 4:09:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PlacementDrive]') AND type in (N'U'))
DROP TABLE [dbo].[PlacementDrive]
GO
/****** Object:  Table [dbo].[PlacementAllocation]    Script Date: 6/23/2023 4:09:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PlacementAllocation]') AND type in (N'U'))
DROP TABLE [dbo].[PlacementAllocation]
GO
/****** Object:  Table [dbo].[Mail]    Script Date: 6/23/2023 4:09:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mail]') AND type in (N'U'))
DROP TABLE [dbo].[Mail]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 6/23/2023 4:09:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
DROP TABLE [dbo].[Department]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 6/23/2023 4:09:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Companies]') AND type in (N'U'))
DROP TABLE [dbo].[Companies]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 6/23/2023 4:09:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comments]') AND type in (N'U'))
DROP TABLE [dbo].[Comments]
GO
/****** Object:  Table [dbo].[College]    Script Date: 6/23/2023 4:09:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[College]') AND type in (N'U'))
DROP TABLE [dbo].[College]
GO
/****** Object:  Table [dbo].[AcademicDetails]    Script Date: 6/23/2023 4:09:02 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AcademicDetails]') AND type in (N'U'))
DROP TABLE [dbo].[AcademicDetails]
GO
/****** Object:  Table [dbo].[AcademicDetails]    Script Date: 6/23/2023 4:09:02 PM ******/
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
/****** Object:  Table [dbo].[College]    Script Date: 6/23/2023 4:09:03 PM ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 6/23/2023 4:09:03 PM ******/
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
/****** Object:  Table [dbo].[Companies]    Script Date: 6/23/2023 4:09:03 PM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 6/23/2023 4:09:03 PM ******/
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
/****** Object:  Table [dbo].[Mail]    Script Date: 6/23/2023 4:09:03 PM ******/
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
/****** Object:  Table [dbo].[PlacementAllocation]    Script Date: 6/23/2023 4:09:03 PM ******/
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
/****** Object:  Table [dbo].[PlacementDrive]    Script Date: 6/23/2023 4:09:03 PM ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 6/23/2023 4:09:03 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 6/23/2023 4:09:03 PM ******/
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
INSERT [dbo].[College] ([CollegeID], [CollegeName], [Address], [Location], [UserID], [CreatedOn], [Status]) VALUES (10, N'New College', N'Add', N'Kollam', 6, CAST(N'2023-05-19' AS Date), 2)
INSERT [dbo].[College] ([CollegeID], [CollegeName], [Address], [Location], [UserID], [CreatedOn], [Status]) VALUES (11, N'Samp', N'sam', N'Kollam', 7, CAST(N'2023-05-19' AS Date), 2)
INSERT [dbo].[College] ([CollegeID], [CollegeName], [Address], [Location], [UserID], [CreatedOn], [Status]) VALUES (12, N'VIT', N'OMR', N'chennai', 14, CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[College] ([CollegeID], [CollegeName], [Address], [Location], [UserID], [CreatedOn], [Status]) VALUES (13, N'SNU', N'Noida', N'Delhi', 15, CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[College] ([CollegeID], [CollegeName], [Address], [Location], [UserID], [CreatedOn], [Status]) VALUES (14, N'abc', N's', N's', 27, CAST(N'2023-06-21' AS Date), 2)
SET IDENTITY_INSERT [dbo].[College] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (1, N'jhjk', N'eeee', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (2, N'dddd', N'ddd', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (3, N'ggg', N'jjj', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (4, N'ttttt', N'mmmm', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (5, N'abc', N'Very good', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (6, N'eee', N'eee', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (7, N'abc', N'good', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (8, N'abc', N'need improvement', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (9, N'ddd', N'good', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (10, N'ggg', N'keep it up', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (11, N'sss', N'Average performance need improvement', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (12, N'ff', N'excellent', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (14, N'fff', N'good', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (15, N'ff', N'bad', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (16, N'ee', N'bad', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (21, N'ok', N'bad', CAST(N'0001-01-01' AS Date), 0)
INSERT [dbo].[Comments] ([CommentID], [CommentForOrg], [CommentForStudent], [CreatedOn], [Status]) VALUES (22, N'abc', N'great', CAST(N'0001-01-01' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([CompanyID], [UserID], [Name], [Branches], [Location], [Address], [Website], [contact_no], [emailID], [CreatedOn], [Remarks], [Status]) VALUES (1, 8, N'HRB', NULL, N'Trivandrum', N'HRB, TVM', N'hrblock.com', N'256666', N'abc@hrblock.com', CAST(N'2023-01-01' AS Date), NULL, 1)
INSERT [dbo].[Companies] ([CompanyID], [UserID], [Name], [Branches], [Location], [Address], [Website], [contact_no], [emailID], [CreatedOn], [Remarks], [Status]) VALUES (2, 16, N'Tcs', NULL, N'Banglore', N'infocity', N'www.tcs.com', N'#######', N'tcs@gmail.com', CAST(N'2023-06-21' AS Date), NULL, 1)
INSERT [dbo].[Companies] ([CompanyID], [UserID], [Name], [Branches], [Location], [Address], [Website], [contact_no], [emailID], [CreatedOn], [Remarks], [Status]) VALUES (3, 17, N'Floki labs', NULL, N'chennai', N'Velachery', N'www.floki.com', N'#######', N'floki@gmail.com', CAST(N'2023-06-21' AS Date), NULL, 1)
INSERT [dbo].[Companies] ([CompanyID], [UserID], [Name], [Branches], [Location], [Address], [Website], [contact_no], [emailID], [CreatedOn], [Remarks], [Status]) VALUES (4, 28, N'd', NULL, N'd', N'd', N'd', N'd', N'd', CAST(N'2023-06-21' AS Date), NULL, 2)
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentID], [CollegeID], [Name], [Description], [CreatedOn], [Status]) VALUES (1, 10, N'EEE', N'electrical and electronic engineering', CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[Department] ([DepartmentID], [CollegeID], [Name], [Description], [CreatedOn], [Status]) VALUES (2, 9, N' B.Tech Csc', N'Computer Science Engineering', CAST(N'2023-06-21' AS Date), 2)
INSERT [dbo].[Department] ([DepartmentID], [CollegeID], [Name], [Description], [CreatedOn], [Status]) VALUES (3, 9, N'Mech', N'Mechanical Engineering', CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[Department] ([DepartmentID], [CollegeID], [Name], [Description], [CreatedOn], [Status]) VALUES (4, 9, N'ECE', N'electronics and Communication engieering', CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[Department] ([DepartmentID], [CollegeID], [Name], [Description], [CreatedOn], [Status]) VALUES (5, 13, N'B.Tech CSE-IOT', N'Internet Of Things', CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[Department] ([DepartmentID], [CollegeID], [Name], [Description], [CreatedOn], [Status]) VALUES (6, 13, N'B.Tech AI & DS', N'Artificial Intelligence and DataScience', CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[Department] ([DepartmentID], [CollegeID], [Name], [Description], [CreatedOn], [Status]) VALUES (7, 13, N'B.Tech CyberSecurity', N'Cyber Security', CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[Department] ([DepartmentID], [CollegeID], [Name], [Description], [CreatedOn], [Status]) VALUES (8, 12, N'BioTechnology', N'BioTechnology engineering', CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[Department] ([DepartmentID], [CollegeID], [Name], [Description], [CreatedOn], [Status]) VALUES (9, 12, N'B.Tech Chem', N'Chemical Engineering', CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[Department] ([DepartmentID], [CollegeID], [Name], [Description], [CreatedOn], [Status]) VALUES (10, 12, N'B.Tech IT', N'Information Technology', CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[Department] ([DepartmentID], [CollegeID], [Name], [Description], [CreatedOn], [Status]) VALUES (11, 9, N'r', N'r', CAST(N'2023-06-21' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[PlacementAllocation] ON 

INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (1, 4, 1, 1, NULL, 1)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (2, 6, 4, 3, NULL, 1)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (3, 6, 1, 4, NULL, 2)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (4, 6, 2, 2, NULL, 1)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (5, 6, 3, 6, NULL, 2)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (6, 4, 4, 8, NULL, 2)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (7, 4, 5, 9, NULL, 1)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (8, 7, 6, 10, NULL, 1)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (9, 10, 7, 14, NULL, 1)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (10, 5, 8, 5, NULL, 1)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (11, 8, 9, 11, NULL, 2)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (12, 12, 10, 15, NULL, 2)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (13, 6, 11, 7, NULL, 1)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (14, 9, 12, 12, NULL, 1)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (15, 13, 13, 16, NULL, 2)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (16, 13, 11, NULL, NULL, 0)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (17, 13, 12, 22, NULL, 1)
INSERT [dbo].[PlacementAllocation] ([PlacementAllocationID], [PlacementDriveID], [StudentID], [CommentID], [Rating], [PlacementStatus]) VALUES (18, 13, 14, 21, NULL, 2)
SET IDENTITY_INSERT [dbo].[PlacementAllocation] OFF
GO
SET IDENTITY_INSERT [dbo].[PlacementDrive] ON 

INSERT [dbo].[PlacementDrive] ([PlacementDriveID], [CollegeID], [CompanyID], [InterviewDate], [NoOfVacancies], [Package], [Place], [Title], [Details], [CreatedOn], [Status]) VALUES (4, 9, 1, CAST(N'2023-01-01' AS Date), 20, N'50000-80000', N'Trivandrum', N'Data Analyst drive', N'Placement drive for data analyst', CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[PlacementDrive] ([PlacementDriveID], [CollegeID], [CompanyID], [InterviewDate], [NoOfVacancies], [Package], [Place], [Title], [Details], [CreatedOn], [Status]) VALUES (5, 12, 1, CAST(N'0001-01-01' AS Date), 20, N'50000-8000', N'Banglore', N'full stack developer', N'Placement drive for Full Stack Developer', CAST(N'2023-06-21' AS Date), 0)
INSERT [dbo].[PlacementDrive] ([PlacementDriveID], [CollegeID], [CompanyID], [InterviewDate], [NoOfVacancies], [Package], [Place], [Title], [Details], [CreatedOn], [Status]) VALUES (6, 13, 1, CAST(N'0001-01-01' AS Date), 20, N'40000-80000', N'Chennai', N'IT developer', N'Placement drive for IT developer', CAST(N'2023-06-21' AS Date), 0)
INSERT [dbo].[PlacementDrive] ([PlacementDriveID], [CollegeID], [CompanyID], [InterviewDate], [NoOfVacancies], [Package], [Place], [Title], [Details], [CreatedOn], [Status]) VALUES (7, 9, 2, CAST(N'0001-01-01' AS Date), 30, N'20000-40000', N'Trivadrum', N'Developer', N'It developer', CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[PlacementDrive] ([PlacementDriveID], [CollegeID], [CompanyID], [InterviewDate], [NoOfVacancies], [Package], [Place], [Title], [Details], [CreatedOn], [Status]) VALUES (8, 12, 2, CAST(N'0001-01-01' AS Date), 30, N'50000-80000', N'Banglore', N'Testing', N'software testing', CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[PlacementDrive] ([PlacementDriveID], [CollegeID], [CompanyID], [InterviewDate], [NoOfVacancies], [Package], [Place], [Title], [Details], [CreatedOn], [Status]) VALUES (9, 13, 2, CAST(N'0001-01-01' AS Date), 30, N'40000-80000', N'Chennai', N'IT support', N'desktop support ', CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[PlacementDrive] ([PlacementDriveID], [CollegeID], [CompanyID], [InterviewDate], [NoOfVacancies], [Package], [Place], [Title], [Details], [CreatedOn], [Status]) VALUES (10, 9, 3, CAST(N'0001-01-01' AS Date), 10, N'40000-80000', N'Trivadrum', N'senior analyst', N'Placement drive for senior data analyst', CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[PlacementDrive] ([PlacementDriveID], [CollegeID], [CompanyID], [InterviewDate], [NoOfVacancies], [Package], [Place], [Title], [Details], [CreatedOn], [Status]) VALUES (12, 12, 3, CAST(N'0001-01-01' AS Date), 10, N'40000-80000', N'Banglore', N'Full stack developer', N'Placement drive for Full Stack Developer', CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[PlacementDrive] ([PlacementDriveID], [CollegeID], [CompanyID], [InterviewDate], [NoOfVacancies], [Package], [Place], [Title], [Details], [CreatedOn], [Status]) VALUES (13, 13, 3, CAST(N'0001-01-01' AS Date), 10, N'40000-80000', N'Chennai', N'IT support', N'Placement drive for  IT specialist', CAST(N'2023-06-21' AS Date), 1)
INSERT [dbo].[PlacementDrive] ([PlacementDriveID], [CollegeID], [CompanyID], [InterviewDate], [NoOfVacancies], [Package], [Place], [Title], [Details], [CreatedOn], [Status]) VALUES (14, 9, 1, CAST(N'0001-01-01' AS Date), 40, N'40000-80000', N'y', N'y', N'y', CAST(N'2023-06-21' AS Date), 0)
INSERT [dbo].[PlacementDrive] ([PlacementDriveID], [CollegeID], [CompanyID], [InterviewDate], [NoOfVacancies], [Package], [Place], [Title], [Details], [CreatedOn], [Status]) VALUES (15, 12, 1, CAST(N'0001-01-01' AS Date), 30, N'40000-80000', N'Banglore', N'kkk', N'k', CAST(N'2023-06-23' AS Date), 1)
SET IDENTITY_INSERT [dbo].[PlacementDrive] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentID], [RegisterNo], [Name], [Gender], [DOB], [MobileNo], [EmailID], [Address], [District], [State], [Pin], [NameOfGuardian], [Occupation], [MaritalStatus], [Mothertongue], [UserID], [DepartmentID], [AcademicDetailID], [AcademicYear], [Remarks], [CreatedOn], [Hobbies], [Skills], [Status]) VALUES (1, N'1234', N'Manu', N'M', CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'9888888888', N'sas@sadfas.cdaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, NULL, N'2022', NULL, CAST(N'2022-01-01' AS Date), NULL, NULL, 1)
INSERT [dbo].[Students] ([StudentID], [RegisterNo], [Name], [Gender], [DOB], [MobileNo], [EmailID], [Address], [District], [State], [Pin], [NameOfGuardian], [Occupation], [MaritalStatus], [Mothertongue], [UserID], [DepartmentID], [AcademicDetailID], [AcademicYear], [Remarks], [CreatedOn], [Hobbies], [Skills], [Status]) VALUES (2, NULL, N'Csc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 1, NULL, NULL, NULL, CAST(N'2023-06-16' AS Date), NULL, NULL, 1)
INSERT [dbo].[Students] ([StudentID], [RegisterNo], [Name], [Gender], [DOB], [MobileNo], [EmailID], [Address], [District], [State], [Pin], [NameOfGuardian], [Occupation], [MaritalStatus], [Mothertongue], [UserID], [DepartmentID], [AcademicDetailID], [AcademicYear], [Remarks], [CreatedOn], [Hobbies], [Skills], [Status]) VALUES (3, NULL, N'Test123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 1, NULL, NULL, NULL, CAST(N'2023-06-16' AS Date), NULL, NULL, 1)
INSERT [dbo].[Students] ([StudentID], [RegisterNo], [Name], [Gender], [DOB], [MobileNo], [EmailID], [Address], [District], [State], [Pin], [NameOfGuardian], [Occupation], [MaritalStatus], [Mothertongue], [UserID], [DepartmentID], [AcademicDetailID], [AcademicYear], [Remarks], [CreatedOn], [Hobbies], [Skills], [Status]) VALUES (4, NULL, N'Adithi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 2, NULL, NULL, NULL, CAST(N'2023-06-16' AS Date), NULL, NULL, 1)
INSERT [dbo].[Students] ([StudentID], [RegisterNo], [Name], [Gender], [DOB], [MobileNo], [EmailID], [Address], [District], [State], [Pin], [NameOfGuardian], [Occupation], [MaritalStatus], [Mothertongue], [UserID], [DepartmentID], [AcademicDetailID], [AcademicYear], [Remarks], [CreatedOn], [Hobbies], [Skills], [Status]) VALUES (5, NULL, N'Anjana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 2, NULL, NULL, NULL, CAST(N'2023-06-21' AS Date), NULL, NULL, 1)
INSERT [dbo].[Students] ([StudentID], [RegisterNo], [Name], [Gender], [DOB], [MobileNo], [EmailID], [Address], [District], [State], [Pin], [NameOfGuardian], [Occupation], [MaritalStatus], [Mothertongue], [UserID], [DepartmentID], [AcademicDetailID], [AcademicYear], [Remarks], [CreatedOn], [Hobbies], [Skills], [Status]) VALUES (6, NULL, N'Nirmal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, 3, NULL, NULL, NULL, CAST(N'2023-06-21' AS Date), NULL, NULL, 1)
INSERT [dbo].[Students] ([StudentID], [RegisterNo], [Name], [Gender], [DOB], [MobileNo], [EmailID], [Address], [District], [State], [Pin], [NameOfGuardian], [Occupation], [MaritalStatus], [Mothertongue], [UserID], [DepartmentID], [AcademicDetailID], [AcademicYear], [Remarks], [CreatedOn], [Hobbies], [Skills], [Status]) VALUES (7, NULL, N'Riya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 4, NULL, NULL, NULL, CAST(N'2023-06-21' AS Date), NULL, NULL, 1)
INSERT [dbo].[Students] ([StudentID], [RegisterNo], [Name], [Gender], [DOB], [MobileNo], [EmailID], [Address], [District], [State], [Pin], [NameOfGuardian], [Occupation], [MaritalStatus], [Mothertongue], [UserID], [DepartmentID], [AcademicDetailID], [AcademicYear], [Remarks], [CreatedOn], [Hobbies], [Skills], [Status]) VALUES (8, NULL, N'Bhavana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, 8, NULL, NULL, NULL, CAST(N'2023-06-21' AS Date), NULL, NULL, 1)
INSERT [dbo].[Students] ([StudentID], [RegisterNo], [Name], [Gender], [DOB], [MobileNo], [EmailID], [Address], [District], [State], [Pin], [NameOfGuardian], [Occupation], [MaritalStatus], [Mothertongue], [UserID], [DepartmentID], [AcademicDetailID], [AcademicYear], [Remarks], [CreatedOn], [Hobbies], [Skills], [Status]) VALUES (9, NULL, N'Mohit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, 9, NULL, NULL, NULL, CAST(N'2023-06-21' AS Date), NULL, NULL, 1)
INSERT [dbo].[Students] ([StudentID], [RegisterNo], [Name], [Gender], [DOB], [MobileNo], [EmailID], [Address], [District], [State], [Pin], [NameOfGuardian], [Occupation], [MaritalStatus], [Mothertongue], [UserID], [DepartmentID], [AcademicDetailID], [AcademicYear], [Remarks], [CreatedOn], [Hobbies], [Skills], [Status]) VALUES (10, NULL, N'Manoj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, 10, NULL, NULL, NULL, CAST(N'2023-06-21' AS Date), NULL, NULL, 1)
INSERT [dbo].[Students] ([StudentID], [RegisterNo], [Name], [Gender], [DOB], [MobileNo], [EmailID], [Address], [District], [State], [Pin], [NameOfGuardian], [Occupation], [MaritalStatus], [Mothertongue], [UserID], [DepartmentID], [AcademicDetailID], [AcademicYear], [Remarks], [CreatedOn], [Hobbies], [Skills], [Status]) VALUES (11, NULL, N'Varun', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 5, NULL, NULL, NULL, CAST(N'2023-06-21' AS Date), NULL, NULL, 1)
INSERT [dbo].[Students] ([StudentID], [RegisterNo], [Name], [Gender], [DOB], [MobileNo], [EmailID], [Address], [District], [State], [Pin], [NameOfGuardian], [Occupation], [MaritalStatus], [Mothertongue], [UserID], [DepartmentID], [AcademicDetailID], [AcademicYear], [Remarks], [CreatedOn], [Hobbies], [Skills], [Status]) VALUES (12, NULL, N'Rahul', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 6, NULL, NULL, NULL, CAST(N'2023-06-21' AS Date), NULL, NULL, 1)
INSERT [dbo].[Students] ([StudentID], [RegisterNo], [Name], [Gender], [DOB], [MobileNo], [EmailID], [Address], [District], [State], [Pin], [NameOfGuardian], [Occupation], [MaritalStatus], [Mothertongue], [UserID], [DepartmentID], [AcademicDetailID], [AcademicYear], [Remarks], [CreatedOn], [Hobbies], [Skills], [Status]) VALUES (13, NULL, N'Neha', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, 7, NULL, NULL, NULL, CAST(N'2023-06-21' AS Date), NULL, NULL, 1)
INSERT [dbo].[Students] ([StudentID], [RegisterNo], [Name], [Gender], [DOB], [MobileNo], [EmailID], [Address], [District], [State], [Pin], [NameOfGuardian], [Occupation], [MaritalStatus], [Mothertongue], [UserID], [DepartmentID], [AcademicDetailID], [AcademicYear], [Remarks], [CreatedOn], [Hobbies], [Skills], [Status]) VALUES (14, NULL, N'nandhini', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, 6, NULL, NULL, NULL, CAST(N'2023-06-23' AS Date), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (1, N'Admin', N'Admin', 0, CAST(N'2023-05-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (2, N'CET', N'CET1', 2, CAST(N'2023-05-19T21:40:05.390' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (6, N'new', N'new', 2, CAST(N'2023-05-19T22:05:37.547' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (7, N'Samp', N'Samp', 2, CAST(N'2023-05-19T22:17:55.160' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (8, N'HRB', N'HRB', 3, CAST(N'2023-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (10, N'aneesha', N'aneesha', 1, CAST(N'2023-01-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (11, N'student', N'qwerty', 1, CAST(N'2023-06-16T13:21:29.717' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (12, N'Test345', N'Test2022!', 1, CAST(N'2023-06-16T13:26:14.910' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (13, N'Adithi', N'adithi', 1, CAST(N'2023-06-16T15:01:34.200' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (14, N'vit', N'vit', 2, CAST(N'2023-06-21T12:21:27.283' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (15, N'snu', N'snu', 2, CAST(N'2023-06-21T12:23:32.523' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (16, N'tcs', N'tcs', 3, CAST(N'2023-06-21T12:24:30.133' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (17, N'floki', N'floki', 3, CAST(N'2023-06-21T12:25:43.443' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (18, N'anjana', N'anjana', 1, CAST(N'2023-06-21T14:49:44.247' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (19, N'Nirmal', N'nirmal', 1, CAST(N'2023-06-21T14:50:13.173' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (20, N'riya', N'riya', 1, CAST(N'2023-06-21T14:50:41.373' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (21, N'bhavana', N'bhavana', 1, CAST(N'2023-06-21T14:51:22.897' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (22, N'mohit', N'mohit', 1, CAST(N'2023-06-21T14:51:55.493' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (23, N'Manoj', N'manoj', 1, CAST(N'2023-06-21T14:52:25.543' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (24, N'varun', N'varun', 1, CAST(N'2023-06-21T14:52:54.253' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (25, N'rahul', N'rahul', 1, CAST(N'2023-06-21T14:53:22.180' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (26, N'neha', N'neha', 1, CAST(N'2023-06-21T14:53:58.653' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (27, N's', N's', 2, CAST(N'2023-06-21T15:06:10.920' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (28, N'd', N'd', 3, CAST(N'2023-06-21T15:06:29.303' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Usertype], [CreatedOn], [Status]) VALUES (29, N'nandhini', N'nandhini', 1, CAST(N'2023-06-23T10:35:51.287' AS DateTime), 1)
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
