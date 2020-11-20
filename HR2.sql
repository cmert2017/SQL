select employee_id from employees;
select employees.employee_id , departments.department_id from departments;
select first_name, last_name from employees;
select first_name||' '||last_name  from employees;
select first_name, last_name, hire_date
    FROM employees
    WHERE job_id = 'ST_MAN';
Select * From Employees;

--day2
select first_name from  employees where department_id = 100;

select * from jobs where min_salary between 8000 and 10000;
select * from jobs where min_salary>=8000 and min_salary<=10000;

select first_name, phone_number 
from employees 
where department_id=60 or 
      department_id=100 or 
      department_id=90 ;
select first_name, phone_number, department_id from employees where department_id in(60,100,90,80,120);


select * from employees where first_name like 'A%';
select * from employees where first_name like '%a';
select COUNT(salary) from employees;

select first_name,last_name from employees where first_name like 'A%' and last_name like '%n';

select first_name
from employees
where first_name like '%a%';

select job_id from employees where job_id like 'AD%';

select job_id 
from employees 
where job_id like '%REP';

select job_id 
from employees 
where job_id not like '%REP';

select first_name 
from employees 
where first_name not like '%a%';

select first_name 
from employees 
where first_name not like '%a%' and first_name not like '%A%';

--null 
select * from employees where manager_id is null;
select * from employees where manager_id is not null;

--Funtional in SQL 

select first_name,  upper(first_name), lower(first_name) from employees;

--change the column name of the quesry column
select first_name "Name" , salary "Money" from employees;
select first_name as Name , salary as "Money" from employees;

--concatenation in SQL : use ||
select first_name||' '||last_name "Name" from employees; 

--case insencitive search
--find out all the first name contain  letter A or a
select first_name , upper(first_name) 
from employees
where upper(first_name) not like 'A%';


select first_name , lower(first_name) 
from employees
where lower(first_name) not like 'a%';

--substring
select first_name,substr(first_name,1,3), length(first_name) from employees;







