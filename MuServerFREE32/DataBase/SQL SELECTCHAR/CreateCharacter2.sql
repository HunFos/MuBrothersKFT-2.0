USE [MuOnline]
GO

/****** Object:  StoredProcedure [dbo].[WZ_CreateCharacter2]    Script Date: 05/04/2021 22:18:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO




CREATE Procedure [dbo].[WZ_CreateCharacter2] 
	@AccountID		varchar(10),		--// 계정 정보 
	@Name			varchar(10),		--// 캐릭터 
	@Class			tinyint			--// Class Type
AS
Begin

	SET NOCOUNT ON
	SET	XACT_ABORT ON
	DECLARE		@Result		tinyint

	--//  결과값 초기화 
	SET @Result = 0x00	

	--====================================================================================
	--	 캐릭터 존재여부 확인 
	--====================================================================================
	If EXISTS ( SELECT  Name  FROM  Character WHERE Name = @Name )
	begin
		SET @Result	= 0x01				--// 동일 캐릭터명 존재 						
		GOTO ProcEnd						
	end 

	BEGIN TRAN
	--====================================================================================
	--	 계정 존재 여부 확인  및 빈 슬롯 정보 확인하여 저장 		
	--====================================================================================
	If NOT EXISTS ( SELECT  Id  FROM  AccountCharacter2 WHERE Id = @AccountID )
		begin
			INSERT INTO dbo.AccountCharacter2(Id, GameID1, GameID2, GameID3, GameID4, GameID5, GameIDC) 
			VALUES(@AccountID, @Name, NULL, NULL, NULL, NULL, NULL)
			SET @Result  = @@Error
		end 
	else
		begin
			--// 캐릭터 빈 슬롯 설정 
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
				--// 해당 빈 슬롯 정보가 존재 하지 않다. 	
				begin					
					SET @Result	= 0x03							
					GOTO TranProcEnd								
				end 			 
		end 

	
	

	--====================================================================================
	--	 캐릭터 정보 저장 
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

	--  결과값 반환 처리 

	-- 0x00 : 캐릭터 존재, 0x01 : 성공완료, 0x02 : 캐릭터 생성 실패 , 0x03 : 빈슬롯 존재하지 않는다   
	--====================================================================================
	SELECT
	   CASE @Result
	      WHEN 0x00 THEN 0x01		--// 성공 반환 
	      WHEN 0x01 THEN 0x00		--// 캐릭터 존재 
	      WHEN 0x03 THEN 0x03		--// 빈슬롯이 존재하지 않는다. 
	      ELSE 0x02				--// 기타 에러코드는 생성 샐패 반환  
	   END AS Result 
End



GO


