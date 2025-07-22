-- UPDATE section inside trigger:
GO


---SELECT * FROM EMPLOYEES
SELECT * FROM TRG_

CREATE TRIGGER trg_AuditEmployee_AllEvents
ON Employees
AFTER  UPDATE
AS
BEGIN
INSERT INTO EmployeeAudit (
    EmployeeID,
    OldSalary, NewSalary,
    OldDepartment, NewDepartment,
    OldEmail, NewEmail,
    OldPhone, NewPhone,
    OldJobTitle, NewJobTitle,
    OldHireDate, NewHireDate,
    ChangedBy, ChangeDate
)
SELECT
    d.EmployeeID,
    d.Salary, i.Salary,
    d.Department, i.Department,
    d.Email, i.Email,
    d.Phone, i.Phone,
    d.JobTitle, i.JobTitle,
    d.HireDate, i.HireDate,
    SYSTEM_USER, GETDATE()
FROM INSERTED i
JOIN DELETED d ON i.EmployeeID = d.EmployeeID
WHERE
    ISNULL(i.Salary, 0) <> ISNULL(d.Salary, 0)
    OR ISNULL(i.Department, '') <> ISNULL(d.Department, '')
    OR ISNULL(i.Email, '') <> ISNULL(d.Email, '')
    OR ISNULL(i.Phone, '') <> ISNULL(d.Phone, '')
    OR ISNULL(i.JobTitle, '') <> ISNULL(d.JobTitle, '')
    OR ISNULL(i.HireDate, '1900-01-01') <> ISNULL(d.HireDate, '1900-01-01')
	
	END;
