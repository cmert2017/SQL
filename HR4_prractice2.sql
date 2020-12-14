select d.department_name, count(*) as "employee_count"
from employees e
inner join departments d on e.department_id = d.department_id 
group by d.department_name;

select d.department_name, count(*) as "employee_count"
from employees e
inner join departments d on e.department_id = d.department_id 
group by d.department_name
order by d.department_name asc;

--on the top of above quesry
--only list those department names started with A or ended with ng
select d.department_name, count(*) as "employee_count"
from employees e
inner join departments d on e.department_id = d.department_id 
group by d.department_name
having d.department_name like 'A%'
or d.department_name like '%ng'
order by d.department_name asc;


--same questions with where. Where is possible bc there is no aggregate function in doncition part
--on the top of above quesry
--only list those department names started with A or ended with ng
select d.department_name, count(*) as "employee_count"
from employees e
inner join departments d on e.department_id = d.department_id 
where d.department_name like 'A%' or d.department_name like '%ng'
group by d.department_name
order by d.department_name asc;

--by extending the above quesry return the department_name with more than 5 employee
select d.department_name, count(*) as "employee_count"
from employees e
inner join departments d on e.department_id = d.department_id 
group by d.department_name
having count(d.department_name) > 5
order by d.department_name asc;



--how many departments in each country
select c.country_name, count(d.department_name)
from locations l 
inner join countries c on c.country_id = l.country_id
inner join departments d  on l.location_id = d.location_id
group by c.country_name;


select c.country_name, count(d.department_name)
from locations l 
full outer join countries c on c.country_id = l.country_id
full outer join departments d  on l.location_id = d.location_id
group by c.country_name
order by 2 DESC;

--practice with union on the same table
select * from countries
union 
select * from countries;



