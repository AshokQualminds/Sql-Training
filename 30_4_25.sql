--dead locks and transactions and window functions 

---dev-- stage-- production

--views and
--materlized views
--pivot and unpivot
--corelated store procedure
-- self joins
---RECURSIVE JOINS AND CTES
--
USE NEW1
GO


--select DATALENGTH(orderdate),* from 
--sales.salesorderheader


--create table product
--(
--customername varchar(100),
--product varchar(100),
--amount decimal(10,2)
--)

--insert into product 
--values( 'james','laptop',30000),( 'james','desktop',25000),( 'devid','laptop',25000),( 'smith','desktop',30000)
--,( 'pam','laptop',30000),( 'pam','laptop',45000),( 'john','desktop',30000),( 'john','desktop',30000)
--,( 'john','laptop',30000)


--insert into product  (customername,product)
--values('smith','  ')
--update product 
--set product ='laptop'
--where customername= 'smith'

--update product
--set amount =65000
--where amount 

---drop table product

select* from product --order by customername

select customername,laptop,desktop
from product
pivot (
sum(amount) for product in (laptop,desktop)
)
as pivot_table

---order by customername

--select isnull(amount,1)
--from product
-----------------------------------------------
GO
use
NEW1
go

 

create table id (id int) 
insert into id values(1),(1),(1),(1)

create table id1 (id int) 
insert into id1 values(1),(1),(1),(1)

insert into id values(0),(2),(3)
insert into id1 values(7),(4),(5)

select * from id
select * from id1

select * --count(1)
from id a
inner join id1 b  on a.id=b.id

17

select * --count(1)
from id a
cross join id1 b  --on a.id=b.id

49

select*--- count(1)
from id a
full join id1 b  on a.id=b.id

16+1+4= 21


select *--count(1)
from id a
right join id1 b  on a.id=b.id

17+2  19

select* --count(1)
from id a
left join id1 b  on a.id=b.id

17+2 19
---left  

SELECT *
FROM ID A
JOIN ID B ON A.ID=B.ID
------------------------------------------------
WITH PRIME
AS(
select 2 as Primenbr
union all
select A.Primenbr+1 as value
from Prime A
where A.Primenbr<=100
)
select Primenbr
from Prime A
where NOT exists(select 1 from Prime B
where A.Primenbr
%
B.Primenbr=0 AND A.Primenbr != B.Primenbr)


----------------------------------------------------------
GO

;WITH  org_chart AS
(
    SELECT ID, NAME, MANAGER_ID, 0 AS LEVEL
    FROM EMPLOYEES1
    WHERE MANAGER_ID IS NULL
    UNION ALL
    SELECT e.ID, e.NAME, e.MANAGER_ID, c.LEVEL + 1
    FROM EMPLOYEES1 e
    JOIN org_chart c ON e.MANAGER_ID = c.id
)
SELECT NAME, LEVEL
FROM org_chart
ORDER BY LEVEL, NAME

OPTION (MAXRECURSION 0);

CREATE TABLE EMPLOYEES1
(ID INT,NAME VARCHAR(100),MANAGER_ID VARCHAR(100))

ALTER TABLE EMPLOYEES1 ALTER COLUMN MANAGER_ID INT

SELECT*FROM EMPLOYEES1

INSERT INTO EMPLOYEES1 VALUES (1,'ALICE',NULL )
INSERT INTO EMPLOYEES1 VALUES (2,'BOB',1 )
INSERT INTO EMPLOYEES1 VALUES (3,'CHARLIE',1 )
INSERT INTO EMPLOYEES1 VALUES (4,'DAVID',2 )
INSERT INTO EMPLOYEES1 VALUES (5,'EVE',2 )
INSERT INTO EMPLOYEES1 VALUES (6,'FRANK',3 )
INSERT INTO EMPLOYEES1 VALUES (1,'GREES',3 )

