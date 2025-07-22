goto , break, loop , while loop,exit ,not exist,stuff ,for xml,string_agg , lag() and lead()


select len('ashokkrishnapardha')-len(replace('ashokkrishnapardha','a','')) as a_count


select replace('ashokkrishnapardha','a',' ')
select len('ashokkrishnapardha')
select len(replace('ashokkrishnapardha','a',''))

SELECT STUFF('abcdef', 2, 3, 'XYZ');

SELECT STUFF('abcdef', 1,2, 'XYZ');
SELECT STUFF('abcdef', 2,3, 'XYZ');
SELECT STUFF('abcdef', 3,4, 'XYZ');

drop  table if exists  #a  
create table #A
(id int)
drop table if exists #b
create table #b
(id int)

insert into #a (id) values(1),(1),(0),(null)
insert into #b values (1),(1),(0),(0)

select * from #a
select * from #b


select * from #a a inner join #b b on a.id=b.id  
select * from #a a left join #b b on a.id=b.id
select * from #a a right join #b b on a.id=b.id
select * from #a a full  join #b b on a.id=b.id
select * from #a a cross join #b --b on a.id=b.id


SELECT DATEADD(DAY, number, CAST(GETDATE() AS DATE)) AS TheDate
FROM master..spt_values
WHERE type = 'P' AND number BETWEEN 0 AND 30;


WITH DateSeries AS (
    SELECT CAST(GETDATE() AS DATE) AS TheDate
    UNION ALL
    SELECT DATEADD(DAY, 1, TheDate)
    FROM DateSeries
    WHERE TheDate < DATEADD(DAY, 9, CAST(GETDATE() AS DATE))
)
SELECT *
FROM DateSeries;


WITH DateSeries AS (
    SELECT GETDATE() AS DATE
    UNION ALL
    SELECT DATEADD(DAY, 1, Date)
    FROM DateSeries
    WHERE Date < DATEADD(DAY, 9, GETDATE())
)
SELECT *
FROM DateSeries;



--stuff function
select * from employees

SELECT 
  STUFF(
  (
          SELECT ',' + Name
            FROM Employees
                FOR XML PATH(''), TYPE
  )
  .value('.', 'NVARCHAR(MAX)'), 1, 1, '') AS EmployeeList

