SELECT TOP 100
    sod.SalesOrderID,
    sod.SalesOrderDetailID,
    p.Name AS ProductName,
    pc.Name AS ProductCategory,
    psc.Name AS ProductSubcategory,
    pch.StandardCost,
    sod.OrderQty,
    sod.UnitPrice,
    soh.OrderDate,
    c.CustomerID,
    per.FirstName + ' ' + per.LastName AS CustomerName
FROM [Sales].[SalesOrderDetail] sod
JOIN [Production].[Product] p ON sod.ProductID = p.ProductID
LEFT JOIN [Production].[ProductSubcategory] psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
LEFT JOIN [Production].[ProductCategory] pc ON psc.ProductCategoryID = pc.ProductCategoryID
JOIN [Sales].[SalesOrderHeader] soh ON sod.SalesOrderID = soh.SalesOrderID
JOIN [Sales].[Customer] c ON soh.CustomerID = c.CustomerID
LEFT JOIN [Person].[Person] per ON c.PersonID = per.BusinessEntityID
LEFT JOIN [Production].[ProductCostHistory] pch 
    ON p.ProductID = pch.ProductID
    AND pch.EndDate IS NULL -- Current cost
ORDER BY soh.OrderDate DESC;

GO

 CREATE PROCEDURE usp_GetSalesOrderDetails1
    @ProductName NVARCHAR(100),
    @OrderDate DATE
AS
BEGIN
    SET NOCOUNT ON;

SELECT
sod.salesorderID,
sod.SalesOrderDetailID,
p.Name AS ProductName,
pc.Name AS ProductCategory,
psc.Name AS ProductSubcategory,
pch.StandardCost,
sod.OrderQty,
sod.UnitPrice,
soh.OrderDate,
c.CustomerID,
        per.FirstName + ' ' + per.LastName AS CustomerName
    FROM [Sales].[SalesOrderDetail] sod
    JOIN       [Production].[Product] p ON sod.ProductID = p.ProductID
    LEFT JOIN  [Production].[ProductSubcategory] psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    LEFT JOIN  [Production].[ProductCategory] pc ON psc.ProductCategoryID = pc.ProductCategoryID
    JOIN        [Sales].[SalesOrderHeader] soh ON sod.SalesOrderID = soh.SalesOrderID
    JOIN        [Sales].[Customer] c ON soh.CustomerID = c.CustomerID
    LEFT JOIN   [Person].[Person] per ON c.PersonID = per.BusinessEntityID
    LEFT JOIN  [Production].[ProductCostHistory] pch 
        ON p.ProductID = pch.ProductID
        AND pch.EndDate IS NULL -- Current cost
    WHERE p.Name LIKE '%' + @ProductName + '%'
      or CAST(soh.OrderDate AS DATE) = @OrderDate
    ORDER BY soh.OrderDate DESC;
END;

EXEC  usp_GetSalesOrderDetails  @productname ='sport',@OrderDate='2014-06-30'

EXEC  usp_GetSalesOrderDetails1  @productname ='sport',@OrderDate='2014-06-30'




