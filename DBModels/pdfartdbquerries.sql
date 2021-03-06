
CREATE TABLE [dbo].[Book](
	[Book_ID] [int] IDENTITY(1,1) NOT NULL,
	[Book_Name] [nvarchar](100) NULL,
	[Book_Author_Name] [nvarchar](100) NULL,
	[Book_Edition] [nvarchar](30) NULL,
	[Book_Date_Created] [datetime] NULL,
	[Book_Date_Updated] [datetime] NULL,
	[Book_IsActive] [bit] NULL,
	[Fk_User_ID] [int] NULL,
	[FK_Catagory_ID] [int] NULL,
	[bookUrl] [nvarchar](50) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Book_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catagory]    Script Date: 4/11/2018 6:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catagory](
	[Catagory_ID] [int] IDENTITY(1,1) NOT NULL,
	[Catagory_Name] [nvarchar](50) NULL,
	[Catagory_Date_Created] [datetime] NULL,
	[Catagory_Date_Updated] [datetime] NULL,
	[Catagory_IsActive] [bit] NULL,
 CONSTRAINT [PK_Catagory] PRIMARY KEY CLUSTERED 
(
	[Catagory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/11/2018 6:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Contact_ID] [int] IDENTITY(1,1) NOT NULL,
	[Contact_Name] [nvarchar](50) NULL,
	[Contact_Email] [nvarchar](50) NULL,
	[Contact_Message] [nvarchar](max) NULL,
	[Contact_isActive] [bit] NULL,
	[Contact_CreateDate] [datetime] NULL,
	[Contact_UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Contact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image_Book]    Script Date: 4/11/2018 6:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image_Book](
	[Image_Book_ID] [int] IDENTITY(1,1) NOT NULL,
	[Image_Book_Date_Created] [datetime] NULL,
	[Image_Book_Date_Updated] [datetime] NULL,
	[Image_Book_IsActive] [bit] NULL,
	[Image_Book_URL] [nvarchar](200) NULL,
	[FK_Book_ID] [int] NULL,
 CONSTRAINT [PK_Image_Book] PRIMARY KEY CLUSTERED 
(
	[Image_Book_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image_Catagory]    Script Date: 4/11/2018 6:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image_Catagory](
	[Image_Catagory_ID] [int] IDENTITY(1,1) NOT NULL,
	[Image_Catagory_Date_Created] [datetime] NULL,
	[Image_Catagory_Date_Updated] [datetime] NULL,
	[Image_Catagory_IsActive] [bit] NULL,
	[Image_Catagory_URL] [nvarchar](200) NULL,
	[FK_Catagory_ID] [int] NULL,
 CONSTRAINT [PK_Image_Catagory] PRIMARY KEY CLUSTERED 
(
	[Image_Catagory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/11/2018 6:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [nvarchar](100) NULL,
	[User_Email] [nvarchar](100) NULL,
	[User_Password] [nvarchar](50) NULL,
	[User_Date_Created] [datetime] NULL,
	[User_Date_Updated] [datetime] NULL,
	[User_IsActive] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_CatagoryID_Book] FOREIGN KEY([FK_Catagory_ID])
REFERENCES [dbo].[Catagory] ([Catagory_ID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_CatagoryID_Book]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_UserID_Book] FOREIGN KEY([Fk_User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_UserID_Book]
GO
ALTER TABLE [dbo].[Image_Book]  WITH CHECK ADD  CONSTRAINT [FK_BookID_Image_Book] FOREIGN KEY([FK_Book_ID])
REFERENCES [dbo].[Book] ([Book_ID])
GO
ALTER TABLE [dbo].[Image_Book] CHECK CONSTRAINT [FK_BookID_Image_Book]
GO
ALTER TABLE [dbo].[Image_Catagory]  WITH CHECK ADD  CONSTRAINT [FK_CatagoryID_Image_Catagory] FOREIGN KEY([FK_Catagory_ID])
REFERENCES [dbo].[Catagory] ([Catagory_ID])
GO
ALTER TABLE [dbo].[Image_Catagory] CHECK CONSTRAINT [FK_CatagoryID_Image_Catagory]
GO
USE [master]
GO
ALTER DATABASE [PDFART] SET  READ_WRITE 
GO
