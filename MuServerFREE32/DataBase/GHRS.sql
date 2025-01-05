USE [MuOnline]
GO

/****** Object:  Table [dbo].[GHRS_top1]    Script Date: 11/26/2021 19:06:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GHRS_top1](
	[rResetLife] [int] NOT NULL,
	[ResetCount] [int] NOT NULL,
	[Time] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[GHRS_top1] ADD  DEFAULT ((0)) FOR [rResetLife]
GO

ALTER TABLE [dbo].[GHRS_top1] ADD  DEFAULT ((0)) FOR [ResetCount]
GO

ALTER TABLE [dbo].[GHRS_top1] ADD  DEFAULT ((0)) FOR [Time]
GO


