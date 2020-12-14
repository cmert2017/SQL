select * from employees order by salary DESC;

select * from employees order by first_name ASC;

--ordering by column number, here 2 represent column 2
select * from employees order by 2 DESC;


--find out unique first_name in employee table
select distinct first_name from employees;
select unique first_name from employees;

select count(distinct first_name) from employees;

--3,  USING EMPLOYEES TABLE
--	FIND OUT HOW MANY EMPLOYEES EACH MANAGER MANAGE (group by manager_id)

select manager_id,count(*) "number of employees" from employees group by manager_id;

--	-- continue above
--		3.1 -- find out manager who mange more than 10 employees
select manager_id,count(*) "number_of_employees" from employees group by manager_id having count(manager_id) > 10;

--		3.2 -- find out manager who manage exactly 6 employees
select manager_id,count(*) "number_of_employees" from employees group by manager_id having count(manager_id) = 6;


select count(*) as char_count , length(first_name) as name_count from employees group by length(first_name);


--sort the first name by character count of first name in employees table
select first_name from employees order by length(first_name);


--order by two columns 
select first_name, last_name 
from employees
order by first_name;





