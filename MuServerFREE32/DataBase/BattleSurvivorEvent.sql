USE [MuOnline]
GO

/****** Object:  Table [dbo].[RankingBsV]    Script Date: 11/18/2021 08:04:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RankingBsV](
	[Name] [varchar](10) NOT NULL,
	[Kills] [int] NOT NULL,
	[Deads] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[RankingBsV] ADD  CONSTRAINT [DF_RankingBsV_Kills]  DEFAULT ((0)) FOR [Kills]
GO

ALTER TABLE [dbo].[RankingBsV] ADD  CONSTRAINT [DF_RankingBsV_Deads]  DEFAULT ((0)) FOR [Deads]
GO

