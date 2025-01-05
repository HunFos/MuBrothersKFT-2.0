USE [MuOnline]
GO

/****** Object:  StoredProcedure [dbo].[WZ_CreateCharacter2]    Script Date: 05/04/2021 22:18:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[WZ_CreateCharacter2] 
	@AccountID		varchar(10),		--// ���� ���� 
	@Name			varchar(10),		--// ĳ���� 
	@Class			tinyint			--// Class Type
AS
Begin

	SET NOCOUNT ON
	SET	XACT_ABORT ON
	DECLARE		@Result		tinyint

	--//  ����� �ʱ�ȭ 
	SET @Result = 0x00	

	--====================================================================================
	--	 ĳ���� ���翩�� Ȯ�� 
	--====================================================================================
	If EXISTS ( SELECT  Name  FROM  Character WHERE Name = @Name )
	begin
		SET @Result	= 0x01				--// ���� ĳ���͸� ���� 						
		GOTO ProcEnd						
	end 

	BEGIN TRAN
	--====================================================================================
	--	 ���� ���� ���� Ȯ��  �� �� ���� ���� Ȯ���Ͽ� ���� 		
	--====================================================================================
	If NOT EXISTS ( SELECT  Id  FROM  AccountCharacter2 WHERE Id = @AccountID )
		begin
			INSERT INTO dbo.AccountCharacter2(Id, GameID1, GameID2, GameID3, GameID4, GameID5, GameIDC) 
			VALUES(@AccountID, @Name, NULL, NULL, NULL, NULL, NULL)
			SET @Result  = @@Error
		end 
	else
		begin
			--// ĳ���� �� ���� ���� 
			Declare @g1 varchar(10), @g2 varchar(10), @g3 varchar(10), @g4 varchar(10), @g5 varchar(10)						
			SELECT @g1=GameID1, @g2=GameID2, @g3=GameID3, @g4=GameID4, @g5=GameID5 FROM dbo.AccountCharacter2 Where Id = @AccountID 			

			if( ( @g1 Is NULL) OR (Len(@g1) = 0))
				begin
					UPDATE AccountCharacter2 SET  GameID1 = @Name
					WHERE Id = @AccountID
										
					SET @Result  = @@Error
				end 
			else	 if( @g2  Is NULL OR Len(@g2) = 0)
				begin
					UPDATE AccountCharacter2 SET  GameID2 = @Name
					WHERE Id = @AccountID

					SET @Result  = @@Error
				end 
			else	 if( @g3  Is NULL OR Len(@g3) = 0)
				begin			
					UPDATE AccountCharacter2 SET  GameID3 = @Name
					WHERE Id = @AccountID

					SET @Result  = @@Error
				end 
			else	 if( @g4 Is NULL OR Len(@g4) = 0)
				begin
					UPDATE AccountCharacter2 SET  GameID4 = @Name
					WHERE Id = @AccountID

					SET @Result  = @@Error
				end 
			else	 if( @g5 Is NULL OR Len(@g5) = 0)
				begin
					UPDATE AccountCharacter2 SET  GameID5 = @Name
					WHERE Id = @AccountID

					SET @Result  = @@Error
				end 		
			else 
				--// �ش� �� ���� ������ ���� ���� �ʴ�. 	
				begin					
					SET @Result	= 0x03							
					GOTO TranProcEnd								
				end 			 
		end 

	
	

	--====================================================================================
	--	 ĳ���� ���� ���� 
	--====================================================================================
	if( @Result <> 0 )
		begin
			GOTO TranProcEnd		
		end 
	else
		begin
			INSERT INTO dbo.Character(AccountID, Name, cLevel, LevelUpPoint, Class, Strength, Dexterity, Vitality, Energy, Leadership, Inventory, MagicList, 
					Life, MaxLife, Mana, MaxMana, BP, MaxBP, Shield, MaxShield, MapNumber, MapPosX, MapPosY, MDate, LDate, Quest, DbVersion, EffectList )
			SELECT @AccountID As AccountID, @Name As Name, Level, LevelUpPoint, @Class As Class, 
				Strength, Dexterity, Vitality, Energy, Leadership, Inventory, MagicList, Life, MaxLife, Mana, MaxMana, 0, 0, 0, 0, MapNumber, MapPosX, MapPosY,
				getdate() As MDate, getdate() As LDate, Quest, DbVersion, EffectList
			FROM  DefaultClassType WHERE Class = @Class				

			SET @Result = @@Error
		end 

TranProcEnd:	-- GOTO
	IF ( @Result  <> 0 )
		ROLLBACK TRAN
	ELSE
		COMMIT	TRAN

ProcEnd:
	SET NOCOUNT OFF
	SET	XACT_ABORT OFF


	--====================================================================================

	--  ����� ��ȯ ó�� 

	-- 0x00 : ĳ���� ����, 0x01 : �����Ϸ�, 0x02 : ĳ���� ���� ���� , 0x03 : �󽽷� �������� �ʴ´�   
	--====================================================================================
	SELECT
	   CASE @Result
	      WHEN 0x00 THEN 0x01		--// ���� ��ȯ 
	      WHEN 0x01 THEN 0x00		--// ĳ���� ���� 
	      WHEN 0x03 THEN 0x03		--// �󽽷��� �������� �ʴ´�. 
	      ELSE 0x02				--// ��Ÿ �����ڵ�� ���� ���� ��ȯ  
	   END AS Result 
End



GO


