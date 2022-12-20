--CREATE DATABASE UNI
--USE UNI
CREATE TABLE Groups
(
	Id int identity PRIMARY KEY,
	Name nvarchar(15) NOT NULL
)
CREATE TABLE Students
(
	Id int identity PRIMARY KEY,
	Name nvarchar(20) NOT NULL,
	GroupId int REFERENCES Groups(Id)
)
Select s.Id,s.Name,s.GroupId FROM Students as s
JOIN Groups as g
ON s.GroupId = g.Id