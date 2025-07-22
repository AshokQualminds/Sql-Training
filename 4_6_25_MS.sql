--palindrome
CREATE OR ALTER PROC U_palindrome(
@n nvarchar(20)
)
AS
BEGIN
	DECLARE @p nvarchar(20)='',@k int
	SET @k=len(@n)
	WHILE @k>0
	BEGIN
		SET @p=@p+substring(@n,@k,1)
		SET @k=@k-1
	END
	PRINT @p 
	IF @p=@n
	 BEGIN
		PRINT 'IT IS PALINDROME'
	END
	ELSE
	BEGIN
	 PRINT 'it is not palindrome'
	END
END
GO
EXEC  U_palindrome 12121

--ARMSTRONG
;
go
CREATE OR ALTER PROC armstrong
(@n int)
AS
BEGIN
	declare @m int=3,@r int,@i int,@k int=0,@l int,@o varchar(20)
	SET @o=CAST(@n AS VARCHAR(20))
	SET @r=len(@o)
	SET @n=CAST(@n as int)
	set @l=@n
	while @r>0
	BEGIN
		set @k=@k+power((@n%10),@m)
		set @n=(@n/10)
		set @r=@r-1
	END
	PRINT @k
	IF @k=@l
	BEGIN
		PRINT 'IT IS ARMSTRONG NUMBER'
	END
	ELSE
	BEGIN
		PRINT 'IT IS NOT ARMSTRONG NUMBER'
	END
END
GO
EXEC armstrong 153


--fibonacci series
CREATE OR ALTER PROC fibonacci(@n int)
AS
BEGIN 
	DECLARE @a int=0,@b int=1,@c int,@i int=0
	SET @c=@a+@b
	while @i<@n
	begin
		print @a
		set @a=@b
		set @b=@c
		set @c=@a+@b
		set @i=@a
	end
end
go
exec fibonacci 100

--fibonacci using cte 
with fibonacci(a,b) as (
select 0,1
union ALL
select b,a+b
from fibonacci
where	a+b <100
)
select a as finonacci_series from fibonacci

--row_running
use room1_ER
drop table salary
create table salary(id int identity,name varchar(20),salary int)

insert into salary(name,salary) values('a',100)
insert into salary(name,salary) values('b',200),('c',300),('d',400)

select * from salary

alter table salary 
add row_running int

declare @i int=1,@m int,@k int,@n int
select @n=count(*) from salary
select @m=0
while @i<=@n
begin
	select @k=salary from salary where @i=id
	set @m=@m+@k
	update salary 
	set row_running=@m
	where id=@i and row_running is null
	set @i=@i+1
end

select * from salary

alter table salary
add low_value int

alter table salary
drop column low_value 

declare @i int=0,@n int,@k int
select @n=count(*) from salary
while @i<@n
	begin
		if not exists(select 1 from salary where @i=id)
			begin
				update salary
				set low_value=0
				where id=(@i+1)
				set @i=@i+1
			end
		else
			begin
				select @k=salary from salary where id=@i
				update salary 
				set low_value=@k
				where id=(@i+1)
				set @i=@i+1
			end
	end

select * from salary

alter table salary
add high_value int

declare @i int=1,@n int,@k int
select @n=count(*) from salary
while @i<=@n
	begin
		if exists(select 1 from salary where @i<id)
			begin
				select @k=salary from salary where id=@i+1
				update salary
				set high_value=@k
				where id=@i
				set @i=@i+1
			end
		else
			begin
				update salary 
				set high_value=0
				where id=@i
				set @i=@i+1
			end
	end