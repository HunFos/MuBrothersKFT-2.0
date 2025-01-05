USE [MuOnline]
GO

/****** Object:  Table [dbo].[ItemMarketData]    Script Date: 11/15/2021 12:11:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ItemMarketData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Account] [varchar](10) NULL,
	[Name] [varchar](10) NULL,
	[PriceType] [int] NOT NULL,
	[PriceValue] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[FilterType] [int] NOT NULL,
	[FilterLevel] [int] NOT NULL,
	[FilterLuck] [int] NOT NULL,
	[FilterExl] [int] NOT NULL,
	[FilterAnc] [int] NOT NULL,
	[Date] [varchar](20) NULL,
	[Item] [varbinary](16) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ItemMarketData] ADD  DEFAULT ((0)) FOR [PriceType]
GO

ALTER TABLE [dbo].[ItemMarketData] ADD  DEFAULT ((0)) FOR [PriceValue]
GO

ALTER TABLE [dbo].[ItemMarketData] ADD  DEFAULT ((0)) FOR [Status]
GO

ALTER TABLE [dbo].[ItemMarketData] ADD  DEFAULT ((0)) FOR [FilterType]
GO

ALTER TABLE [dbo].[ItemMarketData] ADD  DEFAULT ((0)) FOR [FilterLevel]
GO

ALTER TABLE [dbo].[ItemMarketData] ADD  DEFAULT ((0)) FOR [FilterLuck]
GO

ALTER TABLE [dbo].[ItemMarketData] ADD  DEFAULT ((0)) FOR [FilterExl]
GO

ALTER TABLE [dbo].[ItemMarketData] ADD  DEFAULT ((0)) FOR [FilterAnc]
GO

