
drop table employees21

CREATE TABLE Employees21 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Employees21 (EmployeeID, Name, Department) VALUES
(1, 'Alice', 'HR'),
(2, 'Bob', 'Finance'),
(3, 'Charlie', 'IT'),
(4, 'Diana', 'IT'),
(5, 'Ethan', 'HR');

CREATE TABLE SalaryHistory (
    EmployeeID INT,
    SalaryDate DATE,
    Salary MONEY
);



select * from employees21

-- 1. Ensure 'admin' exists
IF NOT EXISTS (SELECT 1 FROM Employees21 WHERE Name = 'admin')
BEGIN
    INSERT INTO Employees21 (EmployeeID, Name, Department)
    VALUES (999, 'admin', 'IT');
END


-- 2. GOTO usage: Exit if no employees
IF NOT EXISTS (SELECT 1 FROM Employees21)
BEGIN
    GOTO NoEmployees;
END

-- 3. Loop through employees21 to find missing salary history
DECLARE @empID INT, @i INT = 1;
DECLARE @Total INT = (SELECT COUNT(*) FROM Employees21);

WHILE @i <= @Total
BEGIN
    SET @empID = (SELECT EmployeeID FROM 
                    (SELECT ROW_NUMBER() OVER (ORDER BY EmployeeID) AS rn, EmployeeID FROM Employees21) x 
                 WHERE rn = @i);

    IF NOT EXISTS (SELECT 1 FROM SalaryHistory WHERE EmployeeID = @empID)
    BEGIN
        PRINT 'Missing salary data for EmployeeID: ' + CAST(@empID AS VARCHAR);
        BREAK; -- Stop on first missing salary
    END

    SET @i += 1;
END

-- 4. Create comma-separated list of departments (2 ways)
-- A) Modern way (SQL Server 2017+)
SELECT STRING_AGG(DISTINCT Department, ', ') AS Departments FROM Employees21;

-- B) Older versions using STUFF and FOR XML PATH
SELECT STUFF((
    SELECT DISTINCT ', ' + Department
    FROM Employees21
    FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS Departments;

-- 5. Analyze Salary Trends using LAG/LEAD
SELECT 
    E.Name,
    S.SalaryDate,
    S.Salary,
    LAG(S.Salary) OVER (PARTITION BY S.EmployeeID ORDER BY S.SalaryDate) AS PreviousSalary,
    LEAD(S.Salary) OVER (PARTITION BY S.EmployeeID ORDER BY S.SalaryDate) AS NextSalary
FROM SalaryHistory S
JOIN Employees21 E ON S.EmployeeID = E.EmployeeID
ORDER BY E.Name, S.SalaryDate;

-- Label for GOTO
NoEmployees:
PRINT 'No employees to process.';


-- Step 1: Create sample tables
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES customers(customer_id)
);

-- Step 2: Insert sample data
INSERT INTO customers (customer_id, customer_name)
VALUES (1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

INSERT INTO orders (order_id, customer_id)
VALUES (101, 1), (102, 1), (103, 2);  -- Charlie has no orders

-- Step 3: Enable Actual Execution Plan
-- In SSMS, press Ctrl + M before running this part

-- Query 1: Using SELECT 1 in EXISTS
SELECT customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- Query 2: Using SELECT * in EXISTS
SELECT customer_name
FROM customers c
WHERE EXISTS (
    SELECT *
    FROM orders o
    WHERE o.customer_id = c.customer_id
);


select * from customers
select * from orders

select customer_name from customers c
where exists (select * from orders o where o.customer_id=c.customer_id);

select customer_name from customers c
where exists ( select 1 from orders o where o.customer_id=c.customer_id)


DECLARE @i INT = 0;

WHILE (@i < 100)
BEGIN
    PRINT @i;

    IF @i = 50
        BREAK;  -- exits the loop when @i = 5

    SET @i = @i + 1;
END


declare @date date= getdate()
print  @date ;

DECLARE @StartDate DATE;
SELECT @StartDate = GETDATE()
print  @STARTdate ;

-- CHARINDEX
SELECT CHARINDEX('e', 'Hello') AS CharIndexResult; -- Output: 2

-- PATINDEX
SELECT PATINDEX('%lo%', 'Hello') AS PatIndexResult; -- Output: 4

-- LIKE
SELECT CASE WHEN 'Hello' LIKE 'H%' 
                  THEN 'Match' ELSE 'No Match' END AS LikeMatch; -- Output: 'Match'

				  select* from employees

					SELECT CASE WHEN 'ALICE' LIKE 'A%' THEN 'MATCH' ELSE 'NO MATCH' END AS LIKEMATCH

SELECT NAME , SALARY FROM EMPLOYEES FOR XML AUTO

SELECT 

IF  NOT EXISTS (SELECT 1 FROM EMPLOYEES WHERE NAME = 'ASHOK')
BEGIN
INSERT INTO EMPLOYEES (NAME) VALUES('ASHOK')
END


IF EXISTS (SELECT 1 FROM EMPLOYEES WHERE NAME ='ASHOK')
BEGIN 
 DELETE FROM EMPLOYEES WHERE NAME = 'ASHOK'
END



SELECT * FROM [HumanResources].[Department]  FOR XML AUTO


GOTO EMPLOYEES

