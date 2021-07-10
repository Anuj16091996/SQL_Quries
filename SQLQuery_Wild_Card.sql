select * from titles

--1) 
select title_id from titles
where title_id like 'B%' or title_id like 'M%' or title_id like 'C%'


--2)
select title_id, pub_id from titles
where title_id like 'B%' or title_id like 'M%' or title_id like 'C%' or pub_id='1389'

--3)
select title_id, pub_id,royalty from titles
where title_id like '[BMC]%'  and  royalty>=10 and royalty <=15 

--4)
select * from authors

select phone from authors 
where phone like '415%'


--5)
select phone from authors 
where phone  not like '415%'

--6)
select state , phone from authors
where state='CA' and phone not like '[523]%'

--7)

select country from publishers
where country='USA'

--8)

select country from publishers
where country='USA'  or country='France'


