-- AGGREGATION&GROUPING
-- ============================================================================================
-- 1. Find the total, average, minimum, and maximum credit limit of all customers.
-- select sum(cust_credit_limit) as total_credit_limit,
--        avg(cust_credit_limit) as avg_credit_limit,
--        min(cust_credit_limit) as minimim_credit_limit,
--        max(cust_credit_limit) as maximum_credit_limit
-- from sh.CUSTOMERS

-- 2. Count the number of customers in each income level.
-- select cust_income_level,count(*) from sh.customers group by cust_income_level 

-- 3. Show total credit limit by state and country.
-- select cust_credit_limit from sh.customers  
-- select cust_state_province,country_id, sum(cust_credit_limit) as total_credit_limit
-- from sh.customers group by cust_state_province, country_id order by cust_state_province,country id;
-- select cust_state_province,country_id, sum(cust_credit_limit) as total_credit_limit
--  from sh.customers group by cust_state_province, country_id order by cust_state_province, COUNTRY_ID
-- 
-- 4. Display average credit limit for each marital status and gender combination.
-- select cust_marital_status,cust_gender, avg(cust_credit_limit) as average_credit_limit
-- from sh.customers group by cust_marital_status, cust_gender order by cust_marital_status,CUST_GENDER
--
--  5. Find the top 3 states with the highest average credit limit.
-- select cust_state_province, avg(cust_credit_limit) as average_credit_limit from sh.customers 
-- group by cust_state_province order by cust_state_province desc fetch first 3 rows only 
--
--  6. Find the country with the maximum total customer credit limit.
-- select country_id, max(cust_credit_limit) as maximum_credit_limit from sh.CUSTOMERS group by country_id order by country_id

-- 7. Show the number of customers whose credit limit exceeds their state average.
-- select cust_state_province,COUNT(*) AS num_customers_above_state_avg
-- FROM sh.customers WHERE cust_credit_limit > (SELECT AVG(cust_credit_limit) FROM sh.customers) GROUP BY cust_state_province
-- ORDER BY num_customers_above_state_avg DESC;

-- 8. Calculate total and average credit limit for customers born after 1980.
-- select cust_year_of_birth,count(*),sum(cust_credit_limit) as total_credit_limit,avg(cust_credit_limit) as average_credit_limit
-- from sh.customers group by cust_year_of_birth having cust_year_of_birth > 1980 order by cust_year_of_birth
-- select cust_year_of_birth, count(*),sum(cust_credit_limit) as total_credit_limit, avg(cust_credit_limit) as average_credit_limit 
-- from sh.CUSTOMERS group by cust_year_of_birth having cust_year_of_birth > 1980 order by total_credit_limit

-- 9. Find states having more than 50 customers.
-- select cust_state_province, count(*) as number_of_customers
-- from sh.CUSTOMERS group by cust_state_province having count(*) > 50 order by CUST_STATE_PROVINCE
-- select cust_state_province, count(*) as number_of_customers 
-- from sh.customers group by cust_state_province having count(*) > 50 order by cust_state_province 

--  10. List countries where the average credit limit is higher than the global average.
-- select country_id, avg(cust_credit_limit) as average_credit_limit from sh.customers
-- group by country_id having average_credit_limit > 
-- (select avg(cust_credit_limit) from sh.customers) order by average_credit_limit desc

-- 11. Calculate the variance and standard deviation of customer credit limits by country.
-- select country_id , var_samp(cust_credit_limit) as variance_credit_limit, 
-- stddev_samp(cust_credit_limit) as standard_credit_limit 
-- from sh.customers group by country_id order by country_id desc

-- 12. Find the state with the smallest range (max–min) in credit limits.
-- select * from 
-- (select cust_state_province, max(cust_credit_limit) - min(cust_credit_limit) as smallest_credit_limit
-- from sh.customers group by cust_state_province order by smallest_credit_limit asc)
-- where rownum = 1


-- =============================================================================================

-- Airport_details_tables

-- Airport table
-- ================================================================
-- create table Airports(
--     AirportID number GENERATED always as identity start with 101 increment by 1 primary key,
--     Airport_name varchar(100),
--     city varchar(50),
--     country varchar(50))
-- insert into Airports(AirportID, Airport_name,city,country) VALUES
-- ('KIA','banglore','india'),
-- ('Tpt','renigunta','india'),
-- ('hyd','Ts','india');
-- commit;
-- select * from Airports;
-- ==================================================================================
-- Flights Table
-- CREATE TABLE Flights (
--     FlightID NUMBER GENERATED ALWAYS AS IDENTITY START WITH 1001 INCREMENT BY 1 PRIMARY KEY,
--     FlightNumber VARCHAR2(10),
--     AirlineName VARCHAR2(100),
--     OriginAirportID NUMBER,
--     DestinationAirportID NUMBER,
--     DepartureTime DATE,
--     ArrivalTime DATE,
--     BaseFare NUMBER(10,2),
--     CONSTRAINT fk_origin_airport FOREIGN KEY (OriginAirportID)
--         REFERENCES Airports(AirportID),
--     CONSTRAINT fk_destination_airport FOREIGN KEY (DestinationAirportID)
--         REFERENCES Airports(AirportID)
-- );

-- INSERT INTO Flights (FlightNumber, AirlineName, OriginAirportID, DestinationAirportID, DepartureTime, ArrivalTime, BaseFare)VALUES 
-- ('AI101', 'Air India', 101, 103, TO_DATE('2023-10-15 08:00','YYYY-MM-DD HH24:MI'), TO_DATE('2023-10-15 10:30','YYYY-MM-DD HH24:MI'), 7500),
-- ('6E220', 'IndiGo', 102, 101, TO_DATE('2023-10-16 09:30','YYYY-MM-DD HH24:MI'), TO_DATE('2023-10-16 11:00','YYYY-MM-DD HH24:MI'), 5500),
-- ('BA150', 'British Airways', 103, 104, TO_DATE('2023-10-17 22:00','YYYY-MM-DD HH24:MI'), TO_DATE('2023-10-18 05:00','YYYY-MM-DD HH24:MI'), 45000),
-- ('AI222', 'Air India', 104, 105, TO_DATE('2023-10-18 10:00','YYYY-MM-DD HH24:MI'), TO_DATE('2023-10-18 18:30','YYYY-MM-DD HH24:MI'), 52000),
-- ('DL560', 'Delta Airlines', 105, 103, TO_DATE('2023-10-19 14:00','YYYY-MM-DD HH24:MI'), TO_DATE('2023-10-20 02:00','YYYY-MM-DD HH24:MI'), 48000);

-- commit;

-- select * from flights
-- =========================================================================
-- Analytical_Window Functions

--  Assign row numbers to customers ordered by credit limit descending.
-- select row_number() over(order by cust_credit_limit desc) as row_num, cust_credit_limit from sh.customers

-- Rank customers within each state by credit limit.
-- select cust_state_province,cust_credit_limit,rank() over (PARTITION by cust_state_province order by cust_credit_limit desc) as rank_cust from sh.CUSTOMERS

-- - 3. Use DENSE_RANK() to find the top 5 credit holders per country.
-- select * from(
-- select country_id,cust_credit_limit,dense_rank() over(PARTITION by country_id order by cust_credit_limit desc) as top_ranks from sh.customers)
-- where top_ranks <=5;

--  4. Divide customers into 4 quartiles based on their credit limit using NTILE(4).
-- select cust_credit_limit,ntile(4) over(order by cust_credit_limit desc) as quartiles from sh.CUSTOMERS
--  5. Calculate a running total of credit limits ordered by customer_id.
-- select cust_id,cust_credit_limit,sum(cust_credit_limit) over(order by cust_id)as cust_credit_limit from sh.CUSTOMERS

-- 6. Show cumulative average credit limit by country.

-- select country_id,cust_credit_limit,avg(cust_credit_limit) over(partition by country_id order by cust_id rows between unbounded preceding and current row) as cumulative_average from sh.customers

-- 7. Compare each customer’s credit limit to the previous one using LAG().
-- select cust_id,cust_credit_limit,lag(cust_credit_limit,1) over(order by cust_id desc) as previous_limit from sh.CUSTOMERS
-- select cust_id,cust_credit_limit,lag(cust_credit_limit,1) over(order by cust_id desc ) as previous_limit from sh.CUSTOMERS

--   8. Show next customer’s credit limit using LEAD().
-- select cust_id,cust_credit_limit,lead(cust_credit_limit,1) over(order by cust_id desc) as next_limit from sh.customers 

-- 9. Display the difference between each customer’s credit limit and the previous one.
-- select cust_id,cust_credit_limit,lag(cust_credit_limit,1) over(order by cust_id) as previous_limit,cust_credit_limit-lag(cust_credit_limit,1) over(order by cust_id desc ) as preceding_difference from sh.CUSTOMERS

-- -- 10. For each country, display the first and last credit limit using FIRST_VALUE() and LAST_VALUE().
-- select country_id,cust_credit_limit,first_value(cust_credit_limit) over(PARTITION by country_id order by cust_credit_limit asc rows between unbounded preceding  and unbounded following) as first_credit_limit,
-- last_value(cust_credit_limit) over(partition by country_id order by cust_credit_limit asc rows between unbounded preceding and unbounded following) as last_credit_limit from sh.customers

--16. For each state, calculate the cumulative total of credit limits ordered by city.
--  select cust_state_province,cust_city, sum(cust_credit_limit) over (order by cust_city) as cust_credit_limit from sh.customers

-- 18. Display the highest 3 credit holders per state using ROW_NUMBER() and PARTITION BY.
select cust_state_province,cust_credit_limit from(select cust_state_province,cust_credit_limit,Row_number()over partition by cust_state_province
