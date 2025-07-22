-- Step 1: Create a temp table to store the final result
CREATE TABLE #ABCD_RESULT (
    ID INT,
    NAME VARCHAR(50),
    SALARY INT,
    CUMULATIVE_SALARY INT,
    PREV_SALARY INT,
    NEXT_SALARY INT
);

-- Step 2: Declare necessary variables
DECLARE 
    @ID INT,
    @NAME VARCHAR(50),
    @SALARY INT,
    @PREV_SALARY INT = NULL,
    @NEXT_ID INT,
    @NEXT_SALARY INT,
    @CUMULATIVE INT = 0;

-- Step 3: Create a cursor for ordered traversal
DECLARE salary_cursor CURSOR FOR
SELECT ID, NAME, SALARY FROM ABCD ORDER BY ID;

OPEN salary_cursor;
FETCH NEXT FROM salary_cursor INTO @ID, @NAME, @SALARY;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Calculate running total
    SET @CUMULATIVE = @CUMULATIVE + @SALARY;

    -- Get next row's salary for LEAD simulation
    SELECT TOP 1 @NEXT_SALARY = SALARY 
    FROM ABCD 
    WHERE ID > @ID 
    ORDER BY ID ASC;

    -- Insert into result table
    INSERT INTO #ABCD_RESULT (ID, NAME, SALARY, CUMULATIVE_SALARY, PREV_SALARY, NEXT_SALARY)
    VALUES (@ID, @NAME, @SALARY, @CUMULATIVE, @PREV_SALARY, @NEXT_SALARY);

    -- Update previous salary for next iteration
    SET @PREV_SALARY = @SALARY;

    -- Clear next salary value for next row
    SET @NEXT_SALARY = NULL;

    FETCH NEXT FROM salary_cursor INTO @ID, @NAME, @SALARY;
END

-- Step 4: Cleanup
CLOSE salary_cursor;
DEALLOCATE salary_cursor;

-- Step 5: View the result
SELECT * FROM #ABCD_RESULT;

-- Optional: DROP TABLE #ABCD_RESULT;




-----------WITHOUT NULLS USING ISNULL 


-- Step 1: Create a temp table to store the final result
CREATE TABLE #ABCD_RESULT (
    ID INT,
    NAME VARCHAR(50),
    SALARY INT,
    CUMULATIVE_SALARY INT,
    PREV_SALARY INT,
    NEXT_SALARY INT
);

-- Step 2: Declare necessary variables
DECLARE 
    @ID INT,
    @NAME VARCHAR(50),
    @SALARY INT,
    @PREV_SALARY INT = NULL,
    @NEXT_SALARY INT,
    @CUMULATIVE INT = 0;

-- Step 3: Create a cursor for ordered traversal
DECLARE salary_cursor CURSOR FOR
SELECT ID, NAME, SALARY FROM ABCD ORDER BY ID;

OPEN salary_cursor;
FETCH NEXT FROM salary_cursor INTO @ID, @NAME, @SALARY;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Calculate running total
    SET @CUMULATIVE = @CUMULATIVE + @SALARY;

    -- Get next row's salary for LEAD simulation
    SELECT TOP 1 @NEXT_SALARY = SALARY 
    FROM ABCD 
    WHERE ID > @ID 
    ORDER BY ID ASC;

    -- Replace NULLs with 0 for prev and next salaries
    SET @PREV_SALARY = ISNULL(@PREV_SALARY, 0);
    SET @NEXT_SALARY = ISNULL(@NEXT_SALARY, 0);

    -- Insert current row with cumulative, previous, and next salaries
    INSERT INTO #ABCD_RESULT (ID, NAME, SALARY, CUMULATIVE_SALARY, PREV_SALARY, NEXT_SALARY)
    VALUES (@ID, @NAME, @SALARY, @CUMULATIVE, @PREV_SALARY, @NEXT_SALARY);

    -- Update previous salary for next iteration
    SET @PREV_SALARY = @SALARY;

    -- Reset next salary for next iteration
    SET @NEXT_SALARY = NULL;

    FETCH NEXT FROM salary_cursor INTO @ID, @NAME, @SALARY;
END

-- Step 4: Cleanup cursor
CLOSE salary_cursor;
DEALLOCATE salary_cursor;

-- Step 5: Show results
SELECT * FROM #ABCD_RESULT;

-- Optional: Drop temp table if no longer needed
-- DROP TABLE #ABCD_RESULT;
