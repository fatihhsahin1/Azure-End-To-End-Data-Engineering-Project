--Medal Count by Country:
SELECT  TOP 10 
        Country, 
        SUM(Gold) as Gold_Medals, 
        SUM(Silver) as Silver_Medals, 
        SUM(Bronze) as Bronze_Medals, 
        SUM(Total) as Total_Medals
FROM medals
GROUP BY Country
ORDER BY Total_Medals DESC;

--List athletes and their respective disciplines, ordered by the discipline.
SELECT Name, NOC, Discipline 
FROM athletes 
ORDER BY Discipline;

--Find out which discipline has the highest gender disparity (difference between male and female participants).
SELECT TOP 1
    Discipline, 
    ABS(Female - Male) AS Gender_Disparity 
FROM entriesgender 
ORDER BY Gender_Disparity DESC;

--List coaches and their respective events in swimming.
SELECT 
Name, 
NOC, 
Event
FROM coaches 
WHERE Discipline = 'Artistic Swimming';

--Which disciplines have the most athletes participating?
SELECT Discipline, COUNT(Name) AS Athlete_Count 
FROM athletes 
GROUP BY Discipline 
ORDER BY Athlete_Count DESC;

--Which country has sent the most coaches, and for which disciplines?
SELECT NOC, Discipline, COUNT(Name) AS Coach_Count 
FROM coaches 
GROUP BY NOC, Discipline 
ORDER BY Coach_Count DESC;

--Which discipline has a near-equal male to female ratio?
SELECT TOP 1
    Discipline, 
    ABS(Female - Male) AS Gender_Difference 
FROM entriesgender 
ORDER BY Gender_Difference;

--Which discipline had teams from the most number of countries participating?
SELECT Discipline, COUNT(DISTINCT NOC) AS Country_Count 
FROM teams 
GROUP BY Discipline 
ORDER BY Country_Count DESC;

--How many athletes participated from countries that won no medals?
SELECT a.NOC, COUNT(a.Name) AS Athlete_Count 
FROM athletes a 
LEFT JOIN medals m ON a.NOC = m.Country 
WHERE m.Total IS NULL 
GROUP BY a.NOC
ORDER BY Athlete_Count DESC;

--Which event in each discipline had the maximum number of coaches?
SELECT Discipline, Event, COUNT(Name) AS Coach_Count 
FROM coaches 
GROUP BY Discipline, Event 
ORDER BY Coach_Count DESC;

--How many disciplines had more female participants than male participants?
SELECT COUNT(Discipline) 
FROM entriesgender 
WHERE Female > Male;

