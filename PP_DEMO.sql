go
create database [PP_DEMO]
go
use [PP_DEMO]
go

--Таблица должности--
CREATE TABLE [dbo].[Position]
(
[ID_Position] INT  NOT NULL PRIMARY KEY clustered identity(1,1),
[Name] VARCHAR(20)  NOT NULL,
	constraint [CH_Name] check ([Name] like  '%[А-Я, а-я]%'),
)

go
--Процедуры для должности--
create procedure [dbo].[Position_insert]
 @Name [varchar] (20)
as
	insert into [dbo].[Position] ([Name])
					  	 values (@Name)
go
create procedure [dbo].[Position_update]
@ID_Position [int],  @Name [varchar] (20)
as
	update [dbo].[Position] set 
	[Name] = @Name
	where [ID_Position] = @ID_Position
go
create procedure [dbo].[Position_delete]
@ID_Position [int]
as
	delete from [dbo].[Position] 
	where [ID_Position] = @ID_Position
--Процедуры для должности--
go
--Таблица статус--
CREATE TABLE [dbo].[Status]
(
[ID_Status] INT  NOT NULL PRIMARY KEY clustered identity(1,1),
[Name] VARCHAR(20)  NOT NULL unique,
	constraint [CH_Name1] check ([Name] like  '%[А-Я, а-я]%'),
)
go
--Процедуры для статуса--
create procedure [dbo].[Status_insert]
 @Name [varchar] (20)
as
	insert into [dbo].[Status] ([Name])
					  	 values (@Name)
go
create procedure [dbo].[Status_update]
@ID_Status [int],  @Name [varchar] (20)
as
	update [dbo].[Status] set 
	[Name] = @Name
	where [ID_Status] = @ID_Status
go
create procedure [dbo].[Status_delete]
@ID_Status [int]
as
	delete from [dbo].[Status] 
	where [ID_Status] = @ID_Status
--Процедуры для статуса--
go
--Таблица авторизации--
CREATE TABLE [dbo].[Authorization]
(
[ID_Authorization] INT  NOT NULL PRIMARY KEY clustered identity(1,1),
[Login] VARCHAR(16)  NOT NULL unique,
[Password] VARCHAR(16)  NOT NULL,
	constraint [CH_Login] check (len([Login]) >= 8),
	constraint [CH_Password] check (len([Password]) >= 8),
)

go
--Таблица персонал--
CREATE TABLE [dbo].[Staff]
(
[ID_Staff] INT  NOT NULL PRIMARY KEY clustered identity(1,1),
[Surname] VARCHAR(20)  NOT NULL,
[Name] VARCHAR(20)  NOT NULL,
[MiddleName] VARCHAR(20)  NOT NULL,
[Birthdate] VARCHAR(10)  NOT NULL,
[Authorization_ID] INT  NOT NULL,
[Position_ID] INT NULL,
	constraint [CH_Surname] check ([Surname] like  '%[А-Я, а-я]%'),
	constraint [CH_Name2] check ([Name] like '%[А-Я, а-я]%'),
	constraint [CH_MiddleName] check ([MiddleName] like '%[А-Я, а-я]%'),
	constraint [FK_Staff1] foreign key ([Authorization_ID]) references [dbo].[Authorization] ([ID_Authorization])
		on update cascade 
		on delete cascade,
	constraint [FK_Staff2] foreign key ([Position_ID]) references [dbo].[Position] ([ID_Position])
		on update cascade 
		on delete cascade,
)

go
--Процедуры для персонала--
create procedure [dbo].[Staff_insert]
@Surname [VARCHAR](20), @Name [VARCHAR](20), @MiddleName [VARCHAR](20), @Birthdate [VARCHAR](10), @Authorization_ID [int], @Position_ID [int]
as
	insert into [dbo].[Staff] ([Surname] , [Name], [MiddleName], [Birthdate], [Authorization_ID], [Position_ID])
					  	 values (@Surname, @Name, @MiddleName, @Birthdate, @Authorization_ID, @Position_ID)
go
create procedure [dbo].[Staff_update]
@ID_Staff [int], @Surname [VARCHAR](20), @Name [VARCHAR](20), @MiddleName [VARCHAR](20), @Birthdate [VARCHAR](10), @Authorization_ID [int], @Position_ID [int]
as
	update [dbo].[Staff] set 
	[Surname] = @Surname ,
	[Name] = @Name,
	[MiddleName] = @MiddleName,
	[Birthdate] = @Birthdate,
	[Authorization_ID] = @Authorization_ID,
	[Position_ID] = @Position_ID
	where [ID_Staff] = @ID_Staff
go
create procedure [dbo].[Staff_delete]
@ID_Staff [int]
as
	delete from [dbo].[Staff] 
	where [ID_Staff] = @ID_Staff

--Процедуры для персонала--
go
--Таблица список сотрудников--
CREATE TABLE [dbo].[StaffList]
(
[ID_StaffList] INT  NOT NULL PRIMARY KEY clustered identity(1,1),
[Status_ID] INT  NOT NULL,
[Staff_ID] INT  NOT NULL,
constraint [FK_StaffList1] foreign key ([Status_ID]) references [dbo].[Status] ([ID_Status])
	on update cascade 
	on delete cascade,
constraint [FK_StaffList2] foreign key ([Staff_ID]) references [dbo].[Staff] ([ID_Staff])
	on update cascade 
	on delete cascade,
)
go
--Процедуры для списка сотрудников--
create procedure [dbo].[StaffList_insert]
 @Status_ID [int], @Staff_ID [int]
as
	insert into [dbo].[StaffList] ([Status_ID], [Staff_ID])
					  	 values (@Status_ID, @Staff_ID)
go
create procedure [dbo].[StaffList_update]
@ID_StaffList [int],  @Status_ID [int], @Staff_ID [int]
as
	update [dbo].[StaffList] set 
	[Status_ID] = @Status_ID,
	[Staff_ID] = @Staff_ID
	where [ID_StaffList] = @ID_StaffList
go
create procedure [dbo].[StaffList_delete]
@ID_StaffList [int]
as
	delete from [dbo].[StaffList] 
	where [ID_StaffList] = @ID_StaffList
--Процедуры для списка сотрудников--
go
--Регистрация пользователя
create procedure [Users_Registration]
@Login [varchar] (16), @Password [varchar] (16), @Name1 [varchar] (20), @Surname [VARCHAR](20), @Name [VARCHAR](20),
 @MiddleName [VARCHAR](20), @Birthdate [VARCHAR](10)
 as
    insert into [dbo].[Authorization] ([Login], [Password] )
    values (@Login, @Password)
    select @@identity
	 insert into [dbo].[Position]([Name])
    values (@Name1)
    select @@identity
    insert into [dbo].[Staff] ([Surname], [Name], [MiddleName], [Birthdate], [Authorization_ID], [Position_ID])
    values (@Surname, @Name, @MiddleName, @Birthdate, @@identity, @@identity)
go
--Добавление пользователя
create procedure [Users_insert]
@Login [varchar] (16), @Password [varchar] (16), @Name1 [varchar] (20), @Surname [VARCHAR](20), @Name [VARCHAR](20),
 @MiddleName [VARCHAR](20), @Birthdate [VARCHAR](10)
 as
    insert into [dbo].[Authorization] ([Login], [Password] )
    values (@Login, @Password)
    select @@identity
	 insert into [dbo].[Position]([Name])
    values (@Name1)
    select @@identity
    insert into [dbo].[Staff] ([Surname], [Name], [MiddleName], [Birthdate], [Authorization_ID], [Position_ID])
    values (@Surname, @Name, @MiddleName, @Birthdate, @@identity, @@identity)
go

--Редактирование пользователя

go
create procedure [Users_update]
@ID_Staff [int], @Login [varchar] (16), @Password [varchar] (16), @Name1 [varchar] (20), @Surname [VARCHAR](20), @Name [VARCHAR](20),
 @MiddleName [VARCHAR](20), @Birthdate [VARCHAR](10)
 as   
	update [dbo].[Staff] set 
	[Surname] = @Surname ,
	[Name] = @Name,
	[MiddleName] = @MiddleName,
	[Birthdate] = @Birthdate
	where [ID_Staff] = @ID_Staff
	declare @ID_Authorization int = (select [Authorization_ID] from [Staff] where [ID_Staff] = @ID_Staff)
	update [dbo].[Authorization] set
	[Login] = @Login,
	[Password] = @Password
	where [ID_Authorization] = @ID_Authorization
	declare @ID_Position int = (select [Position_ID] from [Staff] where [ID_Staff] = @ID_Staff)
	update [dbo].[Position] set
	[Name] = @Name1
	where [ID_Position] = @ID_Position
go

create procedure [Users_delete]
@ID_Staff [int], @Authorization_ID [int], @Position_ID [int]
as
	delete from [dbo].[Staff]
	where [ID_Staff] = @ID_Staff
	delete from [dbo].[Authorization]
	where [ID_Authorization] = @Authorization_ID
	delete from [dbo].[Position]
	where [ID_Position] = @Position_ID
go

create view [Fio_View]
as
select [ID_Staff], [Surname] + ' ' + [Name] + ' ' + [MiddleName] as 'ФИО' from [dbo].[Staff]
go