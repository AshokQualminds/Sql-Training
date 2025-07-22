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



-----Storeprocedure from productdatabase

GO

 create procedure usp_CRUD_operations
 (@id int,
 @name varchar(100),
 @age int,
 @address varchar(110),
 @operations varchar(100))
 as
 begin
       if @operations = 'select'
	   begin 
	    select * from Crud
	   End
	   if @operations = 'insert'
	   begin
	   insert into Crud values(@id,@name,@age,@address);
	   end
	   if @operations='update'
	   begin
	   update Crud 
	   set id=@id, name=@name,age= @age,address=@address 
	   where id=@id;
	   end
	   if @operations='delete'
	   begin
	   delete from Crud where id=@id;
	   end

 end;

select*from crud

exec usp_CRUD_operations @id='0',@name='',@age='0',@address='',@operations='select'
  exec usp_CRUD_operations  @id='1',@name='a',@age='12',@address='hyd',@operations='insert'
   exec usp_CRUD_operations  @id='0',@name='b',@age='13',@address='bng',@operations='update'  
    exec usp_CRUD_operations  @id='1',@name='',@age='',@address='',@operations='delete'   


------ globalstoreproceduretemp

create procedure usp_CRUD_operations_GLOBALTEMP
(@id int,@name varchar(100),@age int,@address varchar(110),@operations varchar(100))
as
begin
       if @operations = 'select'
   begin 
         select * from ##temp
  end
	  if @operations='create'
	    begin
	     select * into ##temp from Crud
	   End
            if @operations = 'insert'
   begin
         insert into ##temp values(@id,@name,@age,@address);
   end
          if @operations='update'
   begin
        update ##temp 
        set id=@id, name=@name,age= @age,address=@address 
        where id=@id;
   end
         if @operations='delete'
     begin
          delete from ##temp where id=@id;
      end



end;

drop procedure usp_CRUD_operations_GLOBALTEMP


----select*from crud
go

exec usp_CRUD_operations_GLOBALTEMP @id='0',@name='',@age='0',@address='',@operations='select'
 exec usp_CRUD_operations_GLOBALTEMP @id='0',@name='',@age='0',@address='',@operations='create'
  exec usp_CRUD_operations_GLOBALTEMP  @id='1',@name='a',@age='12',@address='hyd',@operations='insert'
   exec usp_CRUD_operations_GLOBALTEMP  @id='0',@name='b',@age='13',@address='bng',@operations='update'  
    exec usp_CRUD_operations_GLOBALTEMP  @id='1',@name='',@age='',@address='',@operations='delete'   

 select *from ##temp
 ---------------------------------------

 -----------storeproceduretemp

 GO
 create table #temp
 (d int,@name varchar(100),@age int,@address varchar(110),@operations varchar(100)




ALTER procedure [dbo].[usp_CRUD_operations_temp]
(@id int,@name varchar(100),@age int,@address varchar(110),@operations varchar(100))
as
begin
       if @operations = 'select'
??   begin 
??    select * from #temp
	 end
	  if @operations='create'
	  begin
	     select * into #temp from Crud

??   End
??   if @operations = 'insert'
??   begin
??   insert into #temp values(@id,@name,@age,@address);
??   end
??   if @operations='update'
??   begin
??   update #temp 
??   set id=@id, name=@name,age= @age,address=@address 
??   where id=@id;
??   end
??   if @operations='delete'
??   begin
??   delete from #temp where id=@id;
??   end



end;
GO



exec [usp_CRUD_operations_temp] @id='0',@name='',@age='0',@address='',@operations='select'
 exec [usp_CRUD_operations_temp] @id='0',@name='',@age='0',@address='',@operations='create'
  exec [usp_CRUD_operations_temp]  @id='1',@name='a',@age='12',@address='hyd',@operations='insert'
   exec [usp_CRUD_operations_temp]  @id='0',@name='b',@age='13',@address='bng',@operations='update'  
    exec [usp_CRUD_operations_temp]  @id='1',@name='',@age='',@address='',@operations='delete'   

 select * from #temp