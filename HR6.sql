----warmup question:Find out the name of top earner in each departments in HR Database
--outcome should have 3 columns
--department name , first_name, salary

--step1: find out the ma salary in each department
select department_id, max(salary) from employees 
group by department_id;


select department_name, max(salary) from employees e
inner join departments d on e.department_id = d.department_id
group by department_name;

select max(salary) from employees e
inner join departments d on e.department_id = d.department_id
group by department_name;

--solution 
select e.first_name, d.department_name, e.salary from employees e
inner join departments d on e.department_id = d.department_id
where salary in (select max(salary) from employees e
inner join departments d on e.department_id = d.department_id
group by department_name);

-----second attemp
select department_id, max(salary) from employees 
group by department_id;

