--CREATE DATABASE Sales
--USE Sales

--CREATE TABLE Positions
--(
--	Id int identity PRIMARY KEY,
--	Name nvarchar(20) UNIQUE NOT NULL CHECK(LEN(Name)>2)
--)
--CREATE TABLE Branches
--(
--	Id int identity PRIMARY KEY,
--	Name nvarchar(20) UNIQUE NOT NULL CHECK(LEN(Name)>2)
--)
--CREATE TABLE Employees
--(
--	Id int identity PRIMARY KEY,
--	Name nvarchar(20)  NOT NULL CHECK(LEN(Name)>2),
--	Surname nvarchar(20)  NOT NULL DEFAULT 'XXXX' CHECK(LEN(Surname)>4),
--	FatherName nvarchar(20)  NOT NULL CHECK(LEN(FatherName)>2),
--	Salary decimal(6,2) CHECK(Salary >=300),
--	PositionId int REFERENCES Positions(Id),
--	BranchId int REFERENCES Branches(Id)
--)
--CREATE TABLE Products
--(
--	Id int identity PRIMARY KEY,
--	Name nvarchar(20)  NOT NULL DEFAULT 'XXX',
--	PurchasePrice decimal(6,2) NOT NULL CHECK(PurchasePrice >=0),
--	SalePrice decimal(6,2) NOT NULL CHECK(SalePrice >=0)
--)
--CREATE TABLE Sales
--(
--	Id int identity PRIMARY KEY,
--	SaleDate smalldatetime NOT NULL,
--	EmployeeId int REFERENCES Employees(Id),
--	ProductId int REFERENCES Products(Id),
--	BranchId int REFERENCES Branches(Id)
--)

--INSERT INTO Sales VALUES
--('2022-12-18',1,1,1),('2022-12-18',1,3,2),('2022-12-18',2,4,3),
--('2022-12-18',3,2,1),('2022-12-18',3,1,1),('2022-12-01',4,1,1),
--('2022-12-06',2,4,4),('2022-10-25',1,3,3)

--INSERT INTO Positions VALUES
--('Manager'),('Administrator'),('SalesPerson')

--INSERT INTO Branches VALUES
--('Texas'),('Florida'),('Ohio'),('Georgia')

--INSERT INTO Employees VALUES
--('Rick','Novak','Jeff',400,3,1),
--('Susan','Connor','Melvin',800,1,2),
--('Margaret','Adelman','Roger',400,3,1),
--('Sam','Wilson','Bill',500,2,2),
--('Peter','White','Bob',700,2,3)

--INSERT INTO Products VALUES
--('Box Tape',12.50,16.30),
--('Shampoo',15,23.50),
--('Microwave',170,260),
--('Toaster',53,81)

--Query 1--
--SELECT e.Name [Employee],p.Name [Product],b.Name [Branch],p.PurchasePrice,p.SalePrice FROM Sales as s
--JOIN Employees as e
--ON s.EmployeeId = e.Id
--JOIN Products as p
--ON s.ProductId = p.Id
--JOIN Branches as b
--ON s.BranchId = b.Id
--GROUP BY e.Name,p.Name,b.Name,p.PurchasePrice,p.SalePrice

--Query 2--
--SELECT SUM(p.SalePrice)[Overall Sales] FROM Sales as s
--JOIN Products as p
--ON s.ProductId = p.Id

--Query 3--
--SELECT SUM(p.SalePrice)[Monthly Sales] FROM Sales as s
--JOIN Products as p
--ON s.ProductId = p.Id
--WHERE DATEPART (MONTH, s.SaleDate) = DATEPART (MONTH, GETDATE()) AND
--DATEPART (YEAR, s.SaleDate) = DATEPART (YEAR, GETDATE())

--Query 4--
--SELECT e.Name [Employee],COUNT(p.Name) [SaleCount] from Sales as s
--JOIN Employees as e
--ON s.EmployeeId = e.Id
--JOIN Products as p
--ON s.ProductId = p.Id
--GROUP BY e.Name

--Query 5--

--SELECT TOP(1)  b.Name [Branch],COUNT(p.Name) [SaleCount] FROM Sales as s 
--JOIN Branches as b
--ON s.BranchId = b.Id
--JOIN Products as p
--ON s.ProductId = p.Id
--WHERE CONVERT(date,s.SaleDate) = Convert(date, getdate())
--GROUP BY b.Name
--ORDER BY COUNT(p.Name) DESC


--ALTERNATIVE QUERY 5--

--SELECT b.Name [Branch],COUNT(p.Name) [SaleCount] FROM Sales as s 
--JOIN Branches as b
--ON s.BranchId = b.Id
--JOIN Products as p
--ON s.ProductId = p.Id
--WHERE CONVERT(date,s.SaleDate) = Convert(date, getdate())
--GROUP BY b.Name
--HAVING Count(p.Name) = (SELECT TOP(1) COUNT(p.Name) [SaleCount] FROM Sales as s 
--JOIN Branches as b
--ON s.BranchId = b.Id
--JOIN Products as p
--ON s.ProductId = p.Id
--WHERE CONVERT(date,s.SaleDate) = Convert(date, getdate())
--GROUP BY b.Name
--ORDER BY COUNT(p.Name) DESC)


--Query 6--
--SELECT TOP(1) p.Name [Product],COUNT(p.Name) [ProductCount] FROM Sales as s
--JOIN Products as p
--ON s.ProductId = p.Id
--WHERE DATEPART (MONTH, s.SaleDate) = DATEPART (MONTH, GETDATE()) AND
--DATEPART (YEAR, s.SaleDate) = DATEPART (YEAR, GETDATE())
--GROUP BY p.Name
--ORDER BY COUNT(p.Name) DESC


--ALTERNATIVE QUERY 6--
--SELECT  p.Name [Product],COUNT(p.Name) [ProductCount] FROM Sales as s
--JOIN Products as p
--ON s.ProductId = p.Id
--WHERE DATEPART (MONTH, s.SaleDate) = DATEPART (MONTH, GETDATE()) AND
--DATEPART (YEAR, s.SaleDate) = DATEPART (YEAR, GETDATE())
--GROUP BY p.Name
--HAVING COUNT(p.Name) = (SELECT TOP(1) COUNT(p.Name) [ProductCount] FROM Sales as s
--JOIN Products as p
--ON s.ProductId = p.Id
--WHERE DATEPART (MONTH, s.SaleDate) = DATEPART (MONTH, GETDATE()) AND
--DATEPART (YEAR, s.SaleDate) = DATEPART (YEAR, GETDATE())
--GROUP BY p.Name
--ORDER BY COUNT(p.Name) DESC)