WITH CTE AS
(

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

			)
SELECT * FROM 
CTE ORDER BY noOfDraws DESC


SELECT * FROM icc_world_cup;

WITH CTE AS
(
select team_1 as team_name, COUNT(Team_1) AS NO_OF_MATCHES_PLAYED,
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
group by team_1,WINNER
UNION ALL

select team_2 as team_name, COUNT(Team_2) AS NO_OF_MATCHES_PLAYED,
	   case 
		   when  team_2=winner 
				then 1 
				else 0 
				end as noOfWins,
	   case 
		   when winner='Draw' then 1 
		   else 0 
		   end as noOfDraws 
from icc_world_cup
GROUP BY team_2,Winner
)
SELECT * FROM CTE
GROUP BY TEAM_NAME,Winner

SELECT * FROM icc_world_cup



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



WITH CTE AS (
select team_1 as team_name, 
	   case 
		   when  team_1=winner 
				then 1 
				else 0 
				end as Wins,
	   case 
		   when winner='Draw' then 1 
		   else 0 
		   end as Draws 
from icc_world_cup 
union all
select team_2 as team_name,
		case 
				when  team_2=winner 
				then 1 
				else 0 end as Wins,
	case
			when winner='Draw' then 1 else 0 end as Draws from icc_world_cup
) 

SELECT team_name , count(team_name) as MatchesPlayed,sum(Wins) as Wins, 
((count(team_name) -  sum(Wins)) - sum(Draws)) as Losses,
sum(Draws) as Draws
FROM CTE

group by team_name order by Wins desc


SELECT

    Team,

    COUNT(*) AS Matches_Played,

    SUM(CASE WHEN Team = Winner THEN 1 ELSE 0 END) AS Wins,

    SUM(CASE WHEN Result = 'tie' OR Result = 'no result' THEN 1 ELSE 0 END) AS Draws

FROM (

    SELECT Team1 AS Team, Winner, Result FROM IPL_Matches

    UNION ALL

    SELECT Team2 AS Team, Winner, Result FROM IPL_Matches

) AS AllMatches

GROUP BY Team

ORDER BY Wins DESC;

 




 ---------------05_05_25_01


 
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





----------------


/*
This query text was retrieved from showplan XML, and may be truncated.
*/

select
team_name , count(team_name) as MatchesPlayed,sum(Wins) as Wins, 
((count(team_name) -  sum(Wins)) - sum(Draws)) as Losses,
sum(Draws) as Draws, sum(Wins*2) + sum(Draws) AS Points
from
(
select team_1 as team_name, 
	   case 
		 when  team_1=winner 
				then 1 
				else 0 
				end as Wins,
	   case 
		   when winner='Abandoned' then 1 
		   else 0 
		   end as Draws 
from  dbo.IPL2024_Match_Results
union all
select team_2 as team_name,
		case 
				when  team_2=winner 
				then 1 
				else 0 end as Wins,
	case
	when winner='Abandoned' then 1 else 0 end as Draws from  dbo.IPL2024_Match_Results
) a


group by team_name order by Points desc