select * from cia

--    1. What is the population of the world? Give a title to the column.

select SUM(population) as World_population from cia


--Which country has the largest population in the whole world? Display its population and its percentage in relation to total population
--of all countries in the world. Do not display the country's name

select MAX(population) as Largest_population, concat(cast(round(MAX(population)*100/SUM(population) ,2)AS DECIMAL(10,2)),'%') as Percentage from cia


--    3. Which smallest population of any country in the world? The population must be greater than 50. Display the smallest population and its percentage in compared to the total population of the world. Do not indicate the country name.

select Min(population) as Smallest_population, concat(cast(round(min(population)*100/SUM(population) ,2)AS DECIMAL(10,2)),'%') as Percentage from cia
where population>=50


--Display the name of every region.

select DISTINCT region from cia


--What is the average population of all European counties? Give a title to the returned column.

select concat(cast(Round(AVG(population/1000000),2)as decimal(10,2)),' Million')  as Average_population from cia
where region ='Europe'


--Display the name of each region, and the amount of countries in each region.
select distinct region, COUNT(*) from cia
group by region


--Display the name of each region with countries whose population is greater than 500,000,000 people, and the number of countries who pass this condition for each region respectively.
select region , count(name)Number_of_countries from cia
where population >=50000000
group by region

--Display the name of each region and its respective population in millions with two significant digits of precision.

select distinct region,cast(round(sum(population/1000000),2)as decimal(10,2)) as Population from cia
group by region
order by population desc

--    9. Display in the millions the total population and the total GDP of Europe. Give a title to each of the columns.


select 
concat(cast(round(sum(population/1000000),2)as decimal(10,2)),' M') as Population_Total,
concat(cast(round(sum(gdp/1000000),0)as decimal(10,0)),' M') as Total_GDP from cia
where region='Europe'

--Display in the millions the total population, the total GDP, and the name of each region. Give a title to each column, and sort the result by decreasing GDP.



select distinct region
,cast(round(sum(population/1000000),2)as decimal(10,2)) as Total_Population,
cast(round(sum(gdp/1000000),2)as decimal(10,2)) as Total_GDP from cia

group by region order by Total_GDP desc 

--Display the total number of regions in the world. Give the column a name.

select count(distinct region) as Number_of_regions from cia

--Display the name, total population, total area, and GDP of each region. Give names to the columns.

--Hald Pendinng


select distinct region
,sum(population) as Population
,sum(area) as Total_Area
,sum(gdp) as Total_GDP from cia

group by region order by Population desc 



--Display the name and population of each region which exceeds 400,000,000 people. They should be sorted by descending population

select region, cast(round(sum(population/1000000),2)as decimal(10,2)) as Population from cia
group by region
having sum(population) > 400000000
order by sum(population) desc


-- 14 Display the region name and average population of each region with countries whose total population is greater than 800,000,000 people. Exclude China from the average. Results should be sorted by descending population.

select region as Region, concat(cast(round(AVG(population/1000000),2)as decimal(10,2)),' M') as 'Average Population' from cia
where name!='China'
group by region
having AVG(population)>80000000


--15 Display the the name of each region and average	 population of countries that make up those regions (in millions). Sort by population in descending order.

select region as Region, cast(round(AVG(population/1000000),2)as decimal(10,2)) as 'Average Population' from cia
group by region
having avg(population)>=0
order by avg(population) desc

--16 In the titles table, display only publishers with an identification number greater than 0800 who have been paid more than $ 15,000 in advance payments and whose average book price is less than $ 16 .





