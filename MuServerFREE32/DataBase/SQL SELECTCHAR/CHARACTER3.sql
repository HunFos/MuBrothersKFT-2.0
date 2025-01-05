USE [MuOnline]
GO

/****** Object:  Table [dbo].[AccountCharacter3]    Script Date: 05/04/2021 23:06:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AccountCharacter3](
	[Number] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[GameID1] [varchar](10) NULL,
	[GameID2] [varchar](10) NULL,
	[GameID3] [varchar](10) NULL,
	[GameID4] [varchar](10) NULL,
	[GameID5] [varchar](10) NULL,
	[GameIDC] [varchar](10) NULL,
	[MoveCnt] [tinyint] NULL,
	[ExtClass] [int] NOT NULL,
	[ExtWarehouse] [int] NOT NULL,
 CONSTRAINT [PK_AccountCharacter3] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[AccountCharacter3] ADD  CONSTRAINT [DF__AccountCh__MoveC3__7A3223E8]  DEFAULT ((0)) FOR [MoveCnt]
GO

ALTER TABLE [dbo].[AccountCharacter3] ADD  CONSTRAINT [df_AccountCharacter3_ExtClass]  DEFAULT ((0)) FOR [ExtClass]
GO

ALTER TABLE [dbo].[AccountCharacter3] ADD  DEFAULT ((0)) FOR [ExtWarehouse]
GO


