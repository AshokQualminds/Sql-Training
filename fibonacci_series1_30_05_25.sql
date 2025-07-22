
CREATE TABLE fibonacci_series1 (
    term_number INT PRIMARY KEY,
    fibonacci_number BIGINT
);



DECLARE @n INT = 1;  -- Term number
DECLARE @a BIGINT = 0;  -- First number
DECLARE @b BIGINT = 1;  -- Second number
DECLARE @temp BIGINT;
DECLARE @max_terms INT = 92;  -- Up to 92 to avoid overflow

WHILE @n <= @max_terms
BEGIN
    INSERT INTO fibonacci_series1 (term_number, fibonacci_number)
    VALUES (@n, @a);
    SET @temp = @a + @b;
    SET @a = @b;
    SET @b = @temp;

    SET @n = @n + 1;
END;


select * from fibonacci_series1