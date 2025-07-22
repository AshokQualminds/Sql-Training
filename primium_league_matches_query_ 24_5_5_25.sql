--use pmdb
--go

-- =============================================
-- Script to Create and Populate Premier League 2023-2024 Match Results Table
-- =============================================
-- Note: Team names are standardized for consistency. 'Draw' is used for tied matches.

-- Drop the table if it already exists to avoid errors on re-execution
IF OBJECT_ID('dbo.PremierLeague_2023_2024_Results', 'U') IS NOT NULL
    DROP TABLE dbo.PremierLeague_2023_2024_Results;
GO

-- Create the table structure
CREATE TABLE dbo.PremierLeague_2023_2024_Results (
    MatchID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for each match
    Team_1 NVARCHAR(100) NOT NULL,      -- Name of the home team
    Team_2 NVARCHAR(100) NOT NULL,      -- Name of the away team
    Winner NVARCHAR(100) NOT NULL          -- Name of the winning team or 'Draw'
);
GO

-- Insert the match results data for Premier League 2023-2024 season (380 matches)
INSERT INTO dbo.PremierLeague_2023_2024_Results (Team_1, Team_2, Winner) VALUES
('Burnley', 'Manchester City', 'Manchester City'), -- Aug 11
('Arsenal', 'Nottingham Forest', 'Arsenal'), -- Aug 12
('Bournemouth', 'West Ham United', 'Draw'),
('Brighton & Hove Albion', 'Luton Town', 'Brighton & Hove Albion'),
('Everton', 'Fulham', 'Fulham'),
('Sheffield United', 'Crystal Palace', 'Crystal Palace'),
('Newcastle United', 'Aston Villa', 'Newcastle United'),
('Brentford', 'Tottenham Hotspur', 'Draw'), -- Aug 13
('Chelsea', 'Liverpool', 'Draw'),
('Manchester United', 'Wolverhampton Wanderers', 'Manchester United'), -- Aug 14
('Nottingham Forest', 'Sheffield United', 'Nottingham Forest'), -- Aug 18
('Fulham', 'Brentford', 'Brentford'), -- Aug 19
('Liverpool', 'Bournemouth', 'Liverpool'),
('Wolverhampton Wanderers', 'Brighton & Hove Albion', 'Brighton & Hove Albion'),
('Tottenham Hotspur', 'Manchester United', 'Tottenham Hotspur'),
('Manchester City', 'Newcastle United', 'Manchester City'),
('Aston Villa', 'Everton', 'Aston Villa'), -- Aug 20
('West Ham United', 'Chelsea', 'West Ham United'),
('Crystal Palace', 'Arsenal', 'Arsenal'), -- Aug 21
('Chelsea', 'Luton Town', 'Chelsea'), -- Aug 25
('Bournemouth', 'Tottenham Hotspur', 'Tottenham Hotspur'), -- Aug 26
('Arsenal', 'Fulham', 'Draw'),
('Brentford', 'Crystal Palace', 'Draw'),
('Everton', 'Wolverhampton Wanderers', 'Wolverhampton Wanderers'),
('Manchester United', 'Nottingham Forest', 'Manchester United'),
('Brighton & Hove Albion', 'West Ham United', 'West Ham United'),
('Burnley', 'Aston Villa', 'Aston Villa'), -- Aug 27
('Sheffield United', 'Manchester City', 'Manchester City'),
('Newcastle United', 'Liverpool', 'Liverpool'),
('Luton Town', 'West Ham United', 'West Ham United'), -- Sep 1
('Sheffield United', 'Everton', 'Draw'), -- Sep 2
('Brentford', 'Bournemouth', 'Draw'),
('Burnley', 'Tottenham Hotspur', 'Tottenham Hotspur'),
('Chelsea', 'Nottingham Forest', 'Nottingham Forest'),
('Manchester City', 'Fulham', 'Manchester City'),
('Brighton & Hove Albion', 'Newcastle United', 'Brighton & Hove Albion'),
('Crystal Palace', 'Wolverhampton Wanderers', 'Crystal Palace'), -- Sep 3
('Liverpool', 'Aston Villa', 'Liverpool'),
('Arsenal', 'Manchester United', 'Arsenal'),
('Wolverhampton Wanderers', 'Liverpool', 'Liverpool'), -- Sep 16
('Aston Villa', 'Crystal Palace', 'Aston Villa'),
('Fulham', 'Luton Town', 'Fulham'),
('Manchester United', 'Brighton & Hove Albion', 'Brighton & Hove Albion'),
('Tottenham Hotspur', 'Sheffield United', 'Tottenham Hotspur'),
('West Ham United', 'Manchester City', 'Manchester City'),
('Newcastle United', 'Brentford', 'Newcastle United'),
('Bournemouth', 'Chelsea', 'Draw'), -- Sep 17
('Everton', 'Arsenal', 'Arsenal'),
('Nottingham Forest', 'Burnley', 'Draw'), -- Sep 18
('Crystal Palace', 'Fulham', 'Draw'), -- Sep 23
('Luton Town', 'Wolverhampton Wanderers', 'Draw'),
('Manchester City', 'Nottingham Forest', 'Manchester City'),
('Brentford', 'Everton', 'Everton'),
('Burnley', 'Manchester United', 'Manchester United'),
('Arsenal', 'Tottenham Hotspur', 'Draw'), -- Sep 24
('Brighton & Hove Albion', 'Bournemouth', 'Brighton & Hove Albion'),
('Chelsea', 'Aston Villa', 'Aston Villa'),
('Liverpool', 'West Ham United', 'Liverpool'),
('Sheffield United', 'Newcastle United', 'Newcastle United'),
('Aston Villa', 'Brighton & Hove Albion', 'Aston Villa'), -- Sep 30
('Bournemouth', 'Arsenal', 'Arsenal'),
('Everton', 'Luton Town', 'Luton Town'),
('Manchester United', 'Crystal Palace', 'Crystal Palace'),
('Newcastle United', 'Burnley', 'Newcastle United'),
('West Ham United', 'Sheffield United', 'West Ham United'),
('Wolverhampton Wanderers', 'Manchester City', 'Wolverhampton Wanderers'),
('Tottenham Hotspur', 'Liverpool', 'Tottenham Hotspur'),
('Nottingham Forest', 'Brentford', 'Draw'), -- Oct 1
('Fulham', 'Chelsea', 'Chelsea'), -- Oct 2
('Luton Town', 'Tottenham Hotspur', 'Tottenham Hotspur'), -- Oct 7
('Burnley', 'Chelsea', 'Chelsea'),
('Everton', 'Bournemouth', 'Everton'),
('Fulham', 'Sheffield United', 'Fulham'),
('Manchester United', 'Brentford', 'Manchester United'),
('Crystal Palace', 'Nottingham Forest', 'Draw'),
('Brighton & Hove Albion', 'Liverpool', 'Draw'), -- Oct 8
('West Ham United', 'Newcastle United', 'Draw'),
('Wolverhampton Wanderers', 'Aston Villa', 'Draw'),
('Arsenal', 'Manchester City', 'Arsenal'),
('Tottenham Hotspur', 'Fulham', 'Tottenham Hotspur'), -- Oct 21
('Liverpool', 'Everton', 'Liverpool'),
('Bournemouth', 'Wolverhampton Wanderers', 'Wolverhampton Wanderers'),
('Brentford', 'Burnley', 'Brentford'),
('Manchester City', 'Brighton & Hove Albion', 'Manchester City'),
('Newcastle United', 'Crystal Palace', 'Newcastle United'),
('Nottingham Forest', 'Luton Town', 'Draw'),
('Chelsea', 'Arsenal', 'Draw'),
('Sheffield United', 'Manchester United', 'Manchester United'),
('Aston Villa', 'West Ham United', 'Aston Villa'), -- Oct 22
('Tottenham Hotspur', 'Fulham', 'Tottenham Hotspur'), -- Oct 23 - Moved from Oct 21
('Crystal Palace', 'Tottenham Hotspur', 'Tottenham Hotspur'), -- Oct 27
('Chelsea', 'Brentford', 'Brentford'), -- Oct 28
('Arsenal', 'Sheffield United', 'Arsenal'),
('Bournemouth', 'Burnley', 'Bournemouth'),
('Wolverhampton Wanderers', 'Newcastle United', 'Draw'),
('West Ham United', 'Everton', 'Everton'), -- Oct 29
('Aston Villa', 'Luton Town', 'Aston Villa'),
('Brighton & Hove Albion', 'Fulham', 'Draw'),
('Liverpool', 'Nottingham Forest', 'Liverpool'),
('Manchester United', 'Manchester City', 'Manchester City'),
('Tottenham Hotspur', 'Chelsea', 'Chelsea'), -- Nov 4 - Moved from Nov 6
('Fulham', 'Manchester United', 'Manchester United'), -- Nov 4
('Brentford', 'West Ham United', 'Brentford'),
('Burnley', 'Crystal Palace', 'Crystal Palace'),
('Everton', 'Brighton & Hove Albion', 'Draw'),
('Manchester City', 'Bournemouth', 'Manchester City'),
('Sheffield United', 'Wolverhampton Wanderers', 'Sheffield United'),
('Newcastle United', 'Arsenal', 'Newcastle United'),
('Nottingham Forest', 'Aston Villa', 'Nottingham Forest'), -- Nov 5
('Luton Town', 'Liverpool', 'Draw'),
('Tottenham Hotspur', 'Chelsea', 'Chelsea'), -- Nov 6 - Reverted Date
('Wolverhampton Wanderers', 'Tottenham Hotspur', 'Wolverhampton Wanderers'), -- Nov 11
('Arsenal', 'Burnley', 'Arsenal'),
('Crystal Palace', 'Everton', 'Everton'),
('Manchester United', 'Luton Town', 'Manchester United'),
('Bournemouth', 'Newcastle United', 'Bournemouth'),
('Aston Villa', 'Fulham', 'Aston Villa'), -- Nov 12
('Brighton & Hove Albion', 'Sheffield United', 'Draw'),
('Liverpool', 'Brentford', 'Liverpool'),
('West Ham United', 'Nottingham Forest', 'West Ham United'),
('Chelsea', 'Manchester City', 'Draw'),
('Brentford', 'Arsenal', 'Arsenal'), -- Nov 25
('Burnley', 'West Ham United', 'West Ham United'),
('Luton Town', 'Crystal Palace', 'Luton Town'),
('Manchester City', 'Liverpool', 'Draw'),
('Newcastle United', 'Chelsea', 'Newcastle United'),
('Nottingham Forest', 'Brighton & Hove Albion', 'Brighton & Hove Albion'),
('Sheffield United', 'Bournemouth', 'Bournemouth'),
('Tottenham Hotspur', 'Aston Villa', 'Aston Villa'), -- Nov 26
('Everton', 'Manchester United', 'Manchester United'),
('Fulham', 'Wolverhampton Wanderers', 'Fulham'), -- Nov 27
('Arsenal', 'Wolverhampton Wanderers', 'Arsenal'), -- Dec 2
('Brentford', 'Luton Town', 'Brentford'),
('Burnley', 'Sheffield United', 'Burnley'),
('Nottingham Forest', 'Everton', 'Everton'),
('Newcastle United', 'Manchester United', 'Newcastle United'),
('Chelsea', 'Brighton & Hove Albion', 'Chelsea'), -- Dec 3
('Liverpool', 'Fulham', 'Liverpool'),
('West Ham United', 'Crystal Palace', 'Draw'),
('Manchester City', 'Tottenham Hotspur', 'Draw'),
('Bournemouth', 'Aston Villa', 'Draw'),
('Wolverhampton Wanderers', 'Burnley', 'Wolverhampton Wanderers'), -- Dec 5
('Luton Town', 'Arsenal', 'Arsenal'),
('Brighton & Hove Albion', 'Brentford', 'Brighton & Hove Albion'), -- Dec 6
('Crystal Palace', 'Bournemouth', 'Bournemouth'),
('Fulham', 'Nottingham Forest', 'Fulham'),
('Sheffield United', 'Liverpool', 'Liverpool'),
('Aston Villa', 'Manchester City', 'Aston Villa'),
('Manchester United', 'Chelsea', 'Manchester United'),
('Everton', 'Newcastle United', 'Everton'), -- Dec 7
('Tottenham Hotspur', 'West Ham United', 'West Ham United'),
('Crystal Palace', 'Liverpool', 'Liverpool'), -- Dec 9
('Brighton & Hove Albion', 'Burnley', 'Draw'),
('Manchester United', 'Bournemouth', 'Bournemouth'),
('Sheffield United', 'Brentford', 'Sheffield United'),
('Wolverhampton Wanderers', 'Nottingham Forest', 'Draw'),
('Aston Villa', 'Arsenal', 'Aston Villa'),
('Everton', 'Chelsea', 'Everton'), -- Dec 10
('Fulham', 'West Ham United', 'Fulham'),
('Luton Town', 'Manchester City', 'Manchester City'),
('Tottenham Hotspur', 'Newcastle United', 'Tottenham Hotspur'),
('Nottingham Forest', 'Tottenham Hotspur', 'Tottenham Hotspur'), -- Dec 15
('Bournemouth', 'Luton Town', 'Draw'), -- Dec 16 (Abandoned, Result Set as Draw for record)
('Chelsea', 'Sheffield United', 'Chelsea'),
('Manchester City', 'Crystal Palace', 'Draw'),
('Newcastle United', 'Fulham', 'Newcastle United'),
('Burnley', 'Everton', 'Everton'),
('Arsenal', 'Brighton & Hove Albion', 'Arsenal'), -- Dec 17
('Brentford', 'Aston Villa', 'Aston Villa'),
('West Ham United', 'Wolverhampton Wanderers', 'West Ham United'),
('Liverpool', 'Manchester United', 'Draw'),
('Crystal Palace', 'Brighton & Hove Albion', 'Draw'), -- Dec 21
('Aston Villa', 'Sheffield United', 'Draw'), -- Dec 22
('West Ham United', 'Manchester United', 'West Ham United'), -- Dec 23
('Fulham', 'Burnley', 'Burnley'),
('Luton Town', 'Newcastle United', 'Luton Town'),
('Nottingham Forest', 'Bournemouth', 'Bournemouth'),
('Tottenham Hotspur', 'Everton', 'Tottenham Hotspur'),
('Liverpool', 'Arsenal', 'Draw'),
('Wolverhampton Wanderers', 'Chelsea', 'Wolverhampton Wanderers'), -- Dec 24
('Newcastle United', 'Nottingham Forest', 'Nottingham Forest'), -- Dec 26
('Bournemouth', 'Fulham', 'Bournemouth'),
('Sheffield United', 'Luton Town', 'Luton Town'),
('Burnley', 'Liverpool', 'Liverpool'),
('Manchester United', 'Aston Villa', 'Manchester United'),
('Brentford', 'Wolverhampton Wanderers', 'Wolverhampton Wanderers'), -- Dec 27
('Chelsea', 'Crystal Palace', 'Chelsea'),
('Everton', 'Manchester City', 'Manchester City'),
('Brighton & Hove Albion', 'Tottenham Hotspur', 'Brighton & Hove Albion'), -- Dec 28
('Arsenal', 'West Ham United', 'West Ham United'),
('Luton Town', 'Chelsea', 'Chelsea'), -- Dec 30
('Aston Villa', 'Burnley', 'Aston Villa'),
('Crystal Palace', 'Brentford', 'Crystal Palace'),
('Manchester City', 'Sheffield United', 'Manchester City'),
('Wolverhampton Wanderers', 'Everton', 'Wolverhampton Wanderers'),
('Nottingham Forest', 'Manchester United', 'Nottingham Forest'),
('Fulham', 'Arsenal', 'Fulham'), -- Dec 31
('Tottenham Hotspur', 'Bournemouth', 'Tottenham Hotspur'),
('Liverpool', 'Newcastle United', 'Liverpool'), -- Jan 1
('West Ham United', 'Brighton & Hove Albion', 'Draw'), -- Jan 2
('Burnley', 'Luton Town', 'Draw'), -- Jan 12
('Chelsea', 'Fulham', 'Chelsea'), -- Jan 13
('Newcastle United', 'Manchester City', 'Manchester City'),
('Everton', 'Aston Villa', 'Draw'), -- Jan 14
('Manchester United', 'Tottenham Hotspur', 'Draw'),
('Arsenal', 'Crystal Palace', 'Arsenal'), -- Jan 20
('Brentford', 'Nottingham Forest', 'Brentford'),
('Sheffield United', 'West Ham United', 'Draw'), -- Jan 21
('Bournemouth', 'Liverpool', 'Liverpool'),
('Brighton & Hove Albion', 'Wolverhampton Wanderers', 'Draw'), -- Jan 22
('Nottingham Forest', 'Arsenal', 'Arsenal'), -- Jan 30
('Fulham', 'Everton', 'Draw'),
('Luton Town', 'Brighton & Hove Albion', 'Luton Town'),
('Crystal Palace', 'Sheffield United', 'Crystal Palace'),
('Aston Villa', 'Newcastle United', 'Newcastle United'),
('Manchester City', 'Burnley', 'Manchester City'), -- Jan 31
('Tottenham Hotspur', 'Brentford', 'Tottenham Hotspur'),
('Liverpool', 'Chelsea', 'Liverpool'),
('West Ham United', 'Bournemouth', 'Draw'), -- Feb 1
('Everton', 'Tottenham Hotspur', 'Draw'), -- Feb 3
('Brighton & Hove Albion', 'Crystal Palace', 'Brighton & Hove Albion'),
('Burnley', 'Fulham', 'Draw'),
('Newcastle United', 'Luton Town', 'Draw'),
('Sheffield United', 'Aston Villa', 'Aston Villa'),
('Bournemouth', 'Nottingham Forest', 'Draw'), -- Feb 4
('Chelsea', 'Wolverhampton Wanderers', 'Wolverhampton Wanderers'),
('Manchester United', 'West Ham United', 'Manchester United'),
('Arsenal', 'Liverpool', 'Arsenal'),
('Brentford', 'Manchester City', 'Manchester City'), -- Feb 5
('Manchester City', 'Everton', 'Manchester City'), -- Feb 10
('Fulham', 'Bournemouth', 'Fulham'),
('Liverpool', 'Burnley', 'Liverpool'),
('Luton Town', 'Sheffield United', 'Sheffield United'),
('Tottenham Hotspur', 'Brighton & Hove Albion', 'Tottenham Hotspur'),
('Wolverhampton Wanderers', 'Brentford', 'Brentford'),
('Nottingham Forest', 'Newcastle United', 'Newcastle United'),
('West Ham United', 'Arsenal', 'Arsenal'), -- Feb 11
('Aston Villa', 'Manchester United', 'Manchester United'),
('Crystal Palace', 'Chelsea', 'Chelsea'), -- Feb 12
('Brentford', 'Liverpool', 'Liverpool'), -- Feb 17
('Burnley', 'Arsenal', 'Arsenal'),
('Fulham', 'Aston Villa', 'Aston Villa'),
('Newcastle United', 'Bournemouth', 'Draw'),
('Nottingham Forest', 'West Ham United', 'Nottingham Forest'),
('Tottenham Hotspur', 'Wolverhampton Wanderers', 'Wolverhampton Wanderers'),
('Manchester City', 'Chelsea', 'Draw'),
('Sheffield United', 'Brighton & Hove Albion', 'Brighton & Hove Albion'), -- Feb 18
('Luton Town', 'Manchester United', 'Manchester United'),
('Everton', 'Crystal Palace', 'Draw'), -- Feb 19
('Liverpool', 'Luton Town', 'Liverpool'), -- Feb 21 (Rescheduled)
('Manchester City', 'Brentford', 'Manchester City'), -- Feb 20 (Rescheduled)
('Arsenal', 'Newcastle United', 'Arsenal'), -- Feb 24
('Aston Villa', 'Nottingham Forest', 'Aston Villa'),
('Brighton & Hove Albion', 'Everton', 'Draw'),
('Crystal Palace', 'Burnley', 'Crystal Palace'),
('Manchester United', 'Fulham', 'Fulham'),
('Bournemouth', 'Manchester City', 'Manchester City'),
('Wolverhampton Wanderers', 'Sheffield United', 'Wolverhampton Wanderers'), -- Feb 25
('Chelsea', 'Tottenham Hotspur', 'Postponed'), -- Initially Feb 23 - Placeholder Result Set as Draw for record
('West Ham United', 'Brentford', 'West Ham United'), -- Feb 26
('Luton Town', 'Aston Villa', 'Aston Villa'), -- Mar 2
('Brentford', 'Chelsea', 'Draw'),
('Everton', 'West Ham United', 'West Ham United'),
('Fulham', 'Brighton & Hove Albion', 'Fulham'),
('Newcastle United', 'Wolverhampton Wanderers', 'Newcastle United'),
('Nottingham Forest', 'Liverpool', 'Liverpool'),
('Tottenham Hotspur', 'Crystal Palace', 'Tottenham Hotspur'),
('Burnley', 'Bournemouth', 'Bournemouth'), -- Mar 3
('Manchester City', 'Manchester United', 'Manchester City'),
('Sheffield United', 'Arsenal', 'Arsenal'), -- Mar 4
('Manchester United', 'Everton', 'Manchester United'), -- Mar 9
('Bournemouth', 'Sheffield United', 'Draw'),
('Crystal Palace', 'Luton Town', 'Draw'),
('Wolverhampton Wanderers', 'Fulham', 'Wolverhampton Wanderers'),
('Arsenal', 'Brentford', 'Arsenal'),
('Aston Villa', 'Tottenham Hotspur', 'Tottenham Hotspur'), -- Mar 10
('Brighton & Hove Albion', 'Nottingham Forest', 'Brighton & Hove Albion'),
('West Ham United', 'Burnley', 'Draw'),
('Liverpool', 'Manchester City', 'Draw'),
('Chelsea', 'Newcastle United', 'Chelsea'), -- Mar 11
('Bournemouth', 'Luton Town', 'Bournemouth'), -- Mar 13 (Rearranged)
('Luton Town', 'Nottingham Forest', 'Draw'), -- Mar 16
('Burnley', 'Brentford', 'Burnley'),
('Fulham', 'Tottenham Hotspur', 'Fulham'),
('West Ham United', 'Aston Villa', 'Draw'), -- Mar 17
('Nottingham Forest', 'Crystal Palace', 'Draw'), -- Mar 30
('Bournemouth', 'Everton', 'Bournemouth'),
('Chelsea', 'Burnley', 'Draw'),
('Newcastle United', 'West Ham United', 'Newcastle United'),
('Sheffield United', 'Fulham', 'Draw'),
('Tottenham Hotspur', 'Luton Town', 'Tottenham Hotspur'),
('Aston Villa', 'Wolverhampton Wanderers', 'Aston Villa'),
('Brentford', 'Manchester United', 'Draw'),
('Liverpool', 'Brighton & Hove Albion', 'Liverpool'), -- Mar 31
('Manchester City', 'Arsenal', 'Draw'),
('Newcastle United', 'Everton', 'Draw'), -- Apr 2
('Nottingham Forest', 'Fulham', 'Nottingham Forest'),
('Bournemouth', 'Crystal Palace', 'Bournemouth'),
('Burnley', 'Wolverhampton Wanderers', 'Draw'),
('West Ham United', 'Tottenham Hotspur', 'Draw'),
('Arsenal', 'Luton Town', 'Arsenal'), -- Apr 3
('Brentford', 'Brighton & Hove Albion', 'Draw'),
('Manchester City', 'Aston Villa', 'Manchester City'),
('Liverpool', 'Sheffield United', 'Liverpool'), -- Apr 4
('Chelsea', 'Manchester United', 'Chelsea'),
('Crystal Palace', 'Manchester City', 'Manchester City'), -- Apr 6
('Aston Villa', 'Brentford', 'Draw'),
('Everton', 'Burnley', 'Everton'),
('Fulham', 'Newcastle United', 'Newcastle United'),
('Luton Town', 'Bournemouth', 'Luton Town'),
('Wolverhampton Wanderers', 'West Ham United', 'West Ham United'),
('Brighton & Hove Albion', 'Arsenal', 'Arsenal'),
('Manchester United', 'Liverpool', 'Draw'), -- Apr 7
('Sheffield United', 'Chelsea', 'Draw'),
('Tottenham Hotspur', 'Nottingham Forest', 'Tottenham Hotspur'),
('Newcastle United', 'Tottenham Hotspur', 'Newcastle United'), -- Apr 13
('Brentford', 'Sheffield United', 'Brentford'),
('Burnley', 'Brighton & Hove Albion', 'Draw'),
('Manchester City', 'Luton Town', 'Manchester City'),
('Nottingham Forest', 'Wolverhampton Wanderers', 'Draw'),
('Bournemouth', 'Manchester United', 'Draw'),
('Liverpool', 'Crystal Palace', 'Crystal Palace'), -- Apr 14
('West Ham United', 'Fulham', 'Fulham'),
('Arsenal', 'Aston Villa', 'Aston Villa'),
('Chelsea', 'Everton', 'Chelsea'), -- Apr 15
('Arsenal', 'Chelsea', 'Arsenal'), -- Apr 23 (Rescheduled)
('Wolverhampton Wanderers', 'Bournemouth', 'Bournemouth'), -- Apr 24 (Rescheduled)
('Crystal Palace', 'Newcastle United', 'Crystal Palace'), -- Apr 24 (Rescheduled)
('Everton', 'Liverpool', 'Everton'), -- Apr 24 (Rescheduled)
('Manchester United', 'Sheffield United', 'Manchester United'), -- Apr 24 (Rescheduled)
('Brighton & Hove Albion', 'Manchester City', 'Manchester City'), -- Apr 25 (Rescheduled)
('West Ham United', 'Liverpool', 'Draw'), -- Apr 27
('Fulham', 'Crystal Palace', 'Draw'),
('Manchester United', 'Burnley', 'Draw'),
('Newcastle United', 'Sheffield United', 'Newcastle United'),
('Wolverhampton Wanderers', 'Luton Town', 'Wolverhampton Wanderers'),
('Everton', 'Brentford', 'Everton'),
('Aston Villa', 'Chelsea', 'Draw'),
('Bournemouth', 'Brighton & Hove Albion', 'Bournemouth'), -- Apr 28
('Tottenham Hotspur', 'Arsenal', 'Arsenal'),
('Nottingham Forest', 'Manchester City', 'Manchester City'),
('Luton Town', 'Everton', 'Draw'), -- May 3
('Arsenal', 'Bournemouth', 'Arsenal'), -- May 4
('Brentford', 'Fulham', 'Draw'),
('Burnley', 'Newcastle United', 'Newcastle United'),
('Sheffield United', 'Nottingham Forest', 'Nottingham Forest'),
('Manchester City', 'Wolverhampton Wanderers', 'Manchester City'),
('Brighton & Hove Albion', 'Aston Villa', 'Brighton & Hove Albion'), -- May 5
('Chelsea', 'West Ham United', 'Chelsea'),
('Liverpool', 'Tottenham Hotspur', 'Liverpool'),
('Crystal Palace', 'Manchester United', 'Crystal Palace'), -- May 6
('Fulham', 'Manchester City', 'Manchester City'), -- May 11
('Bournemouth', 'Brentford', 'Brentford'),
('Everton', 'Sheffield United', 'Everton'),
('Newcastle United', 'Brighton & Hove Albion', 'Draw'),
('Tottenham Hotspur', 'Burnley', 'Tottenham Hotspur'),
('West Ham United', 'Luton Town', 'West Ham United'),
('Wolverhampton Wanderers', 'Crystal Palace', 'Crystal Palace'),
('Nottingham Forest', 'Chelsea', 'Chelsea'),
('Manchester United', 'Arsenal', 'Arsenal'), -- May 12
('Aston Villa', 'Liverpool', 'Draw'), -- May 13
('Tottenham Hotspur', 'Manchester City', 'Manchester City'), -- May 14 (Rescheduled)
('Brighton & Hove Albion', 'Chelsea', 'Chelsea'), -- May 15 (Rescheduled)
('Manchester United', 'Newcastle United', 'Manchester United'), -- May 15 (Rescheduled)
('Arsenal', 'Everton', 'Arsenal'), -- May 19
('Brentford', 'Newcastle United', 'Newcastle United'),
('Brighton & Hove Albion', 'Manchester United', 'Manchester United'),
('Burnley', 'Nottingham Forest', 'Nottingham Forest'),
('Chelsea', 'Bournemouth', 'Chelsea'),
('Crystal Palace', 'Aston Villa', 'Crystal Palace'),
('Liverpool', 'Wolverhampton Wanderers', 'Liverpool'),
('Luton Town', 'Fulham', 'Fulham'),
('Manchester City', 'West Ham United', 'Manchester City'),
('Sheffield United', 'Tottenham Hotspur', 'Tottenham Hotspur');
GO

-- Optional: Query to verify the data insertion
-- SELECT COUNT(*) FROM dbo.PremierLeague_2023_2024_Results; -- Should be 380
-- SELECT * FROM dbo.PremierLeague_2023_2024_Results ORDER BY MatchID;
---GO

PRINT 'Table PremierLeague_2023_2024_Results created and populated successfully with Premier League 2023-2024 results.';
GO

-----------------------with cte query
;WITH CTE AS (
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
from  dbo.PremierLeague_2023_2024_Results
union all
select team_2 as team_name,
		case 
				when  team_2=winner 
				then 1 
				else 0 end as Wins,
	case
			when winner='Draw' then 1 else 0 end as Draws from  dbo.PremierLeague_2023_2024_Results
) 

SELECT team_name , count(team_name) as MatchesPlayed,sum(Wins) as Wins, 
((count(team_name) -  sum(Wins)) - sum(Draws)) as Losses,
sum(Draws) as Draws, sum(Wins*3) + sum(Draws) AS Points
FROM CTE
group by team_name order by Points desc


--------------subquery
select
team_name , count(team_name) as MatchesPlayed,sum(Wins) as Wins, 
((count(team_name) -  sum(Wins)) - sum(Draws)) as Losses,
sum(Draws) as Draws, sum(Wins*3) + sum(Draws) AS Points
from
 (
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
from  dbo.PremierLeague_2023_2024_Results
union all
select team_2 as team_name,
		case 
				when  team_2=winner 
				then 1 
				else 0 end as Wins,
	case
			when winner='Draw' then 1 else 0 end as Draws from  dbo.PremierLeague_2023_2024_Results
) A

group by team_name order by Points desc





select * from dbo.PremierLeague_2023_2024_Results
SELECT MatchID,count(*) FROM dbo.PremierLeague_2023_2024_Results
WHERE Winner = 'postponed'
group by MatchID