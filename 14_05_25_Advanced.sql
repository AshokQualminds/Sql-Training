-- ====================================================
-- SQL Server Advanced Lab
-- Topics: Recursive CTE, Window Functions, Pivoting,
--         Error Handling, Transactions
-- ====================================================

-- =============================
-- 1. Recursive CTE: Employee Hierarchy
-- =============================
 --drop if exists 
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL DROP TABLE dbo.Employees;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(100),
    ManagerID INT NULL
);

select * from employees

INSERT INTO Employees (EmployeeID, Name, ManagerID) VALUES
(1, 'CEO', NULL),
(2, 'VP of Sales', 1),
(3, 'Sales Manager', 2),
(4, 'Sales Rep A', 3),
(5, 'Sales Rep B', 3),
(6, 'VP of Engineering', 1),
(7, 'Engineer A', 6),
(8, 'Engineer B', 6);

-- Recursive CTE to show hierarchy
WITH EmployeeCTE AS (
    SELECT EmployeeID, Name, ManagerID, 0 AS Level
    FROM Employees
    WHERE ManagerID IS NULL
    UNION ALL
    SELECT e.EmployeeID, e.Name, e.ManagerID, Level + 1
    FROM Employees e
    JOIN EmployeeCTE cte ON e.ManagerID = cte.EmployeeID
)
SELECT 
    REPLICATE('  ', Level * 2) + Name AS Hierarchy,
    EmployeeID, ManagerID, Level
FROM EmployeeCTE
ORDER BY Level, ManagerID;


-- =============================
-- 2. Window Functions: Moving Averages and Ranks
-- =============================

IF OBJECT_ID('dbo.Sales', 'U') IS NOT NULL DROP TABLE dbo.Sales;

CREATE TABLE Sales (
    SaleID INT IDENTITY PRIMARY KEY,
    SaleDate DATE,
    Amount DECIMAL(10,2)
);

-- Insert sample data
INSERT INTO Sales (SaleDate, Amount)
VALUES
('2024-01-01', 100), ('2024-01-02', 120), ('2024-01-03', 130),
('2024-01-04', 110), ('2024-01-05', 140), ('2024-01-06', 160),
('2024-01-07', 170), ('2024-01-08', 180), ('2024-01-09', 190);

-- Moving 7-day average
SELECT 
    SaleDate,
    Amount,
    AVG(Amount) OVER (
        ORDER BY SaleDate
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS MovingAvg_7Days
FROM Sales;


-- =============================
-- 3. Pivoting: Product Category Sales by Quarter
-- =============================

IF OBJECT_ID('dbo.SalesData', 'U') IS NOT NULL DROP TABLE dbo.SalesData;

CREATE TABLE SalesData (
    SaleID INT IDENTITY PRIMARY KEY,
    ProductCategory NVARCHAR(50),
    Quarter CHAR(2),
    Amount DECIMAL(10,2)
);

INSERT INTO SalesData (ProductCategory, Quarter, Amount) VALUES
('Electronics', 'Q1', 500), ('Electronics', 'Q2', 700),
('Clothing', 'Q1', 200), ('Clothing', 'Q2', 300),
('Home', 'Q1', 400), ('Home', 'Q2', 600);

-- Pivot table
SELECT *
FROM (
    SELECT ProductCategory, Quarter, Amount
    FROM SalesData
) AS SourceTable
PIVOT (
    SUM(Amount)
    FOR Quarter IN ([Q1], [Q2])
) AS PivotTable;


-- =============================
-- 4. Transactions & Error Handling: Inventory Transfer
-- =============================

IF OBJECT_ID('dbo.Inventory', 'U') IS NOT NULL DROP TABLE dbo.Inventory;

CREATE TABLE Inventory (
    WarehouseID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (WarehouseID, ProductID)
);

INSERT INTO Inventory (WarehouseID, ProductID, Quantity) VALUES
(1, 101, 500), (2, 101, 300);

-- Attempt a transaction with error handling
BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE Inventory
    SET Quantity = Quantity - 200
    WHERE WarehouseID = 1 AND ProductID = 101;

    UPDATE Inventory
    SET Quantity = Quantity + 200
    WHERE WarehouseID = 2 AND ProductID = 101;

    -- Uncomment below to simulate error
    -- DELETE FROM Inventory WHERE WarehouseID = 999;

    COMMIT;
    PRINT 'Transaction completed successfully.';
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Transaction failed: ' + ERROR_MESSAGE();
END CATCH;


-- =============================
-- End of Script
-- =============================









-- ============================================================
-- SQL Server Advanced Script
-- Topics Covered:
-- 1. Recursive CTE - Hierarchical Query
-- 2. Window Functions - Rank, Running Total, Moving Average
-- 3. Pivot and Unpivot - Transforming Rows to Columns & Vice Versa
-- 4. Error Handling with TRY...CATCH and Transactions
-- ============================================================

-- ===========================
-- 1. Recursive CTE - Employee Hierarchy
-- ===========================
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL DROP TABLE dbo.Employees;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(100),
    ManagerID INT NULL
);

INSERT INTO Employees (EmployeeID, Name, ManagerID) VALUES
(1, 'CEO', NULL),
(2, 'VP of Sales', 1),
(3, 'Sales Manager', 2),
(4, 'Sales Rep A', 3),
(5, 'Sales Rep B', 3),
(6, 'VP of Engineering', 1),
(7, 'Engineer A', 6),
(8, 'Engineer B', 6);

-- Recursive CTE to get hierarchy
WITH EmployeeHierarchy AS (
    SELECT EmployeeID, Name, ManagerID, 0 AS Level
    FROM Employees
    WHERE ManagerID IS NULL
    UNION ALL
    SELECT e.EmployeeID, e.Name, e.ManagerID, eh.Level + 1
    FROM Employees e
    JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)
SELECT 
    REPLICATE('  ', Level * 2) + Name AS HierarchyPath,
    EmployeeID, ManagerID, Level
FROM EmployeeHierarchy
ORDER BY Level, ManagerID;

-- ===========================
-- 2. Window Functions
-- ===========================

-- Create Sales table
IF OBJECT_ID('dbo.Sales', 'U') IS NOT NULL DROP TABLE dbo.Sales;

CREATE TABLE Sales (
    SaleID INT IDENTITY PRIMARY KEY,
    SaleDate DATE,
    Amount DECIMAL(10,2)
);

-- Insert data
INSERT INTO Sales (SaleDate, Amount) VALUES
('2024-01-01', 100), ('2024-01-02', 120), ('2024-01-03', 130),
('2024-01-04', 110), ('2024-01-05', 140), ('2024-01-06', 160),
('2024-01-07', 170), ('2024-01-08', 180), ('2024-01-09', 190);

-- Rank by Amount
SELECT 
    SaleDate,
    Amount,
    RANK() OVER (ORDER BY Amount DESC) AS SaleRank
FROM Sales;

-- Running total
SELECT 
    SaleDate,
    Amount,
    SUM(Amount) OVER (ORDER BY SaleDate) AS RunningTotal
FROM Sales;

-- 7-day Moving Average
SELECT 
    SaleDate,
    Amount,
    AVG(Amount) OVER (
        ORDER BY SaleDate 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS MovingAvg_7Days
FROM Sales;

-- ===========================
-- 3. Pivot and Unpivot
-- ===========================

IF OBJECT_ID('dbo.Financials', 'U') IS NOT NULL DROP TABLE dbo.Financials;

CREATE TABLE Financials (
    [Year] INT,
    [Quarter] CHAR(2),
    [Revenue] DECIMAL(10,2)
);

INSERT INTO Financials ([Year], [Quarter], [Revenue]) VALUES
(2024, 'Q1', 1000), (2024, 'Q2', 1200), (2024, 'Q3', 1300), (2024, 'Q4', 1500),
(2025, 'Q1', 1100), (2025, 'Q2', 1400), (2025, 'Q3', 1600), (2025, 'Q4', 1800);

-- Pivot: Revenue per quarter by year
SELECT * 
FROM (
    SELECT [Year], [Quarter], [Revenue]
    FROM Financials
) AS SourceTable
PIVOT (
    SUM(Revenue)
    FOR Quarter IN ([Q1], [Q2], [Q3], [Q4])
) AS PivotTable;

-- Unpivot back
SELECT [Year], [Quarter], [Revenue]
FROM (
    SELECT [Year], [Q1], [Q2], [Q3], [Q4]
    FROM (
        SELECT [Year], [Quarter], [Revenue]
        FROM Financials
    ) AS TempSource
    PIVOT (
        SUM(Revenue)
        FOR Quarter IN ([Q1], [Q2], [Q3], [Q4])
    ) AS Pivoted
) AS SourceUnpivot
UNPIVOT (
    Revenue FOR Quarter IN ([Q1], [Q2], [Q3], [Q4])
) AS Unpivoted;

-- ===========================
-- 4. Transaction + TRY...CATCH
-- ===========================

IF OBJECT_ID('dbo.Accounts', 'U') IS NOT NULL DROP TABLE dbo.Accounts;

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    AccountHolder NVARCHAR(100),
    Balance DECIMAL(10,2)
);

INSERT INTO Accounts (AccountID, AccountHolder, Balance) VALUES
(1, 'John Doe', 1000.00),
(2, 'Jane Smith', 1500.00);

-- Safe money transfer with error handling
BEGIN TRY
    BEGIN TRANSACTION;

    -- Debit John
    UPDATE Accounts
    SET Balance = Balance - 300
    WHERE AccountID = 1;

    -- Credit Jane
    UPDATE Accounts
    SET Balance = Balance + 300
    WHERE AccountID = 2;

    -- Uncomment to simulate error
    -- UPDATE Accounts SET Balance = Balance / 0 WHERE AccountID = 2;

    COMMIT;
    PRINT 'Transfer completed successfully.';
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error occurred: ' + ERROR_MESSAGE();
END CATCH;

-- View balances
SELECT * FROM Accounts;

-- ============================================================
-- End of Advanced SQL Server Script
-- ============================================================
