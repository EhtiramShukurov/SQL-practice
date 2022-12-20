--CREATE DATABASE Spotifyy
--USE Spotifyy

--CREATE TABLE Roles
--(
--	Id int identity PRIMARY KEY,
--	Type nvarchar(15) NOT NULL UNIQUE
--)
--CREATE TABLE Users
--(
--	Id int identity PRIMARY KEY,
--	Name nvarchar(20) NOT NULL CHECK(LEN(Name)>2),
--	Surname nvarchar(25)  DEFAULT '---' CHECK(LEN(Surname)>2),
--	Username nvarchar(25) NOT NULL UNIQUE CHECK(LEN(Username)>5),
--	Password nvarchar(20) NOT NULL CHECK(LEN(Password)>7),
--	Gender varchar(6) DEFAULT '---',
--	RoleId int REFERENCES Roles(Id)
--)

--CREATE TABLE Categories
--(
--	Id int identity PRIMARY KEY,
--	Name nvarchar(15) UNIQUE DEFAULT 'Non-genre'
--)
--CREATE TABLE Musics
--(
--	Id int identity PRIMARY KEY,
--	Name nvarchar(30) NOT NULL,
--	Duration time NOT NULL,
--	CategoryId int REFERENCES Categories(Id)
--)
--CREATE TABLE Artists
--(
--	Id int identity PRIMARY KEY,
--	Name nvarchar(20) NOT NULL CHECK(LEN(Name)>0),
--	Surname nvarchar(25)  DEFAULT '---' CHECK(LEN(Surname)>0),
--	Birthday DATE NOT NULL,
--	Gender nvarchar(6) DEFAULT '---'
--)

--CREATE TABLE FullMusics
--(
--	Id int identity PRIMARY KEY,
--	MusicId int REFERENCES Musics(Id),
--	ArtistId int REFERENCES Artists(Id)
--)
--CREATE TABLE Playlists
--(
--	Id int identity PRIMARY KEY,
--	UserId int REFERENCES Users(Id),
--	Name nvarchar(20) DEFAULT 'New Playlist'
--)
--CREATE TABLE PlaylistMusics
--(
--	Id int identity PRIMARY KEY,
--	PlaylistId int REFERENCES Playlists(Id),
--	MusicId int REFERENCES Musics(Id)
--)

--INSERT INTO Roles VALUES
--('User'),('Admin'),('Editor'),('Artist')

--INSERT INTO Users VALUES
--('Ehtiram','Shukurov','Ehtiram00','ehtiram2003','male',1),
--('Jacob','Lanor','Jacob23','janor123','male',3),
--('Lucy','Lawrence','Lucyy.','lucy1990!','female',2),
--('Mandy','Owens','MandyOwen','owens0!0','female',1)

--INSERT INTO Artists (Name,Birthday,Gender)  VALUES
--('The Weekend','1990-02-16','male')

--INSERT INTO Artists  VALUES
--('Taylor','Swift','1989-12-13','female'),
--('Billie','Eilish','2001-12-18','female'),
--('Ed','Sheeran','1991-02-17','male')

--INSERT INTO Categories VALUES
--('Rock'),('Pop'),('Jazz'),('Electronic'),('Hip Hop')

--INSERT INTO Musics VALUES
--('COPYCAT','00:03:17',4),
--('Blinding Lights','00:03:21',4),
--('Run','00:04:01',2),
--('Bad Habits','00:03:52',3),
--('Dark Times','00:04:26',5),
--('Anti-Hero','00:05:10',2)

--INSERT INTO FullMusics VALUES
--(1,4),(2,1),(2,3),(3,3),(4,3),(4,4),(5,1),(6,2)

--INSERT INTO Playlists VALUES
--(3,'Favourites'),(3,'Tracks'),(4,'For Travel')

--INSERT INTO PlaylistMusics VALUES
--(2,1),(2,2),(2,6),
--(3,4),(3,5),(3,1),(3,3),
--(4,1),(4,5)

--------------------------------------------------------------------------------------------------------------

--CREATE MUSIC--

--CREATE PROCEDURE usp_CreateMusic (@Name nvarchar(20),@Duration time,@CategoryId int)
--AS
--BEGIN
--	INSERT INTO Musics VALUES
--	(@Name,@Duration,@CategoryId)
--END

--EXEC usp_CreateMusic @Name = 'After Dark',@Duration = '00:04:48',@CategoryId = 1

------------------------------------------------------------------------------------------

--CREATE USER----

--CREATE PROCEDURE usp_CreateUser (@Name nvarchar(20),@Surname nvarchar(25),@Username nvarchar(25),
--@Password nvarchar(20),@Gender varchar(6),@RoleId int)
--AS
--BEGIN
--	INSERT INTO Users VALUES
--	(@Name,@Surname,@Username,@Password,@Gender,@RoleId)
--END

--EXEC usp_CreateUser @Name = 'James',@Surname = 'Nelson',@Username = 'James0',
--@Password = 'nelsonja12',@Gender = 'male',@RoleId =3

------------------------------------------------------------------------------------------
--CREATE CATEGORY--

--CREATE PROCEDURE usp_CreateCategory (@Name nvarchar(15))
--AS
--BEGIN
--	INSERT INTO Categories VALUES
--	(@Name)
--END

--EXEC usp_CreateCategory 'R&B'


------------------------------------------------------------------------------------------

--ALTER TABLE Musics
--ADD DeletedTime datetime

--CREATE TRIGGER UpdateInsteadOfDelete
--ON Musics
--INSTEAD OF DELETE
--AS
--BEGIN
--	DECLARE @Id int,@DeleteDate datetime
--	SELECT @Id = Id,@DeleteDate = DeletedTime FROM deleted
--		DELETE FullMusics WHERE MusicId =@Id
--		DELETE PlaylistMusics WHERE MusicId = @Id
--		IF (@DeleteDate is NULL)
--		UPDATE Musics
--		SET DeletedTime = GETUTCDATE()
--		WHERE Id = @Id
--	ELSE 
--	DELETE Musics WHERE Id = @Id
--END

--DELETE Musics WHERE Id = 4