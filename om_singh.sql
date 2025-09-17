create database exam;





/* Q1. Write a query where it should contain all the data of the 
movies which were released after 1995 having their movie 
duration greater than 120 and should be including A in their 
movie title.*/
	
SELECT * FROM sqlexam .movie;

select * from movie;
select *
FROM movie
where mov_year > 1995 AND mov_time > 120 AND mov_title like"%A%";

/* Q2. Write an SQL query to find the actors who played a role in the 
movie 'Chinatown'.  Fetch all the fields of actor table. (Hint: Use 
the IN operator)*/

select * from sqlexam .actors;

SELECT * FROM actor;
select * from cast;
select * from movie;
select a.*
from actor as a
join cast
using(act_id)
join movie
using(mov_id)
where mov_title in ("Chinatown");

/* Q3. Write an SQL query for extracting the data from the ratings 
table for the movie who got the maximum number of ratings. */

select m.*,r.*
from movie as m
join ratings as r
using(mov_id)
order by num_o_ratings desc
limit 1;

/* Q4. Write an SQL query to determine the Top 7 movies which were 
released in United Kingdom. Sort the data in ascending order 
of the movie year. */

select* from movie
where mov_rel_country = uk
order by mov_year
limit 7;

/* Q5. Set the language of movie language as 'Chinese' for the movie 
which has its existing language as Japanese and their movie 
year was 2001. */

select * from movie;
UPDATE Movie
SET mov_lang = 'Chinese'
WHERE mov_lang = 'Japanese'
AND YEAR(STR_TO_DATE(mov_dt_rel, '%m/%d/%Y')) = 2001;

/* Q6. Print genre title, maximum movie duration and the count the 
number of movies in each genre. */

select g.gen_title, max(m.mov_time) as `maximum movie duration`,count(m.mov_title) as `no of movies`
from movie as m
join movie_genres as mg
using(mov_id)
join genres as g
using(gen_id)
group by g.gen_title;


/* Q7. Create a view which should contain the first name, last name, 
title of the movie & role played by particular actor.*/

create view Actors as
select a.act_fname,act_lname,m.mov_title,c.role
from actor as a
join cast as c
using(act_id)
join movie as m
using(mov_id)



/* Q8. Display the movies that were released before 31st March 1995. */

select * from movie
where str_to_date(mov_dt_rel,)<"1995/03/31";

/* Q9. Write a query which fetch the first name, last name & role played by the actor where output should all exclude Male actors.*/

select a.act_fname,a.act_lname,a.act_gender,c.role
from actor as a
join cast as c
where act_gender!="M";

/* Q10. Insert five rows into the cast table where the ids for movie 
should be 936,939,942,930,941 and their respective roles 
should be Darth Vader, Sarah Connor, Ethan Hunt, Travis 
Bickle, Antoine Doinel & their actor ids should be set up as 
126,140,135,131,144.*/


select*from cast;
insert into cast (act_id,mov_id,role) values
("126","936","Darth Vader"),
("140","939","Sarah Connor"),
("135","942","Ethan Hunt"),
("131","930","Travis Bickle"),
("144","941","Antoine Doinel");









