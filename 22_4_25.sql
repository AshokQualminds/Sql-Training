create table veeraage
(
id int , name varchar(50),DOB date,Hiredate date
)
insert into veeraage
values (2,'b','10/10/2020',getdate()),
(3,'c','1/1/2000',getdate()), 
(4,'d','11/10/2019',getdate()),
(5,'e','2/1/1995',getdate())



select * from veeraage

select 
       id,
       name,
       DOB ,
       hiredate,
       datediff(year,dob,hiredate) 
           -case 
           when month(dob)>month(dob)
                or(month(dob)=month(dob) and day(dob)>day(dob))
           then 1
           else 0
           end as employeeage

from veeraage




create table employeeage
(
id int , name varchar(50),DOB date,Hiredate date
)
insert into employeeage
values(1,'a','21/4/1999',getdate())
(2,'b','10/10/2020',getdate()),
(3,'c','1/1/2000',getdate()), 
(4,'d','11/10/2019',getdate()),
(5,'e','2/1/1995',getdate())

select * from employeeage
select 
     Id,
	 Name,
	 DOB,
	 Hiredate,
	 DATEDIFF(year,DOB,HIREDATE)
	 -case when month(DOB)>month(dob)
	 or (month(dob)=month(dob) and day(dob)>day(dob))
	 Then 1
	 Else 0
	 End As EmployeeAge

	 from employeeAge
where Id=@id

go
	 create procedure usp_employeeage
	 (@id int, @name varchar(50)
	 )
	 AS
	 Begin
	 select 
     Id,
	 Name,
	 DOB,
	 Hiredate,
	 DATEDIFF(day,DOB,HIREDATE)
	 -case when 
	 month(DOB)>month(dob) or (month(dob)=month(dob) and day(dob)>day(dob))
	 Then 1
	 Else 0
	 End As EmployeeAge

	 from employeeAge
     where Id=@id or name =@name 

	 END
drop procedure usp_employeeage
	 
	 
	 exec usp_employeeage @id='8',@name=''

select datediff(day,'4/21/1999','1/1/2000')

select*from employeeage

insert into employeeage
values(8,'g','12/31/1999','1/1/2000')