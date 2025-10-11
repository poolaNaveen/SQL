--  A. Aggregation & Grouping (20 Questions)
-- 1.Find the total, average, minimum, and maximum credit limit of all customers.
-- select
--     sum(cust_credit_limit) AS total_credit_limit,
--     avg(cust_credit_limit) AS average_credit_limit,
--     max(cust_credit_limit) AS maximum_credit_limit,
--     MIN(cust_credit_limit) AS minimum_credit_limit
-- from sh.CUSTOMERS;  
-- 2.Count the number of customers in each income level 
-- select 
--     cust_income_level,
--     count(*) AS cust_income_level
-- from 
--     sh.CUSTOMERS
-- group by
--     cust_income_level
-- order by
--     cust_income_level;
--  Show total credit limit by state and country
-- select
--      cust_state_province,
--      sum(cust_credit_limit) AS cust_credit_limit
-- from 
--     sh.CUSTOMERS    
-- group by
--     CUST_STATE_PROVINCE,
--     COUNTRY_ID
-- order by
--     cust_state_province,
--     COUNTRY_ID
--  Display average credit limit for each marital status and gender combination
-- select
--     cust_martial_status,
--     cust_gender,
--     avg(cust_credit_limit) AS average_credit_limit    
-- from 
--     sh.CUSTOMERS    
-- group by
--     cust_martial_status,
--     cust_gender
-- order by
--     cust_martial_status,
--     cust_gender;
-- find the top 3 states with the highest average credit limit.
-- select * 
-- from (
--     select
--      cust_state_province ,
--      round(avg(cust_credit_limit),2) AS average_credit_limit
--     from 
--         sh.CUSTOMERS
--     group by 
--         cust_state_province
--     order by
--         average_credit_limit DESC
--  )
-- where rownum <=3;

-- Find the country with the maximum total customer credit limit.
-- select * 
-- from(
--     select
--         cust_country_id,
--         sum(cust_credit_limit) AS total_credit_limit,
--         max(cust_credit_limit) AS maximum_credit_limit
--     from 
--         sh.CUSTOMERS
--     group by
--         CUST_country_id
--     order by
--         sum(cust_credit_limit) DESC
-- )    
-- where ROWNUM = 1;
-- Show the number of customers whose credit limit exceeds their state average.
-- SELECT COUNT(*) AS above_state_average_count
-- FROM sh.CUSTOMERS 
-- WHERE cust_credit_limit > (
--     SELECT AVG(cust_credit_limit)
--     FROM sh.CUSTOMERS
--     WHERE cust_state_province = c.cust_state_province
-- Calculate total and average credit limit for customers born after 1980
-- select 
--     sum(cust_credit_limit) AS total_credit_limit,
--     ROUND(avg(cust_credit_limit),2) AS average_credit_limit
-- FROM
--     sh.CUSTOMERS
-- WHERE
-- Find states having more than 50 customers.  
-- select 
--     cust_state_province,
--     count(*) AS customer_count
-- from 
--     sh.CUSTOMERS
-- group BY
--     CUST_STATE_PROVINCE
-- HAVING
--     count(*) > 50
-- order by
--     customer_count DESC;

-- List countries where the average credit limit is higher than the global average.
-- select 
--     cust-country_id,
--     ROUND(AVG(cust_credit_limit),2) AS average_cust_credit_limit
-- FROM
--     sh.CUSTOMERS   
-- group by
--     cust_country_id
-- HAVING
--     avg(cust_credit_limit) > (
--         select avg(cust_credit_limit)
--         from sh.CUSTOMERS

--     )      
-- order by
--     country_avg_credit_limit DESC;



































