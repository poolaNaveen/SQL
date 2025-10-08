-- select months_between(sysdate,hire_date)from hr.EMPLOYEES
-- select months_between(sysdate,hire_date)/12 from hr.EMPLOYEES
-- select(month_between(sysdate,hire_date))*30 as approx_day from hr.EMPLOYEES
-- select next_day(hire_date, 'MONDAY') from dual
-- select sysdate,next_day(sysdate,'MONDAY') from dual
-- select sysdate,last_day(sysdate) from dual
-- select hire_date,round(hire_date,'month') from hr.EMPLOYEES
-- select extract(year from hire_date),extract(month from hire_date),extract(day from hire_date) from hr.employees
-- select new_time(sysdate,'gmt','pst') from dual
--  select systimestamp at TIMEZONE'asia/kolkata' as a localtime from dual
-- select localtimestamp from dual
-- select EXTRACT(hour from localtimestamp),
-- EXTRACT(MINUTE from localtimestamp),
-- extract(SECOND from localtimestamp ) from dual
-- select localtimestamp,localtimestamp+INTERVAL,'10'days from dual
-- select localtimestamp+intervel'20,6:15' day to hours plus _2 day_6 hours from dual;
-- SELECT LOCALTIMESTAMP 
--        + INTERVAL '20' DAY 
--        + INTERVAL '6:15' HOUR TO MINUTE 
--        + INTERVAL '2' DAY 
--        + INTERVAL '6' HOUR AS adjusted_time
-- FROM dual;





















