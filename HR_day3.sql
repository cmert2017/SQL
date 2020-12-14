---day2: single row function
---will affect eacha dna every row and return same number same number of rows
--length, upper, lower, substr

--get the initials of employees
select lower(concat(substr(first_name,1,1),substr(last_name,1,1))) "Initial" from employees;

select lower(concat(concat(substr(first_name,1,1),'.'),substr(last_name,1,1))) "Initial" from employees;

--partial string condition using like %
--find employees that contains ME in teheir name, caseinsensitive

select first_name, last_name from employees where lower(first_name) like  '%me%' or lower(last_name) like '%me%';

select first_name||' '||last_name "Name" from employees where lower(first_name||' '||last_name) like '%me%';


select substr(hire_date,1,2) as Day ,substr(hire_date,4,3)  as Month from employees;

select first_name, last_name, hire_date from employees where hire_date like '%JAN%';

--another way to do it

select first_name, last_name from employees where substr(hire_date,4,3)='JAN';


--Math functions
select salary as Monthly,salary + 1000 as Add100, salary / 4 as weekly , salary /30 as daily
from employees;

select  salary as Monthly,
        salary + 1000 as After_Raise, 
        salary / 4 as weekly , 
        round(salary /30,2) as daily,
        round(daily)
from employees;

--count
select count(*) as employee_count from employees;

select count(*) as location_count from locations;


--find out who make the most money

select max(salary) as richest_luckyOne from employees;

select MIN(salary), MAX(salary), round(AVG(salary)), Sum(salary) from employees;

sELECT * FROM employees WHERE SALARY = 
(SELECT MAX(SALARY)FROM employees );

select first_name from employees where salary  = 24000;

--find out how many employees in each department

select department_id ,  COUNT(*) , Max(salary) , Min(salary), sum(salary) from employees group by department_id;


--find out how many employees in each job id
select job_id, count(*) from employees GROUP BY job_id;

--ORA-00979: not a GROUP BY expression
select first_name
from employees
group by job_id;


select max(salary) , department_id 
from employees
GROUP BY department_id;


--restrict ther result by employee number having more than 10
select department_id , count(*) from employees group by department_id having count(*) > 10;


select department_id , max(salary) from employees group by department_id having max(salary) < 10000;


select country_id, count(*) from locations GROUP BY country_id;


select * from employees order by first_name ASC;

select max(salary) , department_id
from employees
group by department_id 
order by department_id;

