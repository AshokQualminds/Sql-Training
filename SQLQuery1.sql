use PRODUCTDATABASE
go

------adventureworks

select*from HumanResources.Employee

;with cte as
(
select
ROW_NUMBER() over (order by BusinessEntityID) as rn ,*
from HumanResources.Employee
)

select *from cte

where rn=6

use PRODUCTDATABASE
go
select*from [dbo].[employee4]

select convert(varchar,id) as string from [dbo].[employee4]
;with cte as
(
select id,row_number()over(order by id desc) as Rn from employee4
)
select*from cte where Rn %2=0



create table veera
(
id int , name varchar(20), basic_salary money,HRA money )

insert into veera (id,name,basic_salary,HRA)
values(1,'veera',60000,25000)

select * ,concat (basic_salary,HRA) as Total_salary from veera

alter table veera alter column Total_salary(concat( basic_salary+HRA) money


create table veera1
(
id int,
name varchar (10),
HRA decimal(10,2),
pay_scale decimal(10,2),
Total_salary AS (HRA+pay_scale)
)


insert into
veera1 (id,name,pay_scale,HRA)
values(1,'veera',60000,25000)

select *from veera1

alter table veera1
add travel_allowence decimal(10,2) 

insert into veera1(travel_allowence)
values(2000)

alter table veera1
add new_salary  as (HRA+pay_scale+travel_allowence)


insert into veera1 (id,name,HRA,pay_scale,travel_allowence)
values(2,'veera2',24000,59000,2000)

select* from veera1
---drop table veera1

select *
from  veera1
where Id is null

update veera1
set Total_salary=(HRA+pay_scale+travel_allowence)


select (HRA+pay_scale+travel_allowence) as final
from veera1
where id is null

SELECT COALESCE(HRA+pay_scale+travel_allowence, 0) AS final FROM veera1;


SELECT COALESCE(HRA,pay_scale,travel_allowence, 0) AS final ,*FROM veera1;

insert into veera1 (id,name,HRA,pay_scale)
values(1,'veera3',11000,49000)

select*from veera1

select *,(coalesce(travel_allowence,0)+ coalesce(pay_scale,0) + coalesce(HRA,0)) as Finalsalary,
(TOTAL_SALARY+2000) AS INCRIMENTED_SALARY
from veera1
union 
select*,(Isnull(travel_allowence,0)+Isnull(pay_scale,0)+Isnull(HRA,0))as final_salary
from veera1

SELECT *,(TOTAL_SALARY+2000) AS INCRIMENTED_SALARY FROM VEERA1


--------next day



create table employee3(id int, name varchar(50),salary bigint,hire_date date)

insert into  employee3 (id,name,salary,hire_date )
values--(1,'krishna',10000,'3-2-1992'),
--(2,'krish',90000,'2-1-2025'),
--(3,'kri',80000,'3-1-2025') ,
--(4,'krish',70000,'4-1-2025'),
--(5,'rishna',60000,'6-1-2025'),
--(6,'krish',50000,'5-1-2025'),
--(7,'tram',40000,'8-1-2025'),
--(8,'john',59000,'7-1-2025'),

 --(9,'ram',59000,'7-1-2025'),

 ( 10,'sam',40000,'22-1-2021')

 ( 11,'sa',68000,'23-1-2025'),
 ( 12,'sami',68000,'25-1-2024'),
( 13,'shyam',68000,'30-1-2025'),
 ( 14,'swami',98000,'31-1-2020');

sp_help employee3


delete employee
alter table employee alter column salary bigint
select*from employee3

--select max(salary) as nth_highest_salary  from employee
----where salary not in ( select salary from employee order by salary desc );

create table employee4
(Id int, Name varchar(50),salary bigint, Hire_date date);

INSERT INTO employee4 (id, name, salary,hire_date)
VALUES (1, 'John Doe',65000 ,'2023-05-01'),
       (2, 'Jane Smith',75000, '2022-11-15'),
       (3, 'Alice Brown',45000, '2024-02-20'),
       (4, 'Bob Johnson',23000, '2021-08-10'),
	   (5, 'John Doe', 33000,'2023-05-01'),
       (6, 'Jane Smith',43000, '2022-11-15'),
       (7, 'Alice Brown',68000, '2024-02-20'),
       (8, 'Bob Johnson',89000, '2021-08-10');
=--drop table employee4


 ----select salary from employee order by salary desc

 select max(salary) Highest_salary from employee4 

 --second highest
select max( salary) second_highest_salary from employee4
 where salary < (select max(salary) from employee4   )

 --max salary 
 select  top 1 salary as top_1_salary from 
 (select distinct  top 5 salary from employee4 order by salary desc) result 
 
select salary ,dense_rank() over ( order by salary desc) as denserank  from employee4

select salary, ROW_NUMBER() over (order by salary desc )as Rn from employee4


; with result as
 (
  select salary  ,dense_rank() over ( order by salary desc) as denserank  from employee4
  )
  select top 1  salary from result where result.denserank=5



 --select* from  employee 
; with result as
 (
  select salary ,Row_number() over ( order by salary desc) as Rownumber  from employee4
  )
  select  * from result where Rownumber=5


;with cte as
(select salary ,row_number() over (order by salary desc) as rn from employee4
group by salary
)
select * from cte
where rn=5

SELECT  MAX(hire_date) AS latest_hire_date 
FROM employee4;


SELECT rank() over (order by hire_date) as rank,*
FROM employee4
WHERE hire_date = (SELECT MAX(hire_date) FROM employee4);


SELECT dense_rank() over (order by hire_date) as Denserank,*
FROM employee4
WHERE hire_date = (SELECT MAX(hire_date) FROM employee4);


SELECT row_number() over (order by hire_date) as Rn,*
FROM employee4
WHERE hire_date = (SELECT MAX(hire_date) FROM employee4);
--

select min(hire_date) as oldest_hire_date from employee4;

 select *from employee4
 --
 select hire_date ,dense_rank() over (order by hire_date) as Denserank from employee4
 --
;with cte as 
(
 select hire_date ,dense_rank() over (order by hire_date) as Hiredaterank from employee4

)
select *from cte where Hiredaterank=5;


-------next day


create table persons1
(
id int primary key ,
name varchar(50) not null,
birth_date date ,
phone int,
)

alter table persons1 alter column phone varchar(15)
ALTER TABLE PERSONS1 ADD MOBILE VARCHAR(12),TELE_PHONE VARCHAR(12),LAND_PHONE VARCHAR(12),PHONE1 VARCHAR(12)

ALTER TABLE PERSONS1 
     RENAME COLUMN PHONE1 TO PHONE2,

EXEC SP_RENAME 'DBO.PERSONS1.id','ID','COLUMN'
EXEC SP_RENAME 'DBO.PERSONS1.NAME','NAME' ,'COLUMN'
EXEC SP_RENAME 'DBO.PERSONS1.BIRTH_DATE','BIRTH_DATE','COLUMN'
EXEC SP_RENAME 'DBO.PERSONS1.PHONE','PHONE','COLUMN'

--ALTER TABLE PERSONS1 MODIFY COLUMN id  TO ID INT 

ALTER TABLE PERSONS1 DROP COLUMN MOBILE


update persons1
set phone ='7989966744'
where id=1

CREATE TABLE [UNIQUE]
(
UN_ID INT PRIMARY KEY,
UN_NAME VARCHAR(20) UNIQUE,
UN_DATE DATETIME DEFAULT GETDATE()
);

--INSERT WILL NOT PERFORMED DUE TO DEFAULT VALUE IS NOT GIVEN 
--INSERT INTO [UNIQUE]
--SELECT 1,'ASHOK'    

--HERE DEFAULT VALUE GIVEN AS SPACE WITH SINGLE QUOTE ITS NOW WORKED

INSERT INTO [UNIQUE]
SELECT 1,'ASHOK','' 

INSERT INTO [UNIQUE] SELECT 2,'KRISHNA','' 
INSERT INTO [UNIQUE] SELECT 3,'PARDHA',''
INSERT INTO [UNIQUE] SELECT 4, 'MUKKA',''

INSERT INTO [UNIQUE]
VALUES (5,'VEERA',''),(6,'RAVI',''),(7,'JAN',''),(8,'FEB',''),(9,'MAR','')

SELECT *FROM [UNIQUE]

SELECT GETDATE()

SELECT *FROM [UNIQUE]
ORDER BY UN_NAME DESC
LIMIT 1
----OFFSET 5

SELECT * FROM table_name
ORDER BY column_name DESC
LIMIT 1
--OFFSET 5;



