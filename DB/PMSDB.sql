USE [master]
GO
/****** Object:  Database [PMSDB]    Script Date: 5/10/2023 5:58:27 PM ******/
CREATE DATABASE [PMSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PMSDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\PMSDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PMSDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\PMSDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PMSDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PMSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PMSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PMSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PMSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PMSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PMSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PMSDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PMSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PMSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PMSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PMSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PMSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PMSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PMSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PMSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PMSDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PMSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PMSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PMSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PMSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PMSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PMSDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PMSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PMSDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PMSDB] SET  MULTI_USER 
GO
ALTER DATABASE [PMSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PMSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PMSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PMSDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PMSDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PMSDB] SET QUERY_STORE = OFF
GO
USE [PMSDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [PMSDB]
GO
/****** Object:  Table [dbo].[AcademicDetails]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicDetails](
	[Register_no] [nvarchar](20) NOT NULL,
	[Percentage_10th] [int] NOT NULL,
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
 CONSTRAINT [PK_AcademicDetails] PRIMARY KEY CLUSTERED 
(
	[Register_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Comment_id] [int] NOT NULL,
	[Topic_id] [nvarchar](20) NOT NULL,
	[Comment] [nvarchar](50) NOT NULL,
	[Submit_date] [date] NOT NULL,
	[Register_no] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[company_id] [nvarchar](20) NOT NULL,
	[company_name] [nvarchar](50) NOT NULL,
	[company_type] [nvarchar](50) NOT NULL,
	[Branches] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Website] [nvarchar](50) NOT NULL,
	[contact_no] [numeric](18, 0) NOT NULL,
	[email_id] [nvarchar](50) NOT NULL,
	[established_year] [nvarchar](10) NULL,
	[join_date] [date] NULL,
	[end_date] [date] NULL,
	[Remarks] [nvarchar](50) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complaints]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaints](
	[complaint_id] [nvarchar](20) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[Complaint] [nvarchar](200) NOT NULL,
	[Submit_date] [date] NOT NULL,
	[Reply] [nvarchar](200) NULL,
 CONSTRAINT [PK_Complaints] PRIMARY KEY CLUSTERED 
(
	[complaint_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedback_id] [nvarchar](20) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Feedback] [nvarchar](200) NULL,
	[Submit_date] [date] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroomingClasses]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroomingClasses](
	[Id] [nvarchar](20) NOT NULL,
	[Topic] [nvarchar](50) NOT NULL,
	[Classroom] [nchar](10) NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [datetime] NOT NULL,
	[Name_of_teacher] [nvarchar](50) NOT NULL,
	[Batch] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GroomingClasses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroomingDetails]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroomingDetails](
	[Detail_id] [nvarchar](20) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[Submit_Date] [date] NOT NULL,
	[File] [nvarchar](50) NULL,
 CONSTRAINT [PK_GroomingDetails] PRIMARY KEY CLUSTERED 
(
	[Detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterviewDetails]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewDetails](
	[interview_id] [nvarchar](20) NOT NULL,
	[vacancy_id] [nvarchar](20) NOT NULL,
	[Company_id] [nvarchar](20) NOT NULL,
	[interview_date] [date] NOT NULL,
	[Time] [datetime] NOT NULL,
	[Place] [nvarchar](50) NOT NULL,
	[List_of_students] [nvarchar](50) NULL,
	[Company_name] [nvarchar](50) NOT NULL,
	[Interview_details] [nvarchar](50) NULL,
	[Submit_date] [date] NULL,
 CONSTRAINT [PK_InterviewDetails] PRIMARY KEY CLUSTERED 
(
	[interview_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobApplications]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobApplications](
	[apply_id] [nvarchar](20) NOT NULL,
	[vacancy_id] [nvarchar](50) NOT NULL,
	[Register_no] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Place] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[Branch] [nvarchar](50) NOT NULL,
	[Interested_areas] [nvarchar](50) NULL,
	[Achievements] [nvarchar](50) NULL,
	[Mark_list] [nvarchar](50) NULL,
	[Photo] [image] NULL,
	[Resume] [nvarchar](50) NULL,
	[Submit_date] [date] NULL,
 CONSTRAINT [PK_JobApplications] PRIMARY KEY CLUSTERED 
(
	[apply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mail]    Script Date: 5/10/2023 5:58:28 PM ******/
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
/****** Object:  Table [dbo].[MarksDetails]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarksDetails](
	[Mark_id] [nvarchar](20) NOT NULL,
	[Register_no] [nvarchar](20) NOT NULL,
	[Name] [nchar](10) NOT NULL,
	[Sem] [nchar](10) NULL,
	[Subject] [nchar](10) NULL,
	[Type] [nchar](10) NULL,
	[Total_marks] [nchar](10) NULL,
	[Marks] [nchar](10) NULL,
	[Exam_date] [datetime] NULL,
 CONSTRAINT [PK_MarksDetails] PRIMARY KEY CLUSTERED 
(
	[Mark_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[notification_id] [nvarchar](20) NOT NULL,
	[Date_of_placement] [date] NULL,
	[Venue] [nvarchar](50) NULL,
	[Time] [datetime] NULL,
	[Company_name] [nvarchar](50) NULL,
	[Post] [nvarchar](50) NULL,
	[company_address] [nvarchar](50) NULL,
	[Details] [nvarchar](50) NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[notification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtherInformation]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtherInformation](
	[Other_Id] [nvarchar](20) NOT NULL,
	[Register_no] [nvarchar](20) NOT NULL,
	[Hobbies] [nvarchar](50) NOT NULL,
	[Achievements] [nvarchar](50) NOT NULL,
	[Extra_courses] [nvarchar](50) NOT NULL,
	[Skills] [nvarchar](50) NOT NULL,
	[Experience] [nvarchar](50) NOT NULL,
	[Resume] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OtherInformation] PRIMARY KEY CLUSTERED 
(
	[Other_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participation]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participation](
	[participation_id] [int] NOT NULL,
	[company_id] [nvarchar](20) NOT NULL,
	[Notification_id] [nvarchar](20) NOT NULL,
	[Available_post] [nvarchar](50) NULL,
	[Details] [nvarchar](50) NULL,
	[Submit_date] [date] NULL,
	[approval] [nvarchar](50) NULL,
 CONSTRAINT [PK_Participation] PRIMARY KEY CLUSTERED 
(
	[participation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlacedStudents]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlacedStudents](
	[Id] [nvarchar](20) NOT NULL,
	[Register_no] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Company_name] [nvarchar](50) NOT NULL,
	[Post] [nvarchar](50) NOT NULL,
	[Branch] [nvarchar](50) NOT NULL,
	[Year] [date] NOT NULL,
	[Image] [image] NULL,
 CONSTRAINT [PK_PlacedStudents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[register_no] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[date_of_birth] [datetime] NOT NULL,
	[mobile_no] [numeric](18, 0) NOT NULL,
	[email_id] [nvarchar](50) NOT NULL,
	[present_address] [nvarchar](100) NOT NULL,
	[permanent_address] [nvarchar](100) NOT NULL,
	[District] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Pin] [numeric](18, 0) NOT NULL,
	[name_of_guardian] [nvarchar](50) NULL,
	[Occupation] [nvarchar](50) NULL,
	[contact_no] [numeric](18, 0) NULL,
	[Caste] [nvarchar](50) NULL,
	[Religion] [nvarchar](50) NULL,
	[marital_status] [nvarchar](20) NULL,
	[physically_challenged] [nvarchar](50) NULL,
	[mother_tongue] [nvarchar](50) NOT NULL,
	[Course] [nvarchar](50) NOT NULL,
	[Branch] [nvarchar](50) NOT NULL,
	[Photo] [image] NOT NULL,
	[academic_year] [nvarchar](30) NOT NULL,
	[end_date] [date] NULL,
	[Remarks] [nvarchar](50) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[register_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[Topic_id] [nvarchar](20) NOT NULL,
	[Topic] [nvarchar](50) NOT NULL,
	[Submit_date] [date] NOT NULL,
	[Register_no] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[Topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Usertype] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vacancies]    Script Date: 5/10/2023 5:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacancies](
	[Vacancy_id] [nchar](10) NOT NULL,
	[Post] [nchar](10) NOT NULL,
	[No_of_vacancies] [int] NOT NULL,
	[Qualification] [nvarchar](50) NOT NULL,
	[Package] [nvarchar](50) NOT NULL,
	[Marks_percentage] [nvarchar](50) NOT NULL,
	[Back_papers] [int] NULL,
	[Company_id] [nvarchar](20) NOT NULL,
	[last_date] [date] NOT NULL,
	[Submit_date] [date] NULL,
	[Details] [nvarchar](50) NULL,
 CONSTRAINT [PK_Vacancies] PRIMARY KEY CLUSTERED 
(
	[Vacancy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Topic] FOREIGN KEY([Topic_id])
REFERENCES [dbo].[Topic] ([Topic_id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Topic]
GO
ALTER TABLE [dbo].[Participation]  WITH CHECK ADD  CONSTRAINT [FK_Participation_Companies] FOREIGN KEY([company_id])
REFERENCES [dbo].[Companies] ([company_id])
GO
ALTER TABLE [dbo].[Participation] CHECK CONSTRAINT [FK_Participation_Companies]
GO
ALTER TABLE [dbo].[Participation]  WITH CHECK ADD  CONSTRAINT [FK_Participation_Notifications] FOREIGN KEY([Notification_id])
REFERENCES [dbo].[Notifications] ([notification_id])
GO
ALTER TABLE [dbo].[Participation] CHECK CONSTRAINT [FK_Participation_Notifications]
GO
ALTER TABLE [dbo].[Vacancies]  WITH CHECK ADD  CONSTRAINT [FK_Vacancies_Vacancies] FOREIGN KEY([Company_id])
REFERENCES [dbo].[Companies] ([company_id])
GO
ALTER TABLE [dbo].[Vacancies] CHECK CONSTRAINT [FK_Vacancies_Vacancies]
GO
USE [master]
GO
ALTER DATABASE [PMSDB] SET  READ_WRITE 
GO
