create table employees
(employeeid int primary key, name varchar(20),department varchar(20));

create table sales 
(saleid int ,employeeid int foreign key references employees(employeeid), amount money ,saledate date);

insert into employees values(1,'Alice','electronics'),
(2,'bob','furniture'),
(3,'charlie','electronics');

insert into sales values(101,1,1500,'2024-05-01'),
(102,1,1200,'2024-05-05'),
(103,2,2000,'2024-05-03'),
(104,3,700,'2024-05-04'),
(105,3,300,'2024-05-06')

select * from employees
select * from sales

---find the top-selling employee in each department based on total sales for May 2024.

----BY the method of derived table 
SELECT
    e.Department,
    e.Name AS TopEmployee,
    dt.TotalSales
FROM (
    SELECT
        s.EmployeeID,
        SUM(s.Amount) AS TotalSales
    FROM Sales s
    WHERE MONTH(s.SaleDate) = 5 AND YEAR(s.SaleDate) = 2024
    GROUP BY s.EmployeeID
) AS dt
JOIN Employees e ON e.EmployeeID = dt.EmployeeID
JOIN (
    SELECT 
        e2.Department,
        MAX(ds.TotalSales) AS MaxDeptSales
    FROM (
        SELECT s.EmployeeID, SUM(s.Amount) AS TotalSales
        FROM Sales s
        WHERE MONTH(s.SaleDate) = 5 AND YEAR(s.SaleDate) = 2024
        GROUP BY s.EmployeeID
    ) AS ds
    JOIN Employees e2 ON ds.EmployeeID = e2.EmployeeID
    GROUP BY e2.Department
) AS dept_max ON e.Department = dept_max.Department AND dt.TotalSales = dept_max.MaxDeptSales;

----BY the method of corelated subquery

SELECT
    e.Department,
    e.Name AS TopEmployee,
    (
        SELECT SUM(s2.Amount)
        FROM Sales s2
        WHERE s2.EmployeeID = e.EmployeeID
          AND MONTH(s2.SaleDate) = 5
          AND YEAR(s2.SaleDate) = 2024
    ) AS TotalSales
FROM Employees e
WHERE e.EmployeeID IN (
    SELECT TOP 1 WITH TIES s.EmployeeID
    FROM Sales s
    JOIN Employees e2 ON s.EmployeeID = e2.EmployeeID
    WHERE MONTH(s.SaleDate) = 5 AND YEAR(s.SaleDate) = 2024
    GROUP BY s.EmployeeID, e2.Department
    ORDER BY RANK() OVER (PARTITION BY e2.Department ORDER BY SUM(s.Amount) DESC)
);


---By the method of cte and row_number

WITH EmployeeSales AS (
    SELECT
        e.EmployeeID,
        e.Name,
        e.Department,
        SUM(s.Amount) AS TotalSales
    FROM Sales s
    JOIN Employees e ON s.EmployeeID = e.EmployeeID
    WHERE MONTH(s.SaleDate) = 5 AND YEAR(s.SaleDate) = 2024
    GROUP BY e.EmployeeID, e.Name, e.Department
),
RankedSales AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Department ORDER BY TotalSales DESC) AS rn
    FROM EmployeeSales
)
SELECT Department, Name AS TopEmployee, TotalSales
FROM RankedSales
WHERE rn = 1;





set statistics io on

select * from n

----Check fragmentation
SELECT * FROM
sys.dm_db_index_physical_stats(DB_ID(), OBJECT_ID('Employees'), NULL, NULL, 'DETAILED');

----for missing index
SELECT * 
FROM sys.dm_db_missing_index_details;

---unused indexes
SELECT * 
FROM sys.dm_db_index_usage_stats
WHERE user_seeks = 0 AND user_scans = 0 AND user_lookups = 0;