CREATE TABLE ABCD (ID INT ,SALARY MONEY ,NAME VARCHAR(100)); 
---,RUNNING TOTAL ,PREVIOUS,NEXT

INSERT INTO ABCD VALUES (1,'100','A'), (2,'200','B'),(3,'300','C'),(4,'400','D')

--SELECT  SUM(SALARY) ----OVER ( ORDER BY SALARY) AS RUNNING_TOTAL

--FROM A
--GROUP BY SALARY
--ORDER BY SALARY;

SELECT  NAME,SALARY, SUM(SALARY) OVER ( ORDER BY SALARY) AS RUNNING_TOTAL,
ISNULL(LAG(SALARY) OVER(ORDER BY SALARY),0) AS PREVIOUS,
ISNULL(LEAD(SALARY) OVER (ORDER BY SALARY),0) AS NEXT
FROM ABCD
GROUP BY SALARY,NAME;

DROP TABLE ABCD

SELECT SALARY AS LAG FROM ABCD


SELECT  sum(b.salary) FROM ABCD a

INNER JOIN ABCD b ON a.ID=b.ID 
where b.id<=a.id



SELECT* FROM ABCD a

INNER JOIN ABCD b ON a.ID!=b.ID 
where b.id<=a.id


SELECT *  FROM ABCD a

cross JOIN ABCD b 
where b.id >a.id


SELECT a.salary,sum(b.SALARY+a.salary) as s,sum(b.SALARY) FROM ABCD a

cross JOIN ABCD b 
where b.id<=a.id
group by b.id,a.salary


select *,(select sum(salary) from abcd b where b.id <=a.id) as Running_Total from abcd a

declare @salary int
set @salary =0

while @salary >0
begin

update abcd set salary =salary+1 where id=id
 
 end


 declare @salary1 int
set @salary1 =0

while @salary1 >0
begin
UPDATE ABCD
set SALARY += salary
 SELECT @SALARY1 AS RUNNING
 end

 select *  from abcd
 DROP TABLE ABCD
 
 UPDATE ABCD

set SALARY += salary
WHERE ID <=1



 
 declare @z int =1
 set @z +=@Z
 SELECT @Z AS ADDED1

 SELECT * FROM ABCD

 SELECT 
   A.ID,
    A.SALARY,
    prev.SALARY AS PRESALARY,   -- Simulated LAG
    nxt.SALARY AS NXTSALARY     -- Simulated LEAD
FROM ABCD  A

-- LAG: previous row with lower ID
OUTER APPLY (
    SELECT TOP 1 SALARY
    FROM ABCD AS p
    WHERE p.ID < A.ID
    ORDER BY p.ID DESC
) AS prev

-- LEAD: next row with higher ID
OUTER APPLY (
    SELECT TOP 1 SALARY
    FROM ABCD AS n
    WHERE n.ID >A.ID
    ORDER BY n.ID ASC
) AS nxt
ORDER BY A.ID;

SELECT A.ID,
       (SELECT B.SALARY FROM ABCD B WHERE B.ID = A.ID)
FROM ABCD A











