
;WITH Numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1 FROM Numbers WHERE num < 99
)
SELECT num
FROM Numbers
WHERE num = (
    SELECT SUM(POWER(CAST(value AS INT), LEN(CAST(num AS VARCHAR)))
	)
    FROM STRING_SPLIT(CAST(num AS VARCHAR), '') 
)
OPTION (MAXRECURSION 100);

select len(123)
-----------------------------------------------------------------------------

-- Armstrong Number Finder in SQL Server
-- Works for numbers from 1 to 9999
;WITH Numbers AS (
    SELECT 1 AS Num
    UNION ALL
    SELECT Num + 1
    FROM Numbers
    WHERE Num < 9999
),
Digits AS (
    SELECT
        Num,
        LEN(CAST(Num AS VARCHAR)) AS DigitCount,
        CAST(Num AS VARCHAR) AS NumStr
    FROM Numbers
),
ArmstrongCheck AS (
    SELECT
        Num,
        SUM(POWER(CAST(SUBSTRING(NumStr, v.number, 1) AS INT), DigitCount)) AS ArmstrongSum
    FROM Digits
    JOIN master.dbo.spt_values v
        ON v.type = 'P' AND v.number BETWEEN 1 AND 4
        AND v.number <= LEN(NumStr)
    GROUP BY Num, NumStr, DigitCount
)
SELECT Num
FROM ArmstrongCheck
WHERE Num = ArmstrongSum
ORDER BY Num
OPTION (MAXRECURSION 10000);
