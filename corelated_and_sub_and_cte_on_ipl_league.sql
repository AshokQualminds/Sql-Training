-- =============================================
-- Script to Create and Populate IPL 2024 Match Results Table
-- =============================================

-- Drop the table if it already exists to avoid errors on re-execution
IF OBJECT_ID('dbo.IPL2024_Match_Results', 'U') IS NOT NULL
    DROP TABLE dbo.IPL2024_Match_Results;
GO

-- Create the table structure
CREATE TABLE dbo.IPL2024_Match_Results (
    MatchID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for each match
    Team_1 NVARCHAR(100) NOT NULL,         -- Name of the first team
    Team_2 NVARCHAR(100) NOT NULL,         -- Name of the second team
    Winner NVARCHAR(100) NOT NULL          -- Name of the winning team ('Abandoned' if no result)
);
GO

-- Insert the match results data for IPL 2024 season
-- Note: Team names used are the standard short names for consistency.
--       'Abandoned' indicates matches with no result due to weather or other reasons.

INSERT INTO dbo.IPL2024_Match_Results (Team_1, Team_2, Winner) VALUES
('Chennai Super Kings', 'Royal Challengers Bengaluru', 'Chennai Super Kings'),
('Punjab Kings', 'Delhi Capitals', 'Punjab Kings'),
('Kolkata Knight Riders', 'Sunrisers Hyderabad', 'Kolkata Knight Riders'),
('Rajasthan Royals', 'Lucknow Super Giants', 'Rajasthan Royals'),
('Gujarat Titans', 'Mumbai Indians', 'Gujarat Titans'),
('Royal Challengers Bengaluru', 'Punjab Kings', 'Royal Challengers Bengaluru'),
('Chennai Super Kings', 'Gujarat Titans', 'Chennai Super Kings'),
('Sunrisers Hyderabad', 'Mumbai Indians', 'Sunrisers Hyderabad'),
('Rajasthan Royals', 'Delhi Capitals', 'Rajasthan Royals'),
('Royal Challengers Bengaluru', 'Kolkata Knight Riders', 'Kolkata Knight Riders'),
('Lucknow Super Giants', 'Punjab Kings', 'Lucknow Super Giants'),
('Gujarat Titans', 'Sunrisers Hyderabad', 'Gujarat Titans'),
('Delhi Capitals', 'Chennai Super Kings', 'Delhi Capitals'),
('Mumbai Indians', 'Rajasthan Royals', 'Rajasthan Royals'),
('Royal Challengers Bengaluru', 'Lucknow Super Giants', 'Lucknow Super Giants'),
('Delhi Capitals', 'Kolkata Knight Riders', 'Kolkata Knight Riders'),
('Gujarat Titans', 'Punjab Kings', 'Punjab Kings'),
('Sunrisers Hyderabad', 'Chennai Super Kings', 'Sunrisers Hyderabad'),
('Rajasthan Royals', 'Royal Challengers Bengaluru', 'Rajasthan Royals'),
('Mumbai Indians', 'Delhi Capitals', 'Mumbai Indians'),
('Lucknow Super Giants', 'Gujarat Titans', 'Lucknow Super Giants'),
('Chennai Super Kings', 'Kolkata Knight Riders', 'Chennai Super Kings'),
('Punjab Kings', 'Sunrisers Hyderabad', 'Sunrisers Hyderabad'),
('Rajasthan Royals', 'Gujarat Titans', 'Gujarat Titans'),
('Mumbai Indians', 'Royal Challengers Bengaluru', 'Mumbai Indians'),
('Lucknow Super Giants', 'Delhi Capitals', 'Delhi Capitals'),
('Punjab Kings', 'Rajasthan Royals', 'Rajasthan Royals'),
('Kolkata Knight Riders', 'Lucknow Super Giants', 'Kolkata Knight Riders'),
('Mumbai Indians', 'Chennai Super Kings', 'Chennai Super Kings'),
('Royal Challengers Bengaluru', 'Sunrisers Hyderabad', 'Sunrisers Hyderabad'),
('Kolkata Knight Riders', 'Rajasthan Royals', 'Rajasthan Royals'),
('Gujarat Titans', 'Delhi Capitals', 'Delhi Capitals'),
('Punjab Kings', 'Mumbai Indians', 'Mumbai Indians'),
('Lucknow Super Giants', 'Chennai Super Kings', 'Chennai Super Kings'),
('Delhi Capitals', 'Sunrisers Hyderabad', 'Sunrisers Hyderabad'),
('Kolkata Knight Riders', 'Royal Challengers Bengaluru', 'Kolkata Knight Riders'),
('Punjab Kings', 'Gujarat Titans', 'Gujarat Titans'),
('Rajasthan Royals', 'Mumbai Indians', 'Rajasthan Royals'),
('Chennai Super Kings', 'Lucknow Super Giants', 'Lucknow Super Giants'),
('Delhi Capitals', 'Gujarat Titans', 'Delhi Capitals'),
('Sunrisers Hyderabad', 'Royal Challengers Bengaluru', 'Royal Challengers Bengaluru'),
('Kolkata Knight Riders', 'Punjab Kings', 'Punjab Kings'),
('Delhi Capitals', 'Mumbai Indians', 'Delhi Capitals'),
('Lucknow Super Giants', 'Rajasthan Royals', 'Rajasthan Royals'),
('Gujarat Titans', 'Royal Challengers Bengaluru', 'Royal Challengers Bengaluru'),
('Chennai Super Kings', 'Sunrisers Hyderabad', 'Chennai Super Kings'),
('Kolkata Knight Riders', 'Delhi Capitals', 'Kolkata Knight Riders'),
('Lucknow Super Giants', 'Mumbai Indians', 'Lucknow Super Giants'),
('Chennai Super Kings', 'Punjab Kings', 'Punjab Kings'),
('Sunrisers Hyderabad', 'Rajasthan Royals', 'Sunrisers Hyderabad'),
('Mumbai Indians', 'Kolkata Knight Riders', 'Kolkata Knight Riders'),
('Royal Challengers Bengaluru', 'Gujarat Titans', 'Royal Challengers Bengaluru'),
('Punjab Kings', 'Chennai Super Kings', 'Chennai Super Kings'),
('Lucknow Super Giants', 'Kolkata Knight Riders', 'Kolkata Knight Riders'),
('Mumbai Indians', 'Sunrisers Hyderabad', 'Mumbai Indians'),
('Delhi Capitals', 'Rajasthan Royals', 'Delhi Capitals'),
('Sunrisers Hyderabad', 'Lucknow Super Giants', 'Sunrisers Hyderabad'),
('Punjab Kings', 'Royal Challengers Bengaluru', 'Royal Challengers Bengaluru'),
('Gujarat Titans', 'Chennai Super Kings', 'Gujarat Titans'),
('Kolkata Knight Riders', 'Mumbai Indians', 'Kolkata Knight Riders'),
('Chennai Super Kings', 'Rajasthan Royals', 'Chennai Super Kings'),
('Royal Challengers Bengaluru', 'Delhi Capitals', 'Royal Challengers Bengaluru'),
('Gujarat Titans', 'Kolkata Knight Riders', 'Abandoned'), -- Match 63
('Delhi Capitals', 'Lucknow Super Giants', 'Delhi Capitals'),
('Rajasthan Royals', 'Punjab Kings', 'Punjab Kings'),
('Sunrisers Hyderabad', 'Gujarat Titans', 'Abandoned'), -- Match 66
('Mumbai Indians', 'Lucknow Super Giants', 'Lucknow Super Giants'),
('Royal Challengers Bengaluru', 'Chennai Super Kings', 'Royal Challengers Bengaluru'),
('Sunrisers Hyderabad', 'Punjab Kings', 'Sunrisers Hyderabad'),
('Rajasthan Royals', 'Kolkata Knight Riders', 'Abandoned'), -- Match 70
-- Playoffs
('Kolkata Knight Riders', 'Sunrisers Hyderabad', 'Kolkata Knight Riders'), -- Qualifier 1
('Rajasthan Royals', 'Royal Challengers Bengaluru', 'Rajasthan Royals'), -- Eliminator
('Sunrisers Hyderabad', 'Rajasthan Royals', 'Sunrisers Hyderabad'), -- Qualifier 2
('Kolkata Knight Riders', 'Sunrisers Hyderabad', 'Kolkata Knight Riders'); -- Final
GO

-- Optional: Query to verify the data insertion
-- SELECT * FROM dbo.IPL2024_Match_Results ORDER BY MatchID;
-- GO

PRINT 'Table IPL2024_Match_Results created and populated successfully with IPL 2024 results.';
GO

select * from dbo.IPL2024_Match_Results

SELECT
    Team,
    COUNT(*) AS Matches_Played,
    SUM(CASE WHEN Team = Winner THEN 1 ELSE 0 END) AS Wins,
    SUM(CASE WHEN winner='Abandoned' THEN 1 ELSE 0 END) AS Draws
FROM (
    SELECT Team_1 AS Team, Winner FROM dbo.IPL2024_Match_Results
    UNION ALL
    SELECT Team_2 AS Team, Winner FROM dbo.IPL2024_Match_Results
) AS AllMatches
GROUP BY Team
ORDER BY Wins DESC;



;WITH CTE AS (
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
) 

SELECT team_name , count(team_name) as MatchesPlayed,sum(Wins) as Wins, 
((count(team_name) -  sum(Wins)) - sum(Draws)) as Losses,
sum(Draws) as Draws, sum(Wins*2) + sum(Draws) AS Points
FROM CTE

group by team_name order by Points desc




----------------------------



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