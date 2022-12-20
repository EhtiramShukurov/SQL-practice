--CREATE DATABASE AB101
--USE AB101
--CREATE TABLE Students
--(
--	Id int identity PRIMARY KEY,
--	Name nvarchar(20) NOT NULL CHECK(len(Name) >= 3),
--	Surname nvarchar(30) DEFAULT 'XXX',
--	Age int CHECK(Age between 18 and 50),
--	AvgPoint float CHECK(AvgPoint between 0 and 100)
--)
--INSERT INTO Students VALUES
--(N'Ehtiram',N'Şükürov',19,88.6),
--(N'Elvin',N'Məlikov',20,77),
--(N'Amil',N'Vəliyev',22,98),
--(N'Ruslan',N'Rüstəmov',24,45.6),
--(N'Abdi',N'Səlimov',19,53),
--(N'Ali',N'Rəsulov',21,82.5)

--QUERY 1
--SELECT * FROM Students
--WHERE AvgPoint >51

--QUERY 2
--SELECT * FROM Students
--WHERE AvgPoint between 51 and 90

--QUERY 3
--SELECT * FROM Students
--WHERE Name like 'a%i'

--QUERY 4
--SELECT * FROM Students
--WHERE Name like '%i_'