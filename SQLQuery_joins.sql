select * from publishers
select * from jobs
select * from employee
select * from titles
select * from stores
select * from authors

--1)Display each publisher will all its employees (name, last name, first name, and title).
select p.pub_name as publisher,e.lname as last_name, e.fname as First_name, j.job_desc as title 
from publishers p join employee e on p.pub_id=e.pub_id
				join jobs j on e.job_id=j.job_id  

				order by p.pub_name


--2)  Display the title of each book, with the name(s), city, and state of the stores where the book was sold.
select t.title as Tittle, s.stor_name as Store,s.city as City, s.state as State
from titles t join sales sa on t.title_id=sa.title_id
				join stores s on sa.stor_id= s.stor_id

				order by t.title


--3) Display all authors (first and last name concatenated) with the title of the books they authored sorted by first and last name.
select CONCAT(a.au_fname,' ' ,a.au_lname) as Author, t.title as Tittle 
from authors a join titleauthor ta on a.au_id=ta.au_id
				join titles t on ta.title_id=t.title_id

				order by Author


--4) Display the first and last name of each author who has written at least one book, as well as the amounth of books they have written.
	