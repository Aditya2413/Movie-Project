create database movies;
use movies;
-- Q1 GET ALL DATA ABOUT MOVIES --
select * from imdb;
--  Q2 GET ALL DATA ABOUT DIRECTOR --
select director from imdb;
-- Q3 CHECK HOW MANY MOVIES ARE PRESENT IN IMDB BY USEING COUNT OPERATOR --
select count(*) from imdb;
-- Q4 CHECKING NULL VALUES IN DATA --
select count(*) from imdb where metascore is null;
-- Q5 CHECKING DUPLICATE VALUES IN DATA --
select distinct count(*)from imdb;
-- Q6 DISPLAY YEAR AND NO OF MOVIES PER YEAR
select Year, count(year) from imdb group by year order by year;
-- Q7  TOP 10 LONGEST RUNTIME MOVIE?
select title,runtime from imdb where year>=2006 
and year<=2016 order by runtime desc limit 10;
-- Q8 TOP 10 DIRECTOR WHO MAKES MOST MOVIES
select director, count(director) from imdb group by director order by count(director)desc limit 10;
-- Q9 CHECKING FOR THE TOP 10 MOVIES,GENRES WITH HIGHEST VOTE AND HOW THEY COMPARE TO METASCORE --
select title,genre,votes,metascore from imdb order by metascore desc limit 10;
-- Q10 DO MOVIES FROM CERTAIN YEAR HAVE HIGHER RATINGS THAN OTHERS? 
SELECT Year, AVG(Rating) AS AverageRating
FROM imdb
GROUP BY Year
ORDER BY Year;
-- Q11 MOST POPULAR MOVIES BY REVENUE? 
select title,director,Year from imdb where revenue = (select max(revenue) from imdb)limit 1;
-- Q12 FIND THESE 3 DIRECTOR DAVID AYER,GARTH DAVIS AND JON LUCAS --
select Director from imdb where director='david ayer' or director='garth davis' or director='jon lucas';
-- Q13 FIND ALL DIRECTORS WITH NAME STARTING WITH ADAM --
select * from imdb where director like 'adam%';
-- Q14 FIND ALL DIRECTORS WITHE NAME ENDING WITH 'M' --
select * from imdb where director like '%m';
-- Q15 DISTRIBUTION OF MOVIE RATINGS
SELECT Rating, COUNT(*) AS Count
FROM imdb
GROUP BY Rating
ORDER BY Rating DESC;
-- Q16 DO MORE POPULAR MOVIES TREND TO HAVE HIGHER RATINGS?
SELECT Rating, AVG(Votes) AS AverageVotes
FROM imdb
GROUP BY Rating
ORDER BY Rating DESC;
-- Q17 DO MOVIES FROM CERTAIN YEAR HAVE HIGHER RATINGS THAN OTHERS? 
SELECT Year, AVG(Rating) AS AverageRating
FROM imdb
GROUP BY Year
ORDER BY Year;
-- Q18 WHICH GENRES ARE THE MOST POPULAR AMONG VIEWES?
SELECT Genre, COUNT(*) AS MovieCount
FROM imdb
GROUP BY Genre
ORDER BY MovieCount DESC;
-- Q19 ARE THERE ANY GENRES THA CONSISTENTLY RECEIVE HIGH RATINGS? 
SELECT Genre, AVG(Rating) AS AverageRating
FROM imdb
GROUP BY Genre
HAVING AVG(Rating) > (SELECT AVG(Rating) FROM imdb);
-- Q20 ARE CERTAIN GENRES MORE LIKELY TO HAVE HIGHER REVENUES THAN OTHERS?
SELECT Genre, AVG(Revenue) AS AverageRevenue
FROM imdb
GROUP BY Genre
ORDER BY AverageRevenue DESC;
-- Q21 DISPLAY SPECIFIC GENRES TO HAVE LONGER OR SHORTER RUNTIME?
SELECT Genre, AVG(Runtime) AS AverageRuntime
FROM imdb
GROUP BY Genre
ORDER BY AverageRuntime DESC;
-- Q22 WHO ARE TOP DIRECTORS IN TERMS OF AVERAGE MOVIE RATING AND REVENUES?
SELECT Director, AVG(Rating) AS AverageRating, AVG(Revenue) AS AverageRevenue
FROM imdb
GROUP BY Director
ORDER BY AverageRating DESC, AverageRevenue DESC;
-- Q23 ARE MOVIES WITH WELL-KNOWN ACTORS MORE LIKELY TO HAVE HIGHER RATING AND REVENUE?
SELECT Actors, AVG(Rating) AS AverageRating, AVG(Revenue) AS AverageRevenue
FROM imdb
GROUP BY Actors
ORDER BY AverageRating DESC, AverageRevenue DESC;
-- Q24 IS THERE A RELATIONSHIP BETWEEN A DIRECTOR'S REPUTATION(METASCORE) AND THE RATING OR REVENUE OF THEIR MOVIES?
SELECT Director, AVG(Metascore) AS AverageMetascore, AVG(Rating) AS AverageRating, AVG(Revenue) AS AverageRevenue
FROM imdb
GROUP BY Director
ORDER BY AverageMetascore DESC, AverageRating DESC, AverageRevenue DESC;
-- Q25 WHAT IS THE DISTRIBUTION OF MOVIE REVENUES?
SELECT Revenue, COUNT(*) AS Count
FROM imdb
GROUP BY Revenue
ORDER BY Revenue;
-- Q26 IS THERE A CORRELATION BETWEEN A MOVIES REVENUE AND ITS RATING OR METASCORE?
SELECT Revenue, AVG(Rating) AS AverageRating, AVG(Metascore) AS AverageMetascore
FROM imdb
GROUP BY Revenue
ORDER BY Revenue;
-- Q27 HOW DOES THE RUNTIME OF A MOVIE RELATE TO ITS REVENUE?ARE LONGER MOVIES MORE SUCCESSFUL AT THE BOX OFFICE?
SELECT Runtime, AVG(Revenue) AS AverageRevenue
FROM imdb
GROUP BY Runtime
ORDER BY Runtime limit 10;
-- Q28 HOW HAS THE AVERAGE MOVIE RATING CHANGED OVER THE YEARS?
SELECT Year, AVG(Rating) AS AverageRating
FROM imdb
GROUP BY Year limit 10;
-- Q29 RATING WISE TOP10 MOVIE? 
select title,rating from imdb where rankid in(select rankid from imdb order by rating)limit 10;
-- Q30 MOVIES WITH BIOGRAPHY GENRE
select * from imdb where genre like'%Biography%';
-- Q31 WHICH MOVIE HAS LOWEST RUNTIME?
select runtime,title from imdb order by runtime limit 10;

