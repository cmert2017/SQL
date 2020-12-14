--day5 review
--constrains : primary key, foreign key, unique , not null, check, 

--joins: inner join, left outer, right outer, full outer, self join

select * from employees join ;



--who has the most salary
select * from employees where salary= (select max(salary) from employees)
union 
select * from employees where salary= (select min(salary) from employees);

select * from employees where salary >  (select avg(salary) from employees);


--second max salary from employees
select * from employees where salary = (select max(salary) from employees where salary != (select max(salary) from employees));

--max and min salary in one column
SELECT MAX(SALARY) AS RESULT FROM EMPLOYEES
UNION
SELECT MIN(SALARY) AS RESULT FROM EMPLOYEES  ; 

--find out the name of the ppl who made max and min
select first_name, last_name, salary from employees where salary in(24000,2100);


--find the above without hardcoding
select first_name, last_name, salary 
from employees 
where salary = (select max(salary) from employees) or salary = (select min(salary) from employees);


select first_name, last_name, salary 
from employees 
where salary in((select max(salary) from employees), (select min(salary) from employees));





--create table
create table foreign_students(student_id INTEGER primary key,first_name varchar(20), last_name varchar(20),phone INTEGER ); 


create table foreign_teachers(teacher_id INTEGER primary key,first_name varchar(20), last_name varchar(20),phone INTEGER ); 

insert into foreign_students(student_id,first_name,last_name,phone) values (1,'Mary','Snowman',234345345);
insert into foreign_students(student_id,first_name,last_name,phone) values (1,'Mary','Snowman',234345345);

select * from foreign_students;


