

use pub
select * from authors

select au_lname as lastname, au_fname as firstname from authors
where au_lname like'Smith%'

select distinct state from authors

select au_lname,au_fname, city , state from authors
where state like 'CA%' and city not like 'Oakland%' or city like 'Salt Lake City%' 

select * from titles

select title, price from titles
where price >=5 and price<=20 

select title, price from titles
where price is null

select au_lname,au_fname from authors
where au_lname like '%ger'


select au_lname,au_fname from authors
where au_lname like 'D%' OR au_lname like 'd%'


select au_lname,au_fname from authors
where au_lname like '_____' and au_lname like '%mith' 

select (au_lname+ ' '+ au_fname), state as Author_Name from authors
