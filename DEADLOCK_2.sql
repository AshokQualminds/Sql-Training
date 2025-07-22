--use 
--pmdb
--go 


--create table deadlocktest
--(
--id int primary key,
--value int
--)
--;

--insert into deadlocktest values (1,100),(2,200)

--select* from
--deadlocktest

BEGIN TRANSACTION 

UPDATE DEADLOCKTEST SET VALUE = VALUE + 10 WHERE ID =1

WAITFOR DELAY '00:00:05'

UPDATE DEADLOCKTEST SET VALUE =VALUE + 10 WHERE ID=2

COMMIT;

--SELECT * FROM DEADLOCKTEST