------------------------corelated sub query
use pmdb
go


SELECT
    Team,
    COUNT(*) AS Matches_Played,
    SUM(CASE WHEN Team = Winner THEN 1 ELSE 0 END) AS Wins,
    SUM(CASE WHEN Winner = 'Abandoned' THEN 1 ELSE 0 END) AS Draws,
    (COUNT(*) - SUM(CASE WHEN Team = Winner THEN 1 ELSE 0 END) - 
	SUM(CASE WHEN Winner = 'Abandoned' THEN 1 ELSE 0 END)) AS Losses,
    (SUM(CASE WHEN Team = Winner THEN 1 ELSE 0 END) * 2 
	+ SUM(CASE WHEN Winner = 'Abandoned' THEN 1 ELSE 0 END)) AS Points
FROM (
    SELECT Team_1 AS Team, Winner FROM [dbo].[IPL2024_Match_Results]
    UNION ALL
    SELECT Team_2 AS Team, Winner FROM  [dbo].[IPL2024_Match_Results]
) AS AllMatches
GROUP BY Team
having (SUM(CASE WHEN Team = Winner THEN 1 ELSE 0 END) * 2 
	+ SUM(CASE WHEN Winner = 'Abandoned' THEN 1 ELSE 0 END)) > 14
ORDER BY Points DESC;



go

----------------cte
go
;WITH CTE AS (
    SELECT team_1 AS team_name, 
           CASE WHEN team_1 = winner THEN 1 ELSE 0 END AS Wins,
           CASE WHEN winner = 'Abandoned' THEN 1 ELSE 0 END AS Draws
    FROM dbo.IPL2024_Match_Results
    UNION ALL
    SELECT team_2 AS team_name,
           CASE WHEN team_2 = winner THEN 1 ELSE 0 END AS Wins,
           CASE WHEN winner = 'Abandoned' THEN 1 ELSE 0 END AS Draws
    FROM dbo.IPL2024_Match_Results
)
SELECT 
    team_name,
    COUNT(team_name) AS MatchesPlayed,
    SUM(Wins) AS Wins,
    ((COUNT(team_name) - SUM(Wins)) - SUM(Draws)) AS Losses,
    SUM(Draws) AS Draws,
    SUM(Wins * 2) + SUM(Draws) AS Points
FROM CTE
GROUP BY team_name
ORDER BY Points DESC;

go
---------------- Query 3: Inline Subquery (No CTE)
go
SELECT 
    team_name,
    COUNT(team_name) AS MatchesPlayed,
    SUM(Wins) AS Wins,
    ((COUNT(team_name) - SUM(Wins)) - SUM(Draws)) AS Losses,
    SUM(Draws) AS Draws,
    SUM(Wins * 2) + SUM(Draws) AS Points
FROM (
    SELECT team_1 AS team_name, 
           CASE WHEN team_1 = winner THEN 1 ELSE 0 END AS Wins,
           CASE WHEN winner = 'Abandoned' THEN 1 ELSE 0 END AS Draws
    FROM dbo.IPL2024_Match_Results
    UNION ALL
    SELECT team_2 AS team_name,
           CASE WHEN team_2 = winner THEN 1 ELSE 0 END AS Wins,
           CASE WHEN winner = 'Abandoned' THEN 1 ELSE 0 END AS Draws
    FROM dbo.IPL2024_Match_Results
) a
GROUP BY team_name
ORDER BY Points DESC;
go