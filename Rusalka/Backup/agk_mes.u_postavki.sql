USE [sqlmes]
GO

ALTER TABLE [agk_mes].[U_POSTAVKI] DROP CONSTRAINT [DF__U_POSTAVK__date___2739D489]
GO

/****** Object:  Table [agk_mes].[U_POSTAVKI]    Script Date: 26.12.2019 10:40:40 ******/
DROP TABLE [agk_mes].[U_POSTAVKI]
GO

/****** Object:  Table [agk_mes].[U_POSTAVKI]    Script Date: 26.12.2019 10:40:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [agk_mes].[U_POSTAVKI](
	[ID] [nvarchar](10) NULL,
	[DATA] [datetime] NULL,
	[NAIMENOVANIE] [nvarchar](100) NULL,
	[MASSA] [decimal](18, 0) NULL,
	[KOLICHESTVO_VAGONOV] [smallint] NULL,
	[ID_BRIGADY] [int] NULL,
	[ID_LOKOMOTIVA] [int] NULL,
	[ID_POSTAVSCHIKA] [int] NULL,
	[ID_DOC] [int] NULL,
	[filename] [nvarchar](200) NULL,
	[date_in] [datetime2](7) NULL,
	[systemcode] [nvarchar](50) NULL
) ON [PRIMARY]
GO

ALTER TABLE [agk_mes].[U_POSTAVKI] ADD  DEFAULT (getdate()) FOR [date_in]
GO


