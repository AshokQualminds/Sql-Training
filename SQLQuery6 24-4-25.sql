SELECT 
    p.FirstName + ' ' + p.LastName AS CustomerName,
    pr.Name AS ProductName,
    SUM(sod.OrderQty) AS TotalQuantityOrdered,
    COUNT(DISTINCT soh.SalesOrderID) AS TotalOrders,
    SUM(sod.LineTotal) AS TotalSalesAmount
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product AS pr ON sod.ProductID = pr.ProductID
INNER JOIN Sales.Customer AS c ON soh.CustomerID = c.CustomerID
INNER JOIN Person.Person AS p ON c.PersonID = p.BusinessEntityID
GROUP BY p.FirstName, p.LastName, pr.Name
ORDER BY CustomerName, ProductName;


SELECT *
  
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product AS pr ON sod.ProductID = pr.ProductID
INNER JOIN Sales.Customer AS c ON soh.CustomerID = c.CustomerID
INNER JOIN Person.Person AS p ON c.PersonID = p.BusinessEntityID


GROUP BY p.FirstName, p.LastName, pr.Name
ORDER BY CustomerName, ProductName;







SELECT 
    soh.OrderDate,
    YEAR(soh.OrderDate) AS OrderYear,
    MONTH(soh.OrderDate) AS OrderMonth,
    DAY(soh.OrderDate) AS OrderDay,
    sp.BusinessEntityID AS SalesPersonID,
    p.FirstName + ' ' + p.LastName AS SalesPerson,
    st.Name AS Region,
    pr.Name AS Product,
    pc.Name AS Category,
    sod.OrderQty,
    sod.LineTotal AS TotalAmount
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN Sales.SalesPerson sp ON soh.SalesPersonID = sp.BusinessEntityID
JOIN Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID
JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
JOIN Production.Product pr ON sod.ProductID = pr.ProductID
JOIN Production.ProductSubcategory psc ON pr.ProductSubcategoryID = psc.ProductSubcategoryID
JOIN Production.ProductCategory pc ON psc.ProductCategoryID = pc.ProductCategoryID
WHERE soh.OrderDate BETWEEN '2011-05-31' AND '2014-05-1'
