-- Analytical / Window Functions

-- Assign row numbers to customers ordered by credit limit descending.
-- SELECT 
    -- customer_id,
--     customer_name,
--     credit_limit,
--     ROWNUM as row_number
-- FROM (
--     SELECT 
--         customer_id,
--         customer_name,
--         credit_limit
     
--     FROM sh.customers
--     ORDER BY credit_limit DESC
-- ); 


-- Rank customers within each state by credit limit.
-- SELECT
--     cust_first_name,
--     cust_last_name,
--     customer_id,
--     state,                 -- replace with the actual state column if different
--     credit_limit,          -- replace with actual credit limit column if different
--     RANK() OVER (
--         PARTITION BY state
--         ORDER BY credit_limit DESC
--     ) AS rank_within_state
-- FROM
--     sh.customers;
-- Use DENSE_RANK() to find the top 5 credit holders per country.k
























