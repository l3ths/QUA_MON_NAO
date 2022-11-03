USE [master]
GO
DROP DATABASE [HR]
GO
CREATE DATABASE [HR]
GO
USE [HR]
GO

--Table Account
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[role] [nvarchar](50) NULL,
	[token] [nvarchar](50) NULL,
	CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--Table Employee
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[empID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[phoneNumber] [char](10) NULL,
	[email] [nvarchar](50) NOT NULL,
	[role] [nvarchar](50) NULL,
	[imgPath] [nvarchar](50) NULL,
	[dateOfBirth] [date] NULL,
	CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[empID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	CONSTRAINT [FK_Employee_Account] FOREIGN KEY ([email]) references tblAccount([email])
) ON [PRIMARY]
GO


--Table Certification
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCertificate](
	[certificateID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	CONSTRAINT [PK_tblCertificate] PRIMARY KEY CLUSTERED 
(
	[certificateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--Table Candidate
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCandidate](
	[candidateID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[phoneNumber] [char](10) NULL,
	[email] [nvarchar](50) NOT NULL,
	[imgPath] [nvarchar](50) NULL,
	[dateOfBirth] [date] NULL,
	CONSTRAINT [PK_tblCandidate] PRIMARY KEY CLUSTERED 
(
	[candidateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	CONSTRAINT [FK_Candidate_Account] FOREIGN KEY ([email]) references tblAccount([email]),
) ON [PRIMARY]
GO

--Table Job
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblJob](
	[jobID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[salary] [int] NULL,
	[description] [nvarchar](500) NULL,
	[experienceRequirement] [nvarchar](50) NULL,
	[educationRequirement] [nvarchar](50) NULL,
	[imgPath] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[dateFrom] [date] NULL,
	[dateTo] [date] NULL,
	[empID] [nvarchar](50) NULL,
	CONSTRAINT [PK_tblJob] PRIMARY KEY CLUSTERED 
(
	[jobID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	CONSTRAINT [FK_Job_Employee] FOREIGN KEY ([empID]) references tblEmployee([empID]),
) ON [PRIMARY]
GO

--Table CV
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCV](
	[CVID] [nvarchar](50) NOT NULL,
	[fileCV] [nvarchar](50) NULL,
	[education] [nvarchar](50) NULL,
	[experience] [nvarchar](50) NULL,
	[dateOfBirth] [date] NULL,
	[status] [bit] NULL,
	[candidateID] [nvarchar](50) NULL,
	[certificateID] [nvarchar](50) NULL,
	CONSTRAINT [PK_tblCV] PRIMARY KEY CLUSTERED 
(
	[CVID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	CONSTRAINT [FK_CV_candidate] FOREIGN KEY ([candidateID]) references tblCandidate([candidateID]),
	CONSTRAINT [FK_CV_Certificate] FOREIGN KEY ([certificateID]) references tblCertificate([certificateID])
) ON [PRIMARY]
GO

--Table Recruitment Post
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRecruitmentPost](
	[postID] [nvarchar](50) NOT NULL,
	[dateFrom] [date] NULL,
	[dateTo] [date] NULL,
	CONSTRAINT [PK_tblRecruitmentPost] PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--Table Interviewing
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInterviewing](
	[interviewingID] [nvarchar](50) NOT NULL,
	[date] [date] NULL,
	[time] [time] NULL,
	[score] [int] NULL,
	[content] [nvarchar](50) NULL,
	[empID] [nvarchar](50) NULL,
	[CVID] [nvarchar](50) NULL,
	[jobID] [nvarchar](50) NULL,
	[status] [bit] NULL,
	CONSTRAINT [PK_tblInterviewing] PRIMARY KEY CLUSTERED 
(
	[interviewingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
	CONSTRAINT [FK_Interviewing_Employee] FOREIGN KEY ([empID]) references tblEmployee([empID]),
	CONSTRAINT [FK_Interviewing_CV] FOREIGN KEY ([CVID]) references tblCV([CVID]),
	CONSTRAINT [FK_Interviewing_Job] FOREIGN KEY ([jobID]) references tblJob([jobID])
) ON [PRIMARY]
GO

--Table Applying
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAppyling](
	[date] [date] NULL,
	[CVID] [nvarchar](50) NOT NULL,
	[jobID] [nvarchar](50) NOT NULL,
	CONSTRAINT [FK_Applying_CV] FOREIGN KEY ([CVID]) references tblCV([CVID]),
	CONSTRAINT [FK_Applying_Job] FOREIGN KEY ([jobID]) references tblJob([jobID]),
) ON [PRIMARY]
GO

--Insert data
INSERT [dbo].[tblAccount] ([email], [password], [role]) VALUES (N'ngoctlbse160583@fpt.edu.vn', N'1', N'hr')
INSERT [dbo].[tblAccount] ([email], [password], [role]) VALUES (N'trungttse160105@fpt.edu.vn', N'1', N'hr manager')
INSERT [dbo].[tblAccount] ([email], [password], [role]) VALUES (N'huyltse160094@fpt.edu.vn', N'1', N'interviewer')
INSERT [dbo].[tblAccount] ([email], [password], [role]) VALUES (N'ductcse160119@fpt.edu.vn', N'1', N'candidate')
GO

INSERT [dbo].[tblEmployee] ([empID], [name], [phoneNumber], [email], [role], [imgPath], [dateOfBirth]) VALUES (N'EMP1', N'Tran Le Bao Ngoc', N'0912345678', N'ngoctlbse160583@fpt.edu.vn', N'hr', N'baongoc.jpg', '2002-02-01')
INSERT [dbo].[tblEmployee] ([empID], [name], [phoneNumber], [email], [role], [imgPath], [dateOfBirth]) VALUES (N'EMP2', N'Truong Tan Trung', N'0987654321', N'trungttse160105@fpt.edu.vn', N'hr manager', N'tantrung.jpg', '2002-03-01')
INSERT [dbo].[tblEmployee] ([empID], [name], [phoneNumber], [email], [role], [imgPath], [dateOfBirth]) VALUES (N'EMP3', N'Le Thanh Huy', N'0123456789', N'huyltse160094@fpt.edu.vn', N'hr', N'thanhhuy.jpg', '2002-04-01')
GO

INSERT [dbo].[tblCertificate] ([certificateID], [name]) VALUES (N'CER1',N'Data Science')
GO

INSERT [dbo].[tblCandidate] ([candidateID], [name], [phoneNumber], [email], [imgPath], [dateOfBirth]) VALUES (N'CDD1', N'Tran Cong Duc', N'0912837465', N'ductcse160119@fpt.edu.vn', N'congduc.jpg', '2002-01-01')
GO

INSERT [dbo].[tblJob] ([jobID], [name], [salary], [description], [experienceRequirement], [educationRequirement], [imgPath], [quantity], [dateFrom], [dateTo], [empID]) VALUES (N'JOB1', N'Back End Developer', 2000, N'Responsible for executing the marketing plans to deliver the market share, sales volume, revenue and profit growth objectives for assigned products / categories.
', N'Graduated from university', N'2 years', N'backend.jpg', 3, '2022-09-01', '2022-10-30', 'EMP1')
INSERT [dbo].[tblJob] ([jobID], [name], [salary], [description], [experienceRequirement], [educationRequirement], [imgPath], [quantity], [dateFrom], [dateTo], [empID]) VALUES (N'JOB2', N'Front End Developer', 1800, N'Responsible for executing the marketing plans to deliver the market share, sales volume, revenue and profit growth objectives for assigned products / categories.
', N'Graduated from university', N'3 years', N'frontend.jpg', 2, '2022-09-01', '2022-10-30', 'EMP1')
INSERT [dbo].[tblJob] ([jobID], [name], [salary], [description], [experienceRequirement], [educationRequirement], [imgPath], [quantity], [dateFrom], [dateTo], [empID]) VALUES (N'JOB3', N'Marketing', 1200, N'Responsible for executing the marketing plans to deliver the market share, sales volume, revenue and profit growth objectives for assigned products / categories.
', N'Graduated from university', N'1 years', N'marketing.jpg', 6, '2022-09-01', '2022-10-30', 'EMP1')
INSERT [dbo].[tblJob] ([jobID], [name], [salary], [description], [experienceRequirement], [educationRequirement], [imgPath], [quantity], [dateFrom], [dateTo], [empID]) VALUES (N'JOB4', N'HR', 2800, N'Responsible for executing the marketing plans to deliver the market share, sales volume, revenue and profit growth objectives for assigned products / categories.
', N'Graduated from university', N'1 years', N'hr.jpg', 1, '2022-09-01', '2022-10-30', 'EMP1')
INSERT [dbo].[tblJob] ([jobID], [name], [salary], [description], [experienceRequirement], [educationRequirement], [imgPath], [quantity], [dateFrom], [dateTo], [empID]) VALUES (N'JOB5', N'Tester', 3500, N'Responsible for executing the marketing plans to deliver the market share, sales volume, revenue and profit growth objectives for assigned products / categories.
', N'Graduated from university', N'1 years', N'tester.jpg', 3, '2022-09-01', '2022-10-30', 'EMP1')
INSERT [dbo].[tblJob] ([jobID], [name], [salary], [description], [experienceRequirement], [educationRequirement], [imgPath], [quantity], [dateFrom], [dateTo], [empID]) VALUES (N'JOB6', N'Data Analyst', 1500, N'Responsible for executing the marketing plans to deliver the market share, sales volume, revenue and profit growth objectives for assigned products / categories.
', N'Graduated from university', N'1 years', N'data-analyst.jpg',5, '2022-09-01', '2022-10-30', 'EMP1')
INSERT [dbo].[tblJob] ([jobID], [name], [salary], [description], [experienceRequirement], [educationRequirement], [imgPath], [quantity], [dateFrom], [dateTo], [empID]) VALUES (N'JOB7', N'Product Manager', 2300, N'Responsible for executing the marketing plans to deliver the market share, sales volume, revenue and profit growth objectives for assigned products / categories.
', N'Graduated from university', N'1 years', N'product-manager.jpg', 6, '2022-09-01', '2022-10-30', 'EMP1')
INSERT [dbo].[tblJob] ([jobID], [name], [salary], [description], [experienceRequirement], [educationRequirement], [imgPath], [quantity], [dateFrom], [dateTo], [empID]) VALUES (N'JOB8', N'Content Writer', 3000, N'Responsible for executing the marketing plans to deliver the market share, sales volume, revenue and profit growth objectives for assigned products / categories.
', N'Graduated from university', N'1 years', N'content-writer.jpg', 4, '2022-09-01', '2022-10-30', 'EMP1')
INSERT [dbo].[tblJob] ([jobID], [name], [salary], [description], [experienceRequirement], [educationRequirement], [imgPath], [quantity], [dateFrom], [dateTo], [empID]) VALUES (N'JOB9', N'Bridge System Engineer', 2100, N'Responsible for executing the marketing plans to deliver the market share, sales volume, revenue and profit growth objectives for assigned products / categories.
', N'Graduated from university', N'1 years', N'bridge-system-engineer.jpg', 4, '2022-09-01', '2022-10-30', 'EMP1')
INSERT [dbo].[tblJob] ([jobID], [name], [salary], [description], [experienceRequirement], [educationRequirement], [imgPath], [quantity], [dateFrom], [dateTo], [empID]) VALUES (N'JOB10', N'Business Analyst', 1400, N'Responsible for executing the marketing plans to deliver the market share, sales volume, revenue and profit growth objectives for assigned products / categories.
', N'Graduated from university', N'1 years', N'business-analyst.jpg', 2, '2022-09-01', '2022-10-30', 'EMP1')

GO

INSERT [dbo].[tblCV] ([CVID], [fileCV], [education], [experience], [dateOfBirth], [status], [candidateID], [certificateID]) VALUES (N'CV1', N'hong biet x4', N'hong biet x5', N'hong biet x6',  '2002-01-01', 0, N'CDD1', N'CER1')
GO

INSERT [dbo].[tblRecruitmentPost] ([postID], [dateFrom], [dateTo]) VALUES (N'POST1', '2022-09-01', '2022-10-30')
GO

INSERT [dbo].[tblInterviewing] ([interviewingID], [date], [time], [score], [content], [empID], [CVID], [jobID], [status]) VALUES (N'ITV1', '2022-09-19', '09:00:00', 80, N'hong biet x8', N'EMP3', N'CV1', N'JOB1', 0)
GO

INSERT [dbo].[tblAppyling] ([date], [CVID], [jobID]) VALUES ('2022-09-10', N'CV1', N'JOB1')
GO