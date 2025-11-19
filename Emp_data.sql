create database employee_data;
use employee_data;
create table emp_data(
emp_id int,
emp_name varchar(20),
city varchar(20),
dept_name varchar(20)
);
desc emp_data;
insert into emp_data values(101,'ramu', 'chennai','IT'),
(102,'ram','banglore','HR'),
(103,'mahesh','hydrabad','sales'),
(104,'mohan','delhi', 'marketing'),
(105,'nani','mumbai','promotion'),
(106,'pravan','haryana','production'),
(107,'harsha','mysore','service');
select * from emp_data;
SET SQL_SAFE_UPDATES = 0;

UPDATE emp_data
SET emp_name = 'naveen'
WHERE emp_id = 101;

SET SQL_SAFE_UPDATES = 1;
update emp_data set emp_name = 'ganesh' where emp_id=102;
select * from emp_data;
