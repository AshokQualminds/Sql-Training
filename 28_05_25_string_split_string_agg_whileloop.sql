select CURRENT_TIMESTAMP as date_and_time--current_timestamp  which is ansi sql can be used multiple databases
select getdate() as date ----which is specifically for sql server ...

use NEW1
go

select * from [dbo].[Employee1]

select concat(first_name,first_name) from employee1

select 
first_name,
case 
when first_name ='sourabh' then 's' else 'n'end

from employee1


select 
first_name,
case 
when first_name =first_name then '1' else '0'end

from employee1





select stuff('abcdefghijklmnopqrstuvwxyz',4,2,'   ')

select string_agg(First_Name,',') as comma_seperated from Employee1

select string_agg(concat('{',empid,':',first_name,'}'),',') as c from employee1

-- Create the Product table
CREATE TABLE Product1 (
    ProductDescription VARCHAR(100)
);

-- Insert some sample data
INSERT INTO Product1 (ProductDescription) VALUES
('Shirt,Blue,Large'),
('Pants,Black,Medium'),
('Dress,Red,Small');

select * from product1

select  value as color
from product1 p
cross apply string_split(p.productdescription,',');

-- Query to extract the color from the ProductDescription column

SELECT 
    ProductDescription,
    SUBSTRING(
        ProductDescription,
        charindex(',', ProductDescription) + 1,
        charindex(',', ProductDescription, charindex(',', ProductDescription) + 1)
		                                - charindex(',', ProductDescription) - 1
    ) AS Color
FROM 
    Product1;


	CREATE TABLE Products2 (
    ProductID INT,
    Tags NVARCHAR(100)
);

INSERT INTO Products2 VALUES
(1, 'Fruit,Fresh,Organic'),
(2, 'Vegetable,Local,Organic');

select * from products2

select  value as tag
from products2 p
cross apply string_split(p.tags,',');

select productid,value as tag
from
products2 p cross apply string_split(p.tags,',');


CREATE TABLE TestData (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    DataValue NVARCHAR(100),
    InsertTime DATETIME DEFAULT GETDATE()
);
---drop table testdata
declare @i int
set @i=1 

while @i<5000
begin
insert into testdata (DataValue)
values(@i);
if @i % 1000 =0
begin
print concat ('inserted',@i,'records.waiting for 5 seconds...');
waitfor delay '00:00:05';
end
set @i=@i+1
end


select* from testdata

CREATE TABLE TestData2 (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    DataValue NVARCHAR(100),
    InsertTime DATETIME DEFAULT GETDATE()
);

DECLARE @j INT = 1;

WHILE @j <= 5000
BEGIN
    INSERT INTO TestData2 (DataValue)
    VALUES (CONCAT('Row ', @j));

    -- After every 1000 records, wait for 5 seconds
    IF @j % 1000 = 0
    BEGIN
        PRINT CONCAT('Inserted ', @j, ' records. Waiting for 5 seconds...');
        WAITFOR DELAY '00:00:05';
    END

    SET @j = @j + 1;
END

select* from testdata2




select * from employee1

;with recursivecte as 
(
select empid ,cast(first_name as varchar(max)) as concatenated_result from employee1 
where empid=1
union all
select e1.EmpId,concat(r.concatenated_result,',',e1.First_Name)
from employee1 e1
inner join recursivecte r on e1.empid= r.empid +1
)
select concatenated_result from recursivecte where empid=(select max(empid) from employee1 );







;with recursivecte as 
(
select empid ,first_name as concatenated_result from employee1 where empid=1
union all
select e1.EmpId,concat(r.concatenated_result,',',e1.First_Name)
from employee1 e1
inner join recursivecte r on e1.empid= r.empid +1
)
select concatenated_result from recursivecte where empid=(select max(empid) from employee1 );



--WITH RecursiveCTE AS (
--    SELECT id, CAST(column_name AS VARCHAR(MAX)) AS concatenated_result
--    FROM table_name
--    WHERE id = 1
--    UNION ALL
--    SELECT t.id, CONCAT(r.concatenated_result, ', ', t.column_name)
--    FROM table_name t
--    INNER JOIN RecursiveCTE r ON t.id = r.id + 1
--)
--SELECT concatenated_result
--FROM RecursiveCTE
--WHERE id = (SELECT MAX(id) FROM table_name);


0 1 1 2 3 5 8 13 21



121121


153 = 1^3+5^3+3^3

select power(153,3);








-----------palindrome 

declare @a varchar(100)
set @a='121121'
select case when @a = reverse(@a) then 1
else 0 end

select len('153')

declare @b int 
set @b =121121

select case when @



declare @z int
set @z=0

while @z<=10

set @z = @z+1
print @z



WITH PRIME
AS(
select 2 as Primenbr
union all
select A.Primenbr+1 as value
from Prime A
where A.Primenbr<=50
)
select Primenbr
from Prime A
where not exists(select 1 from Prime B where A.Primenbr % B.Primenbr=0 and a.Primenbr !=b.Primenbr)

SELECT 
  word,
  CASE 
    WHEN LOWER(word) = REVERSE(LOWER(word)) THEN 'Palindrome'
    ELSE 'Not Palindrome'
  END AS result
FROM (
  SELECT 'Level' AS word
) AS words;


;WITH Numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1 FROM Numbers WHERE num < 99
)
SELECT num
FROM Numbers
WHERE num = (
    SELECT SUM(POWER(CAST(value AS INT), LEN(CAST(num AS VARCHAR))
	)
	)
    FROM STRING_SPLIT(CAST(num AS VARCHAR), '') 
)
OPTION (MAXRECURSION 0);


