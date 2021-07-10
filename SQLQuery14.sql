create database mother
use mother 
create table mother (motherNb int,motherLastName varchar(25) ,motherFirstName varchar(25) );
insert mother (motherNb ,motherLastName  ,motherFirstName  ) values (16,'King','Mary' ) ;

insert mother (motherNb ,motherLastName  ,motherFirstName  ) values (22,'Trudeau','Chantal' ) ;
insert mother (motherNb ,motherLastName  ,motherFirstName  ) values (30,'Ringer','Anne' ) ;

--select * from mother 

create table child ( childLastName varchar(25),childFirstName varchar(25),motherNb int )  ;

insert child (childLastName ,childFirstName ,motherNb) values ('King','Majorie',16 );
insert child (childLastName ,childFirstName ,motherNb) values ('Tremblay','Pierre',22 );

insert child (childLastName ,childFirstName ,motherNb) values ( 'King','John',16);
insert child (childLastName ,childFirstName ,motherNb) values ('Ford', 'Mary' ,16 );
insert child (childLastName ,childFirstName ,motherNb) values ( 'Tremblay','Marc',22);

insert child (childLastName ,childFirstName ,motherNb) values ( 'Cramer','Paul',NULL);
insert child (childLastName ,childFirstName ,motherNb) values ( 'Brown','Lesly',NULL);

--select * from child

--cartesian product

select * 
from mother,child 

--inner join
select * 
from mother,child 
where mother.motherNb = child.motherNb 
order by mother.motherNb
--alias
select * 
from mother m,child c 
where m.motherNb = c.motherNb 
order by m.motherNb

--defining each column in the output 
select mother.motherNb, mother.motherFirstName,mother.motherLastName,
       child.childLastName , child.childFirstName, child.motherNb
from mother,child 
where   child.motherNb =mother.motherNb
order by mother.motherNb

--alias
select m.motherNb, m.motherFirstName,m.motherLastName,
       c.childLastName , c.childFirstName, c.motherNb
from mother m,child c
where m.motherNb = c.motherNb 
order by m.motherNb

--inner join 
select * 
from mother inner join child on mother.motherNb=child.motherNb

--writting inner is optional since inner join = join 
select * 
from mother m inner join child c on m.motherNb=c.motherNb

--another example
select m.motherNb, m.motherFirstName, m.motherLastName, 
       c.childFirstName,c.childLastName, c.motherNb
from mother m 
     join child c  on m.motherNb=c.motherNb
order by m.motherNb


--left inner join = left join
--everything in the left table + all corresponding data from the right table
select 
       m.motherNb, m.motherFirstName, m.motherLastName, 
       c.childFirstName,c.childLastName, c.motherNb
from mother m  left join child c on m.motherNb=c.motherNb
order by m.motherNb

--right inner join = right join
--everything in the right table + all corresponding data from the left table
select 
       m.motherNb, m.motherFirstName, m.motherLastName, 
       c.childFirstName,c.childLastName, c.motherNb
from mother m  right join child c on m.motherNb=c.motherNb
order by m.motherNb

--full join

select 
       m.motherNb, m.motherFirstName, m.motherLastName, 
       c.childFirstName,c.childLastName, c.motherNb
from mother m  full join child c on m.motherNb=c.motherNb
order by m.motherNb

--self join 
--a self join is a join of a table with itself. 

select c1.motherNb,c1.childFirstName,c1.childLastName,
       c2.motherNb,c2.childFirstName,c2.childLastName
from child c1 join child c2 on c1.motherNb=c2.motherNb
where c1.childFirstName!=c2.childFirstName
order by c1.motherNb
