USE [test]
GO

/****** Object:  Table [dbo].[test]    Script Date: 24/08/2023 22:01:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[test](
	[t_id] [int] IDENTITY(1,1) NOT NULL,
	[name_] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[contact] [varchar](100) NULL,
	[address_] [varchar](400) NULL,
	[status_] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[t_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


