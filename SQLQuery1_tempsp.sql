create procedure usp_CRUD_operations_temp
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

drop procedure usp_CRUD_operations_temp


select*from crud
exec usp_CRUD_operations @id='0',@name='',@age='0',@address='',@operations='select'
 exec usp_CRUD_operations @id='0',@name='',@age='0',@address='',@operations='create'
  exec usp_CRUD_operations  @id='1',@name='a',@age='12',@address='hyd',@operations='insert'
   exec usp_CRUD_operations  @id='0',@name='b',@age='13',@address='bng',@operations='update'  
    exec usp_CRUD_operations  @id='1',@name='',@age='',@address='',@operations='delete'   

 select *from #temp