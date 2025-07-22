
DECLARE @BinaryVariable2 BINARY(2);
DECLARE @IntValue INT;

-- Initialize binary value with a 2-byte hex literal (e.g., 0x3039 = 12345)
SET @BinaryVariable2 = 0x3039;

-- Cast binary to int, increment
SET @IntValue = CAST(@BinaryVariable2 AS INT) + 1;

-- Optional: Store back into binary (if needed)
SET @BinaryVariable2 = CAST(@IntValue AS BINARY(2));

-- Output the result
SELECT @IntValue AS Result;
GO

create procedure spoperations
@salary int ,@operations  int 
as 

begin

;with cte as insert
(

insert into employee  values (1,'v',100000)
) as insert

where salary= @salary

end

select *from employee

insert into employee  values (1,'v',100000)
where id=@i


update employee
set name='v1',id=2,salary=2000 where id=@u

select* from employee
select * from crud

create table Crud
(
id int,
name varchar(100),
age int,
address varchar(100)
)
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
 exec usp_CRUD_operations '0','','0','','select'
  exec usp_CRUD_operations '1','a','12','hyd','insert'
   exec usp_CRUD_operations '0','b','13','sec','update'
    exec usp_CRUD_operations '0','','','','delete'