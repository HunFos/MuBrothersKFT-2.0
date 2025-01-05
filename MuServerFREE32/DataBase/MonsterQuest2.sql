USE [MuOnline]
GO

/****** Object:  StoredProcedure [dbo].[EX_MONSTERQUEST_SAVE]    Script Date: 11/27/2021 13:42:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[EX_MONSTERQUEST_SAVE]
	@szName			VARCHAR(10),
	@QuestNum		INT,
	@QuestKill_1	INT,
	@QuestKill_2	INT,
	@QuestKill_3	INT,
	@QuestKill_4	INT,
	@QuestKill_5	INT
AS
	SET NOCOUNT ON

	UPDATE Character SET
	QuestNum			= @QuestNum,
	QuestKill_1			= @QuestKill_1,
	QuestKill_2			= @QuestKill_2,
	QuestKill_3			= @QuestKill_3,
	QuestKill_4			= @QuestKill_4,
	QuestKill_5			= @QuestKill_5
	WHERE Name = @szName;
	
	SET NOCOUNT OFF
GO

