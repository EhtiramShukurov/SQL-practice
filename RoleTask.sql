--CREATE DATABASE TASK2
--USE TASK2
--CREATE TABLE Users
--(
--	Id int identity PRIMARY KEY,
--	Username nvarchar(20) NOT NULL CHECK(LEN(Username) > 5),
--	Password nvarchar(20) NOT NULL CHECK(LEN(Password) > 6),
--	RoleId int REFERENCES Roles(Id)
--)

--CREATE TABLE Roles
--(
--	Id int identity PRIMARY KEY,
--	Name nvarchar(15) NOT NULL UNIQUE CHECK(LEN(Name) > 2)
--)

--INSERT INTO Roles VALUES
--('Analyst'),
--('Coordinator'),
--('Technician'),
--('Administrator')

--INSERT INTO Users VALUES
--('Jamess','james123.',1),
--('Rachel','lech5853',4),
--('Angela','qwas123!.',3),
--('Philip','philli12p',2)

--SELECT u.Username,r.Name [RoleName] FROM Users as u
--JOIN Roles as r
--ON u.RoleId = r.Id

