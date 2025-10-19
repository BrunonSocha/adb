-- =============================================
-- Brunon
-- Socha
-- 233861
-- =============================================

-- =============================================
-- Zadanie 1
-- =============================================
SELECT * FROM SalesLT.Customer WHERE LastName LIKE 'b%';
GO

-- =============================================
-- Zadanie 2
-- =============================================
SELECT FirstName, LastName, EmailAddress FROM SalesLT.Customer WHERE CustomerID LIKE '%1';
GO

-- =============================================
-- Zadanie 3
-- =============================================
SELECT Name, ListPrice, ProductNumber FROM SalesLT.Product WHERE Name LIKE '%b%' ORDER BY ListPrice DESC;
GO

-- =============================================
-- Zadanie 4
-- =============================================
SELECT AVG(ListPrice) as AvgListPrice FROM SalesLT.Product WHERE ProductCategoryID % 10 = 1;
GO

-- =============================================
-- Zadanie 5
-- =============================================
SELECT DISTINCT a.City FROM SalesLT.CustomerAddress ca JOIN SalesLT.Address a ON ca.AddressID = a.AddressID JOIN SalesLT.Customer c ON ca.CustomerID = c.CustomerID WHERE a.City LIKE 'b%';
GO

-- =============================================
-- Zadanie 6
-- =============================================
INSERT INTO SalesLT.Customer (FirstName, LastName, CompanyName, EmailAddress, PasswordHash, PasswordSalt) VALUES ('Brunon', 'Socha', 'Lab1', 'brunon.socha@lab1.com', 'x', 'x');
GO
SELECT FirstName, LastName, CompanyName, EmailAddress FROM SalesLT.Customer WHERE FirstName = 'Brunon' AND LastName = 'Socha' AND CompanyName = 'Lab1' AND EmailAddress = 'brunon.socha@lab1.com';
GO

-- =============================================
-- Zadanie 7
-- =============================================
INSERT INTO SalesLT.ProductCategory (Name) VALUES ('Special-B'),('Extra-1');
GO

-- =============================================
-- Zadanie 7
-- =============================================
CREATE TABLE IF NOT EXISTS SalesLT.ProductsCategoriesY (NVARCHAR(30) Name NOT NULL, INT ProductNumber NOT NULL, ProductCategory PRIMARY KEY, NVARCHAR(6) OwnerId DEFAULT '233861');
GO