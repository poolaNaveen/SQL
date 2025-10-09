-- Find the total, average, minimum, and maximum credit limit of all customer
-- select
--     sum('credit_limit')AS SUM_credit_limit,
--     avg('credit_limit')AS average_credit_limit,
--     max('credit_limit')AS maximum_credit_limit,
--     min('credit_limit')AS minimum_credit_limit
-- from hr.employees
-- SELECT * FROM ALL_TAB_COLUMNS 
-- WHERE TABLE_NAME = 'CUSTOMERS' AND OWNER = 'SH';
 -- 1. Find customers born after the year 1990.
-- SELECT * FROM SH.customers WHERE CUST_YEAR_OF_BIRTH > 1990;
-- 2. List all male customers (`CUST_GENDER = 'M'`)
-- select CUST_GENDER from sh.customers where cust_gender='M'
--3. Retrieve all female customers (`CUST_GENDER = 'F'`) living in Sydney
-- select cust_gender,cust_city from sh.customers where cust_gender = 'F' and cust_city = 'SYDNEY'

-- 4. Find customers with income level `"G: 130,000 - 149,999"`.
-- select cust_income_level from sh.customers where cust_income_level = 'G: 130,000 - 149,999'





















