CREATE DATABASE BookShop
USE BookShop
CREATE TABLE Books
(
	Id int identity PRIMARY KEY,
	Name nvarchar(20) NOT NULL CHECK(Len(Name) >2),
	AuthorName nvarchar(20) DEFAULT 'Anonymous' CHECK(Len(AuthorName)>2),
	PageCount int CHECK(PageCount between 5 and 2000),
	Price float CHECK(Price >= 0)
)
INSERT INTO Books VALUES
(N'Səfillər','George',35,10.5),
(N'Lovely Bones',N'James',35,10.5),
(N'ADSHGD',N'Akif',20,10.5)

UPDATE Books 
Set Price = 45
WHERE PageCount > 30

SELECT * FROM Books
WHERE  AuthorName = 'George'

DELETE  FROM Books
WHERE PageCount <30