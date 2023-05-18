use donor

select * from WorldCupMatches
select * from WorldCupPlayers
select * from WorldCups

 --Which team won the most World Cups, and how many wins was that?

 select winner,count(winner) as total_wins
 from worldcups
 group by winner
 order by total_wins desc

 --Which Finals or Semi-final games were decided by penalties?

 SELECT [Home Team Name], [Away Team Name],[Win conditions] as penalties
	FROM WorldCupMatches
	WHERE [Win conditions] LIKE '%pen%' 
	AND (Stage = 'Final' OR Stage = 'Semi-finals')
ORDER BY year;


-- Which years had the highest and lowest attendance to the World Cup games?

SELECT year, Attendance
FROM Worldcups
WHERE Attendance = (SELECT MAX(Attendance) FROM Worldcups)
UNION ALL
SELECT year, Attendance
FROM Worldcups
WHERE Attendance = (SELECT MIN(Attendance) FROM worldcups)
ORDER BY Attendance ASC;

---What's the average number of goals scored per World Cup?

SELECT ROUND(AVG(GoalsScored),2) AS avg_goals
	 FROM worldcups;

----How many countries qualified for the World Cup in 1930 compared to 2014?

SELECT 
  SUM(CASE WHEN Home Team Goals > Away Team Goals THEN 1 ELSE 0 END) AS Total_Home_Team_Wins,
  SUM(CASE WHEN  Away Team Goals > Home Team Goals THEN 1 ELSE 0 END) AS Total_Away_Team_Wins,
  SUM(CASE WHEN Away Team Goals = Home Team Goals THEN 1 ELSE 0 END) AS Total_Draws
    FROM WorldCupMatches;