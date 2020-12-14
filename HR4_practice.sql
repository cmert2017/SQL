--where clause
SELECT
    *
FROM employees
where salary > 2000 and manager_id =114;

--between
select * from employees where salary between 3000 and 8000;


--in statement 
select * from employees where department_id in(60,30,50);

select * from locations where location_id in(1,1000);

--order by statement 
--for sorting 

select * from countries order by region_id ASC;
select * from countries order by region_id;

select * from countries order by region_id DESC;


--aggregate  functions: min() , max(), avg(), sum() 
--and two other functions: count() and round()


select min(location_id) as min_Location_ID from departments; 

select * from departments where location_id = 1400;

select * from departments where location_id = (select min(location_id) from departments);

select max(location_id) from departments;

select * from departments where location_id =(select max(location_id) from departments);

select * from employees where salary = (select max(salary) from employees );

select * from employees where salary = (select min(salary) from employees);

select avg(salary) from employees;

select round(avg(salary),2) from employees;

select to_char(avg(salary),'999,999') from employees;

select sum(salary) from employees;

select to_char(sum(salary),'999,999') from employees;

SELECT * FROM  employees where manager_id=100;

select count(manager_id) from employees where manager_id=100;

select count(salary) from employees where salary <10000;


--like statement : partical search

select * from countries where country_name like 'A%';

select * from countries where country_name like '%n';

select * from countries where country_name like 'A%' and country_name like '%a';

select * from countries where country_name like '%b%';

select count(*) from countries where country_name like '%a%';

--String manupilations 
-- there are 9 text Functions, they are only used for display  does not modify the table

--concant:
select email from employees;
select email||'@gmail.com' from employees;

select first_name||' '||last_name from employees;

select concat(first_name,concat(' ' , last_name)) from employees;

--upper and lower
select upper(first_name), lower(first_name) from employees;

--initCap
select INITCAP(email), email from employees;

--length
select first_name, length(first_name) from employees;


select first_name, length(first_name) from employees where length(first_name)>5;

--replace

select replace(email,'A','a') from employees;

--substr

select substr(first_name,1,5)|| ' ' ||substr(last_name,1,1) from employees;


select trim(substr(first_name,1,5)|| ' ' ||substr(last_name,1,1)|| '        ') as FN from employees;

select substr(first_name,1,length(concat(first_name,'   '))) as FN from employees;


--group by

select job_id from employees group by job_id;
select job_id, count(job_id) from employees group by job_id;


select job_id, count(job_id) from employees group by job_id order by count(job_id) DESC;

select salary,count(salary) from employees where salary =(select min(salary)from employees) group by salary order by salary DESC ;


select job_id, max(salary), min(salary),sum(salary), AVG(salary), count(salary) from employees group by job_id;

-- having

select  job_id, count(job_id) from employees  group by job_id having max(salary) > 8000;
select  department_id,max(salary),count(department_id) from employees group by department_id having max(salary)>10000;

--Aliases: 
select Isci.first_name , isimiz.job_title
as Name from employees Isci, jobs isimiz;

--View: virtual tables

select * from employees;

select first_name||' '||last_name "FullName" from employees;

create view EmployeeInfo as select first_name||' '||last_name "FullName" from employees;

select * from employeeinfo;

--how to update view
select * from employeeinfo;

select first_name||' '||last_name "FullName" ,
lower(email||'@team.com') "Email"
from employees;

--replace view 
create or replace view employeeinfo as
select first_name||' '||last_name "FullName" ,
lower(email||'@team.com') "Email"
from employees;


--check new view
select * from employeeinfo;


--dropping view
drop view employeeinfo;

--tables: DML and DDL 


--inner join
select * from employees;
select * from jobs;

select * from employees inner join jobs on employees.job_id = jobs.job_id;

select E.first_name, E.last_name , j.max_salary from employees E inner join jobs J on E.job_id = J.job_id;

-----creating tables: 
CREATE TABLE address(

address_id Integer PRIMARY KEY,
address VARCHAR(50) NOT NULL,
phone Integer NOT NULL

);


INSERT INTO address (address_id, address, phone) VALUES (5,  '1913 Hanoi Way'  ,  28303384);
INSERT INTO address (address_id, address, phone) VALUES (7,  '692 Joliet Street'  ,  44847719);
INSERT INTO address (address_id, address, phone) VALUES (8,  '1566 Inegl Manor'  ,  70581400);
INSERT INTO address (address_id, address, phone) VALUES (10,  '1795 Santiago '  ,  86045262);
INSERT INTO address (address_id, address, phone) VALUES (11,  '900 Santiago '  ,  16571220);


CREATE TABLE customer(

customer_id Integer PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50)NOT NULL,
address_id Integer REFERENCES address(address_id)

);


INSERT INTO customer (customer_id, first_name, last_name, address_id) VALUES (1, 'Mary' ,  'Smith',  5);
INSERT INTO customer (customer_id, first_name, last_name, address_id) VALUES (2,  'Patricia' ,  'Johnson' ,  NULl);
INSERT INTO customer (customer_id, first_name, last_name, address_id) VALUES (3,  'Linda' ,  'Williams' ,  7);
INSERT INTO customer (customer_id, first_name, last_name, address_id) VALUES (4, 'Barbara' ,  'Jones' , 8);
INSERT INTO customer (customer_id, first_name, last_name, address_id) VALUES (5,  'Elizabeth' ,  'Brown' ,  NULL);


commit work;

-----


