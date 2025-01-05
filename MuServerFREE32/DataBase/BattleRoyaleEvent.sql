USE MUONLINE
GO
alter table [Character] add [CTCTime] int not null default(0)
alter table [Character] add [CTCRegDay] int not null default(0)