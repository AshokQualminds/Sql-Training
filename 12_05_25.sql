
--set statistics io,time on
--select * from [Person].[Address] where AddressID = 1000

--set statistics io,time off

drop table if exists n
create table N
(
id int not null
)
insert into n values(1),(3),(5),(7),(9),(11),(13),(15),(2),(4),(6),(8),(10),(12),(14)

alter table n
add constraint primary_key_id primary key (id) 

select* from n

create nonclustered index UX
on n(id)

drop index UX on  n 








