SELECT * from employees;
select first_name from employees;
select first_name, last_name from employees;
select first_name, manager_id from employees where manager_id is null;
--task1 find all department IDs between 60 and 100
select * from employees where department_id between 60 and 100;

--find all the first_names which start with  A and last_names finish with n.
select * from employees where first_name like 'A%' and last_name like '%n';

--find out all the first_names that contains letter i or I
select * from employees where first_name like '%i%' or  first_name like '%I%';

--find all employees whose first_name doesnt contains A or a.
select * from employees where first_name not like 'A%' and  first_name not like '%a%';--here result is 37

select * from employees where first_name not like '%a%';  --here result is 41 

select * from employees where lower(first_name) not like '%a%'; -- here result is 37

--show the full names of the employees together in one column and name the column header as FullName
select first_name||' '||last_name "FullName" from employees;

--show 3 numbers of phone numbers
select phone_number,substr(phone_number,1,30) from employees;

--find all the cities in UK, US, CA,IT in locations table
select city,country_id from locations where country_id in('US','UK','IT','CA');

--find all the cities in UK, US, CA,IT in locations table
select city,country_id from locations where country_id='US';

--find the number of the citis in US in the locaitons table
select count(city) from locations where country_id='US';

select city from locations where country_id='US';


--find all the countries which has more than 3 cities in the locations table
--select country_id from locations where count(city) > 3;

--find all the street _address whose postal0cdes's length is more than 5 
select street_address, postal_code, length(postal_code) from locations where length(postal_code) > 5;

--find all the different max_salary from jobs table
select distinct max_salary from jobs;

--how many departments we have from employees 
select count(distinct(department_id)) from employees;

--how mmany departments we have from departments table
select count(distinct(department_id)) from departments;

--order the employees according to salary from min to max
select first_name,last_name,salary from employees order by salary desc;

--find  min, macx and avg salary
select MIN(salary), MAX(salary), AVG(salary) "Average" from employees;

