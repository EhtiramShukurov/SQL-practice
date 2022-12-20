--CREATE DATABASE TASK3
--USE TASK3

--CREATE TABLE Categories
--(
--	Id int identity PRIMARY KEY,
--	Name varchar(20) NOT NULL CHECK(LEN(Name) >3),
--	ParentCategoryId int DEFAULT NULL
--)

--INSERT INTO Categories (Name) VALUES
--('Dairy'),
--('Beverages'),
--('Hygiene'),
--('Packaged Goods')

--INSERT INTO Categories VALUES
--('asdf',null)
--('Milk',1),
--('Lotion',3),
--('Apple Juice',2),
--('Shampoo',3),
--('Chips',4),
--('Cereal',4),
--('Coca-Cola',2)

--SELECT c1.Name [Product],c2.Name [ParentCategory] FROM Categories as c1
--JOIN Categories as c2
--ON c2.id = c1.ParentCategoryId
