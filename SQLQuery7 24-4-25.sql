select TOP 1* from [Sales].[SalesOrderHeader]
select TOP 1* from [Sales].[SalesOrderDetail]
select top 1 * from[Production].[Product]
SELECT TOP 10* FROM [Sales].[Customer]
select top 10* from [Person].[Person]



select* from [Sales].[SalesOrderHeaderSalesReason]
SELECT TOP 1* FROM [Sales].[Customer]
select * from [Person].[Person]
select top 1* from [Person].[BusinessEntity]
select top 1* from [Person].[BusinessEntityContact]
select top 1 * from [Production].[ProductSubcategory]
select top 1 * from[Production].[ProductCategory]
select top 1 * from[Production].[Product]

Sales.SalesOrderHeader -- contains the order-level info.

Sales.SalesOrderDetail ---contains product-level detail per order.

Production.Product 

Sales.Customer 

Person.Person 


select * from [Sales].[vSalesPersonSalesByFiscalYears]
SELECT FIRSTNAME , LASTNAME,FirstName+' '+LastName AS FULLNAME 
FROM 
PERSON.PERSON

SELECT SUBSTRING('ABCDEF',2,6)


SELECT  
P.FirstName+' '+P.LastName AS CUSTOMER_NAME,
PR.Name AS PRODUCT_NAME,
 
SUM(SOD.OrderQty) TOTAL_ORDER_QUANTITY,
SUM(SOD.LineTotal) TOTAL_AMOUNT ,
COUNT( soh.SalesOrderID) TOTAL_NO_ORDERS
FROM [Sales].[SalesOrderHeader] SOH
INNER JOIN 
[Sales].[SalesOrderDetail] SOD ON SOH.SalesOrderID=SOD.SalesOrderID
INNER JOIN 
[Production].[Product] PR ON SOD.ProductID= PR.ProductID
INNER JOIN 
[Sales].[Customer] SC ON SOH.CustomerID=SC.CustomerID
INNER JOIN 
[Person].[Person] P ON SC.PersonID=P.BusinessEntityID
-- WHERE PR.NAME ='Full-Finger Gloves, L'
GROUP BY P.FirstName,P.LastName,PR.Name, soh.SalesOrderID
ORDER BY TOTAL_ORDER_QUANTITY DESC




 CUSTOMER_NAME,PRODUCT_NAME,TOTAL_AMOUNT DESC
 WHERE PRODUCT_NAME=

INNER JOIN
[Sales].[SalesOrderHeaderSalesReason] SOHSR ON SOHSR.SalesOrderID=SOD.SalesOrderID
INNER JOIN 
[Sales].[Customer] SC ON SOH.CustomerID= SC.CustomerID
INNER JOIN
[Person].[BusinessEntityContact] PBEC ON PBEC.PersonID=SC.PersonID
INNER JOIN 
[Person].[BusinessEntity] PBE ON PBE.BusinessEntityID=PBEC.BusinessEntityID
INNER JOIN
[Person].[Person] P ON P.BusinessEntityID= PBEC.BusinessEntityID



SELECT YEAR(SOH.OrderDate) AS SALE_YEAR,MONTH(SOH.OrderDate) AS MONTH_SALES,---DAY(SOH.OrderDate) AS DAY_WISE_SALES,
--P.FirstName+' '+P.LastName AS CUSTOMER_NAME,SOH.OrderDate,
--PR.Name AS PRODUCT_NAME,--SOH.SalesOrderID,
SUM(SOD.OrderQty) TOTAL_ORDER_QUANTITY,
SUM(SOD.LineTotal) TOTAL_AMOUNT ,
COUNT( soh.SalesOrderID) TOTAL_NO_ORDERS
FROM [Sales].[SalesOrderHeader] SOH
INNER JOIN 
[Sales].[SalesOrderDetail] SOD ON SOH.SalesOrderID=SOD.SalesOrderID
INNER JOIN 
[Production].[Product] PR ON SOD.ProductID= PR.ProductID
INNER JOIN 
[Sales].[Customer] SC ON SOH.CustomerID=SC.CustomerID
INNER JOIN 
[Person].[Person] P ON SC.PersonID=P.BusinessEntityID
WHERE  SOH.OrderDate='2014'
GROUP BY YEAR(SOH.OrderDate),MONTH(SOH.OrderDate)---P.FirstName,P.LastName,PR.Name, soh.SalesOrderID,SOH.OrderDate,MONTH(SOH.OrderDate)
ORDER BY TOTAL_ORDER_QUANTITY DESC

SELECT 
    YEAR(sale_date) AS sale_year,
    SUM(sale_amount) AS total_sales
FROM 
    sales
GROUP BY 
    YEAR(sale_date)
ORDER BY 
    sale_year;

SELECT  
P.FirstName+' '+P.LastName AS CUSTOMER_NAME,
PR.Name AS PRODUCT_NAME,SOH.SalesOrderID,
SUM(SOD.OrderQty) TOTAL_ORDER_QUANTITY,
SUM(SOD.LineTotal) TOTAL_AMOUNT ,
COUNT( soh.SalesOrderID) TOTAL_NO_ORDERS
FROM [Sales].[SalesOrderHeader] SOH
INNER JOIN 
[Sales].[SalesOrderDetail] SOD ON SOH.SalesOrderID=SOD.SalesOrderID
INNER JOIN 
[Production].[Product] PR ON SOD.ProductID= PR.ProductID 
INNER JOIN 
[Sales].[Customer] SC ON SOH.CustomerID=SC.CustomerID
INNER JOIN 
[Person].[Person] P ON SC.PersonID=P.BusinessEntityID
 --WHERE PR.NAME ='All-Purpose Bike Stand'
GROUP BY P.FirstName,P.LastName,PR.Name, soh.SalesOrderID
ORDER BY TOTAL_ORDER_QUANTITY DESC



select * from [Sales].[SalesOrderHeader]
select * from [Sales].[SalesOrderDetail]
select* from [Sales].[SalesOrderHeaderSalesReason]
SELECT TOP 1* FROM [Sales].[Customer]
select top 1* from [Person].[Person]
select top 1* from [Person].[BusinessEntity]
select top 1* from [Person].[BusinessEntityContact]
select top 1 * from [Production].[ProductSubcategory]
select top 1 * from[Production].[ProductCategory]
select top 1 * from[Production].[Product]
Sales.SalesOrderHeader -- contains the order-level info.

Sales.SalesOrderDetail ---contains product-level detail per order.

Production.Product 

Sales.Customer 

Person.Person 


select * from [Sales].[vSalesPersonSalesByFiscalYears]


SELECT   DATEPART(YYYY,OrderDate) AS ORDERYEAR,*
FROM [Sales].[SalesOrderHeader] SOH
INNER JOIN 
[Sales].[SalesOrderDetail] SOD ON SOH.SalesOrderID=SOD.SalesOrderID
INNER JOIN
[Sales].[SalesOrderHeaderSalesReason] SOHSR ON SOHSR.SalesOrderID=SOD.SalesOrderID
INNER JOIN 
[Sales].[Customer] SC ON SOH.CustomerID= SC.CustomerID
INNER JOIN
[Person].[BusinessEntityContact] PBEC ON PBEC.PersonID=SC.PersonID
INNER JOIN 
[Person].[BusinessEntity] PBE ON PBE.BusinessEntityID=PBEC.BusinessEntityID
INNER JOIN
[Person].[Person] P ON P.BusinessEntityID= PBEC.BusinessEntityID





SELECT DATEPART(YYYY,OrderDate) AS ORDERYEAR
FROM [Sales].[SalesOrderHeader]

