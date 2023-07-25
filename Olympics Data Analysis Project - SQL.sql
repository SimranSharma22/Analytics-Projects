create database internshipdb
Select * from athlete_events;
# 1 How many Olympics games have been held?
SELECT COUNT(DISTINCT Games) AS TotalOlympicsGames
FROM athlete_events ;

# 2 List down all Olympics games held so far.
SELECT DISTINCT Games
FROM athlete_events;

# 3 Mention the total number of nations that participated in each Olympics game?
SELECT Games, COUNT(DISTINCT Team) AS TotalNationsParticipated
FROM athlete_events
GROUP BY Games;

# 4 Which year saw the highest and lowest number of countries participating in the Olympics?
#Highest
SELECT Year, COUNT(DISTINCT Team) AS TotalNationsParticipated
FROM athlete_events
GROUP BY Year
ORDER BY TotalNationsParticipated DESC
LIMIT 1;
#Lowest
SELECT Year, COUNT(DISTINCT Team) AS TotalNationsParticipated
FROM athlete_events
GROUP BY Year
ORDER BY TotalNationsParticipated ASC
LIMIT 1;

# 5 Which nation has participated in all of the Olympic games?
SELECT Team
FROM (
  SELECT Team, COUNT(DISTINCT Games) AS TotalGamesParticipated
  FROM athlete_events
  GROUP BY Team
) AS team_games
WHERE TotalGamesParticipated = (SELECT COUNT(DISTINCT Games) FROM athlete_events);

# 6 Identify the sport that was played in all summer Olympics.
SELECT Sport
FROM (
  SELECT Sport, COUNT(DISTINCT Games) AS TotalGames
  FROM athlete_events
  WHERE Season = 'Summer'
  GROUP BY Sport
) AS summer_sports
WHERE TotalGames = (SELECT COUNT(DISTINCT Games) FROM athlete_events WHERE Season = 'Summer');

# 7 Which Sports were just played only once in the Olympics?
SELECT Sport
FROM (
  SELECT Sport, COUNT(DISTINCT Games) AS TotalGames
  FROM athlete_events
  GROUP BY Sport
) AS sports_played_once
WHERE TotalGames = 1;

# 8 Fetch the total number of sports played in each Olympic game.

SELECT Games, COUNT(DISTINCT Sport) AS TotalSports
FROM athlete_events
GROUP BY Games;

# 9 Fetch details of the oldest athletes to win a gold medal.
SELECT *
FROM athlete_events
WHERE Medal = 'Gold'
ORDER BY Age DESC
LIMIT 1;

# 10 Fetch the top 5 athletes who have won the most gold medals.
SELECT ID, Name, COUNT(Medal) AS GoldMedals
FROM athlete_events
WHERE Medal = 'Gold'
GROUP BY ID, Name
ORDER BY GoldMedals DESC
LIMIT 5;

# 11 Fetch the top 5 athletes who have won the most medals.
SELECT ID, Name, COUNT(Medal) AS TotalMedals
FROM athlete_events
GROUP BY ID, Name
ORDER BY TotalMedals DESC
LIMIT 5;

# 12 In which Sport/event, India has won the highest medals.
SELECT Sport, Event, COUNT(Medal) AS TotalMedals
FROM athlete_events
WHERE Team = 'India' AND Medal IS NOT NULL
GROUP BY Sport, Event
ORDER BY TotalMedals DESC
LIMIT 1;









