USE [MuOnline]
GO

/****** Object:  StoredProcedure [dbo].[EX_MONSTERQUEST_LOAD]    Script Date: 11/27/2021 13:42:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[EX_MONSTERQUEST_LOAD]
	@szName			VARCHAR(10)
AS
	SET NOCOUNT ON

	SELECT 
	QuestNum,
	QuestKill_1,
	QuestKill_2,
	QuestKill_3,
	QuestKill_4,
	QuestKill_5
	FROM Character WHERE Name = @szName;
	
	SET NOCOUNT OFF
GO

