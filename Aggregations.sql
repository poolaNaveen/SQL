create database bang_streets;
use bang_streets;
create table streets_details(name varchar(20), region varchar(20), population int);
desc streets_details;
insert into streets_details values ('jayanagara','east',2000),
('indhranagar','west',1200),
('Kr_pura','north',3000),
('nagavara','east',4500),
('peenya','north',9000),
('shivajinagar','west',9888),
('magestic','east',9800);
select * from streets_details;
select region from streets_details where region = 'west';
select name,population from streets_details where population > 5000;
delete from streets_details where name = 'Kr_pura';
update streets_details set name = 'koramangala' where region = 'east';
select SUM(population) from streets_details;
select MAX(population) from streets_details;
select MIN(population) from streets_details;
select AVG(population) from streets_details;
select * from streets_details order by population;
select * from streets_details order by region;
select name,population from streets_details where name IS NULL;
insert into streets_details values ('','east',2000);
desc streets_details;
select * from streets_details;
select * from streets_details where name like 'k%';
select region,name from streets_details where region in('east');
select population from streets_details where region in ('west');
select region,name from streets_details where name in ('koramangala');
select * from streets_details where region like 'e%';
select * from streets_details where region in ('east','west');
select * from streets_details where population between 1000 and 9000;
select * from streets_details where population between 1000 and 5000;
select region from streets_details;




