create database pmdb

use pmdb
go

create table EMP
(
ID int,
ENAME varchar(20),
HIREDATE date
)

INSERT INTO EMP VALUES ( 1,'SMITH',GETDATE())
INSERT INTO EMP VALUES ( 2,'SMITH','10-4-2025')

--SELECT *FROM EMP
--SELECT 'THE EMPLOYEE'+’ ‘+ENAME+’ ‘+'JOINED ON DATE'+’ ‘+CAST 
--(HIREDATE AS VARCHAR) FROM EMP 

--| Function                   | Description                                                                                             | Example                                             |
--| -------------------------- | ------------------------------------------------------------------------------------------------------- | --------------------------------------------------- |
--| `UPPER()`                  | Converts to uppercase                                                                                   | `UPPER('sql') ? 'SQL'`                              |
--| `LOWER()`                  | Converts to lowercase                                                                                   | `LOWER('SQL') ? 'sql'`                              |
--| `LENGTH()` / `LEN()`       | Returns length of a string<br>? `LENGTH()` in MySQL, PostgreSQL<br>? `LEN()` in SQL Server              | `LENGTH('hello') ? 5`                               |
--| `TRIM()`                   | Removes spaces from both ends                                                                           | `TRIM(' SQL ') ? 'SQL'`                             |
--| `LTRIM()`                  | Removes spaces from left                                                                                | `LTRIM(' SQL') ? 'SQL'`                             |
--| `RTRIM()`                  | Removes spaces from right                                                                               | `RTRIM('SQL ') ? 'SQL'`                             |
--| `SUBSTRING()` / `SUBSTR()` | Extracts part of a string<br>? `SUBSTRING()` in SQL Server, MySQL<br>? `SUBSTR()` in Oracle, PostgreSQL | `SUBSTRING('database', 1, 4) ? 'data'`              |
--| `REPLACE()`                | Replaces substring                                                                                      | `REPLACE('abcabc', 'a', 'x') ? 'xbcxbc'`            |
--| `CONCAT()`                 | Concatenates strings                                                                                    | `CONCAT('SQL', 'Fun') ? 'SQLFun'`                   |
--| `CONCAT_WS()`              | Concatenates with separator                                                                             | `CONCAT_WS('-', '2025', '05', '05') ? '2025-05-05'` |
--| `INSTR()`                  | Returns position of substring<br>? MySQL, Oracle                                                        | `INSTR('database', 'base') ? 5`                     |
--| `POSITION()`               | Similar to `INSTR` in PostgreSQL                                                                        | `POSITION('base' IN 'database') ? 5`                |
--| `LEFT()`                   | Extracts leftmost characters                                                                            | `LEFT('SQLFun', 3) ? 'SQL'`                         |
--| `RIGHT()`                  | Extracts rightmost characters                                                                           | `RIGHT('SQLFun', 3) ? 'Fun'`                        |
--| `REVERSE()`                | Reverses the string<br>? Not available in PostgreSQL natively                                           | `REVERSE('abc') ? 'cba'`                            |
--| `ASCII()`                  | Returns ASCII code of first character                                                                   | `ASCII('A') ? 65`                                   |
--| `CHAR()` / `CHR()`         | Returns character from ASCII code                                                                       | `CHAR(65) ? 'A'` (MySQL) / `CHR(65)` (PostgreSQL)   |
--| `INITCAP()`                | Capitalizes first letter of each word (Oracle/PostgreSQL)            
--                                   | `INITCAP('sql functions') ? 'Sql Functions'`        |











----------------------------

create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

insert into icc_world_cup values ('Aus','India','draw');
select * from icc_world_cup;

select count(*)
from icc_world_cup

--select  as team_name,
--as no_of_matches_played,
--as no_of_wins,
--as no_of_loses
--from 
--icc_world_cup



select team_1 as Team, case when team_1=Winner then 1 else 0 end as win_flag
from icc_world_cup
union all
select team_2 as Team , case when team_2=winner then 1 else 0 end as win_flag
from icc_world_cup
----------------------------------
select Team ,count(1) no_of_matches_played,sum(win_flag) as no_of_matches_won
,count(1)-sum(win_flag) as no_of_losses
from (
select team_1 as Team, case when team_1=Winner then 1 else 0 end as win_flag
from icc_world_cup
union all
select team_2 as Team , case when team_2=winner then 1 else 0 end as win_flag
from icc_world_cup
) A

group by Team
order by  Team -- no_of_matches_won desc

----------------------------------
---leader board

select Team ,count(1) no_of_matches_played,sum(win_flag) as no_of_matches_won
,count(1)-sum(win_flag) as no_of_losses
from (
select team_1 as Team, case when team_1=Winner then 1 else 0 end as win_flag
from icc_world_cup
union all
select team_2 as Team , case when team_2=winner then 1 else 0 end as win_flag
from icc_world_cup
) A

group by Team
order by no_of_matches_won desc

-----------------------

-----case for draw statement

--case when Winner = 'draw'  then 1 else 0 end as draw

select team_1 ,count(1) as no_of_matches_played,* from icc_world_cup
group by team_1

select Team_1 , count(Team_1) as no_of_matches_played,
case
    when Team_1=Winner then 1 else 0 end as win_flag
from icc_world_cup
group by Team_1

order by no_of_matches_played

-------

SELECT team_name , count(team_name) as noOfmatchPlayed,sum(noOfWins) as noOfWins, 
((count(team_name) -  sum(noOfWins)) - sum(noOfDraws)) as noOfLoss,
sum(noOfDraws) as noOfDraws
from (
select team_1 as team_name, 
	   case 
		   when  team_1=winner 
				then 1 
				else 0 
				end as noOfWins,
	   case 
		   when winner='Draw' then 1 
		   else 0 
		   end as noOfDraws 
from icc_world_cup 
union all
select team_2 as team_name,
		case 
				when  team_2=winner 
				then 1 
				else 0 end as noOfWins,
	case
			when winner='Draw' then 1 else 0 end as noOfDraws from icc_world_cup
) A 
group by team_name order by noOfWins desc
