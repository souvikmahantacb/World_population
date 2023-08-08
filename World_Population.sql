create schema world_population;
use world_population;

-- number of continent
select distinct count(Continent) as continent_count 
from world_population
group by continent

-- number of country
select count(Country) as country_count 
from world_population

--number of country in every continent
select continent, count(country) as country_count
from world_population
group by continent
order by country_count desc

--total population of each continent in the year of 2022
select continent, sum(2022_Population) as 2022_continent_count
from world_population
group by continent
order by 2022_continent_count desc

--avg population of 2020 population

select avg(2020_population) as avg_2020_population
from world_population

--list of country where 2015 population is >2000000

select country, Capital, continent, 2015_Population
from world_population
where 2015_Population >=2000000;

--most populated country in the year of 2020

select *
from world_population
order by 2020_population desc limit 1;

--top 5 most populated country in year 2010
select *
from world_population
order by 2010_population desc limit 5;

-- 10 lowest growth_Rate country
select *
from world_population
order by Growth_Rate limit 10;

--name of country starts with c
select *
from world_population
where country like 'C%';

--name of country with k in the  iddle of the name 
select *
from world_population
where country like '%a%';

--growth rate index
SELECT country, Capital, Growth_Rate
CASE
    WHEN Growth_Rate > 1.01 THEN 'growth rate is high'
    ELSE 'growth rate is good'
END AS Growth_rate_index
FROM world_population;

--list of country which growth_rate is between 1 and 1.02 and aslo rank them

select country, growth_rate, rank() over (order by Growth_rate) as growth_rate_rank
from world_population
where Growth_rate between 1 and 1.02







