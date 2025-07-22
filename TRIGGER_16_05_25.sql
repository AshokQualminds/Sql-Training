CREATE DATABASE TRIGGERS


USE TRIGGERS
GO

CREATE TABLE EmployeeAudit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
    OldSalary DECIMAL(10,2),
    NewSalary DECIMAL(10,2),
    OldDepartment NVARCHAR(100),
    NewDepartment NVARCHAR(100),
    ChangedBy SYSNAME,
    ChangeDate DATETIME
);


GO

CREATE TRIGGER trg_AuditEmployeeChanges
ON Employee
AFTER UPDATE
AS
BEGIN
    INSERT INTO EmployeeAudit (
        EmployeeID, OldSalary, NewSalary,
        OldDepartment, NewDepartment,
        ChangedBy, ChangeDate
    )
    SELECT
        d.EmployeeID,
        d.Salary,
        i.Salary,
        d.Department,
        i.Department,
        SYSTEM_USER,
        GETDATE()
    FROM
        INSERTED i
    INNER JOIN
        DELETED d ON i.EmployeeID = d.EmployeeID
    WHERE
        ISNULL(i.Salary, 0) <> ISNULL(d.Salary, 0) OR
        ISNULL(i.Department, '') <> ISNULL(d.Department, '');
END;




----------------------------------------------------------------------------
----FULL SCRIPT


-- ================================
-- 1. Create Employees Table
-- ================================
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(255),
    Phone NVARCHAR(50),
    JobTitle NVARCHAR(100),
    Salary DECIMAL(10,2),
    Department NVARCHAR(100),
    HireDate DATE
);

SELECT * FROM EMPLOYEES
-- ================================
-- 2. Create EmployeeAudit Table
-- ================================
drop table if exists EmployeeAudit
CREATE TABLE EmployeeAudit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
    
    OldSalary DECIMAL(10,2),
    NewSalary DECIMAL(10,2),
    OldDepartment NVARCHAR(100),
    NewDepartment NVARCHAR(100),
    
    OldEmail NVARCHAR(255),
    NewEmail NVARCHAR(255),
    OldPhone NVARCHAR(50),
    NewPhone NVARCHAR(50),
    OldJobTitle NVARCHAR(100),
    NewJobTitle NVARCHAR(100),
    OldHireDate DATE,
    NewHireDate DATE,
    
    ChangeReason NVARCHAR(255),
    ChangedBy SYSNAME,
    ChangeDate DATETIME
);

SELECT * FROM EmployeeAudit
-- ================================
-- 3. Combined Trigger: INSERT, UPDATE, DELETE
-- ================================
GO

CREATE TRIGGER trg_AuditEmployee_AllEvents
ON Employees
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- INSERT
    INSERT INTO EmployeeAudit (
        EmployeeID,
        OldSalary, NewSalary,
        OldDepartment, NewDepartment,
        OldEmail, NewEmail,
        OldPhone, NewPhone,
        OldJobTitle, NewJobTitle,
        OldHireDate, NewHireDate,
        ChangeReason, ChangedBy, ChangeDate
    )
    SELECT
        i.EmployeeID,
        NULL, i.Salary,
        NULL, i.Department,
        NULL, i.Email,
        NULL, i.Phone,
        NULL, i.JobTitle,
        NULL, i.HireDate,
        SESSION_CONTEXT(N'ChangeReason'),
        SYSTEM_USER,
        GETDATE()
    FROM INSERTED i
    WHERE NOT EXISTS (
        SELECT 1 FROM DELETED d WHERE d.EmployeeID = i.EmployeeID
    );

    -- DELETE
    INSERT INTO EmployeeAudit (
        EmployeeID,
        OldSalary, NewSalary,
        OldDepartment, NewDepartment,
        OldEmail, NewEmail,
        OldPhone, NewPhone,
        OldJobTitle, NewJobTitle,
        OldHireDate, NewHireDate,
        ChangeReason, ChangedBy, ChangeDate
    )
    SELECT
        d.EmployeeID,
        d.Salary, NULL,
        d.Department, NULL,
        d.Email, NULL,
        d.Phone, NULL,
        d.JobTitle, NULL,
        d.HireDate, NULL,
        SESSION_CONTEXT(N'ChangeReason'),
        SYSTEM_USER,
        GETDATE()
    FROM DELETED d
    WHERE NOT EXISTS (
        SELECT 1 FROM INSERTED i WHERE i.EmployeeID = d.EmployeeID
    );

    -- UPDATE
    INSERT INTO EmployeeAudit (
        EmployeeID,
        OldSalary, NewSalary,
        OldDepartment, NewDepartment,
        OldEmail, NewEmail,
        OldPhone, NewPhone,
        OldJobTitle, NewJobTitle,
        OldHireDate, NewHireDate,
        ChangeReason, ChangedBy, ChangeDate
    )
    SELECT
        d.EmployeeID,
        d.Salary, i.Salary,
        d.Department, i.Department,
        d.Email, i.Email,
        d.Phone, i.Phone,
        d.JobTitle, i.JobTitle,
        d.HireDate, i.HireDate,
        SESSION_CONTEXT(N'ChangeReason'),
        SYSTEM_USER,
        GETDATE()
    FROM INSERTED i
    JOIN DELETED d ON i.EmployeeID = d.EmployeeID
    WHERE
        ISNULL(i.Salary, 0) <> ISNULL(d.Salary, 0) OR
        ISNULL(i.Department, '') <> ISNULL(d.Department, '') OR
        ISNULL(i.Email, '') <> ISNULL(d.Email, '') OR
        ISNULL(i.Phone, '') <> ISNULL(d.Phone, '') OR
        ISNULL(i.JobTitle, '') <> ISNULL(d.JobTitle, '') OR
        ISNULL(i.HireDate, '1900-01-01') <> ISNULL(d.HireDate, '1900-01-01');
END;

-- ================================
-- 4. Optional: Set Change Reason
-- ================================
-- Use this before INSERT/UPDATE/DELETE to log a change reason
-- (SQL Server 2016+ only)
-- Example:
-- EXEC sp_set_session_context 'ChangeReason', 'Annual Review Update';

-- ================================
-- 5. Optional: Row-Level Security Setup
-- ================================
-- Users only see their own changes in EmployeeAudit

-- Step 1: Create filter function
CREATE FUNCTION fn_AuditRowFilter(@ChangedBy SYSNAME)
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN SELECT 1 AS Result WHERE @ChangedBy = SYSTEM_USER;

-- Step 2: Apply security policy
CREATE SECURITY POLICY AuditSecurityPolicy
ADD FILTER PREDICATE fn_AuditRowFilter(ChangedBy) ON dbo.EmployeeAudit,
ADD BLOCK PREDICATE fn_AuditRowFilter(ChangedBy) ON dbo.EmployeeAudit
WITH (STATE = ON);
