use new1
go

SELECT 
  word,
  CASE 
    WHEN LOWER(word) = REVERSE(LOWER(word)) THEN 'Palindrome'
    ELSE 'Not Palindrome'
  END AS result
FROM (
  SELECT 'Level' AS word
) AS words;

select 
word,
case when upper(word)=reverse(upper(word)) then 'palindrome'
      else 'not palindrome'
end as result
from 
( select 'travel' as word) as words;



select 
word,
case when word= reverse(word) then 'palindrome'
     else 'not palindrome'
	 end as result
	 from ( select 'name' as word) as words;



declare @a varchar(100)
set @a='121121'
select case when @a = reverse(@a) then 1
else 0 end

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


;with CTE (N,A,B) as 
(
select 1 as INT,CAST(0 as BIGINT),CAST (1 AS BIGINT)
UNION ALL 
SELECT N+1,B,A+B
FROM CTE 
WHERE N<92
)
SELECT N,A FROM CTE 

OPTION (MAXRECURSION 0);

--------------------------------------------------------------


