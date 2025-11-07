-- =============================================
-- Brunon
-- Socha
-- 233861
-- =============================================

-- =============================================
-- Zadanie 1
-- =============================================

-- Zwraca dane.

-- =============================================
-- Zadanie 2
-- =============================================

DECLARE @Litera CHAR(1);
DECLARE @Cyfra INT;
SET @Litera = 'B';
SET @Cyfra = 1;
SELECT CustomerID, FirstName, LastName FROM SalesLT.Customer WHERE LastName LIKE @Litera + '%' AND CustomerID % 10 = @Cyfra;
GO

-- =============================================
-- Zadanie 3
-- =============================================

DECLARE @Produkty TABLE (ProductID INT, Name NVARCHAR(50), ListPrice MONEY);
INSERT INTO @Produkty SELECT ProductID, Name, ListPrice FROM SalesLT.Product WHERE Name LIKE '%B%';
SELECT * FROM @Produkty;
GO

-- =============================================
-- Zadanie 4
-- =============================================

SELECT c.CustomerID, c.FirstName, c.LastName, a.City INTO #KlienciMiasta FROM SalesLT.Customer AS c JOIN SalesLT.CustomerAddress AS ca ON c.CustomerID = ca.CustomerID LEFT JOIN SalesLT.Address AS a ON ca.AddressID = a.AddressID WHERE a.City LIKE 'B%';
SELECT * FROM #KlienciMiasta;
DROP TABLE #KlienciMiasta;
GO
-- W poleceniu była prośba o pobranie danych przez CustomerAddress oraz SalesLT.Address - ale brakowało tam FirstName oraz LastName.

-- =============================================
-- Zadanie 5
-- =============================================

CREATE SCHEMA Student_861 AUTHORIZATION db_owner;
GO
SELECT p.ProductID, p.Name, c.Name AS Category, p.ListPrice INTO Student_861.ProduktyB FROM SalesLT.Product AS p JOIN SalesLT.ProductCategory AS c ON p.ProductCategoryID = c.ProductCategoryID WHERE c.Name LIKE '%B%';

GO

-- =============================================
-- Zadanie 6
-- =============================================

DECLARE @Podsumowanie TABLE (Category NVARCHAR(100), SredniaCena MONEY);
INSERT INTO @Podsumowanie (Category, SredniaCena) SELECT pc.Name, AVG(p.ListPrice) FROM SalesLT.ProductCategory AS pc JOIN SalesLT.Product AS p ON pc.ProductCategoryID = p.ProductCategoryID WHERE pc.ProductCategoryID % 10 = 1 GROUP BY pc.Name;
SELECT * FROM @Podsumowanie;
GO

-- =============================================
-- Zadanie 7
-- =============================================
CREATE SCHEMA "233861" AUTHORIZATION db_owner;
ALTER SCHEMA "233861" TRANSFER SalesLT.Customer;
GO 
ALTER SCHEMA "233861" TRANSFER SalesLT.CustomerAddress;
GO
