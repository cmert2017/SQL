--Q19 from sql interview
--Q: How to find employees whose salaries are below the average?
--average salary
select avg(salary)  from employees;


--names of employees whose salary is less than avg salary
select first_name, last_name ,salary
from employees where salary < (select min(salary)  from employees) ;

--number of employees whose salary is less than the avg
select count(*) 
from employees 
where salary < (select avg(salary)  from employees);


--Q20: How to find maximum salaries in each department?
select department_id, max(salary) from  employees group by department_id;

--ordered 
select department_id, max(salary), count(salary) from  employees group by department_id order by 2;

--Q20*: How to find maximum salaries in each department with department names?
select e.department_id,d.department_name , max(salary) , round(avg(salary),2) , min(salary), count(*)
from  employees e 
inner join departments d on e.department_id = d.department_id
group by  d.department_name, e.department_id
order by 3;


--Q21 How to find lowest salaries?
--a: find the min salary’s amount just
select min(salary) from employees;

--b: find the employee who has the min salary
select first_name, last_name , salary
from employees 
where salary = (select min(salary) from employees);


--c: find the min salary in each department
select department_id,min(salary)
from employees
group by department_id;

--d: find the min salary in each department with department name as well.
select e.department_id ,department_name, min(salary)
from employees e
left outer join departments d on e.department_id = d.department_id
group by e.department_id, department_name
order by 3;

--e: find the min salary in each department with department name as well and also show 
--how many employees has that min salary in that department, if possible ?
select e.department_id ,department_name, min(salary), count(salary)
from employees e
left outer join departments d on e.department_id = d.department_id
--where salary = (select min(salary) from employees group by e.department_id)
group by e.department_id, department_name;
--having salary <= (select min(salary) from employees group by e.department_id );

--Q22-How to find second highest salary of employees?
select max(salary)
from employees
where salary < (select max(salary) from employees );


select first_name, last_name , salary
from employees
where salary = (select max(salary) from employees where salary < (select max(salary) from employees ));
select first_name from employees;

select * from super_heros;

UPDATE super_heros
SET
    hero_id = 200
WHERE
        hero_id = 102
  
  

