SELECT
    hr.employees.first_name,
    hr.employees.last_name,
    hr.departments.department_name,
    hr.countries.country_name,
    hr.locations.city,
    hr.regions.region_name
FROM
    hr.employees,
    hr.departments,
    hr.locations,
    hr.countries,
    hr.regions,
    hr.regions regions1
WHERE
        hr.employees.department_id = hr.departments.department_id
    AND hr.departments.location_id = hr.locations.location_id
    AND hr.locations.country_id = hr.countries.country_id
    AND hr.countries.region_id = hr.regions.region_id;
    
    
--find out the first name and department name 
--use employees table and department table
select first_name , department_name 
from employees 
inner join  departments on employees.department_id = departments.department_id ; 

select first_name , department_name 
from employees e
inner join  departments d on e.department_id = d.department_id ; 

select * from employees where department_id is  null;


--get the first name and job_title
select e.first_name, j.job_title 
from employees e 
inner join jobs j on e.job_id = j.job_id;

select e.first_name , d.department_name ,l.city , c.country_name , r.region_name
from employees e
inner join departments d on e.department_id = d.department_id
inner join locations l on l.location_id = d.location_id
inner join countries c on l.country_id = c.country_id
inner join regions r on r.region_id = c.region_id;



--left outer join
select e.first_name,e.last_name, j.job_title 
from employees e 
left OUTER join jobs j on e.job_id = j.job_id;


select c.country_name , l.city
from countries c 
left OUTER join locations l on l.country_id = c.country_id;



select c.country_name , l.city
from countries c 
right OUTER join locations l on l.country_id = c.country_id;

select e.first_name, d.department_name
from employees e
inner join departments d on e.department_id = d.department_id;


select e.first_name, d.department_name
from employees e
left outer join departments d on e.department_id = d.department_id;

select e.first_name, d.department_name
from employees e
right outer join departments d on e.department_id = d.department_id;



select e.first_name, d.department_name
from employees e
full outer join departments d on e.department_id = d.department_id;

