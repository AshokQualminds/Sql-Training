/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [CustomerID]
      ,[PersonID]
      ,[StoreID]
      ,[TerritoryID]
      ,[AccountNumber]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Sales].[Customer]


  select  customerid,
  storeid,
  sum(storeid) over (order by customerid) as running_sum,
  lag(storeid) over (order by customerId) as previous_one
  from
  sales.customer


  select 
  customerid,
  storeid,
  lag(CustomerID)over (order by storeid) previousone
  from sales.customer

    select 
  customerid,
  storeid,
  lag(storeid)over (order by CustomerID) previousone
  from sales.customer

--  SELECT 
--  employee,
--  region,
--  amount,
--  RANK() OVER (PARTITION BY region ORDER BY amount DESC) AS region_rank
--FROM sales.customer;

SELECT name, salary,
       SUM(salary) OVER (PARTITION BY department) AS dept_total_salary
FROM employees;

SELECT name, salary,
       LAST_VALUE(name) OVER (
           PARTITION BY department ORDER BY salary DESC 
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS lowest_paid
FROM employees;

SELECT name, salary,
       FIRST_VALUE(name) OVER (PARTITION BY department ORDER BY salary DESC) AS highest_paid
FROM employees;

SELECT name, salary,
       LEAD(salary, 1) OVER (ORDER BY hire_date) AS next_salary
FROM employees;



SELECT name, salary,
       LAG(salary, 1) OVER (ORDER BY hire_date) AS prev_salary
FROM employees;


SELECT name, salary,
       NTILE(2) OVER (ORDER BY salary DESC) AS salary_quartile
FROM employees;

SELECT name, department, salary,
       DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank
FROM employees;

SELECT name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
FROM employees;

SELECT name, department, salary,
       ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employees;


CREATE TABLE employees (
  employee_id INT,
  name TEXT,
  department TEXT,
  salary INT,
  hire_date DATE
);
---drop table  employees


CREATE TABLE employees (
  employee_id INT,
  name varchar(100),
  department varchar(100),
  salary INT,
  hire_date DATE
);

INSERT INTO employees (employee_id, name, department, salary, hire_date) VALUES
(1, 'Alice', 'HR', 50000, '2020-01-10'),
(2, 'Bob', 'HR', 60000, '2019-04-22'),
(3, 'Charlie', 'IT', 70000, '2018-07-15'),
(4, 'Dana', 'IT', 90000, '2017-03-12'),
(5, 'Eve', 'IT', 70000, '2021-09-01'),
(6, 'Frank', 'HR', 60000, '2022-02-18');

select * from employees

select
employee_id
,name
,department
,row_number() over(partition by department order by salary desc) as department_wise_rank
from
employees





select
employee_id
,name
,department
,row_number() over(  order by salary desc) as department_wise_rank
from
employees

order by department_wise_rank