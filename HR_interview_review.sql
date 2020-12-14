--POST_Interview_Review
--Q1: How to find top 3 high paid employees?
select first_name,last_name,salary from employees where ROWNUM < 4 order by salary DESC ;

--limit is used in mysql
select first_name,last_name,salary from employees where limit < 3 order by salary DESC  ;
--first max salary
select max(salary) from employees;

--employees who has the first max salary
select first_name, last_name, salary from  employees where salary = (select max(salary) from employees);

--second max salary
select max(salary) from employees where salary < (select max(salary) from employees);

--employees who has the second max salary
select first_name,last_name, salary from employees where salary = (select max(salary) from employees where salary < (select max(salary) from employees));


--first threee top paid employees
select first_name, last_name, salary from  employees where salary = (select max(salary) from employees)
union all
select first_name,last_name, salary from employees where salary = (select max(salary) from employees where salary < (select max(salary) from employees));


--Q2: Find duplicate names in employees
--solution1
select first_name, count(*) 
from employees
group by first_name
having count(*)>1
order by 2;

--solution 2: under development
CREATE TABLE Employees_Name_Only AS (
    SELECT distinct FIRST_NAME FROM EMPLOYEES    
);  

COMMIT ;

select first_name from employees 
intersect 
SELECT first_name from employees_name_only;


--under development
select * from employees e1
left outer join employees_name_only e2 on e1.first_name=e2.first_name;



