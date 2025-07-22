-- 1. Create two tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(50)
)+ADs-

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)+ADs-

-- 2. Insert data into tables
INSERT INTO Customers (CustomerID, Name, Country) VALUES
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'USA')+ADs-

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount) VALUES
(101, 1, '2024-01-15', 250.00),
(102, 1, '2024-02-10', 150.50),
(103, 2, '2024-03-05', 300.00),
(104, 3, '2024-03-15', 200.00)+ADs-

-- 3. Select basic data
SELECT +ACo- FROM Customers+ADs-
SELECT +ACo- FROM Orders+ADs-

-- 4. Filtering with WHERE
SELECT +ACo- FROM Orders WHERE Amount +AD4- 200+ADs-

-- 5. Ordering results
SELECT +ACo- FROM Orders ORDER BY Amount DESC+ADs-

-- 6. Joining tables
SELECT o.OrderID, c.Name, o.Amount
FROM Orders o
JOIN Customers c ON o.CustomerID +AD0- c.CustomerID+ADs-

-- 7. Grouping and aggregation
SELECT CustomerID, SUM(Amount) AS TotalSpent
FROM Orders
GROUP BY CustomerID+ADs-

-- 8. Filtering groups with HAVING
SELECT CustomerID, SUM(Amount) AS TotalSpent
FROM Orders
GROUP BY CustomerID
HAVING SUM(Amount) +AD4- 300+ADs-

-- 9. Update data
UPDATE Customers
SET Country +AD0- 'Canada'
WHERE Name +AD0- 'Alice'+ADs-

-- 10. Delete data
DELETE FROM Orders
WHERE Amount +ADw- 200+ADs-

-- 11. Drop tables (cleanup)
DROP TABLE Orders+ADs-
DROP TABLE Customers+ADs-


-- 1. Create tables with constraints and identity
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) UNIQUE,
    Country NVARCHAR(50) DEFAULT 'USA',
    CreatedAt DATETIME DEFAULT GETDATE()
)+ADs-

SELECT +ACo- FROM Customers+ADs-

CREATE TABLE Orders (
    OrderID INT IDENTITY(100,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE DEFAULT GETDATE(),
    Amount DECIMAL(10,2),
    Status NVARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)+ADs-

SELECT +ACo- FROM Orders+ADs-

-- 2. Insert sample data
INSERT INTO Customers (Name, Email, Country) VALUES
('Alice Johnson', 'alice+AEA-example.com', 'USA'),
('Bob Smith', 'bob+AEA-example.com', 'UK'),
('Charlie Lee', 'charlie+AEA-example.com', NULL)+ADs-

SELECT +ACo- FROM Customers+ADs-


INSERT INTO Orders (CustomerID, OrderDate, Amount, Status) VALUES
(1, '2024-01-15', 250.00, 'Completed'),
(1, '2024-02-10', 150.50, 'Pending'),
(2, '2024-03-05', 300.00, 'Completed'),
(3, '2024-03-15', 200.00, 'Cancelled')+ADs-

SELECT +ACo- FROM Orders+ADs-


-- 3. SELECT with JOIN and CASE
SELECT 
    o.OrderID, 
    c.Name, 
    o.Amount,
    CASE 
		
        WHEN o.Status +AD0- 'Completed' THEN N'+JwU- Done'
        WHEN o.Status +AD0- 'Pending' THEN N'+2D3dUg- In Progress'
        ELSE N'+J0w-  Cancelled'
    END AS OrderStatus
FROM Orders o
INNER JOIN Customers c ON o.CustomerID +AD0- c.CustomerID+ADs-
--- UNICODE STRINGS BY USING PREFIX WITH N' STRING '  
----AND COLUMN SHOULD BE IN UNICODE LIKE NVARCHAR OR NCHAR


-- 4. Aggregation, GROUP BY, HAVING

SELECT 
    c.Country, 
    COUNT(o.OrderID) AS OrderCount, 
    SUM(o.Amount) AS TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID +AD0- o.CustomerID
GROUP BY c.Country
HAVING SUM(o.Amount) +AD4- 300+ADs-

-- 5. Subquery: Customers with above-average order amount

SELECT Name FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID FROM Orders
    WHERE Amount +AD4- (SELECT AVG(Amount) FROM Orders)
)+ADs-

-- 6. Create a view
+ADs-
GO

CREATE VIEW vw+AF8-CustomerOrders AS

SELECT c.Name, o.OrderDate, o.Amount
FROM Customers c
JOIN Orders o ON c.CustomerID +AD0- o.CustomerID+ADs-

SELECT +ACo- FROM vw+AF8-CustomerOrders+ADs-

-- 7. Create a scalar function


CREATE FUNCTION dbo.GetCustomerOrderCount (+AEA-CustomerID INT)
RETURNS INT
AS
BEGIN
    DECLARE +AEA-OrderCount INT+ADs-
    SELECT +AEA-OrderCount +AD0- COUNT(+ACo-) FROM Orders WHERE CustomerID +AD0- +AEA-CustomerID+ADs-
    RETURN +AEA-OrderCount+ADs-
END+ADs-


-- 8. Use the function
SELECT 
    Name, 
    dbo.GetCustomerOrderCount(CustomerID) AS TotalOrders
FROM Customers+ADs-

-- 9. Create a stored procedure
CREATE PROCEDURE usp+AF8-AddOrder
    +AEA-CustomerID INT,
    +AEA-Amount DECIMAL(10,2)
AS
BEGIN
    INSERT INTO Orders (CustomerID, Amount) VALUES (+AEA-CustomerID, +AEA-Amount)+ADs-
END+ADs-

-- Call the stored procedure
EXEC usp+AF8-AddOrder +AEA-CustomerID +AD0- 2, +AEA-Amount +AD0- 500.00+ADs-



-- 10. Use transactions with error handling
BEGIN TRY
    BEGIN TRANSACTION+ADs-

    UPDATE Orders SET Amount +AD0- Amount +- 100 WHERE OrderID +AD0- 101+ADs-
    DELETE FROM Customers WHERE CustomerID +AD0- 999+ADs-  -- Will fail if ID doesn't exist

    COMMIT+ADs-
END TRY
BEGIN CATCH
    ROLLBACK+ADs-
    PRINT 'An error occurred: ' +- ERROR+AF8-MESSAGE()+ADs-
END CATCH+ADs-

-- 11. Temporary table usage
CREATE TABLE +ACM-TempSummary (
    CustomerID INT,
    TotalAmount DECIMAL(10,2)
)+ADs-

INSERT INTO +ACM-TempSummary
SELECT CustomerID, SUM(Amount)
FROM Orders
GROUP BY CustomerID+ADs-

SELECT +ACo- FROM +ACM-TempSummary+ADs-

DROP TABLE +ACM-TempSummary+ADs-

-- 12. Drop objects (cleanup)
DROP PROCEDURE usp+AF8-AddOrder+ADs-
DROP FUNCTION dbo.GetCustomerOrderCount+ADs-
DROP VIEW vw+AF8-CustomerOrders+ADs-
DROP TABLE Orders+ADs-
DROP TABLE Customers+ADs-



-- +AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0-
-- SQL Server Advanced Lab
-- Topics: Recursive CTE, Window Functions, Pivoting,
--         Error Handling, Transactions
-- +AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0-

-- +AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQ-
-- 1. Recursive CTE: Employee Hierarchy
-- +AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQ-

-- Drop if exists
IF OBJECT+AF8-ID('dbo.Employees', 'U') IS NOT NULL DROP TABLE dbo.Employees+ADs-

----- To finding foreign key constraints table

SELECT
    f.name AS ForeignKey,
    OBJECT+AF8-NAME(f.parent+AF8-object+AF8-id) AS ReferencingTable
FROM 
    sys.foreign+AF8-keys AS f
WHERE 
    f.referenced+AF8-object+AF8-id +AD0- OBJECT+AF8-ID('dbo.Employees')+ADs-

	--To remove foreign key from a table 
--select +ACo- from sales
--select +ACo- from employees
	alter table sales --- ReferencingTable is sales here
	drop constraint employeeid--(employeeid)

	drop table sales
	rollback

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(100),
    ManagerID INT NULL
)+ADs-

INSERT INTO Employees (EmployeeID, Name, ManagerID) VALUES
(1, 'CEO', NULL),
(2, 'VP of Sales', 1),
(3, 'Sales Manager', 2),
(4, 'Sales Rep A', 3),
(5, 'Sales Rep B', 3),
(6, 'VP of Engineering', 1),
(7, 'Engineer A', 6),
(8, 'Engineer B', 6)+ADs-

select +ACo- from employees

-- Recursive CTE to show hierarchy

WITH EmployeeCTE AS (
    SELECT EmployeeID, Name, ManagerID, 0 AS Level
    FROM Employees
    WHERE ManagerID IS NULL
    UNION ALL
    SELECT e.EmployeeID, e.Name, e.ManagerID, Level +- 1
    FROM Employees e
    JOIN EmployeeCTE cte ON e.ManagerID +AD0- cte.EmployeeID
)
SELECT 
    REPLICATE('  ', Level +ACo- 2) +- Name AS Hierarchy,
    EmployeeID, ManagerID, Level
FROM EmployeeCTE
ORDER BY Level, ManagerID+ADs-


-- +AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQ-
-- 2. Window Functions: Moving Averages and Ranks
-- +AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQ-

IF OBJECT+AF8-ID('dbo.Sales', 'U') IS NOT NULL DROP TABLE dbo.Sales+ADs-

CREATE TABLE Sales (
    SaleID INT IDENTITY PRIMARY KEY,
    SaleDate DATE,
    Amount DECIMAL(10,2)
)+ADs-

-- Insert sample data
INSERT INTO Sales (SaleDate, Amount)
VALUES
('2024-01-01', 100), ('2024-01-02', 120), ('2024-01-03', 130),
('2024-01-04', 110), ('2024-01-05', 140), ('2024-01-06', 160),
('2024-01-07', 170), ('2024-01-08', 180), ('2024-01-09', 190)+ADs-

-- Moving 7-day average
SELECT 
    SaleDate,
    Amount,
    AVG(Amount) OVER (
        ORDER BY SaleDate
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS MovingAvg+AF8-7Days
FROM Sales+ADs-


-- +AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQ-
-- 3. Pivoting: Product Category Sales by Quarter
-- +AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQ-

IF OBJECT+AF8-ID('dbo.SalesData', 'U') IS NOT NULL DROP TABLE dbo.SalesData+ADs-

CREATE TABLE SalesData (
    SaleID INT IDENTITY PRIMARY KEY,
    ProductCategory NVARCHAR(50),
    Quarter CHAR(2),
    Amount DECIMAL(10,2)
)+ADs-

INSERT INTO SalesData (ProductCategory, Quarter, Amount) VALUES
('Electronics', 'Q1', 500), ('Electronics', 'Q2', 700),
('Clothing', 'Q1', 200), ('Clothing', 'Q2', 300),
('Home', 'Q1', 400), ('Home', 'Q2', 600)+ADs-

-- Pivot table
SELECT +ACo-
FROM (
    SELECT ProductCategory, Quarter, Amount
    FROM SalesData
) AS SourceTable
PIVOT (
    SUM(Amount)
    FOR Quarter IN (+AFs-Q1+AF0-, +AFs-Q2+AF0-)
) AS PivotTable+ADs-


-- +AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQ-
-- 4. Transactions +ACY- Error Handling: Inventory Transfer
-- +AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQ-

IF OBJECT+AF8-ID('dbo.Inventory', 'U') IS NOT NULL DROP TABLE dbo.Inventory+ADs-

IF OBJECT+AF8-ID('dbo.Inventory', 'U') IS NOT NULL DROP TABLE dbo.Inventory+ADs-

CREATE TABLE Inventory (
    WarehouseID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (WarehouseID, ProductID)
)+ADs-

INSERT INTO Inventory (WarehouseID, ProductID, Quantity) VALUES
(1, 101, 500), (2, 101, 300)+ADs-

-- Attempt a transaction with error handling
BEGIN TRY
    BEGIN TRANSACTION+ADs-

    UPDATE Inventory
    SET Quantity +AD0- Quantity - 200
    WHERE WarehouseID +AD0- 1 AND ProductID +AD0- 101+ADs-

    UPDATE Inventory
    SET Quantity +AD0- Quantity +- 200
    WHERE WarehouseID +AD0- 2 AND ProductID +AD0- 101+ADs-

    -- Uncomment below to simulate error
    -- DELETE FROM Inventory WHERE WarehouseID +AD0- 999+ADs-

    COMMIT+ADs-
    PRINT 'Transaction completed successfully.'+ADs-
END TRY
BEGIN CATCH
    ROLLBACK+ADs-
    PRINT 'Transaction failed: ' +- ERROR+AF8-MESSAGE()+ADs-
END CATCH+ADs-


-- +AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQ-
-- End of Script