use new1
go

;
WITH Numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM Numbers
    WHERE num < 9999
)
SELECT num
FROM Numbers


WHERE num = (
    SELECT SUM(POWER(CAST(d AS INT), LEN(CAST(num AS VARCHAR))))
    FROM STRING_SPLIT(CAST(num AS VARCHAR), '')
    CROSS APPLY (SELECT value AS d) AS Digits
)
OPTION (MAXRECURSION 10000);



;WITH Numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM Numbers
    WHERE num < 9999
)
SELECT num
FROM Numbers
WHERE num = (
    SELECT SUM(POWER(num, LEN(CAST(num AS VARCHAR))))
    FROM Numbers)
	
OPTION (MAXRECURSION 10000);
	
	--STRING_SPLIT(CAST(num AS VARCHAR), '')
  --  CROSS APPLY (SELECT value AS d) AS Digits

OPTION (MAXRECURSION 10000);

;
with numbers as
(
select 1 as num
union all 
select num + 1
from numbers
where num <= 999
)
select *, len( num ) as length_of_number,power(num,3) as power_of_num ,
len(power(num,3)) as len_power_of_number from numbers

----where num in (select max(num)from numbers) 

option (maxrecursion 10000);

select LEN(CAST(num AS VARCHAR) from numbers


---------Armstrong number

;WITH Numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM Numbers
    WHERE num < 9999
)
SELECT num
FROM Numbers
WHERE num = 
    POWER(CAST(SUBSTRING(CAST(num AS VARCHAR(5)), 1, 1) AS INT), LEN(CAST(num AS VARCHAR(5))))
	+ ISNULL(POWER(CAST(SUBSTRING(CAST(num AS VARCHAR(5)), 2, 1) AS INT), LEN(CAST(num AS VARCHAR(5)))), 0)
  + ISNULL(POWER(CAST(SUBSTRING(CAST(num AS VARCHAR(5)), 3, 1) AS INT), LEN(CAST(num AS VARCHAR(5)))), 0)
  + ISNULL(POWER(CAST(SUBSTRING(CAST(num AS VARCHAR(5)), 4, 1) AS INT), LEN(CAST(num AS VARCHAR(5)))), 0)

OPTION (MAXRECURSION 10000);



WITH RECURSIVE Fibonacci (n, a, b) AS (
    SELECT 1, 0, 1
    UNION ALL
    SELECT n + 1, b, a + b
    FROM Fibonacci
    WHERE n < 20
)
SELECT n, a AS fibonacci_number
FROM Fibonacci;


CREATE TABLE fibonacci_series (
    term_number INT PRIMARY KEY,
    fibonacci_number BIGINT
);

WITH RECURSIVE Fibonacci (n, a, b) AS (
    SELECT 1, 0, 1
    UNION ALL
    SELECT n + 1, b, a + b
    FROM Fibonacci
    WHERE n < 20  -- Change to desired number of terms
)
INSERT INTO fibonacci_series (term_number, fibonacci_number)
SELECT n, a
FROM Fibonacci;

;
WITH Fibonacci (n, a, b) AS (
    SELECT 1, CAST(0 AS BIGINT), CAST(1 AS BIGINT)
    UNION ALL
    SELECT n + 1, b, a + b
    FROM Fibonacci
    WHERE n < 200
)
--INSERT INTO fibonacci_series (term_number, fibonacci_number)
SELECT n, a
FROM Fibonacci
OPTION (MAXRECURSION 0);

-------output: Msg 8115, Level 16, State 2, Line 111
------Arithmetic overflow error converting expression to data type bigint.
---- the limit of the number reaches the limit

WITH Fibonacci (n, a, b) AS (
    SELECT 1, CAST(0 AS BIGINT), CAST(1 AS BIGINT)
    UNION ALL
    SELECT n + 1, b, a + b
    FROM Fibonacci
    WHERE n < 92
)
--INSERT INTO fibonacci_series (term_number, fibonacci_number)
SELECT n, a
FROM Fibonacci
OPTION (MAXRECURSION 0);


select * from fibonacci_series
select * from fibonacci_series1

CREATE TABLE fibonacci_series1 (
    term_number INT PRIMARY KEY,
    fibonacci_number BIGINT
);



DECLARE @n INT = 1;  -- Term number
DECLARE @a BIGINT = 0;  -- First number
DECLARE @b BIGINT = 1;  -- Second number
DECLARE @temp BIGINT;
DECLARE @max_terms INT = 92;  -- Up to 92 to avoid arthemetic overflow

WHILE @n <= @max_terms
BEGIN
    INSERT INTO fibonacci_series1 (term_number, fibonacci_number)
    VALUES (@n, @a);

    SET @temp = @a + @b;
    SET @a = @b;
    SET @b = @temp;

    SET @n = @n + 1;
END;


;WITH FEBI (N,A,B) 
AS 
(
SELECT 1  ,CAST( 0 AS BIGINT), CAST(1 AS BIGINT) 
UNION ALL 
SELECT N+1,B,A+B
FROM FEBI
)
SELECT N,A ,LEN(A)
FROM FEBI 

WHERE N < 90

OPTION (MAXRECURSION 0);

CREATE FEBI ( ID INT , FEBIVALUE INT)


DECLARE @X INT =1
DECLARE @C BIGINT =0
DECLARE @D BIGINT =1
DECLARE @T INT;
DECLARE @MAX BIGINT;

WHILE @X<= @MAX

BEGIN

 SET @T=@C+@D;
 SET @C=@D;
 SET @D=@T;

 SET @X=@X+1;

 END










